#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude"
    echo "🔗 Processing wikilinks in temp directory..."
else
    CLAUDE_DIR="$PROJECT_ROOT/.claude"
    echo "🔗 Processing wikilinks in .claude directory..."
fi

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

# Process each file
find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    # Create a temporary file
    temp_file=$(mktemp)

    # Copy original to temp
    cp "$file" "$temp_file"

    # Find all unique wikilinks in the file
    wikilinks=$(grep -o '\[\[[^]]*\]\]' "$file" 2>/dev/null | sort -u || true)

    # Process wiki links
    if [ -n "$wikilinks" ]; then
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

            # Escape special characters for sed
            escaped_wikilink=$(echo "$wikilink" | sed 's/\[/\\[/g' | sed 's/\]/\\]/g')
            escaped_replacement=$(echo "$replacement" | sed 's/\//\\\//g')

            # Use sed instead of perl (perl seems to be intercepted by something)
            sed -i '' "s/$escaped_wikilink/$escaped_replacement/g" "$temp_file"
        done <<< "$wikilinks"
    fi

    # Replace the original file with the processed one
    mv "$temp_file" "$file"
    ((processed_files++))

    # Show progress
    echo -ne "\r🔄 Processing: $processed_files/$total_files files"
done

echo -e "\n✅ Processed wikilinks in $total_files files"

# Debug: Check test file after processing
if [ -f "$CLAUDE_DIR/commands/follow/test-conventions.md" ]; then
    echo "🔍 Debug: test-conventions after wiki link processing:"
    grep -n "meta-agent" "$CLAUDE_DIR/commands/follow/test-conventions.md" || true
fi
