#!/bin/bash

# Script to create a new role with standard folders

# Ask for role name
echo "Enter the name of the role:"
read role_name

# Check if role already exists
if [ -d "$role_name" ]; then
    echo "Role '$role_name' already exists. Adding any missing folders..."
else
    # Create role directory
    mkdir -p "$role_name"
    echo "Creating role: $role_name"
fi

# Define directories to create
DIRS=(
    "artifacts"
    "assets"
    "backlog"
    "credentials"
    "docs"
    "drafts"
    "inbox"
    "instructions"
    "prompts"
    "refinements"
    "resources"
    "rubrics"
    "scripts"
    "systems"
    "tasks"
    "templates"
    "tools"
    "wiki"
)
  // TODO(AI-AGENT): make sure this script has all possible main folders

# Create all folders, skip if they already exist
for folder in "${DIRS[@]}"; do
    if [ ! -d "$role_name/$folder" ]; then
        mkdir -p "$role_name/$folder"
        echo "Created: $role_name/$folder"
    else
        echo "Skipped existing folder: $role_name/$folder"
    fi
done

echo "Role '$role_name' setup completed successfully." 
