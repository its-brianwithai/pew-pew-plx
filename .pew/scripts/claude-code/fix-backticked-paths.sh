#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
YAML_PARSER="$SCRIPT_DIR/plx-yaml-parser.sh"

# Use temp directory if available, otherwise use project directory
if [ -n "$CLAUDE_SYNC_TEMP_DIR" ]; then
    CLAUDE_DIR="$CLAUDE_SYNC_TEMP_DIR/.claude"
    echo "🔧 Fixing backticked paths to @ syntax..."
else
    CLAUDE_DIR="$PROJECT_ROOT/.claude"
    echo "🔧 Fixing backticked paths to @ syntax..."
fi

# Check if Claude directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "❌ Claude directory not found: $CLAUDE_DIR"
    exit 1
fi

# Function to get the actual source path for a type
get_source_path() {
    local type="$1"
    local source_path=""
    
    # Get the first source directory for this type from yaml parser
    if [ -f "$YAML_PARSER" ]; then
        source_path=$("$YAML_PARSER" get_sources "$type" 2>/dev/null | head -1 || echo "")
    fi
    
    # Return the path (could be empty if not found)
    echo "$source_path"
}

# Count total files to process
total_files=$(find "$CLAUDE_DIR" -name "*.md" -type f | wc -l | tr -d ' ')
processed_files=0

echo "📊 Found $total_files files to process"

# Define artifact types to process
ARTIFACT_TYPES=(
    "agents"
    "prompts"
    "templates"
    "workflows"
    "instructions"
    "modes"
    "blocks"
    "personas"
    "output-formats"
)

# Build the sed replacement commands
SED_COMMANDS=""

for type in "${ARTIFACT_TYPES[@]}"; do
    # Get the actual source path for this type
    source_path=$(get_source_path "$type")
    
    if [ -n "$source_path" ]; then
        # Prepare the type name for matching (handle output-formats specially)
        if [ "$type" = "output-formats" ]; then
            match_pattern="output-formats"
        else
            match_pattern="$type"
        fi
        
        # Build sed commands for different patterns
        # Pattern 1: `type/` → @source_path/
        SED_COMMANDS="${SED_COMMANDS}s|\`${match_pattern}/|@${source_path}/|g;"
        
        # Pattern 2: `type/<filename>` → @source_path/<filename>
        # This handles paths like `prompts/create.md`
        SED_COMMANDS="${SED_COMMANDS}s|\`${match_pattern}/\([^/\`]*\)\`|@${source_path}/\1|g;"
        
        # Pattern 3: Handle subdirectories like `templates/blocks/`
        SED_COMMANDS="${SED_COMMANDS}s|\`${match_pattern}/\([^/]*/\)|@${source_path}/\1|g;"
        
        echo "  📁 Mapping: \`${match_pattern}/\` → @${source_path}/"
    fi
done

# Remove trailing semicolon
SED_COMMANDS="${SED_COMMANDS%?}"

if [ -z "$SED_COMMANDS" ]; then
    echo "⚠️  No path mappings found. Check plx.yaml configuration."
    exit 0
fi

echo "🔄 Processing files..."

# Process each markdown file
find "$CLAUDE_DIR" -name "*.md" -type f | while read -r file; do
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Apply all sed replacements
    if [ -n "$SED_COMMANDS" ]; then
        sed "$SED_COMMANDS" "$file" > "$temp_file"
        
        # Only replace if file changed
        if ! cmp -s "$file" "$temp_file"; then
            mv "$temp_file" "$file"
            echo -ne "\r🔄 Processing: $((++processed_files))/$total_files files (modified: $(basename "$file"))"
        else
            rm "$temp_file"
            echo -ne "\r🔄 Processing: $((++processed_files))/$total_files files"
        fi
    else
        rm "$temp_file"
        ((processed_files++))
    fi
done

echo -e "\n✅ Fixed backticked paths to @ syntax in $total_files files"

# Debug: Show a sample of the changes
if [ -f "$CLAUDE_DIR/agents/meta-prompt-engineer.md" ]; then
    echo "🔍 Sample result from meta-prompt-engineer.md:"
    grep -m 3 '@[^@]*prompts/[^@]*' "$CLAUDE_DIR/agents/meta-prompt-engineer.md" 2>/dev/null || echo "  (no @ prompts paths found)"
fi