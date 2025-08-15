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
SINGLE_VERB_TARGET=$("$YAML_PARSER" get_prompt_single_verb_target)
VERB_SUBJECT_TARGET=$("$YAML_PARSER" get_prompt_verb_subject_target)

# Set fallbacks if not found - default to verb_subject for backward compatibility
if [ -z "$SINGLE_VERB_TARGET" ] && [ -z "$VERB_SUBJECT_TARGET" ]; then
    # Old config format - use legacy get_targets approach
    LEGACY_TARGETS=()
    while IFS= read -r line; do
        LEGACY_TARGETS+=("$line")
    done < <("$YAML_PARSER" get_targets prompts 2>/dev/null || true)
    
    if [ ${#LEGACY_TARGETS[@]} -gt 0 ]; then
        # Use legacy target for both (backward compatibility)
        VERB_SUBJECT_TARGET="${LEGACY_TARGETS[0]}"
        SINGLE_VERB_TARGET="${LEGACY_TARGETS[0]}"
        echo "📋 Using legacy configuration - both single-verb and verb-subject prompts go to: $VERB_SUBJECT_TARGET"
    else
        # Ultimate fallback
        SINGLE_VERB_TARGET=".claude/commands/"
        VERB_SUBJECT_TARGET=".claude/commands/plx/"
    fi
else
    # New config format - set individual fallbacks
    if [ -z "$SINGLE_VERB_TARGET" ]; then
        SINGLE_VERB_TARGET=".claude/commands/"
    fi
    if [ -z "$VERB_SUBJECT_TARGET" ]; then
        VERB_SUBJECT_TARGET=".claude/commands/plx/"
    fi
fi

# Set target directories
CLAUDE_COMMANDS_DIR="$BASE_ROOT/${SINGLE_VERB_TARGET%/}"
CLAUDE_COMMANDS_PLX_DIR="$BASE_ROOT/${VERB_SUBJECT_TARGET%/}"

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

echo "🎯 Creating Claude commands directories..."
mkdir -p "$CLAUDE_COMMANDS_DIR"
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
        
        # Check if filename contains a hyphen (verb-subject pattern)
        if [[ "$base_name" == *"-"* ]]; then
            # Multi-word prompt (verb-subject) - goes to plx directory
            # Extract verb and subject
            verb="${base_name%%-*}"
            subject="${base_name#*-}"
            
            # Create verb subdirectory in plx
            verb_dir="$CLAUDE_COMMANDS_PLX_DIR/$verb"
            mkdir -p "$verb_dir"
            
            # Move processed file to verb directory with subject name only
            output_file="$verb_dir/$subject.md"
            mv "$temp_file" "$output_file"
            echo "✅ Created plx/$verb/$subject.md"
        else
            # Single verb prompt - goes to commands root directory
            output_file="$CLAUDE_COMMANDS_DIR/$base_name.md"
            mv "$temp_file" "$output_file"
            echo "✅ Created $base_name.md (single verb)"
        fi
        
        ((prompt_count++))
    fi
done

echo "✅ Successfully processed $prompt_count prompt files"
