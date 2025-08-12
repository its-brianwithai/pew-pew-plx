#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
YAML_PARSER="$SCRIPT_DIR/plx-yaml-parser.sh"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

# Get source directories from YAML config
BLOCKS_SOURCE=$("$YAML_PARSER" get_sources blocks | head -1)
if [ -z "$BLOCKS_SOURCE" ]; then
    BLOCKS_SOURCE="blocks"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$BLOCKS_SOURCE"

# Get target directories from YAML config
BLOCK_TARGETS=()
while IFS= read -r line; do
    BLOCK_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets blocks)
if [ ${#BLOCK_TARGETS[@]} -eq 0 ]; then
    # Fallback to default if no targets found
    BLOCK_TARGETS=(".claude/commands/add/")
fi

# Set primary target - blocks should go to commands/add based on YAML
CLAUDE_COMMANDS_ADD_DIR="$BASE_ROOT/${BLOCK_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating blocks directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "🧱 Creating Claude block commands directory..."
mkdir -p "$CLAUDE_COMMANDS_ADD_DIR"

# Create source directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating blocks directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "🧱 Processing blocks from $SOURCE_DIR to $CLAUDE_COMMANDS_ADD_DIR..."

# Process each block file (excluding command blocks)
block_count=0
for block_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" ! -name "*command-block*"); do
    if [ -f "$block_file" ]; then
        # Keep the original filename
        basename=$(basename "$block_file")
        output_file="$CLAUDE_COMMANDS_ADD_DIR/$basename"
        
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
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/block-command-block.md");
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
                cat "$PROJECT_ROOT/blocks/block-command-block.md"
                echo ""
                echo "\`\`\`\`\`\`\`\`\`\`"
                cat "$block_file"
                echo "\`\`\`\`\`\`\`\`\`\`"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created add/$basename"
        ((block_count++))
    fi
done

echo "✅ Successfully processed $block_count block files"
