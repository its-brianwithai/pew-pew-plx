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
WORKFLOWS_SOURCE=$("$YAML_PARSER" get_sources workflows | head -1)
if [ -z "$WORKFLOWS_SOURCE" ]; then
    WORKFLOWS_SOURCE="workflows"  # Default fallback
fi
SOURCE_DIR="$PROJECT_ROOT/$WORKFLOWS_SOURCE"

# Get target directories from YAML config
WORKFLOW_TARGETS=()
while IFS= read -r line; do
    WORKFLOW_TARGETS+=("$line")
done < <("$YAML_PARSER" get_targets workflows)
if [ ${#WORKFLOW_TARGETS[@]} -eq 0 ]; then
    # Fallback to defaults if no targets found
    WORKFLOW_TARGETS=(".claude/commands/start/")
fi

# Set primary target
CLAUDE_COMMANDS_START_DIR="$BASE_ROOT/${WORKFLOW_TARGETS[0]%/}"

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
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/workflow-command-block.md");
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
                cat "$PROJECT_ROOT/blocks/workflow-command-block.md"
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
