#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AGENTS_DIR="$PROJECT_ROOT/agents"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_AGENTS_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/agents"
    CLAUDE_COMMANDS_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/act"
else
    CLAUDE_AGENTS_DIR="$PROJECT_ROOT/.claude/agents"
    CLAUDE_COMMANDS_DIR="$PROJECT_ROOT/.claude/commands/act"
fi

if [ ! -d "$AGENTS_DIR" ]; then
    echo "❌ Error: Agents directory not found at $AGENTS_DIR"
    exit 1
fi

echo "📋 Creating Claude agents and commands directories..."
mkdir -p "$CLAUDE_AGENTS_DIR"
mkdir -p "$CLAUDE_COMMANDS_DIR"

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
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/meta/agent-command-block.md");
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
                cat "$PROJECT_ROOT/blocks/meta/agent-command-block.md"
                echo ""
                cat "$agent_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$command_file"
    fi
done

echo "✅ Agent sync complete!"
