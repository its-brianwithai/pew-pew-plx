#!/bin/bash

# Script to create a new role with standard folders

# Ask for role name
echo "Enter the name of the role:"
read role_name

# Check if role already exists
if [ -d "$role_name" ]; then
    echo "Error: Role '$role_name' already exists."
    exit 1
fi

# Define folder structure
folders=(
    "backlog"
    "credentials"
    "docs"
    "drafts"
    "inbox"
    "projects"
    "prompts"
    "artifacts"
    "rubriks"
    "scripts"
    "systems"
    "templates"
    "tasks"
    "tools"
    "tutorials"
)

# Create role directory
mkdir -p "$role_name"
echo "Creating role: $role_name"

# Create all folders
for folder in "${folders[@]}"; do
    mkdir -p "$role_name/$folder"
    echo "Created: $role_name/$folder"
done

echo "Role '$role_name' successfully created with all folders." 