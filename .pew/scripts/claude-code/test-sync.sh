#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  PLX YAML-Based Sync Test Runner${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo ""

# Setup paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
TEST_ROOT="/tmp/plx-sync-test-$(date +%s)"
TEST_WORKSPACE="$TEST_ROOT/test-workspace"

echo -e "${YELLOW}📁 Creating test environment at: $TEST_ROOT${NC}"

# Cleanup function
cleanup_test() {
    echo -e "${YELLOW}🧹 Cleaning up test environment...${NC}"
    rm -rf "$TEST_ROOT"
}

# Set trap for cleanup
trap cleanup_test EXIT

# Create test structure
echo -e "${YELLOW}🏗️  Setting up test workspace...${NC}"
mkdir -p "$TEST_WORKSPACE"
cd "$TEST_WORKSPACE"

# Copy YAML config
cp "$PROJECT_ROOT/plx.yaml" "$TEST_WORKSPACE/"

# Copy scripts
echo -e "${YELLOW}📋 Copying sync scripts...${NC}"
mkdir -p "$TEST_WORKSPACE/scripts/claude-code"
cp -r "$PROJECT_ROOT/scripts/claude-code/"*.sh "$TEST_WORKSPACE/scripts/claude-code/"

# Copy blocks directory (needed for command blocks)
echo -e "${YELLOW}📦 Copying blocks...${NC}"
mkdir -p "$TEST_WORKSPACE/blocks"
if [ -d "$PROJECT_ROOT/blocks" ]; then
    cp "$PROJECT_ROOT/blocks/"*command-block*.md "$TEST_WORKSPACE/blocks/" 2>/dev/null || true
fi

# Create test content directories and sample files
echo -e "${YELLOW}📝 Creating test content...${NC}"

# Agents
mkdir -p "$TEST_WORKSPACE/agents"
cat > "$TEST_WORKSPACE/agents/test-agent.md" << 'EOF'
---
title: Test Agent
---

# Test Agent

This is a test agent for sync validation.
EOF

cat > "$TEST_WORKSPACE/agents/flutter-developer.md" << 'EOF'
---
title: Flutter Developer
---

# Flutter Developer Agent

Expert Flutter developer agent.
EOF

# Prompts
mkdir -p "$TEST_WORKSPACE/prompts"
cat > "$TEST_WORKSPACE/prompts/create-component.md" << 'EOF'
---
title: Create Component
---

# Create Component Prompt

Create a new component based on specifications.
EOF

cat > "$TEST_WORKSPACE/prompts/simple.md" << 'EOF'
# Simple Prompt

A simple test prompt without frontmatter.
EOF

# Templates
mkdir -p "$TEST_WORKSPACE/templates"
cat > "$TEST_WORKSPACE/templates/test-template.md" << 'EOF'
---
title: Test Template
---

# Test Template

Template content here.
EOF

# Blocks
mkdir -p "$TEST_WORKSPACE/blocks"
cat > "$TEST_WORKSPACE/blocks/test-block.md" << 'EOF'
# Test Block

This is a test block content.
EOF

# Output formats
mkdir -p "$TEST_WORKSPACE/output-formats"
cat > "$TEST_WORKSPACE/output-formats/json.md" << 'EOF'
---
title: JSON Output
---

Output in JSON format.
EOF

# Instructions
mkdir -p "$TEST_WORKSPACE/instructions"
cat > "$TEST_WORKSPACE/instructions/coding-standards.md" << 'EOF'
---
title: Coding Standards
---

Follow these coding standards.
EOF

# Personas
mkdir -p "$TEST_WORKSPACE/personas"
cat > "$TEST_WORKSPACE/personas/reviewer.md" << 'EOF'
---
title: Code Reviewer
---

Act as a code reviewer.
EOF

# Workflows
mkdir -p "$TEST_WORKSPACE/workflows"
cat > "$TEST_WORKSPACE/workflows/feature.md" << 'EOF'
---
title: Feature Workflow
---

Feature development workflow.
EOF

# Modes
mkdir -p "$TEST_WORKSPACE/modes"
cat > "$TEST_WORKSPACE/modes/debug.md" << 'EOF'
---
title: Debug Mode
---

Debug mode configuration.
EOF

echo -e "${GREEN}✅ Test content created${NC}"
echo ""

# Run the sync
echo -e "${YELLOW}🚀 Running sync scripts...${NC}"
echo "═══════════════════════════════════════════════════════════════"

# Make scripts executable
chmod +x "$TEST_WORKSPACE/scripts/claude-code/"*.sh

# Run the main sync script
cd "$TEST_WORKSPACE"
./scripts/claude-code/sync-claude-code.sh

echo ""
echo -e "${GREEN}✅ Sync completed${NC}"
echo ""

# Verify the results
echo -e "${YELLOW}🔍 Verifying sync results...${NC}"
echo "═══════════════════════════════════════════════════════════════"

# Function to check directory
check_dir() {
    local dir="$1"
    local expected="$2"
    
    if [ -d "$dir" ]; then
        local count=$(find "$dir" -type f -name "*.md" 2>/dev/null | wc -l)
        if [ "$count" -gt 0 ]; then
            echo -e "${GREEN}✓${NC} $expected: $count files"
            return 0
        else
            echo -e "${RED}✗${NC} $expected: directory exists but empty"
            return 1
        fi
    else
        echo -e "${RED}✗${NC} $expected: directory missing"
        return 1
    fi
}

# Check all expected directories
ERRORS=0

echo "Checking .claude/agents/:"
check_dir "$TEST_WORKSPACE/.claude/agents" "Agents directory" || ((ERRORS++))

echo ""
echo "Checking .claude/commands/ subdirectories:"
check_dir "$TEST_WORKSPACE/.claude/commands/act" "act (agents/personas)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/plx" "plx (prompts)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/use" "use (templates)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/add" "add (blocks)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/output" "output (formats)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/apply" "apply (instructions)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/start" "start (workflows)" || ((ERRORS++))
check_dir "$TEST_WORKSPACE/.claude/commands/activate" "activate (modes)" || ((ERRORS++))

echo ""
echo "═══════════════════════════════════════════════════════════════"

# Show directory structure
echo -e "${YELLOW}📂 Final directory structure:${NC}"
tree -L 3 "$TEST_WORKSPACE/.claude" 2>/dev/null || find "$TEST_WORKSPACE/.claude" -type d | head -20

echo ""
echo "═══════════════════════════════════════════════════════════════"

# Test YAML parser
echo -e "${YELLOW}🔧 Testing YAML parser:${NC}"
echo ""

echo "Testing get_sources agents:"
"$TEST_WORKSPACE/scripts/claude-code/plx-yaml-parser.sh" get_sources agents

echo ""
echo "Testing get_targets prompts:"
"$TEST_WORKSPACE/scripts/claude-code/plx-yaml-parser.sh" get_targets prompts

echo ""
echo "Testing get_delete_before:"
"$TEST_WORKSPACE/scripts/claude-code/plx-yaml-parser.sh" get_delete_before

echo ""
echo "═══════════════════════════════════════════════════════════════"

# Final results
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ ALL TESTS PASSED!${NC}"
    echo -e "${GREEN}The YAML-based sync system is working correctly.${NC}"
else
    echo -e "${RED}❌ TESTS FAILED!${NC}"
    echo -e "${RED}Found $ERRORS errors in sync process.${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}📍 Test workspace location: $TEST_WORKSPACE${NC}"
echo -e "${YELLOW}   (will be auto-cleaned on exit)${NC}"
echo ""