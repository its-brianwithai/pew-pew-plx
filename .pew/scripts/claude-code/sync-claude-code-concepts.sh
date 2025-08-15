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
CONCEPTS_SOURCE=$("$YAML_PARSER" get_sources concepts | head -1)
if [ -z "$CONCEPTS_SOURCE" ]; then
    CONCEPTS_SOURCE="concepts"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$CONCEPTS_SOURCE"

# Get target directories from YAML config
CONCEPT_TARGETS=()
while IFS= read -r line; do
    CONCEPT_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets concepts)
if [ ${#CONCEPT_TARGETS[@]} -eq 0 ]; then
    # Fallback to default if no targets found
    CONCEPT_TARGETS=(".claude/commands/understand/")
fi

# Set primary target - concepts should go to commands/understand based on YAML
CLAUDE_COMMANDS_UNDERSTAND_DIR="$BASE_ROOT/${CONCEPT_TARGETS[0]%/}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating concepts directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "💡 Creating Claude concept commands directory..."
mkdir -p "$CLAUDE_COMMANDS_UNDERSTAND_DIR"

echo "💡 Processing concepts from $SOURCE_DIR to $CLAUDE_COMMANDS_UNDERSTAND_DIR..."

# Process each concept file
concept_count=0
for concept_file in $(find "$SOURCE_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$concept_file" ]; then
        # Keep the original filename
        basename=$(basename "$concept_file")
        output_file="$CLAUDE_COMMANDS_UNDERSTAND_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Add concept command header
        {
            echo "# 💡 Concept Command"
            echo ""
            echo "When this command is used, apply this conceptual understanding to your approach."
            echo ""
            echo "---"
            echo ""
            cat "$concept_file"
        } > "$temp_file"
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        echo "✅ Created understand/$basename"
        ((concept_count++))
    fi
done

echo "✅ Successfully processed $concept_count concept files"