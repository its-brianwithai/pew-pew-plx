#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
WORKFLOWS_DIR="$PROJECT_ROOT/workflows"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_COMMANDS_START_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude/commands/start"
else
    CLAUDE_COMMANDS_START_DIR="$PROJECT_ROOT/.claude/commands/start"
fi

if [ ! -d "$WORKFLOWS_DIR" ]; then
    echo "❌ Error: Workflows directory not found at $WORKFLOWS_DIR"
    exit 1
fi

echo "🔄 Creating Claude workflow commands directory..."
mkdir -p "$CLAUDE_COMMANDS_START_DIR"

echo "🔄 Processing workflows from $WORKFLOWS_DIR to $CLAUDE_COMMANDS_START_DIR..."

# Process each workflow file
workflow_count=0
for workflow_file in "$WORKFLOWS_DIR"/*.md; do
    if [ -f "$workflow_file" ]; then
        # Keep the original filename
        basename=$(basename "$workflow_file")
        output_file="$CLAUDE_COMMANDS_START_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$workflow_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/meta/workflow-command-block.md");
                    print "";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
            ' "$workflow_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/blocks/meta/workflow-command-block.md"
                echo ""
                cat "$workflow_file"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        
        ((workflow_count++))
    fi
done

echo "✅ Successfully created $workflow_count workflow commands"