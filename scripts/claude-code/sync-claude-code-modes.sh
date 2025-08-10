#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    SOURCE_DIR="$CLAUDE_SYNC_TEMP_DIR/modes"
    OUTPUT_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/activate"
    BLOCKS_DIR="$CLAUDE_SYNC_TEMP_DIR/templates/blocks"
else
    SOURCE_DIR="$PROJECT_ROOT/modes"
    OUTPUT_DIR="$PROJECT_ROOT/.claude/commands/activate"
    BLOCKS_DIR="$PROJECT_ROOT/templates/blocks"
fi

echo "🎮 Syncing modes..."

# Create modes directory if it doesn't exist
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