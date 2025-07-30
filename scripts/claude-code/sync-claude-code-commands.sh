#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PROMPTS_DIR="$PROJECT_ROOT/prompts"
CLAUDE_COMMANDS_DIR="$PROJECT_ROOT/.claude/commands/plx"

if [ ! -d "$PROMPTS_DIR" ]; then
    echo "❌ Error: Prompts directory not found at $PROMPTS_DIR"
    exit 1
fi

echo "🎯 Creating Claude commands plx directory..."
mkdir -p "$CLAUDE_COMMANDS_DIR"

echo "🎯 Copying prompts from $PROMPTS_DIR to $CLAUDE_COMMANDS_DIR..."

# Copy all .md files from prompts directory (flat copy)
if [ -d "$PROMPTS_DIR" ]; then
    find "$PROMPTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" -exec cp {} "$CLAUDE_COMMANDS_DIR/" \;
    echo "✅ Successfully copied $(find "$PROMPTS_DIR" -name "*.md" -type f ! -name "README*" ! -name "readme*" | wc -l) prompt files"
else
    echo "⚠️  No prompt files found to copy"
fi
