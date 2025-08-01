#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CLAUDE_DIR="$PROJECT_ROOT/.claude"

echo "🔗 Processing wikilinks in .claude directory..."

# Process all markdown files in .claude (excluding commands/act)
total_files=0
processed_files=0

# Count total files to process
for file in $(find "$CLAUDE_DIR" -name "*.md" -type f); do
    if [[ "$file" != *"/commands/act/"* ]]; then
        ((total_files++))
    fi
done

echo "📊 Found $total_files files to process"

# Process each file
find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    # Skip files in commands/act directory
    if [[ "$file" == *"/commands/act/"* ]]; then
        continue
    fi
    
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
            
            # Check in commands directories (plx, use, start) first
            if [ -f "$CLAUDE_DIR/commands/plx/$base_filename.md" ]; then
                replacement="@.claude/commands/plx/$base_filename.md"
            elif [ -f "$CLAUDE_DIR/commands/use/$base_filename.md" ]; then
                replacement="@.claude/commands/use/$base_filename.md"
            elif [ -f "$CLAUDE_DIR/commands/start/$base_filename.md" ]; then
                replacement="@.claude/commands/start/$base_filename.md"
            # Check in agents directory - first check root (for our flat copy)
            elif [ -f "$CLAUDE_DIR/agents/$base_filename.md" ]; then
                replacement="@.claude/agents/$base_filename.md"
            # Then check recursively for other use cases
            elif agent_file=$(find "$CLAUDE_DIR/agents" -name "$base_filename.md" -type f | head -1) && [ -n "$agent_file" ]; then
                # Convert absolute path to relative path starting with @.claude/agents/
                relative_path="${agent_file#$CLAUDE_DIR/}"
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