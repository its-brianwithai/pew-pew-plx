#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get temp dir from parent script or use default
if [ -z "$CLAUDE_SYNC_TEMP_DIR" ]; then
    TEMP_DIR=".claude-sync-temp"
else
    TEMP_DIR="$CLAUDE_SYNC_TEMP_DIR"
fi

# Directories
MODES_DIR=".pew/modes"
OUTPUT_DIR="$TEMP_DIR/.claude/commands/activate"
BLOCKS_DIR=".pew/templates/blocks"

echo -e "${GREEN}Syncing modes...${NC}"

# Create temp and output directories
mkdir -p "$OUTPUT_DIR"

# Check if modes directory exists
if [ ! -d "$MODES_DIR" ]; then
    echo -e "${YELLOW}No modes directory found at $MODES_DIR${NC}"
    exit 0
fi

# Process each mode file
for mode_file in "$MODES_DIR"/*.md; do
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
            echo "Warning: mode-command-block.md not found"
        fi
        
        # Append mode content
        cat "$mode_file" >> "$output_file"
    fi
done

echo -e "${GREEN}Modes synced successfully${NC}"