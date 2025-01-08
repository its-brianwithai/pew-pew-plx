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
    # Include all components if no input
    selected=("${components[@]}")
    echo -e "\nIncluding all components:"
    for component in "${components[@]}"; do
        echo "✓ $component"
    done
else
    # Check for each number in the input
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
            for file in "your-requirements.md" "your-ticket.md" "your-todo-list.md" "your-initial-input.md"; do
                touch "$WORKSPACE_DIR/$file"
            done
            echo "✓ Created: Agent Work Documents"
            ;;
        "Protocols")
            mkdir -p "$WORKSPACE_DIR/protocols"
            if [ -d "$SCRIPT_DIR/protocols" ]; then
                cp -r "$SCRIPT_DIR/protocols"/* "$WORKSPACE_DIR/protocols"/ 2>/dev/null || true
            fi
            echo "✓ Created: Protocols"
            ;;
        "Workflows")
            mkdir -p "$WORKSPACE_DIR/workflows"
            if [ -d "$SCRIPT_DIR/workflows" ]; then
                cp -r "$SCRIPT_DIR/workflows"/* "$WORKSPACE_DIR/workflows"/ 2>/dev/null || true
            fi
            echo "✓ Created: Workflows"
            ;;
        "Templates")
            mkdir -p "$WORKSPACE_DIR/templates"
            if [ -d "$SCRIPT_DIR/templates" ]; then
                cp -r "$SCRIPT_DIR/templates"/* "$WORKSPACE_DIR/templates"/ 2>/dev/null || true
            fi
            echo "✓ Created: Templates"
            ;;
        "Knowledge")
            mkdir -p "$WORKSPACE_DIR/knowledge"
            if [ -d "$SCRIPT_DIR/knowledge" ]; then
                cp -r "$SCRIPT_DIR/knowledge"/* "$WORKSPACE_DIR/knowledge"/ 2>/dev/null || true
            fi
            echo "✓ Created: Knowledge"
            ;;
        "Prompts")
            mkdir -p "$WORKSPACE_DIR/prompts"
            if [ -d "$SCRIPT_DIR/prompts" ]; then
                cp -r "$SCRIPT_DIR/prompts"/* "$WORKSPACE_DIR/prompts"/ 2>/dev/null || true
            fi
            echo "✓ Created: Prompts"
            ;;
    esac
done

echo -e "\n🎉 Ultra Wide Turbo workspace '$WORKSPACE_NAME' created successfully!"
echo "Location: $WORKSPACE_DIR"
echo -e "\nFiles in new workspace:"
ls -la "$WORKSPACE_DIR" 