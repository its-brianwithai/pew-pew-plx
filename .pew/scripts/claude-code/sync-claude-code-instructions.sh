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
INSTRUCTIONS_SOURCE=$("$YAML_PARSER" get_sources instructions | head -1)
if [ -z "$INSTRUCTIONS_SOURCE" ]; then
    INSTRUCTIONS_SOURCE="instructions"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$INSTRUCTIONS_SOURCE"

# Get blocks source directory from YAML config
BLOCKS_SOURCE=$("$YAML_PARSER" get_sources blocks | head -1)
if [ -z "$BLOCKS_SOURCE" ]; then
    BLOCKS_SOURCE="blocks"  # Default fallback
fi
BLOCKS_DIR="$PROJECT_ROOT/$BLOCKS_SOURCE"

# Get target directories from YAML config
INSTRUCTION_TARGETS=()
while IFS= read -r line; do
    INSTRUCTION_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets instructions)
if [ ${#INSTRUCTION_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found
    INSTRUCTION_TARGETS=(".claude/commands/apply/")
fi

# Set primary target
CLAUDE_FOLLOW_DIR="$BASE_ROOT/${INSTRUCTION_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating instructions directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📚 Creating Claude apply directory..."
mkdir -p "$CLAUDE_FOLLOW_DIR"

# Create source directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating instructions directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

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
            BLOCKS_DIR="$BLOCKS_DIR" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["BLOCKS_DIR"] "/instruction-command-block.md");
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
                cat "$BLOCKS_DIR/instruction-command-block.md"
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
