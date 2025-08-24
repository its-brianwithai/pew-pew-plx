#!/bin/bash

# Script to merge current-raycast-snippets.json and pew-raycast-snippets.json into combined-raycast-snippets.json
# Single responsibility: merging two existing JSON files

set -e

# CONFIGURATION
# Set to true to give PEW snippets precedence (they override current snippets)
# Set to false to give current snippets precedence (they are kept over PEW snippets)
PEW_TAKES_PRECEDENCE=true

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Project root: $PROJECT_ROOT"
echo ""
echo "Configuration:"
echo "  PEW_TAKES_PRECEDENCE = $PEW_TAKES_PRECEDENCE"
echo ""

# File paths
CURRENT_SNIPPETS="$PROJECT_ROOT/imports/current-raycast-snippets.json"
PEW_SNIPPETS="$PROJECT_ROOT/exports/pew-raycast-snippets.json"
COMBINED_OUTPUT="$PROJECT_ROOT/exports/combined-raycast-snippets.json"

# Merge snippets
echo "Merging snippets..."
echo "==================="

# Create exports directory if it doesn't exist
mkdir -p "$PROJECT_ROOT/exports"

# Create imports directory if it doesn't exist
mkdir -p "$PROJECT_ROOT/imports"

# Check if current snippets file exists, if not create empty array
if [[ ! -f "$CURRENT_SNIPPETS" ]]; then
    echo "⚠️  Warning: No current snippets found at $CURRENT_SNIPPETS"
    echo "[]" > "$CURRENT_SNIPPETS"
    echo "   Created empty current snippets file"
fi

# Check if pew snippets file exists
if [[ ! -f "$PEW_SNIPPETS" ]]; then
    echo "❌ Error: PEW snippets file not found at: $PEW_SNIPPETS"
    echo "   Please run parse-pew-raycast-snippets.sh first"
    exit 1
fi

# Merge JSON files using Python
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

# Load current and pew snippets
current_snippets = load_json_file("$CURRENT_SNIPPETS")
pew_snippets = load_json_file("$PEW_SNIPPETS")

print(f"📊 Current snippets: {len(current_snippets)}")
print(f"📊 PEW snippets: {len(pew_snippets)}")

# Configuration from bash
pew_takes_precedence = "$PEW_TAKES_PRECEDENCE" == "true"

# Create a dictionary to track unique snippets by keyword
snippet_dict = OrderedDict()
overwritten_snippets = []

if pew_takes_precedence:
    print(f"🔄 Mode: PEW snippets will OVERRIDE current snippets with same keyword")
    print("")
    
    # Add current snippets first
    for snippet in current_snippets:
        keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
        if keyword:
            snippet_dict[keyword] = snippet
    
    # Then add PEW snippets (these override)
    added = 0
    overwritten = 0
    for snippet in pew_snippets:
        keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
        if keyword:
            if keyword in snippet_dict:
                # Track what we're overwriting
                old_snippet = snippet_dict[keyword]
                overwritten_snippets.append({
                    'keyword': keyword,
                    'old_name': old_snippet.get('name', 'Unknown'),
                    'new_name': snippet.get('name', 'Unknown'),
                    'old_text_preview': old_snippet.get('text', '')[:100] + '...' if len(old_snippet.get('text', '')) > 100 else old_snippet.get('text', ''),
                    'new_text_preview': snippet.get('text', '')[:100] + '...' if len(snippet.get('text', '')) > 100 else snippet.get('text', '')
                })
                overwritten += 1
            else:
                added += 1
            snippet_dict[keyword] = snippet
    
    # Print overwritten snippets
    if overwritten_snippets:
        print(f"⚠️  {len(overwritten_snippets)} snippets were OVERWRITTEN by PEW snippets:")
        print("=" * 60)
        for item in overwritten_snippets:
            print(f"")
            print(f"Keyword: {item['keyword']}")
            print(f"  OLD: {item['old_name']}")
            print(f"  NEW: {item['new_name']}")
            print(f"  Old preview: {item['old_text_preview'][:50]}...")
            print(f"  New preview: {item['new_text_preview'][:50]}...")
        print("=" * 60)
        print("")
        print("💡 If you want to KEEP the old snippets instead:")
        print("   1. Edit this script and set PEW_TAKES_PRECEDENCE=false")
        print("   2. Run the script again")
        print("")
else:
    print(f"🔄 Mode: Current snippets will be KEPT over PEW snippets with same keyword")
    print("")
    
    # Add current snippets (these take precedence)
    for snippet in current_snippets:
        keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
        if keyword:
            snippet_dict[keyword] = snippet
    
    current_count = len(snippet_dict)
    
    # Add pew snippets (only if keyword doesn't exist)
    duplicates = 0
    added = 0
    skipped_pew = []
    for snippet in pew_snippets:
        keyword = snippet.get('keyword', snippet.get('name', '').lower().replace(' ', '-'))
        if keyword:
            if keyword not in snippet_dict:
                snippet_dict[keyword] = snippet
                added += 1
            else:
                duplicates += 1
                skipped_pew.append({
                    'keyword': keyword,
                    'pew_name': snippet.get('name', 'Unknown'),
                    'kept_name': snippet_dict[keyword].get('name', 'Unknown')
                })
    
    if skipped_pew:
        print(f"ℹ️  {len(skipped_pew)} PEW snippets were SKIPPED (current snippets kept):")
        print("=" * 60)
        for item in skipped_pew:
            print(f"  Keyword: {item['keyword']}")
            print(f"    Kept: {item['kept_name']}")
            print(f"    Skipped PEW: {item['pew_name']}")
        print("=" * 60)
        print("")
        print("💡 If you want PEW snippets to OVERRIDE instead:")
        print("   1. Edit this script and set PEW_TAKES_PRECEDENCE=true")
        print("   2. Run the script again")
        print("")
    
    added = added
    overwritten = 0

# Convert back to list
combined_snippets = list(snippet_dict.values())

# Sort by name for consistency
combined_snippets.sort(key=lambda x: x.get('name', '').lower())

# Save combined snippets
with open("$COMBINED_OUTPUT", 'w') as f:
    json.dump(combined_snippets, f, indent=2, ensure_ascii=False)

print(f"✅ Merge completed:")
if pew_takes_precedence:
    print(f"   • Total PEW snippets: {len(pew_snippets)}")
    print(f"   • New snippets added: {added}")
    print(f"   • Snippets overwritten: {overwritten}")
    print(f"   • Total combined: {len(combined_snippets)} snippets")
else:
    print(f"   • Kept {current_count} current snippets")
    print(f"   • Added {added} new PEW snippets")
    print(f"   • Skipped {duplicates} duplicate PEW snippets")
    print(f"   • Total combined: {len(combined_snippets)} snippets")
EOF

# Validate the combined JSON
if python3 -m json.tool "$COMBINED_OUTPUT" > /dev/null 2>&1; then
    echo ""
    echo "✅ Successfully created: $COMBINED_OUTPUT"
    echo ""
    echo "📋 You can now import this file into Raycast:"
    echo "   1. Open Raycast Preferences"
    echo "   2. Go to Extensions → Snippets"
    echo "   3. Click Import/Export → Import"
    echo "   4. Select: $COMBINED_OUTPUT"
else
    echo "❌ Error: Generated combined JSON is invalid"
    exit 1
fi