#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
YAML_PARSER="$SCRIPT_DIR/plx-yaml-parser.sh"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

# Get source directories from YAML config
AGENTS_SOURCE=$("$YAML_PARSER" get_sources agents | head -1)
if [ -z "$AGENTS_SOURCE" ]; then
    AGENTS_SOURCE="agents"  # Default fallback
fi
AGENTS_DIR="$PROJECT_ROOT/$AGENTS_SOURCE"

# Get blocks source directory from YAML config
BLOCKS_SOURCE=$("$YAML_PARSER" get_sources blocks | head -1)
if [ -z "$BLOCKS_SOURCE" ]; then
    BLOCKS_SOURCE="blocks"  # Default fallback
fi
BLOCKS_DIR="$PROJECT_ROOT/$BLOCKS_SOURCE"

# Get target directories from YAML config
AGENT_TARGETS=()
while IFS= read -r line; do
    AGENT_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets agents)

if [ ${#AGENT_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found
    AGENT_TARGETS=(".claude/agents/" ".claude/commands/act/")
fi

# Set primary targets (first two from config)
CLAUDE_AGENTS_DIR="$BASE_ROOT/${AGENT_TARGETS[0]%/}"
if [ ${#AGENT_TARGETS[@]} -gt 1 ]; then
    CLAUDE_COMMANDS_DIR="$BASE_ROOT/${AGENT_TARGETS[1]%/}"
else
    CLAUDE_COMMANDS_DIR="$BASE_ROOT/.claude/commands/act"
fi

# Create agents directory if it doesn't exist
if [ ! -d "$AGENTS_DIR" ]; then
    echo "📁 Creating agents directory at $AGENTS_DIR"
    mkdir -p "$AGENTS_DIR"
fi

echo "📋 Creating Claude agents and commands directories..."
mkdir -p "$CLAUDE_AGENTS_DIR"
mkdir -p "$CLAUDE_COMMANDS_DIR"

# Create source directory if it doesn't exist
if [ ! -d "$AGENTS_DIR" ]; then
    echo "📁 Creating agents directory at $AGENTS_DIR"
    mkdir -p "$AGENTS_DIR"
fi

echo "📋 Copying agents from $AGENTS_DIR to $CLAUDE_AGENTS_DIR..."

# Copy all .md files from all subdirectories to the root of CLAUDE_AGENTS_DIR (flat copy)
if [ -d "$AGENTS_DIR" ]; then
    find "$AGENTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" -exec cp {} "$CLAUDE_AGENTS_DIR/" \;
    echo "✅ Successfully copied $(find "$AGENTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" | wc -l) agent files"
else
    echo "⚠️  No agent files found to copy"
fi

echo "📋 Creating agent commands in $CLAUDE_COMMANDS_DIR..."

# Process each .md file for commands
for agent_file in $(find "$AGENTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$agent_file" ]; then
        base_name=$(basename "$agent_file" .md)
        
        # Common persona suffixes to check
        personas=("engineer" "architect" "specialist" "developer" "reviewer" "drafter" "expert")
        
        # Default values
        persona=""
        object_path=""
        
        # Check if filename ends with any persona
        for p in "${personas[@]}"; do
            if [[ "$base_name" == *"-$p" ]]; then
                persona="$p"
                # Remove persona from the end to get the object
                object="${base_name%-$p}"
                # Replace hyphens with directory separators in object
                object_path="${object//-//}"
                break
            fi
        done
        
        # Determine the output path
        if [ -n "$persona" ] && [ -n "$object_path" ]; then
            # Multi-part name with persona: act/object-path/persona.md (NO 'as' folder)
            output_dir="$CLAUDE_COMMANDS_DIR/$object_path"
            mkdir -p "$output_dir"
            command_file="$output_dir/$persona.md"
            echo "✅ Created act/$object_path/$persona.md"
        else
            # Single word or no recognized persona: act/filename.md
            command_file="$CLAUDE_COMMANDS_DIR/$base_name.md"
            echo "✅ Created act/$base_name.md"
        fi
        
        # Create temporary file for processing
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$agent_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends
            BLOCKS_DIR="$BLOCKS_DIR" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["BLOCKS_DIR"] "/agent-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$agent_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$BLOCKS_DIR/agent-command-block.md"
                echo ""
                cat "$agent_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$command_file"
    fi
done

echo "✅ Agent sync complete!"
