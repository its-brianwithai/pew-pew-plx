#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    PERSONAS_DIR="$CLAUDE_SYNC_TEMP_DIR/pew/personas"
    CLAUDE_COMMANDS_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/act"
else
    PERSONAS_DIR="$PROJECT_ROOT/pew/personas"
    CLAUDE_COMMANDS_DIR="$PROJECT_ROOT/.claude/commands/act"
fi

# Create personas directory if it doesn't exist
if [ ! -d "$PERSONAS_DIR" ]; then
    echo "📁 Creating personas directory at $PERSONAS_DIR"
    mkdir -p "$PERSONAS_DIR"
fi

echo "🎭 Creating Claude persona commands directory..."
mkdir -p "$CLAUDE_COMMANDS_DIR"

echo "🎭 Processing personas from $PERSONAS_DIR to $CLAUDE_COMMANDS_DIR..."

# Process each persona file
persona_count=0
for persona_file in $(find "$PERSONAS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$persona_file" ]; then
        base_name=$(basename "$persona_file" .md)
        
        # Create output path in act directory
        command_file="$CLAUDE_COMMANDS_DIR/$base_name.md"
        
        # Create temporary file for processing
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$persona_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/pew/templates/blocks/persona-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$persona_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/pew/templates/blocks/persona-command-block.md"
                echo ""
                cat "$persona_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$command_file"
        echo "✅ Created act/$base_name.md"
        ((persona_count++))
    fi
done

echo "✅ Successfully processed $persona_count persona files"