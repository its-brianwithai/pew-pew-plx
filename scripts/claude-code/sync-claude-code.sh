#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔄 Starting Claude Code synchronization..."

echo "📋 Syncing agents..."
"$SCRIPT_DIR/sync-claude-code-agents.sh"

echo "🎯 Syncing commands..."
"$SCRIPT_DIR/sync-claude-code-commands.sh"

echo "✅ Claude Code synchronization complete!"
