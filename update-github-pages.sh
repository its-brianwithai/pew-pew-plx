#!/bin/bash

# Script to update GitHub Pages site structure by copying the exact repository structure

set -e  # Exit on error

REPO_ROOT=$(pwd)
DOCS_DIR="$REPO_ROOT/docs"

echo "🚀 Updating GitHub Pages structure for Ultra Wide Turbo Workspace..."
echo "This script will create an exact copy of the repository structure in docs/"

# Make sure docs directory exists
mkdir -p "$DOCS_DIR"

# Clean up everything in docs except Jekyll files
find "$DOCS_DIR" -mindepth 1 -not -path "*/\.*" -and -not -name "_config.yml" -and -not -name "Gemfile" -and -not -name "index.md" -and -not -path "*/_layouts/*" -and -not -path "*/_includes/*" -and -not -path "*/_data/*" -and -not -path "*/assets/*" -exec rm -rf {} \; 2>/dev/null || true

echo "♻️ Cleaned up docs directory"

# Run the Python script to copy the repository structure
cd "$REPO_ROOT"
python3 "$DOCS_DIR/generate_site_structure.py"

echo "✅ GitHub Pages structure updated successfully!"
echo ""
echo "📋 What's been generated:"
echo "  - An exact copy of all repository content in docs/"
echo "  - Each role has its own directory with all original files"
echo "  - All hidden files and system directories are excluded"
echo ""
echo "💡 To preview the site locally:"
echo "   1. cd docs"
echo "   2. bundle install"
echo "   3. bundle exec jekyll serve"
echo ""
echo "🌐 After pushing these changes, your site will be available at:"
echo "    https://its-brianwithai.github.io/ultra-wide-turbo-workspace/"
echo ""
echo "🔄 To keep the GitHub Pages structure up-to-date:"
echo "   Run this script whenever you make changes to the repository"