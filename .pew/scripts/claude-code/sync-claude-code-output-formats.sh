#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
YAML_PARSER="$SCRIPT_DIR/plx-yaml-parser.sh"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

# Get source directories from YAML config
OUTPUT_FORMATS_SOURCE=$("$YAML_PARSER" get_sources output-formats | head -1)
if [ -z "$OUTPUT_FORMATS_SOURCE" ]; then
    OUTPUT_FORMATS_SOURCE="output-formats"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$OUTPUT_FORMATS_SOURCE"

# Get blocks source directory from YAML config
BLOCKS_SOURCE=$("$YAML_PARSER" get_sources blocks | head -1)
if [ -z "$BLOCKS_SOURCE" ]; then
    BLOCKS_SOURCE="blocks"  # Default fallback
fi
BLOCKS_DIR="$PROJECT_ROOT/$BLOCKS_SOURCE"

# Get target directories from YAML config
OUTPUT_FORMAT_TARGETS=()
while IFS= read -r line; do
    OUTPUT_FORMAT_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets output-formats)
if [ ${#OUTPUT_FORMAT_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found - yaml shows output not use
    OUTPUT_FORMAT_TARGETS=(".claude/commands/output/")
fi

# Set primary target  
CLAUDE_COMMANDS_OUTPUT_DIR="$BASE_ROOT/${OUTPUT_FORMAT_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating output-formats directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📄 Creating Claude output format commands directory..."
mkdir -p "$CLAUDE_COMMANDS_OUTPUT_DIR"

# Create source directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating output-formats directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📄 Processing output formats from $SOURCE_DIR to $CLAUDE_COMMANDS_OUTPUT_DIR..."

# Process each output format file
format_count=0
for format_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$format_file" ]; then
        # Keep the original filename
        basename=$(basename "$format_file")
        output_file="$CLAUDE_COMMANDS_OUTPUT_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$format_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            BLOCKS_DIR="$BLOCKS_DIR" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["BLOCKS_DIR"] "/output-format-command-block.md");
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
                cat "$BLOCKS_DIR/output-format-command-block.md"
                echo ""
                cat "$format_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created output/$basename"
        ((format_count++))
    fi
done

echo "✅ Successfully processed $format_count output format files"
