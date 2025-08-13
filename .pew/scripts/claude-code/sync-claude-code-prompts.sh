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
PROMPTS_SOURCE=$("$YAML_PARSER" get_sources prompts | head -1)
if [ -z "$PROMPTS_SOURCE" ]; then
    PROMPTS_SOURCE="prompts"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$PROMPTS_SOURCE"

# Get target directories from YAML config
PROMPT_TARGETS=()
while IFS= read -r line; do
    PROMPT_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets prompts)
if [ ${#PROMPT_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found
    PROMPT_TARGETS=(".claude/commands/plx/")
fi

# Set primary target
CLAUDE_COMMANDS_PLX_DIR="$BASE_ROOT/${PROMPT_TARGETS[0]%/}"

CLAUDE_COMMANDS_DIR="$BASE_ROOT/.claude/commands"

# Get blocks source directory from YAML config
BLOCKS_SOURCE=$("$YAML_PARSER" get_sources blocks | head -1)
if [ -z "$BLOCKS_SOURCE" ]; then
    BLOCKS_SOURCE="blocks"  # Default fallback
fi
BLOCKS_DIR="$PROJECT_ROOT/$BLOCKS_SOURCE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating prompts directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "🎯 Creating Claude plx commands directory..."
mkdir -p "$CLAUDE_COMMANDS_PLX_DIR"

# Create source directory if it doesn't exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating prompts directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

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
            PROJECT_ROOT="$PROJECT_ROOT" BLOCKS_DIR="$BLOCKS_DIR" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["BLOCKS_DIR"] "/prompt-command-block.md");
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
                cat "$BLOCKS_DIR/prompt-command-block.md"
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
