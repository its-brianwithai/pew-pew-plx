#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🎯 Syncing prompt commands..."
"$SCRIPT_DIR/sync-claude-code-prompts.sh"

echo ""
echo "📋 Syncing template commands..."
"$SCRIPT_DIR/sync-claude-code-templates.sh"
