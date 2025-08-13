#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
YAML_PARSER="$SCRIPT_DIR/plx-yaml-parser.sh"
TEMP_DIR="$PROJECT_ROOT/tmp/claude-sync/"

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        
        # Check if tmp folder only contains claude-sync (now deleted)
        # If tmp is empty or only has hidden files, remove it too
        TMP_PARENT="$PROJECT_ROOT/tmp"
        if [ -d "$TMP_PARENT" ]; then
            # Count non-hidden entries in tmp
            count=$(ls -1 "$TMP_PARENT" 2>/dev/null | wc -l)
            if [ "$count" -eq 0 ]; then
                echo "🧹 Removing empty tmp directory..."
                rm -rf "$TMP_PARENT"
            fi
        fi
    fi
}

# Set trap to cleanup on exit, error, or interrupt
trap cleanup EXIT ERR INT TERM

# Pre-sync cleanup from YAML config
if [ -f "$PROJECT_ROOT/plx.yaml" ]; then
    echo "🧹 Pre-sync cleanup per config..."
    while IFS= read -r target; do
        [ -z "$target" ] && continue
        echo "  Removing $PROJECT_ROOT/$target"
        rm -rf "$PROJECT_ROOT/$target"
    done < <("$YAML_PARSER" get_delete_before || true)
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
"$SCRIPT_DIR/sync-claude-code-agents.sh" || { echo "❌ Agent sync failed"; cleanup; exit 1; }

echo "🎯 Syncing prompts..."
"$SCRIPT_DIR/sync-claude-code-prompts.sh" || { echo "❌ Prompt sync failed"; cleanup; exit 1; }

echo "📋 Syncing templates..."
"$SCRIPT_DIR/sync-claude-code-templates.sh" || { echo "❌ Template sync failed"; cleanup; exit 1; }

echo "🔄 Syncing workflows..."
"$SCRIPT_DIR/sync-claude-code-workflows.sh" || { echo "❌ Workflow sync failed"; cleanup; exit 1; }

echo "📚 Syncing instructions..."
"$SCRIPT_DIR/sync-claude-code-instructions.sh" || { echo "❌ Instruction sync failed"; cleanup; exit 1; }

echo "🎭 Syncing personas..."
"$SCRIPT_DIR/sync-claude-code-personas.sh" || { echo "❌ Persona sync failed"; cleanup; exit 1; }

echo "📄 Syncing output formats..."
"$SCRIPT_DIR/sync-claude-code-output-formats.sh" || { echo "❌ Output format sync failed"; cleanup; exit 1; }

echo "🧱 Syncing blocks..."
"$SCRIPT_DIR/sync-claude-code-blocks.sh" || { echo "❌ Block sync failed"; cleanup; exit 1; }

echo "🎮 Syncing modes..."
"$SCRIPT_DIR/sync-claude-code-modes.sh" || { echo "❌ Mode sync failed"; cleanup; exit 1; }

echo "🔗 Processing embedded wikilinks..."
"$SCRIPT_DIR/sync-claude-code-embedded-wikilinks.sh" || echo "⚠️  Embedded wikilinks processing had issues (non-critical)"

echo "🔗 Processing wikilinks..."
"$SCRIPT_DIR/sync-claude-code-wikilinks.sh" || echo "⚠️  Wikilinks processing had issues (non-critical)"

echo "📦 Moving files to .claude directory..."

# Remove existing directories if they exist
rm -rf "$PROJECT_ROOT/.claude/agents"
rm -rf "$PROJECT_ROOT/.claude/commands"

# Move from temp to final location
if ! mv "$TEMP_DIR/.claude/agents" "$PROJECT_ROOT/.claude/"; then
    echo "❌ Failed to move agents directory"
    cleanup
    exit 1
fi

if ! mv "$TEMP_DIR/.claude/commands" "$PROJECT_ROOT/.claude/"; then
    echo "❌ Failed to move commands directory"
    cleanup
    exit 1
fi

echo "✅ Claude Code synchronization complete!"

# Cleanup will be called automatically by trap

# Post-sync cleanup from YAML config
if [ -f "$PROJECT_ROOT/plx.yaml" ]; then
    echo "🧹 Post-sync cleanup per config..."
    while IFS= read -r target; do
        [ -z "$target" ] && continue
        echo "  Removing $PROJECT_ROOT/$target"
        rm -rf "$PROJECT_ROOT/$target"
    done < <("$YAML_PARSER" get_delete_after || true)
fi
