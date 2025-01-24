#!/bin/bash

# Documentation paths for syncing between source and mason bricks
# This allows the docs folder to be synced from the root project into mason bricks
# when generating new projects, ensuring documentation is properly copied over
docs_paths=(
    "../docs"  # Source path relative to script location
)

# Target paths in mason brick structure where docs will be copied
# The {{name}} variable will be replaced with the actual project name during generation
docs_target_paths=(
    "../_mason/docs/__brick__/{{name}}/docs"  # Target path in mason brick
)

# Array of source paths
source_paths=(
# CORE ------------------------------------------------------------
    "../apis"
    "../code-of-conduct"
    "../concepts"
    "../objects"
    "../protocols"
    "../templates"
    "../prompts"
    "../work-docs"
# ISSUE -----------------------------------------------------------
    "../work-docs/your-planning.md"
    "../work-docs/your-requirements.md"
    "../work-docs/your-ticket.md"
)

# Array of target paths
target_paths=(
# CORE ------------------------------------------------------------
    "../_mason/apis/__brick__/{{name}}"
    "../_mason/code-of-conduct/__brick__/{{name}}/code-of-conduct"
    "../_mason/concepts/__brick__/{{name}}/concepts"
    "../_mason/objects/__brick__/{{name}}/objects"
    "../_mason/protocols/__brick__/{{name}}/protocols"
    "../_mason/templates/__brick__/{{name}}/templates"
    "../_mason/prompts/__brick__/{{name}}/prompts"
    "../_mason/work-docs/__brick__"
# ISSUE -----------------------------------------------------------
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-planning.md"
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-requirements.md"
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-ticket.md"
)

# Check if arrays have same length
if [ ${#source_paths[@]} -ne ${#target_paths[@]} ]; then
    echo "Error: Number of source paths must match number of target paths"
    exit 1
fi

# Loop through arrays and copy files
for i in "${!source_paths[@]}"; do
    source="${source_paths[$i]}"
    target="${target_paths[$i]}"

    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    # Copy files and folders
    if [ -e "$source" ]; then
        if [ -d "$source" ]; then
            # If source is a directory, copy its contents
            cp -R "$source"/. "$target"
        else
            # If source is a file, copy it directly
            cp "$source" "$target"
        fi
        echo "Copied: $source -> $target"
    else
        echo "Warning: Source does not exist: $source"
    fi
done

echo "Sync completed!"
