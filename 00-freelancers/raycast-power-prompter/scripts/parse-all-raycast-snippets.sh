#!/bin/bash

# Orchestrator script that runs all Raycast snippet parsing scripts in the correct order
# This ensures all files are generated properly before merging

set -e

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🚀 Running all Raycast snippet parsers..."
echo "=========================================="
echo "Project root: $PROJECT_ROOT"
echo ""

# Make all scripts executable
chmod +x "$SCRIPT_DIR"/*.sh

# Step 1: Parse PEW framework snippets
echo "Step 1: Parsing PEW framework snippets..."
echo "------------------------------------------"
if [[ -f "$SCRIPT_DIR/parse-pew-raycast-snippets.sh" ]]; then
    if bash "$SCRIPT_DIR/parse-pew-raycast-snippets.sh"; then
        echo "✅ PEW snippets parsed successfully"
    else
        echo "❌ Error: Failed to parse PEW snippets"
        exit 1
    fi
else
    echo "⚠️  Warning: parse-pew-raycast-snippets.sh not found"
fi
echo ""

# Step 2: Parse new unique snippets (PEW minus current)
echo "Step 2: Filtering for new unique snippets..."
echo "---------------------------------------------"
if [[ -f "$SCRIPT_DIR/parse-new-raycast-snippets.sh" ]]; then
    if bash "$SCRIPT_DIR/parse-new-raycast-snippets.sh"; then
        echo "✅ New snippets filtered successfully"
    else
        echo "❌ Error: Failed to filter new snippets"
        exit 1
    fi
else
    echo "⚠️  Warning: parse-new-raycast-snippets.sh not found"
fi
echo ""

# Step 3: Combine current and PEW snippets
echo "Step 3: Combining current and PEW snippets..."
echo "----------------------------------------------"
if [[ -f "$SCRIPT_DIR/parse-combined-raycast-snippets.sh" ]]; then
    if bash "$SCRIPT_DIR/parse-combined-raycast-snippets.sh"; then
        echo "✅ Combined snippets created successfully"
    else
        echo "❌ Error: Failed to combine snippets"
        exit 1
    fi
else
    echo "⚠️  Warning: parse-combined-raycast-snippets.sh not found"
fi
echo ""

# Summary
echo "✨ All parsing complete!"
echo "========================"
echo ""
echo "📁 Generated files in $PROJECT_ROOT/exports/:"
echo ""

# List generated files if they exist
if [[ -f "$PROJECT_ROOT/exports/pew-raycast-snippets.json" ]]; then
    COUNT=$(python3 -c "import json; print(len(json.load(open('$PROJECT_ROOT/exports/pew-raycast-snippets.json'))))" 2>/dev/null || echo "?")
    echo "   • pew-raycast-snippets.json ($COUNT snippets) - All PEW framework snippets"
fi

if [[ -f "$PROJECT_ROOT/exports/new-raycast-snippets.json" ]]; then
    COUNT=$(python3 -c "import json; print(len(json.load(open('$PROJECT_ROOT/exports/new-raycast-snippets.json'))))" 2>/dev/null || echo "?")
    echo "   • new-raycast-snippets.json ($COUNT snippets) - Only NEW snippets to add"
fi

if [[ -f "$PROJECT_ROOT/exports/combined-raycast-snippets.json" ]]; then
    COUNT=$(python3 -c "import json; print(len(json.load(open('$PROJECT_ROOT/exports/combined-raycast-snippets.json'))))" 2>/dev/null || echo "?")
    echo "   • combined-raycast-snippets.json ($COUNT snippets) - Current + PEW merged"
fi

echo ""
echo "📋 Import guide:"
echo "   1. Open Raycast Preferences"
echo "   2. Go to Extensions → Snippets"
echo "   3. Click Import/Export → Import"
echo "   4. Choose the file you want to import:"
echo "      - new-raycast-snippets.json: Add only new snippets"
echo "      - combined-raycast-snippets.json: Replace with full set"