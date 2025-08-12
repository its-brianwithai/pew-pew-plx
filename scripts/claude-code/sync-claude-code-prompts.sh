#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
REPO_ROOT="$(cd "$PROJECT_ROOT/.." && pwd)"
CONFIG_BIN="node $REPO_ROOT/bin/plx-config.js"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

SOURCE_DIR="$PROJECT_ROOT/prompts"

# Derive targets from config if available
PLX_DIR_DEFAULT=".claude/commands/plx"
if command -v node >/dev/null 2>&1; then
    first_target=$($CONFIG_BIN list sync_targets.prompts 2>/dev/null | sed -n '1p' || true)
    if [ -n "$first_target" ]; then
        CLAUDE_COMMANDS_PLX_DIR="$BASE_ROOT/${first_target%/}"
    else
        CLAUDE_COMMANDS_PLX_DIR="$BASE_ROOT/$PLX_DIR_DEFAULT"
    fi
else
    CLAUDE_COMMANDS_PLX_DIR="$BASE_ROOT/$PLX_DIR_DEFAULT"
fi

CLAUDE_COMMANDS_DIR="$BASE_ROOT/.claude/commands"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating prompts directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "🎯 Creating Claude plx commands directory..."
mkdir -p "$CLAUDE_COMMANDS_PLX_DIR"

echo "🎯 Processing prompts from $SOURCE_DIR to $CLAUDE_COMMANDS_PLX_DIR..."

# Process all .md files from prompts directory
prompt_count=0
for prompt_file in "$SOURCE_DIR"/*.md; do
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
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/prompt-command-block.md");
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
                cat "$PROJECT_ROOT/blocks/prompt-command-block.md"
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
