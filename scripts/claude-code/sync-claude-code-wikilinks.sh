#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CLAUDE_DIR="$PROJECT_ROOT/.claude"

echo "🔗 Processing wikilinks in .claude directory..."

# Process all markdown files in .claude
total_files=0
processed_files=0

# Count total files to process
for file in $(find "$CLAUDE_DIR" -name "*.md" -type f); do
    ((total_files++))
done

echo "📊 Found $total_files files to process"

# Function to search for file in project directories
find_in_project() {
    local filename="$1"
    local search_dirs=("prompts" "agents" "instructions" "templates" "context" "docs")
    
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

# Process each file
find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Copy original to temp
    cp "$file" "$temp_file"
    
    # Find all unique wikilinks in the file
    wikilinks=$(grep -o '\[\[[^]]*\]\]' "$file" 2>/dev/null | sort -u || true)
    
    if [ -n "$wikilinks" ]; then
        # Process each wikilink
        while IFS= read -r wikilink; do
            # Extract filename from wikilink
            filename=$(echo "$wikilink" | sed 's/\[\[\(.*\)\]\]/\1/')
            base_filename="${filename%.md}"
            
            # Find the actual location
            replacement=""
            
            # First search in project directories
            if project_file=$(find_in_project "$base_filename") && [ -n "$project_file" ]; then
                # Convert to relative path from project root
                relative_path="${project_file#$PROJECT_ROOT/}"
                replacement="@$relative_path"
            # Then search in .claude directories
            elif claude_file=$(find_in_claude "$base_filename") && [ -n "$claude_file" ]; then
                # Convert to relative path starting with @.claude/
                relative_path="${claude_file#$CLAUDE_DIR/}"
                replacement="@.claude/$relative_path"
            else
                # If not found, keep the original wikilink
                replacement="[[$base_filename]]"
            fi
            
            # Use perl with different delimiter to avoid slash issues
            perl -i -pe "s|\Q$wikilink\E|$replacement|g" "$temp_file"
        done <<< "$wikilinks"
    fi
    
    # Replace the original file with the processed one
    mv "$temp_file" "$file"
    ((processed_files++))
    
    # Show progress
    echo -ne "\r🔄 Processing: $processed_files/$total_files files"
done

echo -e "\n✅ Processed wikilinks in $total_files files"