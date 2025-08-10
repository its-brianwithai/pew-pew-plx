#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    SOURCE_DIR="$CLAUDE_SYNC_TEMP_DIR/output-formats"
else
    SOURCE_DIR="$PROJECT_ROOT/output-formats"
fi
# Removed old path

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_COMMANDS_USE_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/use"
else
    CLAUDE_COMMANDS_USE_DIR="$PROJECT_ROOT/.claude/commands/use"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating output-formats directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📄 Creating Claude output format commands directory..."
mkdir -p "$CLAUDE_COMMANDS_USE_DIR"

echo "📄 Processing output formats from $SOURCE_DIR to $CLAUDE_COMMANDS_USE_DIR..."

# Process each output format file
format_count=0
for format_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$format_file" ]; then
        # Keep the original filename
        basename=$(basename "$format_file")
        output_file="$CLAUDE_COMMANDS_USE_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$format_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/templates/blocks/output-format-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$format_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/templates/blocks/output-format-command-block.md"
                echo ""
                cat "$format_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created use/$basename"
        ((format_count++))
    fi
done

echo "✅ Successfully processed $format_count output format files"