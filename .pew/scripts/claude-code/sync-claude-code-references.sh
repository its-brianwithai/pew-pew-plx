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
REFERENCES_SOURCE=$("$YAML_PARSER" get_sources references | head -1)
if [ -z "$REFERENCES_SOURCE" ]; then
    REFERENCES_SOURCE="references"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$REFERENCES_SOURCE"

# Get target directories from YAML config
REFERENCE_TARGETS=()
while IFS= read -r line; do
    REFERENCE_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets references)
if [ ${#REFERENCE_TARGETS[@]} -eq 0 ]; then
    # Fallback to default if no targets found
    REFERENCE_TARGETS=(".claude/commands/refer/")
fi

# Set primary target - references should go to commands/refer based on pattern
CLAUDE_COMMANDS_REFER_DIR="$BASE_ROOT/${REFERENCE_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating references directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📖 Creating Claude reference commands directory..."
mkdir -p "$CLAUDE_COMMANDS_REFER_DIR"

echo "📖 Processing references from $SOURCE_DIR to $CLAUDE_COMMANDS_REFER_DIR..."

# Process each reference file
reference_count=0
for reference_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$reference_file" ]; then
        # Keep the original filename
        basename=$(basename "$reference_file")
        output_file="$CLAUDE_COMMANDS_REFER_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Add reference command header
        {
            echo "# 📖 Reference Command"
            echo ""
            echo "When this command is used, consult this reference documentation."
            echo ""
            echo "---"
            echo ""
            cat "$reference_file"
        } > "$temp_file"
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created refer/$basename"
        ((reference_count++))
    fi
done

echo "✅ Successfully processed $reference_count reference files"