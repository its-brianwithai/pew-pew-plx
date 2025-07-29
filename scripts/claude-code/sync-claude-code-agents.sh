#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AGENTS_DIR="$PROJECT_ROOT/agents"
CLAUDE_AGENTS_DIR="$PROJECT_ROOT/.claude/agents"

if [ ! -d "$AGENTS_DIR" ]; then
    echo "❌ Error: Agents directory not found at $AGENTS_DIR"
    exit 1
fi

echo "📋 Creating Claude agents directory..."
mkdir -p "$CLAUDE_AGENTS_DIR"

echo "📋 Copying agents from $AGENTS_DIR to $CLAUDE_AGENTS_DIR (excluding README files)..."

if [ "$(ls -A "$AGENTS_DIR")" ]; then
    find "$AGENTS_DIR" -type f ! -name "README*" ! -name "readme*" -exec cp {} "$CLAUDE_AGENTS_DIR/" \;
    echo "✅ Successfully copied $(find "$AGENTS_DIR" -type f ! -name "README*" ! -name "readme*" | wc -l) agent files"
else
    echo "⚠️  No agent files found to copy"
fi
