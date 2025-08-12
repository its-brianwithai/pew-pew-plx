#!/bin/bash

# Pew Pew Framework Installer
# Downloads and sets up the Pew Pew framework in the current directory

set -e

echo "⚡ Installing Pew Pew Framework..."

# Check if we're in a git repository
if [ -d .git ]; then
    echo "📦 Detected git repository"
fi

# Create temp directory for download
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Download the framework
echo "📥 Downloading framework files..."
curl -L https://github.com/yourusername/pew-pew-workspace/archive/main.tar.gz -o "$TEMP_DIR/pew-pew.tar.gz"

# Extract to temp directory
echo "📂 Extracting framework components..."
tar -xzf "$TEMP_DIR/pew-pew.tar.gz" -C "$TEMP_DIR"

# Copy framework directories (skip if they already exist)
FRAMEWORK_DIRS=(agents prompts templates workflows instructions modes blocks output-formats personas scripts)

for dir in "${FRAMEWORK_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "⚠️  Directory '$dir' already exists, merging contents..."
        cp -r "$TEMP_DIR/pew-pew-workspace-main/$dir/"* "$dir/" 2>/dev/null || true
    else
        echo "✅ Installing $dir/"
        cp -r "$TEMP_DIR/pew-pew-workspace-main/$dir" .
    fi
done

# Copy configuration file
if [ -f "plx.yaml" ]; then
    echo "⚠️  plx.yaml already exists, creating plx.yaml.new"
    cp "$TEMP_DIR/pew-pew-workspace-main/plx.yaml" "plx.yaml.new"
else
    echo "✅ Installing plx.yaml configuration"
    cp "$TEMP_DIR/pew-pew-workspace-main/plx.yaml" .
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