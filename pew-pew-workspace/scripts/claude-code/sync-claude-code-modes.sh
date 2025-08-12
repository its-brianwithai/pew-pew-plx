#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIG_BIN="node $PROJECT_ROOT/bin/plx-config.js"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

SOURCE_DIR="$PROJECT_ROOT/modes"
BLOCKS_DIR="$PROJECT_ROOT/templates/blocks"

# Derive targets from config if available
ACTIVATE_DIR_DEFAULT=".claude/commands/activate"
if command -v node >/dev/null 2>&1; then
    first_target=$($CONFIG_BIN list sync_targets.modes 2>/dev/null | sed -n '1p' || true)
    if [ -n "$first_target" ]; then
        OUTPUT_DIR="$BASE_ROOT/${first_target%/}"
    else
        OUTPUT_DIR="$BASE_ROOT/$ACTIVATE_DIR_DEFAULT"
    fi
else
    OUTPUT_DIR="$BASE_ROOT/$ACTIVATE_DIR_DEFAULT"
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