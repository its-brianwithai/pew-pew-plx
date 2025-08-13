#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# Check for .pew/plx.local.yaml override first, then use .pew/plx.yaml
if [ -f "$PROJECT_ROOT/.pew/plx.local.yaml" ]; then
    YAML_FILE="$PROJECT_ROOT/.pew/plx.local.yaml"
elif [ -f "$PROJECT_ROOT/.pew/plx.yaml" ]; then
    YAML_FILE="$PROJECT_ROOT/.pew/plx.yaml"
else
    echo "Error: plx.yaml not found at $PROJECT_ROOT/.pew/plx.yaml" >&2
    exit 1
fi

# Function to get sync sources for a given type
get_sync_sources() {
    local type="$1"
    if [ -z "$type" ]; then
        echo "Error: Type parameter required" >&2
        return 1
    fi
    
    awk -v type="$type" '
    BEGIN { in_sync_sources = 0; in_type = 0; found = 0 }
    /^sync_sources:/ { in_sync_sources = 1; next }
    in_sync_sources && /^[a-z]/ && /^[^ ]/ { in_sync_sources = 0 }
    in_sync_sources && $0 ~ "^  " type ":" { in_type = 1; next }
    in_type && /^  [a-z]/ && /^  [^ ]/ { in_type = 0 }
    in_type && /^    - / { 
        gsub(/^    - /, "")
        print
        found = 1
    }
    END { exit !found }
    ' "$YAML_FILE"
}

# Function to get sync targets for a given type
get_sync_targets() {
    local type="$1"
    if [ -z "$type" ]; then
        echo "Error: Type parameter required" >&2
        return 1
    fi
    
    awk -v type="$type" '
    BEGIN { in_sync_targets = 0; in_type = 0; found = 0 }
    /^sync_targets:/ { in_sync_targets = 1; next }
    in_sync_targets && /^[a-z]/ && /^[^ ]/ { in_sync_targets = 0 }
    in_sync_targets && $0 ~ "^  " type ":" { in_type = 1; next }
    in_type && /^  [a-z]/ && /^  [^ ]/ { in_type = 0 }
    in_type && /^    - / { 
        gsub(/^    - /, "")
        print
        found = 1
    }
    END { exit !found }
    ' "$YAML_FILE"
}

# Function to get delete_before_sync_targets
get_delete_before_targets() {
    awk '
    BEGIN { in_delete_before = 0; found = 0 }
    /^delete_before_sync_targets:/ { in_delete_before = 1; next }
    in_delete_before && /^[a-z]/ && /^[^ ]/ { in_delete_before = 0 }
    in_delete_before && /^  - / { 
        gsub(/^  - /, "")
        print
        found = 1
    }
    END { exit !found }
    ' "$YAML_FILE"
}

# Function to get delete_after_sync_targets
get_delete_after_targets() {
    awk '
    BEGIN { in_delete_after = 0; found = 0 }
    /^delete_after_sync_targets:/ { in_delete_after = 1; next }
    in_delete_after && /^[a-z]/ && /^[^ ]/ { in_delete_after = 0 }
    in_delete_after && /^  - / { 
        gsub(/^  - /, "")
        print
        found = 1
    }
    in_delete_after && /^ *\[\]/ { exit 0 }
    END { exit !found }
    ' "$YAML_FILE"
}

# Function to list all sync source types
list_sync_source_types() {
    awk '
    BEGIN { in_sync_sources = 0 }
    /^sync_sources:/ { in_sync_sources = 1; next }
    in_sync_sources && /^[a-z]/ && /^[^ ]/ { in_sync_sources = 0 }
    in_sync_sources && /^  [a-z].*:/ { 
        gsub(/^  /, "")
        gsub(/:.*/, "")
        print
    }
    ' "$YAML_FILE"
}

# Function to list all sync target types  
list_sync_target_types() {
    awk '
    BEGIN { in_sync_targets = 0 }
    /^sync_targets:/ { in_sync_targets = 1; next }
    in_sync_targets && /^[a-z]/ && /^[^ ]/ { in_sync_targets = 0 }
    in_sync_targets && /^  [a-z].*:/ { 
        gsub(/^  /, "")
        gsub(/:.*/, "")
        print
    }
    ' "$YAML_FILE"
}

# Main command handler
case "${1:-}" in
    get_sources)
        get_sync_sources "$2"
        ;;
    get_targets)
        get_sync_targets "$2"
        ;;
    get_delete_before)
        get_delete_before_targets
        ;;
    get_delete_after)
        get_delete_after_targets
        ;;
    list_source_types)
        list_sync_source_types
        ;;
    list_target_types)
        list_sync_target_types
        ;;
    *)
        echo "Usage: $0 {get_sources|get_targets|get_delete_before|get_delete_after|list_source_types|list_target_types} [type]"
        echo ""
        echo "Commands:"
        echo "  get_sources <type>      Get source directories for a content type"
        echo "  get_targets <type>      Get target directories for a content type"
        echo "  get_delete_before       Get directories to delete before sync"
        echo "  get_delete_after        Get directories to delete after sync"
        echo "  list_source_types       List all available source types"
        echo "  list_target_types       List all available target types"
        exit 1
        ;;
esac