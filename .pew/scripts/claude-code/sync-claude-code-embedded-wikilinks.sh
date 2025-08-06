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
# Use temp files for caching instead of associative array (macOS compatibility)
CACHE_DIR=$(mktemp -d)
trap "rm -rf $CACHE_DIR" EXIT

# Statistics
total_files=0
processed_files=0
embeds_resolved=0

# Count total files to process
for file in $(find "$CLAUDE_DIR" -name "*.md" -type f); do
    ((total_files++))
done

echo "📊 Found $total_files files to scan for embedded wikilinks"

# Function to search for file in project directories
find_in_project() {
    local filename="$1"
    local search_dirs=("blocks" "prompts" "agents" "instructions" "templates" "context" "docs" "workflows")
    
    for dir in "${search_dirs[@]}"; do
        if [ -d "$PROJECT_ROOT/$dir" ]; then
            # Search recursively in the directory
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
    
    # Search recursively in .claude
    local found=$(find "$CLAUDE_DIR" -name "$filename.md" -type f | head -1)
    if [ -n "$found" ]; then
        echo "$found"
        return 0
    fi
    
    return 1
}

# Extract content without front-matter
extract_content() {
    local filepath="$1"
    local cache_file="$CACHE_DIR/$(echo "$filepath" | sed 's/\//_/g')"
    
    # Check cache first
    if [ -f "$cache_file" ]; then
        cat "$cache_file"
        return 0
    fi
    
    # Read file content
    local content=$(cat "$filepath" 2>/dev/null || echo "")
    
    # Remove YAML front-matter if present
    # Check if first line is ---
    if echo "$content" | head -1 | grep -q '^---[[:space:]]*$'; then
        # Remove everything between first --- and second ---
        content=$(echo "$content" | awk '
            BEGIN { in_fm = 1; count = 0 }
            /^---[[:space:]]*$/ { 
                count++
                if (count == 1) { next }
                if (count == 2) { in_fm = 0; next }
            }
            !in_fm { print }
        ')
    fi
    
    # Trim leading and trailing blank lines only (preserve internal blank lines)
    # First, remove leading blank lines
    content=$(echo "$content" | awk 'NF {p=1} p')
    # Then, remove trailing blank lines
    content=$(echo "$content" | awk '{lines[NR] = $0} END {while (NR > 0 && lines[NR] ~ /^[[:space:]]*$/) NR--; for (i=1; i<=NR; i++) print lines[i]}')
    
    # Cache the result
    echo "$content" > "$cache_file"
    echo "$content"
}

# Process embedded wikilinks recursively
process_embedded_content() {
    local content="$1"
    local depth="$2"
    local current_file="$3"
    local chain="$4"
    
    # Check depth limit
    if [ "$depth" -gt "$MAX_DEPTH" ]; then
        echo "⚠️ Max recursion depth ($MAX_DEPTH) reached at $current_file" >&2
        echo "$content"
        return 0
    fi
    
    # Update processing chain
    local new_chain="${chain}:${current_file}"
    
    # Find all embedded wikilinks
    local embeds=$(echo "$content" | grep -o '!\[\[[^]]*\]\]' | sort -u || true)
    
    if [ -z "$embeds" ]; then
        echo "$content"
        return 0
    fi
    
    # Process each embed
    while IFS= read -r embed; do
        # Extract filename from embed
        local filename=$(echo "$embed" | sed 's/!\[\[\(.*\)\]\]/\1/')
        local base_filename="${filename%.md}"
        
        # Check for circular reference
        if [[ ":${chain}:" == *":${base_filename}:"* ]]; then
            echo "⚠️ Circular reference detected: $base_filename (in chain: ${chain})" >&2
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
        embedded_content=$(process_embedded_content "$embedded_content" $((depth + 1)) "$base_filename" "$new_chain")
        
        # Create temp file with the new content
        local temp_replacement=$(mktemp)
        echo "$content" | while IFS= read -r line; do
            if [[ "$line" == *"$embed"* ]]; then
                # Replace line containing embed with embedded content
                echo "$embedded_content"
            else
                echo "$line"
            fi
        done > "$temp_replacement"
        
        content=$(cat "$temp_replacement")
        rm "$temp_replacement"
        
        # Update global counter
        local current_count=$(cat "$embeds_counter_file" 2>/dev/null || echo "0")
        echo $((current_count + 1)) > "$embeds_counter_file"
    done <<< "$embeds"
    
    echo "$content"
}

# Process each file
files_with_embeds=0
# Use a temp file to track global embeds resolved counter
embeds_counter_file=$(mktemp)
echo "0" > "$embeds_counter_file"

find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    ((processed_files++))
    
    # Quick check if file contains embedded wikilinks
    if ! grep -q '!\[\[' "$file" 2>/dev/null; then
        echo -ne "\r🔄 Scanning: $processed_files/$total_files files"
        continue
    fi
    
    ((files_with_embeds++))
    
    # Create temp file
    temp_file=$(mktemp)
    
    # Read and process content
    content=$(cat "$file")
    processed_content=$(process_embedded_content "$content" 0 "$(basename "$file" .md)" "")
    
    # Write to temp file
    echo "$processed_content" > "$temp_file"
    
    # Replace original only if content changed
    if ! cmp -s "$file" "$temp_file"; then
        mv "$temp_file" "$file"
        echo -ne "\r🔄 Processing embedded wikilinks: $processed_files/$total_files files (modified: $files_with_embeds)"
    else
        rm "$temp_file"
        echo -ne "\r🔄 Scanning: $processed_files/$total_files files"
    fi
done

# Get final embeds count
embeds_resolved=$(cat "$embeds_counter_file" 2>/dev/null || echo "0")
rm -f "$embeds_counter_file"

echo -e "\n✅ Processed embedded wikilinks ($embeds_resolved embeds resolved)"