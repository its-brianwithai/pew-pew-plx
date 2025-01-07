#!/bin/bash

# Default target is one folder up
default_dir="../"
echo "Default target directory: $default_dir (one folder up)"
read -p "Enter target directory (press Enter for default): " target_dir
target_dir="${target_dir:-$default_dir}"

# Show files to be copied
echo -e "\nFiles to be copied:"
for pattern in "your-*.md" "our-*.md" "plx-*.md" "the-*.md" "system-prompt.md"; do
    for file in $pattern; do
        if [ -f "$file" ]; then
            echo "- $file"
        fi
    done
done

# Ask for final confirmation
read -p "Proceed with copy to $target_dir? (y/N) " proceed
if [[ ! $proceed =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Create target directory if it doesn't exist
mkdir -p "$target_dir"

# Copy our specific files to target
for pattern in "your-*.md" "our-*.md" "plx-*.md" "the-*.md" "system-prompt.md"; do
    for file in $pattern; do
        if [ -f "$file" ]; then
            cp "$file" "$target_dir/"
            echo "Copied $file to $target_dir"
        fi
    done
done

echo "Framework files copied to: $target_dir" 