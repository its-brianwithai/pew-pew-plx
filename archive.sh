#!/bin/bash

# Default source directory is one folder up
default_source="../"
echo "Default source directory: $default_source (one folder up)"
read -p "Enter source directory (press Enter for default): " source_dir
source_dir="${source_dir:-$default_source}"

# Default target is turbo-archive in current directory
default_target="turbo-archive"
echo "Default target directory: $default_target"
read -p "Enter target directory (press Enter for default): " target_dir
target_dir="${target_dir:-$default_target}"

# Show files to be archived
echo -e "\nFiles to be archived from $source_dir:"
cd "$source_dir" || exit 1
for pattern in "your-*.md" "our-*.md" "plx-*.md" "the-*.md" "system-prompt.md"; do
    for file in $pattern; do
        if [ -f "$file" ]; then
            echo "- $file"
        fi
    done
done

# Ask for final confirmation
read -p "Proceed with archiving to $target_dir? (y/N) " proceed
if [[ ! $proceed =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Create target directory if it doesn't exist
mkdir -p "$target_dir"

# Move our specific files to target
for pattern in "your-*.md" "our-*.md" "plx-*.md" "the-*.md" "system-prompt.md"; do
    for file in $pattern; do
        if [ -f "$file" ]; then
            mv "$file" "$target_dir/"
            echo "Archived $file to $target_dir"
        fi
    done
done

echo "Files have been archived to: $target_dir" 