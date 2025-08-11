#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIG_BIN="node $PROJECT_ROOT/bin/plx-config.js"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    SOURCE_DIR="$PROJECT_ROOT/workflows"
else
    SOURCE_DIR="$PROJECT_ROOT/workflows"
fi
# Removed old path

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

# Derive targets from config if available
START_DIR_DEFAULT=".claude/commands/start"
if command -v node >/dev/null 2>&1; then
    first_target=$($CONFIG_BIN list sync_targets.workflows 2>/dev/null | sed -n '1p' || true)
    if [ -n "$first_target" ]; then
        CLAUDE_COMMANDS_START_DIR="$BASE_ROOT/${first_target%/}"
    else
        CLAUDE_COMMANDS_START_DIR="$BASE_ROOT/$START_DIR_DEFAULT"
    fi
else
    CLAUDE_COMMANDS_START_DIR="$BASE_ROOT/$START_DIR_DEFAULT"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating workflows directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "🔄 Creating Claude workflow commands directory..."
mkdir -p "$CLAUDE_COMMANDS_START_DIR"

echo "🔄 Processing workflows from $SOURCE_DIR to $CLAUDE_COMMANDS_START_DIR..."

# Process each workflow file
workflow_count=0
for workflow_file in "$SOURCE_DIR"/*.md; do
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
                    system("cat " ENVIRON["PROJECT_ROOT"] "/templates/blocks/workflow-command-block.md");
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
                cat "$PROJECT_ROOT/templates/blocks/workflow-command-block.md"
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