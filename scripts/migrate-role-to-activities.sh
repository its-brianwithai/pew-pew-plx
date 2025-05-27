#!/bin/bash
# migrate-role-to-activities.sh - Migrates a single role to activity-based structure

set -e

ROLE=$1
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -z "$ROLE" ]; then
    echo "Usage: $0 <role-name>"
    exit 1
fi

echo "Migrating role: $ROLE"
echo "Workspace root: $WORKSPACE_ROOT"

# Function to create activity folder structure
create_activity_structure() {
    local activity_path=$1
    mkdir -p "$activity_path/prompts/activities"
    mkdir -p "$activity_path/prompts/agents"
    mkdir -p "$activity_path/prompts/rules"
    mkdir -p "$activity_path/templates"
    mkdir -p "$activity_path/wows"
    mkdir -p "$activity_path/systems"
    mkdir -p "$activity_path/checklists"
    mkdir -p "$activity_path/resources"
    mkdir -p "$activity_path/snippets"
}

# Function to move files preserving git history
move_file() {
    local src=$1
    local dest=$2
    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        git mv "$src" "$dest" 2>/dev/null || cp "$src" "$dest"
        echo "Moved: $src -> $dest"
    fi
}

# Function to copy files preserving git history
copy_file() {
    local src=$1
    local dest=$2
    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        git add "$dest" 2>/dev/null || true
        echo "Copied: $src -> $dest"
    fi
}

# Process a specific role
process_role() {
    local role=$1
    local role_path="$WORKSPACE_ROOT/$role"
    
    if [ ! -d "$role_path" ]; then
        echo "Role directory not found: $role_path"
        return 1
    fi
    
    # Find all activity prompts
    local activities_dir="$role_path/prompts/activities"
    if [ -d "$activities_dir" ]; then
        for activity_file in "$activities_dir"/plx-*.md; do
            if [ -f "$activity_file" ]; then
                # Extract activity name from filename
                local filename=$(basename "$activity_file")
                local activity_name=$(echo "$filename" | sed 's/^plx-//' | sed 's/\.md$//')
                
                # Convert to folder name (replace underscores with hyphens)
                activity_name=$(echo "$activity_name" | tr '_' '-')
                
                echo "Processing activity: $activity_name"
                
                # Create activity folder structure
                local activity_path="$role_path/$activity_name"
                create_activity_structure "$activity_path"
                
                # Move the activity file
                move_file "$activity_file" "$activity_path/prompts/activities/$filename"
                
                # TODO: Map and move related agents, templates, etc.
                # This would require a mapping file or intelligent matching
            fi
        done
    fi
}

# Main execution
cd "$WORKSPACE_ROOT"

# Create backup tag
git tag -f "backup-before-restructure-$ROLE" 2>/dev/null || true

# Process the role
process_role "$ROLE"

echo "Migration complete for role: $ROLE"
echo "To rollback: git reset --hard backup-before-restructure-$ROLE"