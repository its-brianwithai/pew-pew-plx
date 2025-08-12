#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
REPO_ROOT="$(cd "$PROJECT_ROOT/.." && pwd)"
TEMP_DIR="$PROJECT_ROOT/tmp/claude-sync/"

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

CONFIG_BIN="node $REPO_ROOT/bin/plx-config.js"

# Pre-sync cleanup from config
if command -v node >/dev/null 2>&1; then
    if [ -f "$PROJECT_ROOT/config.yaml" ] || [ -f "$PROJECT_ROOT/lib/config.yaml" ]; then
        echo "🧹 Pre-sync cleanup per config..."
        while IFS= read -r target; do
            [ -z "$target" ] && continue
            echo "  Removing $target"
            rm -rf "$PROJECT_ROOT/$target"
        done < <($CONFIG_BIN list delete_before_sync_targets || true)
    fi
fi

echo "🔄 Starting Claude Code synchronization..."

# Create temp sync directory for processing
echo "📁 Creating temporary sync directory..."
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Create Claude structure in temp
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

echo "🎭 Syncing personas..."
"$SCRIPT_DIR/sync-claude-code-personas.sh"

echo "📄 Syncing output formats..."
"$SCRIPT_DIR/sync-claude-code-output-formats.sh"

echo "🧱 Syncing blocks..."
"$SCRIPT_DIR/sync-claude-code-blocks.sh"

echo "🎮 Syncing modes..."
"$SCRIPT_DIR/sync-claude-code-modes.sh"

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

# Post-sync cleanup from config
if command -v node >/dev/null 2>&1; then
    if [ -f "$PROJECT_ROOT/config.yaml" ] || [ -f "$PROJECT_ROOT/lib/config.yaml" ]; then
        echo "🧹 Post-sync cleanup per config..."
        while IFS= read -r target; do
            [ -z "$target" ] && continue
            echo "  Removing $target"
            rm -rf "$PROJECT_ROOT/$target"
        done < <($CONFIG_BIN list delete_after_sync_targets || true)
    fi
fi
