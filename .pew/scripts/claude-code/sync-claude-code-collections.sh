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
COLLECTIONS_SOURCE=$("$YAML_PARSER" get_sources collections | head -1)
if [ -z "$COLLECTIONS_SOURCE" ]; then
    COLLECTIONS_SOURCE="collections"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$COLLECTIONS_SOURCE"

# Get target directories from YAML config
COLLECTION_TARGETS=()
while IFS= read -r line; do
    COLLECTION_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets collections)
if [ ${#COLLECTION_TARGETS[@]} -eq 0 ]; then
    # Fallback to default if no targets found
    COLLECTION_TARGETS=(".claude/commands/collect/")
fi

# Set primary target - collections should go to commands/collect based on YAML
CLAUDE_COMMANDS_COLLECT_DIR="$BASE_ROOT/${COLLECTION_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating collections directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📚 Creating Claude collection commands directory..."
mkdir -p "$CLAUDE_COMMANDS_COLLECT_DIR"

echo "📚 Processing collections from $SOURCE_DIR to $CLAUDE_COMMANDS_COLLECT_DIR..."

# Process each collection file
collection_count=0
for collection_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$collection_file" ]; then
        # Keep the original filename
        basename=$(basename "$collection_file")
        output_file="$CLAUDE_COMMANDS_COLLECT_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Add collection command header
        {
            echo "# 📚 Collection Command"
            echo ""
            echo "When this command is used, load this curated collection of related items."
            echo ""
            echo "---"
            echo ""
            cat "$collection_file"
        } > "$temp_file"
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created collect/$basename"
        ((collection_count++))
    fi
done

echo "✅ Successfully processed $collection_count collection files"