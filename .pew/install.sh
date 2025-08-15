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

# Check if .pew directory already exists and remove it
if [ -d "$PEW_DIR" ]; then
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

echo -e "${BLUE}📋 Copying framework content based on YAML config...${NC}"
# Use YAML parser to get source directories and copy them properly
YAML_PARSER="$PEW_DIR/scripts/claude-code/plx-yaml-parser.sh"
if [ -f "$YAML_PARSER" ]; then
    for type in $("$YAML_PARSER" list_source_types); do
        while IFS= read -r source; do
            [ -z "$source" ] && continue
            # Remove .pew/ prefix to get the actual directory name
            source_dir=$(echo "$source" | sed 's|^\.pew/||')
            if [ -d "$TEMP_DIR/$source_dir" ]; then
                echo "  Copying $source_dir to $source..."
                mkdir -p "$PROJECT_ROOT/$source"
                cp -r "$TEMP_DIR/$source_dir"/* "$PROJECT_ROOT/$source"/ 2>/dev/null || true
            fi
        done < <("$YAML_PARSER" get_sources "$type")
    done
else
    echo "⚠️  YAML parser not found, using fallback copy method"
    # Fallback: copy to .pew/ subdirectories
    for dir in agents prompts templates workflows instructions modes blocks output-formats personas collections concepts; do
        if [ -d "$TEMP_DIR/$dir" ]; then
            echo "  Copying $dir..."
            mkdir -p "$PEW_DIR/$dir"
            cp -r "$TEMP_DIR/$dir"/* "$PEW_DIR/$dir"/ 2>/dev/null || true
        fi
    done
fi

# Copy references directory (not in sync_sources, goes to project root)
if [ -d "$TEMP_DIR/references" ]; then
    echo "  Copying references..."
    mkdir -p "$PROJECT_ROOT/references"
    cp -r "$TEMP_DIR/references"/* "$PROJECT_ROOT/references"/ 2>/dev/null || true
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