#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TEMPLATES_DIR="$PROJECT_ROOT/templates"
CLAUDE_COMMANDS_USE_DIR="$PROJECT_ROOT/.claude/commands/use"

if [ ! -d "$TEMPLATES_DIR" ]; then
    echo "❌ Error: Templates directory not found at $TEMPLATES_DIR"
    exit 1
fi

echo "📋 Creating Claude use commands directory..."
mkdir -p "$CLAUDE_COMMANDS_USE_DIR"

echo "📋 Processing templates from $TEMPLATES_DIR to $CLAUDE_COMMANDS_USE_DIR..."

# Process each template file
template_count=0
for template_file in "$TEMPLATES_DIR"/*-template.md; do
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
            awk '
                BEGIN { in_frontmatter = 1; found_end = 0 }
                in_frontmatter && /^---$/ && NR > 1 { 
                    print; 
                    print "# Template Command"; 
                    print ""; 
                    print "When this command is used, use the following template. Acknowledge your understanding and then await the user'\''s request.";
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
                echo "# Template Command"
                echo ""
                echo "When this command is used, use the following template. Acknowledge your understanding and then await the user's request."
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
done

echo "✅ Successfully created $template_count template commands"