#!/bin/bash

# Script to parse all files from raycast-power-prompter into Raycast snippet format
# Excludes imports and exports folders

set -e

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Check if we're in raycast-power-prompter directory
if [[ ! "$(basename "$PROJECT_ROOT")" == "raycast-power-prompter" ]]; then
    echo "Error: This script must be run from within the raycast-power-prompter directory"
    echo "Current directory: $PROJECT_ROOT"
    exit 1
fi

echo "✓ Confirmed: Running from raycast-power-prompter directory"
echo "Project root: $PROJECT_ROOT"

# Output file
OUTPUT_FILE="$PROJECT_ROOT/exports/pew-raycast-snippets.json"

# Create exports directory if it doesn't exist
mkdir -p "$PROJECT_ROOT/exports"

# Function to get file name without extension
get_file_name() {
    basename "$1" | sed 's/\.[^.]*$//'
}

# Function to replace WikiLinks with snippet syntax
replace_wikilinks() {
    # First replace ![[LINK]] patterns, then [[LINK]] patterns
    # This ensures we don't leave stray ! characters
    sed 's/!\[\[\([^]]*\)\]\]/{snippet name="\1"}/g' | \
    sed 's/\[\[\([^]]*\)\]\]/{snippet name="\1"}/g'
}

# Function to escape JSON strings
escape_json() {
    python3 -c "import json; import sys; print(json.dumps(sys.stdin.read()))" | sed 's/^"//;s/"$//'
}

# Start JSON array
echo "[" > "$OUTPUT_FILE"

# Flag to track if we've added any snippets
FIRST_ENTRY=true

# Find all files recursively, excluding imports, exports, scripts folders and hidden files
while IFS= read -r -d '' file; do
    # Skip if file is in imports, exports, or scripts directory
    if [[ "$file" == *"/imports/"* ]] || [[ "$file" == *"/exports/"* ]] || [[ "$file" == *"/scripts/"* ]]; then
        continue
    fi
    
    # Skip hidden files and directories
    if [[ "$(basename "$file")" == .* ]]; then
        continue
    fi
    
    # Get relative path from project root
    REL_PATH="${file#$PROJECT_ROOT/}"
    
    # Skip files in root directory (no subdirectory)
    if [[ ! "$REL_PATH" == *"/"* ]]; then
        continue
    fi
    
    # Skip the output file itself
    if [[ "$file" == "$OUTPUT_FILE" ]]; then
        continue
    fi
    
    # Skip non-text files (you can adjust this list as needed)
    if [[ "$file" == *.png ]] || [[ "$file" == *.jpg ]] || [[ "$file" == *.jpeg ]] || \
       [[ "$file" == *.gif ]] || [[ "$file" == *.pdf ]] || [[ "$file" == *.zip ]] || \
       [[ "$file" == *.tar ]] || [[ "$file" == *.gz ]] || [[ "$file" == *.exe ]] || \
       [[ "$file" == *.dmg ]] || [[ "$file" == *.app ]]; then
        continue
    fi
    
    # Get file name and convert to kebab-case (it likely already is)
    FILE_NAME=$(get_file_name "$file")
    KEBAB_NAME=$(echo "$FILE_NAME" | sed 's/_/-/g' | tr '[:upper:]' '[:lower:]')
    
    # Read file content and replace WikiLinks
    if [[ -f "$file" ]] && [[ -r "$file" ]]; then
        FILE_CONTENT=$(cat "$file" | replace_wikilinks | escape_json)
        
        # Add comma if not first entry
        if [[ "$FIRST_ENTRY" == true ]]; then
            FIRST_ENTRY=false
        else
            echo "," >> "$OUTPUT_FILE"
        fi
        
        # Add snippet entry (use kebab name for both name and keyword with semicolon)
        cat >> "$OUTPUT_FILE" << EOF
  {
    "name": "$KEBAB_NAME",
    "text": "$FILE_CONTENT",
    "keyword": "$KEBAB_NAME;"
  }
EOF
        
        echo "✓ Processed: $REL_PATH"
    fi
done < <(find "$PROJECT_ROOT" -type f -print0 2>/dev/null)

# Close JSON array
echo "" >> "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

# Validate JSON
if python3 -m json.tool "$OUTPUT_FILE" > /dev/null 2>&1; then
    echo ""
    echo "✅ Successfully created: $OUTPUT_FILE"
    
    # Count snippets
    SNIPPET_COUNT=$(python3 -c "import json; print(len(json.load(open('$OUTPUT_FILE'))))")
    echo "📊 Total snippets created: $SNIPPET_COUNT"
else
    echo "❌ Error: Generated JSON is invalid. Please check the output file."
    exit 1
fi
