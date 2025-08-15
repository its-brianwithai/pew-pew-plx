#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/its-brianwithai/pew-pew-workspace.git"
TEMP_DIR="/tmp/pew-pew-install-$$"
PROJECT_ROOT="$(pwd)"
PEW_DIR="$PROJECT_ROOT/.pew"

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Set trap for cleanup
trap cleanup EXIT ERR INT TERM

echo -e "${BLUE}🚀 Pew Pew Framework Installer${NC}"
echo "Installing into: $PROJECT_ROOT"
echo

# Check if .pew directory already exists
if [ -d "$PEW_DIR" ]; then
    echo -e "${YELLOW}⚠️  .pew/ directory already exists.${NC}"
    echo -e "${YELLOW}This will override all existing framework files.${NC}"
    echo
    echo -e "${BLUE}💡 If you just want to sync existing files, run:${NC}"
    echo -e "${BLUE}   make -f .pew/Makefile sync claude${NC}"
    echo
    
    # Use exec to redirect stdin from tty for piped execution
    exec < /dev/tty
    read -p "Continue with installation? (y/N): " -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}ℹ️  Installation cancelled. To sync existing framework files, run:${NC}"
        echo -e "${BLUE}   make -f .pew/Makefile sync claude${NC}"
        exit 0
    fi
    
    echo -e "${YELLOW}🗑️  Removing existing .pew/ directory...${NC}"
    rm -rf "$PEW_DIR"
fi

echo -e "${BLUE}📦 Cloning framework repository...${NC}"
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" --quiet

echo -e "${BLUE}📁 Creating .pew directory structure...${NC}"
mkdir -p "$PEW_DIR"

echo -e "${BLUE}🔧 Copying framework infrastructure...${NC}"
# Copy the core .pew infrastructure
if [ -d "$TEMP_DIR/.pew" ]; then
    cp -r "$TEMP_DIR/.pew"/* "$PEW_DIR"/
fi

echo -e "${BLUE}📋 Copying framework content...${NC}"
# Copy framework content from root directories to .pew subdirectories
for dir in agents prompts templates workflows instructions modes blocks output-formats personas collections concepts; do
    if [ -d "$TEMP_DIR/$dir" ]; then
        echo "  Copying $dir..."
        mkdir -p "$PEW_DIR/$dir"
        cp -r "$TEMP_DIR/$dir"/* "$PEW_DIR/$dir"/ 2>/dev/null || true
    fi
done

# Copy references if they exist
if [ -d "$PROJECT_ROOT/references" ]; then
    echo "  Found existing references directory, keeping it..."
elif [ -d "$TEMP_DIR/references" ]; then
    echo "  Copying references..."
    cp -r "$TEMP_DIR/references" "$PROJECT_ROOT/"
fi

echo -e "${BLUE}🔄 Running initial sync...${NC}"
if [ -f "$PEW_DIR/scripts/claude-code/sync-claude-code.sh" ]; then
    bash "$PEW_DIR/scripts/claude-code/sync-claude-code.sh"
else
    echo -e "${RED}⚠️  Sync script not found, skipping initial sync${NC}"
fi

echo
echo -e "${GREEN}✅ Pew Pew Framework installed successfully!${NC}"
echo
echo -e "${BLUE}🎯 Next steps:${NC}"
echo "  • All framework components are now in .pew/"
echo "  • Claude Code commands are available in .claude/commands/"
echo "  • Use 'make -f .pew/Makefile sync claude' to sync after changes"
echo "  • Check the README.md for available commands"
echo
echo -e "${GREEN}🎉 Ready to use Pew Pew framework!${NC}"