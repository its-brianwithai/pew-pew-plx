# Implementation Plan: Embedded WikiLinks Processing Feature

## Technical Acceptance Criteria

### Functional Requirements
- ✅ Script processes all `.md` files in the target directory
- ✅ Identifies and expands `![[filename]]` syntax  
- ✅ Removes YAML front-matter from embedded content
- ✅ Handles recursive embedded WikiLinks up to depth 10
- ✅ Detects and escapes circular references
- ✅ Preserves original syntax when files not found
- ✅ Integrates before standard WikiLink processing

### Performance Requirements  
- ✅ Caches file content to avoid re-reading
- ✅ Processes files in single pass
- ✅ Completes within existing sync time budget

### Code Quality
- ✅ Follows existing bash script patterns
- ✅ Reuses functions from WikiLink processor
- ✅ Provides clear error messages
- ✅ Uses consistent variable naming

## CRUD Operations

### Create Operations
- **Temp file for each processed markdown**: Create using `mktemp`
- **Content cache entries**: Store in associative array

### Read Operations
- **List markdown files**: `find "$CLAUDE_DIR" -name "*.md" -type f`
- **Read file content**: `cat "$filepath"`
- **Search for embeds**: `grep -o '!\[\[[^]]*\]\]'`
- **Check front-matter**: Read first lines for `---`

### Update Operations
- **Replace embed lines**: Use `sed` to replace entire lines
- **Write processed content**: `mv "$temp_file" "$file"`

### Delete Operations
- **Remove front-matter**: Strip lines between `---` markers
- **Clean temp files**: Automatic via trap or explicit rm

## Implementation Steps

### Step 1: Create sync-claude-code-embedded-wikilinks.sh

**File**: `/Users/codaveto/Repos/pew-pew-plx/scripts/claude-code/sync-claude-code-embedded-wikilinks.sh`

**Action**: Create new script file with core structure

```bash
#!/bin/bash
set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude"
    echo "🔗 Processing embedded wikilinks in temp directory..."
else
    CLAUDE_DIR="$PROJECT_ROOT/.claude"
    echo "🔗 Processing embedded wikilinks in .claude directory..."
fi

# Configuration
MAX_DEPTH="${CLAUDE_EMBED_MAX_DEPTH:-10}"
declare -A content_cache
declare -a processing_chain

# Statistics
total_files=0
processed_files=0
embeds_resolved=0

# Count total files
for file in $(find "$CLAUDE_DIR" -name "*.md" -type f); do
    ((total_files++))
done

echo "📊 Found $total_files files to process for embedded wikilinks"
```

### Step 2: Add File Search Functions

**Action**: Copy and adapt search functions from existing WikiLink script

```bash
# Function to search for file in project directories
find_in_project() {
    local filename="$1"
    local search_dirs=("blocks" "prompts" "agents" "instructions" "templates" "context" "docs")
    
    for dir in "${search_dirs[@]}"; do
        if [ -d "$PROJECT_ROOT/$dir" ]; then
            local found=$(find "$PROJECT_ROOT/$dir" -name "$filename.md" -type f | head -1)
            if [ -n "$found" ]; then
                echo "$found"
                return 0
            fi
        fi
    done
    return 1
}

# Function to search for file in .claude directories
find_in_claude() {
    local filename="$1"
    local found=$(find "$CLAUDE_DIR" -name "$filename.md" -type f | head -1)
    if [ -n "$found" ]; then
        echo "$found"
        return 0
    fi
    return 1
}
```

### Step 3: Add Content Extraction Function

**Action**: Create function to read and clean content

```bash
# Extract content without front-matter
extract_content() {
    local filepath="$1"
    
    # Check cache first
    if [ -n "${content_cache[$filepath]}" ]; then
        echo "${content_cache[$filepath]}"
        return 0
    fi
    
    local content=$(cat "$filepath")
    local cleaned_content="$content"
    
    # Remove YAML front-matter if present
    if [[ "$content" =~ ^---[[:space:]]*$ ]]; then
        # Find the closing --- and remove everything before it
        cleaned_content=$(echo "$content" | awk '
            /^---$/ { if (++count == 2) { found=1; next } }
            found { print }
        ')
    fi
    
    # Trim leading and trailing blank lines
    cleaned_content=$(echo "$cleaned_content" | sed -e '/^[[:space:]]*$/d' -e '1{/^$/d}' -e '${/^$/d}')
    
    # Cache the result
    content_cache[$filepath]="$cleaned_content"
    echo "$cleaned_content"
}
```

### Step 4: Add Recursive Processing Function

**Action**: Create main processing logic with recursion handling

```bash
# Process embedded wikilinks recursively
process_embedded_content() {
    local content="$1"
    local depth="$2"
    local current_file="$3"
    
    # Check depth limit
    if [ "$depth" -gt "$MAX_DEPTH" ]; then
        echo "⚠️ Max recursion depth reached at $current_file" >&2
        echo "$content"
        return 0
    fi
    
    # Add to processing chain
    processing_chain+=("$current_file")
    
    # Find all embedded wikilinks
    local embeds=$(echo "$content" | grep -o '!\[\[[^]]*\]\]' | sort -u || true)
    
    if [ -n "$embeds" ]; then
        while IFS= read -r embed; do
            # Extract filename
            local filename=$(echo "$embed" | sed 's/!\[\[\(.*\)\]\]/\1/')
            local base_filename="${filename%.md}"
            
            # Check for circular reference
            if [[ " ${processing_chain[@]} " =~ " $base_filename " ]]; then
                echo "⚠️ Circular reference detected: $base_filename" >&2
                continue
            fi
            
            # Find the file
            local found_file=""
            if found_file=$(find_in_project "$base_filename") && [ -n "$found_file" ]; then
                :
            elif found_file=$(find_in_claude "$base_filename") && [ -n "$found_file" ]; then
                :
            else
                echo "⚠️ Embedded file not found: $base_filename" >&2
                continue
            fi
            
            # Extract and process content recursively
            local embedded_content=$(extract_content "$found_file")
            embedded_content=$(process_embedded_content "$embedded_content" $((depth + 1)) "$base_filename")
            
            # Replace the entire line containing the embed
            content=$(echo "$content" | awk -v embed="$embed" -v replacement="$embedded_content" '
                $0 ~ embed {
                    print replacement
                    next
                }
                { print }
            ')
            
            ((embeds_resolved++))
        done <<< "$embeds"
    fi
    
    # Remove from processing chain
    unset 'processing_chain[-1]'
    
    echo "$content"
}
```

### Step 5: Add Main Processing Loop

**Action**: Process all markdown files

```bash
# Process each file
find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    # Check if file contains embedded wikilinks
    if ! grep -q '!\[\[' "$file" 2>/dev/null; then
        continue
    fi
    
    # Create temp file
    temp_file=$(mktemp)
    
    # Reset processing chain for this file
    processing_chain=()
    
    # Read and process content
    content=$(cat "$file")
    processed_content=$(process_embedded_content "$content" 0 "$(basename "$file" .md)")
    
    # Write to temp file
    echo "$processed_content" > "$temp_file"
    
    # Replace original
    mv "$temp_file" "$file"
    
    ((processed_files++))
    echo -ne "\r🔄 Processing embedded wikilinks: $processed_files/$total_files files"
done

echo -e "\n✅ Processed embedded wikilinks in $processed_files files ($embeds_resolved embeds resolved)"
```

### Step 6: Modify sync-claude-code.sh

**File**: `/Users/codaveto/Repos/pew-pew-plx/scripts/claude-code/sync-claude-code.sh`

**Action**: Add call to embedded WikiLinks script before standard WikiLinks

Find this section:
```bash
echo "📚 Syncing instructions..."
"$SCRIPT_DIR/sync-claude-code-instructions.sh"

echo "🔗 Processing wikilinks..."
"$SCRIPT_DIR/sync-claude-code-wikilinks.sh"
```

Replace with:
```bash
echo "📚 Syncing instructions..."
"$SCRIPT_DIR/sync-claude-code-instructions.sh"

echo "🔗 Processing embedded wikilinks..."
"$SCRIPT_DIR/sync-claude-code-embedded-wikilinks.sh"

echo "🔗 Processing wikilinks..."
"$SCRIPT_DIR/sync-claude-code-wikilinks.sh"
```

### Step 7: Make Script Executable

**Action**: Set permissions

```bash
chmod +x /Users/codaveto/Repos/pew-pew-plx/scripts/claude-code/sync-claude-code-embedded-wikilinks.sh
```

## Testing Checklist

### Manual Testing
1. Create test file with simple embed: `![[test-block]]`
2. Create test file with recursive embeds
3. Create test with circular reference
4. Test with missing file reference
5. Test with YAML front-matter in embedded file
6. Run `plx sync claude` and verify output

### Expected Results
- Simple embeds are replaced with content
- Recursive embeds are fully expanded
- Circular references show warning and are skipped
- Missing files show warning and preserve original
- Front-matter is stripped from embedded content
- Standard WikiLinks still work after embedded processing

## Summary

This implementation plan provides step-by-step instructions to create the embedded WikiLinks processor. The implementation reuses existing patterns and functions, making it a straightforward addition to the sync workflow. Total effort: 3 story points.