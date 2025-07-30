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

echo "🎯 Syncing commands..."
"$SCRIPT_DIR/sync-claude-code-commands.sh"

echo "✅ Claude Code synchronization complete!"
