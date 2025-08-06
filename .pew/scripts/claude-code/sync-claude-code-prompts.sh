#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PROMPTS_DIR="$PROJECT_ROOT/prompts"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_COMMANDS_PLX_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/plx"
    CLAUDE_COMMANDS_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands"
else
    CLAUDE_COMMANDS_PLX_DIR="$PROJECT_ROOT/.claude/commands/plx"
    CLAUDE_COMMANDS_DIR="$PROJECT_ROOT/.claude/commands"
fi

if [ ! -d "$PROMPTS_DIR" ]; then
    echo "❌ Error: Prompts directory not found at $PROMPTS_DIR"
    exit 1
fi

echo "🎯 Creating Claude plx commands directory..."
mkdir -p "$CLAUDE_COMMANDS_PLX_DIR"

echo "🎯 Processing prompts from $PROMPTS_DIR to $CLAUDE_COMMANDS_PLX_DIR..."

# Process all .md files from prompts directory
prompt_count=0
for prompt_file in "$PROMPTS_DIR"/*.md; do
    if [ -f "$prompt_file" ] && [[ ! $(basename "$prompt_file") =~ ^(README|readme) ]]; then
        base_name=$(basename "$prompt_file" .md)
        
        # Create temporary file for processing
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$prompt_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/meta/prompt-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$prompt_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/blocks/meta/prompt-command-block.md"
                echo ""
                cat "$prompt_file"
            } > "$temp_file"
        fi
        
        # Check if filename contains a hyphen (verb-object pattern)
        if [[ "$base_name" == *"-"* ]]; then
            # Extract verb and object
            verb="${base_name%%-*}"
            object="${base_name#*-}"
            
            # Create verb subdirectory
            verb_dir="$CLAUDE_COMMANDS_PLX_DIR/$verb"
            mkdir -p "$verb_dir"
            
            # Move processed file to verb directory with object name only
            output_file="$verb_dir/$object.md"
            mv "$temp_file" "$output_file"
            echo "✅ Created $verb/$object.md"
        else
            # Single word prompt - move to plx directory
            output_file="$CLAUDE_COMMANDS_PLX_DIR/$base_name.md"
            mv "$temp_file" "$output_file"
            echo "✅ Created plx/$base_name.md"
        fi
        
        ((prompt_count++))
    fi
done

echo "✅ Successfully processed $prompt_count prompt files"