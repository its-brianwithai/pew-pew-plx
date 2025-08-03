#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Check for --clean flag
if [[ "$1" == "--clean" ]]; then
    echo "🧹 Cleaning .claude directories..."
    rm -rf "$PROJECT_ROOT/.claude/agents"
    rm -rf "$PROJECT_ROOT/.claude/commands"
    echo "✅ Clean complete!"
fi

echo "🔄 Starting Claude Code synchronization..."

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

echo "🔗 Processing wikilinks..."
"$SCRIPT_DIR/sync-claude-code-wikilinks.sh"

echo "✅ Claude Code synchronization complete!"
