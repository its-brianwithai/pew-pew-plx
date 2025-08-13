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
MODES_SOURCE=$("$YAML_PARSER" get_sources modes | head -1)
if [ -z "$MODES_SOURCE" ]; then
    MODES_SOURCE="modes"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$MODES_SOURCE"
BLOCKS_DIR="$PROJECT_ROOT/blocks"

# Get target directories from YAML config
MODE_TARGETS=()
while IFS= read -r line; do
    MODE_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets modes)
if [ ${#MODE_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found
    MODE_TARGETS=(".claude/commands/activate/")
fi

# Set primary target
OUTPUT_DIR="$BASE_ROOT/${MODE_TARGETS[0]%/}"

echo "🎮 Syncing modes..."

# Create modes directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating modes directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

# Create source directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating modes directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Process each mode file
for mode_file in "$SOURCE_DIR"/*.md; do
    if [ -f "$mode_file" ]; then
        filename=$(basename "$mode_file")
        mode_name="${filename%.md}"
        
        echo "  Processing mode: $mode_name"
        
        # Create output file with command block header
        output_file="$OUTPUT_DIR/$filename"
        
        # Copy command block header
        if [ -f "$BLOCKS_DIR/mode-command-block.md" ]; then
            cat "$BLOCKS_DIR/mode-command-block.md" > "$output_file"
        else
            # Just copy the mode content if no command block exists
            cp "$mode_file" "$output_file"
            continue
        fi
        
        # Append mode content
        cat "$mode_file" >> "$output_file"
    fi
done

echo "✅ Modes synced successfully"
