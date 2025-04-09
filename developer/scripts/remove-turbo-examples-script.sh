#!/bin/bash

# Script to remove all *.turbo.* files and add the pattern to .gitignore
# This is useful for users who want to use this repository without the example files

echo "🔍 Searching for *.turbo.* files..."
TURBO_FILES=$(find . -name "*.turbo.*" -type f)

if [ -z "$TURBO_FILES" ]; then
  echo "✅ No *.turbo.* files found."
else
  echo "🗑️  Found the following files to remove:"
  echo "$TURBO_FILES"
  echo ""
  echo "⚠️  About to delete these files. Continue? (y/n)"
  read -r CONTINUE
  
  if [[ "$CONTINUE" == "y" || "$CONTINUE" == "Y" ]]; then
    echo "🗑️  Removing files..."
    find . -name "*.turbo.*" -type f -delete
    echo "✅ Files removed successfully."
  else
    echo "❌ Operation cancelled."
    exit 1
  fi
fi

# Check if the pattern already exists in .gitignore
if grep -q "*.turbo.*" .gitignore; then
  echo "✅ Pattern '*.turbo.*' already exists in .gitignore."
else
  echo "📝 Adding '*.turbo.*' pattern to .gitignore..."
  echo "" >> .gitignore
  echo "# Ignore turbo example files" >> .gitignore
  echo "*.turbo.*" >> .gitignore
  echo "✅ Pattern added successfully."
fi

echo "🎉 All done! The repository is now clean of example files." 