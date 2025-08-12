#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
REPO_ROOT="$(cd "$PROJECT_ROOT/.." && pwd)"
CONFIG_BIN="node $REPO_ROOT/bin/plx-config.js"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    SOURCE_DIR="$PROJECT_ROOT/templates"
else
    SOURCE_DIR="$PROJECT_ROOT/templates"
fi
# Removed old path

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    BASE_ROOT="$CLAUDE_SYNC_TEMP_DIR"
else
    BASE_ROOT="$PROJECT_ROOT"
fi

# Derive targets from config if available
USE_DIR_DEFAULT=".claude/commands/use"
if command -v node >/dev/null 2>&1; then
    first_target=$($CONFIG_BIN list sync_targets.templates 2>/dev/null | sed -n '1p' || true)
    if [ -n "$first_target" ]; then
        CLAUDE_COMMANDS_USE_DIR="$BASE_ROOT/${first_target%/}"
    else
        CLAUDE_COMMANDS_USE_DIR="$BASE_ROOT/$USE_DIR_DEFAULT"
    fi
else
    CLAUDE_COMMANDS_USE_DIR="$BASE_ROOT/$USE_DIR_DEFAULT"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "📁 Creating templates directory at $SOURCE_DIR"
    mkdir -p "$SOURCE_DIR"
fi

echo "📋 Creating Claude use commands directory..."
mkdir -p "$CLAUDE_COMMANDS_USE_DIR"

echo "📋 Processing templates from $SOURCE_DIR to $CLAUDE_COMMANDS_USE_DIR..."

# Process each template file
template_count=0
while IFS= read -r -d '' template_file; do
    if [ -f "$template_file" ]; then
        # Keep the original filename
        basename=$(basename "$template_file")
        output_file="$CLAUDE_COMMANDS_USE_DIR/$basename"
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Check if file has frontmatter
        first_line=$(head -n 1 "$template_file")
        if [[ "$first_line" == "---" ]]; then
            # File has frontmatter, find where it ends and insert header after
            PROJECT_ROOT="$PROJECT_ROOT" awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    system("cat " ENVIRON["PROJECT_ROOT"] "/blocks/template-command-block.md");
                    print "";
                    print "````````````";
                    in_frontmatter = 0; 
                    found_end = 1; 
                    next 
                }
                in_frontmatter { print; next }
                { print }
                END { print "````````````" }
            ' "$template_file" > "$temp_file"
        else
            # No frontmatter, add header at the beginning
            {
                cat "$PROJECT_ROOT/blocks/template-command-block.md"
                echo ""
                echo "\`\`\`\`\`\`\`\`\`\`"
                cat "$template_file"
                echo "\`\`\`\`\`\`\`\`\`\`"
            } > "$temp_file"
        fi
        
        # Move processed file to final location
        mv "$temp_file" "$output_file"
        
        ((template_count++))
    fi
done < <(find "$SOURCE_DIR" -name "*-template.md" -type f -print0)

echo "✅ Successfully created $template_count template commands"
