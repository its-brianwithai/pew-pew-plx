#!/bin/bash

# add_make_issue_brick.sh
#
# This script adds the issue brick globally to your Mason installation.
# It's required to run this script before you can create new issues using 'mason make issue'.
#
# The script will:
# 1. Navigate to the _mason directory
# 2. Check if the issue brick is already installed
# 3. Add the brick globally if not present
# 4. Provide feedback about the process
#
# Usage: ./scripts/add_make_issue_brick.sh

# Print with emoji and color
print_step() {
    echo -e "\033[1;34m$1\033[0m"
}

print_success() {
    echo -e "\033[1;32m$1\033[0m"
}

print_error() {
    echo -e "\033[1;31m$1\033[0m"
}

# Store current directory
CURRENT_DIR=$(pwd)

print_step "🔍 Preparing to add issue brick..."

# Navigate to _mason directory
cd "$(dirname "$0")/../_mason" || {
    print_error "❌ Failed to navigate to _mason directory"
    exit 1
}

# Check if mason is installed
if ! command -v mason &> /dev/null; then
    print_error "❌ Mason CLI is not installed. Please install it first:"
    print_error "  dart pub global activate mason_cli"
    exit 1
fi

# Check if issue brick exists locally
if [ ! -d "issue" ]; then
    print_error "❌ Issue brick not found in _mason/issue"
    exit 1
fi

if [ ! -f "issue/brick.yaml" ]; then
    print_error "❌ Issue brick configuration not found in _mason/issue/brick.yaml"
    exit 1
fi

if [ ! -d "issue/__brick__" ]; then
    print_error "❌ Issue brick template not found in _mason/issue/__brick__"
    exit 1
fi

# Check if brick is already added
if mason list | grep -q "issue"; then
    print_success "✅ Issue brick is already added globally"
else
    # Add brick globally from local path
    print_step "📦 Adding issue brick globally from local path..."
    if mason add issue --path "issue" -g; then
        print_success "✅ Successfully added issue brick globally"
    else
        print_error "❌ Failed to add issue brick"
        cd "$CURRENT_DIR" || exit 1
        exit 1
    fi
fi

# Return to original directory
cd "$CURRENT_DIR" || exit 1

print_success "🎉 Setup complete! You can now create issues using:"
echo "    mason make issue" 