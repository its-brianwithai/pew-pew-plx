#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TEMP_DIR="/tmp/claude-sync-$$"

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

# Check for --clean flag
if [[ "$1" == "--clean" ]]; then
    echo "🧹 Cleaning .claude directories..."
    rm -rf "$PROJECT_ROOT/.claude/agents"
    rm -rf "$PROJECT_ROOT/.claude/commands"
    echo "✅ Clean complete!"
fi

echo "🔄 Starting Claude Code synchronization..."

# Create temp directory structure
echo "📁 Creating temporary sync directory..."
mkdir -p "$TEMP_DIR/.claude/agents"
mkdir -p "$TEMP_DIR/.claude/commands"

# Export temp dir for child scripts
export CLAUDE_SYNC_TEMP_DIR="$TEMP_DIR"

echo "📋 Syncing agents..."
"$SCRIPT_DIR/sync-claude-code-agents.sh"

echo "🎯 Syncing prompts..."
"$SCRIPT_DIR/sync-claude-code-prompts.sh"

echo "📋 Syncing templates..."
"$SCRIPT_DIR/sync-claude-code-templates.sh"

echo "🔄 Syncing workflows..."
"$SCRIPT_DIR/sync-claude-code-workflows.sh"

echo "📚 Syncing instructions..."
"$SCRIPT_DIR/sync-claude-code-instructions.sh"

echo "🔗 Processing embedded wikilinks..."
"$SCRIPT_DIR/sync-claude-code-embedded-wikilinks.sh"

echo "🔗 Processing wikilinks..."
"$SCRIPT_DIR/sync-claude-code-wikilinks.sh"

echo "📦 Moving files to .claude directory..."

# Remove existing directories if they exist
rm -rf "$PROJECT_ROOT/.claude/agents"
rm -rf "$PROJECT_ROOT/.claude/commands"

# Move from temp to final location
mv "$TEMP_DIR/.claude/agents" "$PROJECT_ROOT/.claude/"
mv "$TEMP_DIR/.claude/commands" "$PROJECT_ROOT/.claude/"

echo "✅ Claude Code synchronization complete!"
