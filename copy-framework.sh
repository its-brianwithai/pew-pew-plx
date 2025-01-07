#!/bin/bash

# Default target is one folder up
DEFAULT_TARGET="../"

# Ask for target directory
echo "Enter target directory (press Enter for default: $DEFAULT_TARGET):"
read TARGET_DIR

# Use default if no input
TARGET_DIR=${TARGET_DIR:-$DEFAULT_TARGET}

# Ensure target directory exists
mkdir -p "$TARGET_DIR"

# Show files that will be copied
echo "The following files will be copied to $TARGET_DIR:"
ls _*.md

# Ask for confirmation
echo "Proceed with copy? (y/n)"
read CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Operation cancelled"
    exit 1
fi

# Copy files and remove underscore prefix
for file in _*.md; do
    # Extract filename without underscore
    newname=${file#_}
    echo "Copying $file to $TARGET_DIR/$newname"
    cp "$file" "$TARGET_DIR/$newname"
done

echo "Framework files copied successfully to $TARGET_DIR" 