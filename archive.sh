#!/bin/bash

# Create timestamp for archive folder
timestamp=$(date +"%Y-%m-%d-%H-%M")
archive_dir="turbo-archive/$timestamp"

# Create archive directory
mkdir -p "$archive_dir"

# Copy only our specific files to archive
for pattern in "your-*.md" "our-*.md" "plx-*.md" "the-*.md" "system-prompt.md"; do
    for file in $pattern; do
        if [ -f "$file" ]; then
            cp "$file" "$archive_dir/"
        fi
    done
done

echo "Archive created at: $archive_dir" 