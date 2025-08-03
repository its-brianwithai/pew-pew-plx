#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
INSTRUCTIONS_DIR="$PROJECT_ROOT/instructions"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_FOLLOW_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/follow"
else
    CLAUDE_FOLLOW_DIR="$PROJECT_ROOT/.claude/commands/follow"
fi

if [ ! -d "$INSTRUCTIONS_DIR" ]; then
    echo "❌ Error: Instructions directory not found at $INSTRUCTIONS_DIR"
    exit 1
fi

echo "📚 Creating Claude follow directory..."
mkdir -p "$CLAUDE_FOLLOW_DIR"

echo "📚 Processing instructions from $INSTRUCTIONS_DIR to $CLAUDE_FOLLOW_DIR..."

# Process each instruction file
instruction_count=0
for instruction_file in $(find "$INSTRUCTIONS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
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
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/meta/instruction-command-block.md");
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
                cat "$PROJECT_ROOT/blocks/meta/instruction-command-block.md"
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