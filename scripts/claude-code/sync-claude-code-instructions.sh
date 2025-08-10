#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    SOURCE_DIR="$CLAUDE_SYNC_TEMP_DIR/pew/instructions"
else
    SOURCE_DIR="$PROJECT_ROOT/pew/instructions"
fi
# Removed old path

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_FOLLOW_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/apply"
else
    CLAUDE_FOLLOW_DIR="$PROJECT_ROOT/.claude/commands/apply"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating instructions directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📚 Creating Claude apply directory..."
mkdir -p "$CLAUDE_FOLLOW_DIR"

echo "📚 Processing instructions from $SOURCE_DIR to $CLAUDE_FOLLOW_DIR..."

# Process each instruction file
instruction_count=0
for instruction_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$instruction_file" ]; then
        base_name=$(basename "$instruction_file" .md)
        output_file="$CLAUDE_FOLLOW_DIR/$base_name.md"
        
        # Create temporary file for processing
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$instruction_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/pew/templates/blocks/instruction-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$instruction_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/pew/templates/blocks/instruction-command-block.md"
                echo ""
                cat "$instruction_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created $base_name.md"
        ((instruction_count++))
    fi
done

echo "✅ Successfully processed $instruction_count instruction files"
