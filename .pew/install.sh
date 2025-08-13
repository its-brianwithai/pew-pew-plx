#!/bin/bash

# Pew Pew Framework Installer
# Downloads and sets up the Pew Pew framework in the current directory

set -e

echo "⚡ Installing Pew Pew Framework..."

# Check if running from the pew-pew-workspace directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/plx.yaml" ] && [ -d "$SCRIPT_DIR/agents" ]; then
    echo "📍 Installing from local Pew Pew workspace..."
    SOURCE_DIR="$SCRIPT_DIR"
    IS_LOCAL=true
else
    IS_LOCAL=false
    # Create temp directory for download
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf $TEMP_DIR" EXIT
    
    # For now, provide instructions for manual setup
    echo "❌ Remote installation not yet available."
    echo ""
    echo "📋 To install Pew Pew Framework manually:"
    echo "1. Clone the repository:"
    echo "   git clone https://github.com/its-brianwithai/pew-pew-workspace.git /tmp/pew-pew-workspace"
    echo ""
    echo "2. Run the installer from the cloned directory:"
    echo "   /tmp/pew-pew-workspace/install.sh"
    echo ""
    echo "Or if you have the pew-pew-workspace locally, run:"
    echo "   /path/to/pew-pew-workspace/install.sh"
    exit 1
fi

# Check if we're in a git repository
if [ -d .git ]; then
    echo "📦 Detected git repository"
fi

# Copy framework directories (skip if they already exist)
FRAMEWORK_DIRS=(agents prompts templates workflows instructions modes blocks output-formats personas scripts)

for dir in "${FRAMEWORK_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "⚠️  Directory '$dir' already exists, merging contents..."
        if [ "$IS_LOCAL" = true ]; then
            cp -r "$SOURCE_DIR/$dir/"* "$dir/" 2>/dev/null || true
        fi
    else
        echo "✅ Installing $dir/"
        if [ "$IS_LOCAL" = true ]; then
            cp -r "$SOURCE_DIR/$dir" .
        fi
    fi
done

# Copy configuration file
if [ -f "plx.yaml" ]; then
    echo "⚠️  plx.yaml already exists, creating plx.yaml.new"
    if [ "$IS_LOCAL" = true ]; then
        cp "$SOURCE_DIR/plx.yaml" "plx.yaml.new"
    fi
else
    echo "✅ Installing plx.yaml configuration"
    if [ "$IS_LOCAL" = true ]; then
        cp "$SOURCE_DIR/plx.yaml" .
    fi
fi

# Make scripts executable
echo "🔧 Setting up scripts..."
chmod +x scripts/claude-code/*.sh

# Run sync
echo "🔄 Running initial sync..."
./scripts/claude-code/sync-claude-code.sh

echo ""
echo "✨ Pew Pew Framework installed successfully!"
echo ""
echo "📚 What's been added to your project:"
echo "   • agents/         - AI agent definitions"
echo "   • prompts/        - Reusable prompts"
echo "   • templates/      - Document templates"
echo "   • workflows/      - Multi-step processes"
echo "   • instructions/   - Rules and conventions"
echo "   • modes/          - Operational modes"
echo "   • blocks/         - Reusable content blocks"
echo "   • output-formats/ - Output specifications"
echo "   • personas/       - Role definitions"
echo "   • scripts/        - Sync and utility scripts"
echo "   • .claude/        - Synced Claude Code artifacts"
echo "   • plx.yaml        - Configuration file"
echo ""
echo "🎮 You can now use commands like:"
echo "   • /plx:create     - Create new artifacts"
echo "   • /plx:update     - Update existing artifacts"
echo "   • /plx:make       - Transform content"
echo "   • /act:<agent>    - Activate agents"
echo "   • /start:<workflow> - Start workflows"
echo ""
echo "📖 For full documentation, visit: https://github.com/yourusername/pew-pew-workspace"