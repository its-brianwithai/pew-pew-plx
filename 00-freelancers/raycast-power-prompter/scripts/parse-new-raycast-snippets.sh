#!/bin/bash

# Script to parse only NEW snippets that exist in pew-raycast-snippets.json but NOT in current-raycast-snippets.json
# Output contains only the unique/new snippets

set -e

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Project root: $PROJECT_ROOT"

# File paths
PEW_SNIPPETS="$PROJECT_ROOT/exports/pew-raycast-snippets.json"
CURRENT_SNIPPETS="$PROJECT_ROOT/imports/current-raycast-snippets.json"
OUTPUT_FILE="$PROJECT_ROOT/exports/new-raycast-snippets.json"

# Create directories if they don't exist
mkdir -p "$PROJECT_ROOT/exports"
mkdir -p "$PROJECT_ROOT/imports"

# Check if pew-raycast-snippets.json exists
if [[ ! -f "$PEW_SNIPPETS" ]]; then
    echo "❌ Error: pew-raycast-snippets.json not found at: $PEW_SNIPPETS"
    echo "   Please run parse-pew-raycast-snippets.sh first to generate it"
    exit 1
fi

# Check if current snippets file exists, if not create empty array
if [[ ! -f "$CURRENT_SNIPPETS" ]]; then
    echo "⚠️  Warning: No current snippets found at $CURRENT_SNIPPETS"
    echo "[]" > "$CURRENT_SNIPPETS"
    echo "   Created empty current snippets file"
fi

# Filter snippets using Python
python3 << EOF
import json
import sys
from collections import OrderedDict

def load_json_file(filepath):
    try:
        with open(filepath, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"⚠️  Warning: Could not load {filepath}: {e}")
        return []

# Load pew and current snippets
pew_snippets = load_json_file("$PEW_SNIPPETS")
current_snippets = load_json_file("$CURRENT_SNIPPETS")

print(f"📊 PEW framework snippets: {len(pew_snippets)}")
print(f"📊 Current snippets: {len(current_snippets)}")

# Create a set of current snippet keywords for fast lookup
current_keywords = set()
for snippet in current_snippets:
    keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
    if keyword:
        current_keywords.add(keyword)

print(f"📊 Unique current keywords: {len(current_keywords)}")

# Filter to only NEW snippets (in pew but not in current)
new_snippets = []
duplicates = 0

for snippet in pew_snippets:
    keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
    if keyword:
        if keyword not in current_keywords:
            new_snippets.append(snippet)
        else:
            duplicates += 1

# Sort by name for consistency
new_snippets.sort(key=lambda x: x.get('name', '').lower())

# Save new snippets only
with open("$OUTPUT_FILE", 'w') as f:
    json.dump(new_snippets, f, indent=2, ensure_ascii=False)

print(f"")
print(f"✅ Filtering completed:")
print(f"   • PEW framework snippets: {len(pew_snippets)}")
print(f"   • Already in current: {duplicates}")
print(f"   • NEW snippets only: {len(new_snippets)}")
print(f"")
print(f"📋 These {len(new_snippets)} NEW snippets can be imported to Raycast")
EOF

# Validate the output JSON
if python3 -m json.tool "$OUTPUT_FILE" > /dev/null 2>&1; then
    echo ""
    echo "✅ Successfully created: $OUTPUT_FILE"
    echo ""
    echo "📋 This file contains ONLY NEW snippets not already in your Raycast"
    echo "   You can import this file into Raycast to add only the new snippets:"
    echo "   1. Open Raycast Preferences"
    echo "   2. Go to Extensions → Snippets"
    echo "   3. Click Import/Export → Import"
    echo "   4. Select: $OUTPUT_FILE"
else
    echo "❌ Error: Generated JSON is invalid"
    exit 1
fi
