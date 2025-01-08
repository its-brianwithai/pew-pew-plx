#!/bin/bash

# Function to convert title to kebab case
to_kebab_case() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-zA-Z0-9]/-/g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//'
}

# Function to get default workspace name
get_default_name() {
    local month=$(date "+%m")
    local day=$(date "+%d")
    local weekday=$(date "+%a" | tr '[:upper:]' '[:lower:]')
    local base_name="$1"
    local date_suffix="${month}${day}-${weekday}"
    local counter=1
    local name="$base_name-$date_suffix-$(printf "%02d" $counter)"
    
    while [ -d "$TARGET_DIR/$name" ]; do
        counter=$((counter + 1))
        name="$base_name-$date_suffix-$(printf "%02d" $counter)"
    done
    
    echo "$name"
}

# Get script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Show welcome message
echo "Welcome to Ultra Wide Turbo workspace creation!"
echo "----------------------------------------"

# Available components
components=(
    "Agent Work Documents"
    "Protocols"
    "Workflows"
    "Templates"
    "Knowledge"
    "Prompts"
)

# Show components and get selection
echo "Available components:"
for ((i=0; i<${#components[@]}; i++)); do
    echo "$((i+1)). ${components[$i]}"
done

echo -e "\nEnter numbers of components to include (space-separated) or press ENTER to include all:"
read -r include_nums

# Process selection
selected=()
if [ -z "$include_nums" ]; then
    selected=("${components[@]}")
    echo -e "\nIncluding all components:"
    for component in "${components[@]}"; do
        echo "✓ $component"
    done
else
    for i in {1..6}; do
        if [[ "$include_nums" == *"$i"* ]]; then
            selected+=("${components[$((i-1))]}")
            echo "✓ ${components[$((i-1))]}"
        fi
    done
    if [ ${#selected[@]} -eq 0 ]; then
        echo "No valid components selected, using all components:"
        selected=("${components[@]}")
        for component in "${components[@]}"; do
            echo "✓ $component"
        done
    else
        echo -e "\nSelected components:"
        for component in "${selected[@]}"; do
            echo "✓ $component"
        done
    fi
fi

# Get workspace base name
month=$(date "+%m")
day=$(date "+%d")
weekday=$(date "+%a" | tr '[:upper:]' '[:lower:]')
default_name="turbo-workspace-${month}${day}-${weekday}-01"
echo -e "\nEnter workspace base name (press ENTER for: $default_name):"
read -r USER_INPUT

# Use default if no input
if [ -z "$USER_INPUT" ]; then
    BASE_NAME="turbo-workspace"
    echo "Using default base name: $BASE_NAME"
else
    BASE_NAME=$(to_kebab_case "$USER_INPUT")
    echo "Using kebab case name: $BASE_NAME"
fi

# Generate workspace name
WORKSPACE_NAME=$(get_default_name "$BASE_NAME")
echo "Using workspace name: $WORKSPACE_NAME"

# Set target directory
TARGET_DIR="$(dirname "$SCRIPT_DIR")"

# Create main workspace directory
WORKSPACE_DIR="$TARGET_DIR/$WORKSPACE_NAME"
mkdir -p "$WORKSPACE_DIR"
echo -e "\nCreated workspace directory: $WORKSPACE_DIR"

# Create selected components
echo -e "\nCreating workspace with selected components..."
for component in "${selected[@]}"; do
    case "$component" in
        "Agent Work Documents")
            cp "$REPO_ROOT"/your-*.md "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No agent work documents found to copy"
            cp "$REPO_ROOT"/our-*.md "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No template documents found to copy"
            ;;
        "Protocols")
            cp -r "$REPO_ROOT/protocols" "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No protocols found to copy"
            ;;
        "Workflows")
            cp -r "$REPO_ROOT/workflows" "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No workflows found to copy"
            ;;
        "Templates")
            cp -r "$REPO_ROOT/templates" "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No templates found to copy"
            ;;
        "Knowledge")
            cp -r "$REPO_ROOT/knowledge" "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No knowledge found to copy"
            ;;
        "Prompts")
            cp -r "$REPO_ROOT/prompts" "$WORKSPACE_DIR/" 2>/dev/null || echo "⚠️  No prompts found to copy"
            ;;
    esac
done

echo -e "\n🎉 Ultra Wide Turbo workspace '$WORKSPACE_NAME' created successfully!"
echo "Location: $WORKSPACE_DIR"
echo -e "\nFiles in new workspace:"
ls -la "$WORKSPACE_DIR" 
