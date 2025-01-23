#!/bin/bash

# add_workspace_bricks.sh
#
# This script adds all Mason bricks in the workspace globally to your Mason installation.
# It will scan the _mason directory for valid bricks (containing brick.yaml) and add each one.
#
# The script will:
# 1. Navigate to the _mason directory
# 2. Find all brick.yaml files (including root level)
# 3. Add each corresponding brick globally
# 4. Track progress and provide feedback
#
# Usage: ./scripts/add_workspace_bricks.sh

# Print with emoji and color
print_step() {
    echo -e "\033[1;34m$1\033[0m"
}

print_success() {
    echo -e "\033[1;32m$1\033[0m"
}

print_error() {
    echo -e "\033[1;31m$1\033[0m"
}

print_warning() {
    echo -e "\033[1;33m$1\033[0m"
}

# Get brick name from brick.yaml
get_brick_name() {
    local brick_yaml="$1"
    if [ -f "$brick_yaml" ]; then
        # Extract name field from brick.yaml, handling potential quotes
        local name=$(grep "^name:" "$brick_yaml" | sed 's/^name:[[:space:]]*//;s/^"\(.*\)"$/\1/;s/^'"'"'\(.*\)'"'"'$/\1/')
        echo "$name"
    fi
}

# Check if brick is already installed
is_brick_installed() {
    local brick_name="$1"
    mason list 2>/dev/null | grep -q "^$brick_name\$"
    return $?
}

# Get list of installed bricks
get_installed_bricks() {
    mason list 2>/dev/null | grep -v "^$" | grep -v "^[[:space:]]*└──" | grep -v "^/" | sort -u
}

# Add brick with automatic confirmation
add_brick() {
    local brick_name="$1"
    local brick_path="$2"
    # First remove the brick if it exists
    mason remove "$brick_name" -g >/dev/null 2>&1
    # Then add it fresh using --path consistently
    mason add "$brick_name" --path "$brick_path" -g >/dev/null 2>&1
    return $?
}

# Check if this is a known directory/brick name difference
is_known_name_difference() {
    local dir_name="$1"
    local brick_name="$2"
    if [ "$dir_name" = "code-of-conduct" ] && [ "$brick_name" = "cocs" ]; then
        return 0
    fi
    if [ "$dir_name" = "_mason" ] && [ "$brick_name" = "workspace" ]; then
        return 0
    fi
    return 1
}

# Store current directory
CURRENT_DIR=$(pwd)

# Initialize counters and arrays
total_bricks=0
successful_bricks=0
failed_bricks=0
added_bricks=()

print_step "🔍 Preparing to add workspace bricks..."

# Navigate to _mason directory
cd "$(dirname "$0")/../_mason" || {
    print_error "❌ Failed to navigate to _mason directory"
    exit 1
}

# Check if mason is installed
if ! command -v mason &> /dev/null; then
    print_error "❌ Mason CLI is not installed. Please install it first:"
    print_error "  dart pub global activate mason_cli"
    exit 1
fi

# Process root level brick first
if [ -f "brick.yaml" ]; then
    ((total_bricks++))
    root_brick_name=$(get_brick_name "brick.yaml")
    if [ -n "$root_brick_name" ]; then
        print_step "📦 Processing root brick: $root_brick_name"
        
        if [ ! -d "__brick__" ]; then
            print_error "  ❌ Invalid brick structure: missing __brick__ directory"
            ((failed_bricks++))
        else
            if is_brick_installed "$root_brick_name"; then
                print_warning "  ⚠️  Brick '$root_brick_name' is already added globally"
                added_bricks+=("$root_brick_name")
                ((successful_bricks++))
            else
                if add_brick "$root_brick_name" "."; then
                    print_success "  ✅ Successfully added '$root_brick_name' brick"
                    added_bricks+=("$root_brick_name")
                    ((successful_bricks++))
                else
                    print_error "  ❌ Failed to add '$root_brick_name' brick"
                    ((failed_bricks++))
                fi
            fi
        fi
    fi
fi

# Find all brick.yaml files in subdirectories, excluding .mason directory
brick_files=$(find . -mindepth 2 -name "brick.yaml" -not -path "./.mason/*" -not -path "./mason-lock.json" -not -path "./mason.yaml")

if [ -z "$brick_files" ] && [ ${#added_bricks[@]} -eq 0 ]; then
    print_error "❌ No brick.yaml files found in workspace"
    exit 1
fi

# Convert brick files to array and update total
IFS=$'\n' read -r -d '' -a brick_array <<< "$brick_files"
total_bricks=$((total_bricks + ${#brick_array[@]}))

print_step "📦 Found $total_bricks brick(s) to process..."

# Process each brick in subdirectories
for index in "${!brick_array[@]}"; do
    brick_file="${brick_array[$index]}"
    brick_dir=$(dirname "$brick_file")
    dir_name=$(basename "$brick_dir")
    current_number=$((index + 2))  # +2 because root brick was first

    # Get brick name from brick.yaml
    brick_name=$(get_brick_name "$brick_file")
    if [ -z "$brick_name" ]; then
        print_error "  ❌ Could not determine brick name from $brick_file"
        ((failed_bricks++))
        continue
    fi

    print_step "📦 Processing brick ($current_number/$total_bricks): $brick_name"

    # Verify brick structure
    if [ ! -d "$brick_dir/__brick__" ]; then
        print_error "  ❌ Invalid brick structure: missing __brick__ directory"
        ((failed_bricks++))
        continue
    fi

    # Verify brick name matches directory name or check if it's a known difference
    if [ "$dir_name" != "$brick_name" ]; then
        if is_known_name_difference "$dir_name" "$brick_name"; then
            print_step "  ℹ️  Using brick name '$brick_name' for directory '$dir_name' (known configuration)"
        else
            print_warning "  ⚠️  Directory name '$dir_name' differs from brick name '$brick_name'"
        fi
    fi

    # Check if brick is already added
    if is_brick_installed "$brick_name"; then
        print_warning "  ⚠️  Brick '$brick_name' is already added globally"
        ((successful_bricks++))
        added_bricks+=("$brick_name")
        continue
    fi

    # Add brick globally from local path
    if add_brick "$brick_name" "$brick_dir"; then
        print_success "  ✅ Successfully added '$brick_name' brick"
        ((successful_bricks++))
        added_bricks+=("$brick_name")
    else
        print_error "  ❌ Failed to add '$brick_name' brick"
        ((failed_bricks++))
    fi
done

# Return to original directory
cd "$CURRENT_DIR" || exit 1

# Print summary
echo
print_step "📊 Summary:"
print_success "✅ Successfully processed: $successful_bricks brick(s)"
if [ $failed_bricks -gt 0 ]; then
    print_error "❌ Failed to process: $failed_bricks brick(s)"
fi

if [ $successful_bricks -gt 0 ]; then
    print_success "🎉 You can now use your bricks with: mason make <brick-name>"
    echo "    Available bricks:"
    for brick in "${added_bricks[@]}"; do
        echo "    - mason make $brick"
    done
fi

# Exit with error if any bricks failed
[ $failed_bricks -eq 0 ] || exit 1 