#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
BLOCKS_DIR="$PROJECT_ROOT/.pew/templates/blocks"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_COMMANDS_USE_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/use"
else
    CLAUDE_COMMANDS_USE_DIR="$PROJECT_ROOT/.claude/commands/use"
fi

if [ ! -d "$BLOCKS_DIR" ]; then
    echo "❌ Error: Blocks directory not found at $BLOCKS_DIR"
    exit 1
fi

echo "🧱 Creating Claude block commands directory..."
mkdir -p "$CLAUDE_COMMANDS_USE_DIR"

echo "🧱 Processing blocks from $BLOCKS_DIR to $CLAUDE_COMMANDS_USE_DIR..."

# Process each block file (excluding command blocks)
block_count=0
for block_file in $(find "$BLOCKS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" ! -name "*command-block*"); do
    if [ -f "$block_file" ]; then
        # Keep the original filename
        basename=$(basename "$block_file")
        output_file="$CLAUDE_COMMANDS_USE_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$block_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/.pew/templates/blocks/block-command-block.md");
                    print "";
                    print "````````````";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
                END { print "````````````" }
            ' "$block_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/.pew/templates/blocks/block-command-block.md"
                echo ""
                echo "\`\`\`\`\`\`\`\`\`\`"
                cat "$block_file"
                echo "\`\`\`\`\`\`\`\`\`\`"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created use/$basename"
        ((block_count++))
    fi
done

echo "✅ Successfully processed $block_count block files"