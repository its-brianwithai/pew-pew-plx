#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AGENTS_DIR="$PROJECT_ROOT/agents"
CLAUDE_AGENTS_DIR="$PROJECT_ROOT/.claude/agents"
CLAUDE_COMMANDS_DIR="$PROJECT_ROOT/.claude/commands/act"

if [ ! -d "$AGENTS_DIR" ]; then
    echo "❌ Error: Agents directory not found at $AGENTS_DIR"
    exit 1
fi

echo "📋 Creating Claude agents and commands directories..."
mkdir -p "$CLAUDE_AGENTS_DIR"
mkdir -p "$CLAUDE_COMMANDS_DIR"

echo "📋 Copying agents from $AGENTS_DIR to $CLAUDE_AGENTS_DIR..."

# Copy entire directory structure
if [ -d "$AGENTS_DIR" ]; then
    cp -r "$AGENTS_DIR"/* "$CLAUDE_AGENTS_DIR/" 2>/dev/null || true
    echo "✅ Successfully copied agent files with directory structure"
else
    echo "⚠️  No agent files found to copy"
fi

echo "📋 Creating as commands in $CLAUDE_COMMANDS_DIR..."

# Process each .md file for commands
for agent_file in $(find "$AGENTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*"); do
    if [ -f "$agent_file" ]; then
        base_name=$(basename "$agent_file" .md)
        # Create as- filename
        command_name="as-${base_name}.md"
        command_file="$CLAUDE_COMMANDS_DIR/$command_name"
        
        # Create temporary file for processing
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$agent_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends
            awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    print "# Agent Command"; 
                    print ""; 
                    print "When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user'\''s request.";
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
                echo "# Agent Command"
                echo ""
                echo "When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request."
                echo ""
                cat "$agent_file"
            } > "$temp_file"
        fi
        
        # Move temp file to final location
        mv "$temp_file" "$command_file"
        echo "✅ Created $command_name"
    fi
done

echo "✅ Agent sync complete!"
