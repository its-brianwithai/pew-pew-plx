#!/bin/bash

# Default source is one folder up
DEFAULT_SOURCE="../"

# Default target is turbo-archive in current directory
DEFAULT_TARGET="./turbo-archive"

# Show default configuration
echo "Default source directory: $DEFAULT_SOURCE (parent directory)"
echo "Default target directory: $DEFAULT_TARGET (in current directory)"

# Ask for source directory (optional)
echo "Enter source directory (press Enter for default):"
read SOURCE_DIR

# Ask for target directory (optional)
echo "Enter target directory (press Enter for default):"
read TARGET_DIR

# Use defaults if no input
SOURCE_DIR=${SOURCE_DIR:-$DEFAULT_SOURCE}
TARGET_DIR=${TARGET_DIR:-$DEFAULT_TARGET}

# Create timestamp for archive folder
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")
ARCHIVE_DIR="$TARGET_DIR/$TIMESTAMP"

# Show files that will be archived
echo "The following files will be archived from $SOURCE_DIR to $ARCHIVE_DIR:"
ls "$SOURCE_DIR"/*.md 2>/dev/null

# Ask for confirmation
echo "Proceed with archive? (y/n)"
read CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Operation cancelled"
    exit 1
fi

# Create archive directory
mkdir -p "$ARCHIVE_DIR"

# Copy files to archive
for file in "$SOURCE_DIR"/*.md; do
    if [ -f "$file" ]; then
        cp "$file" "$ARCHIVE_DIR/"
        echo "Archived: $file"
    fi
done

echo "Workspace archived successfully to: $ARCHIVE_DIR" 