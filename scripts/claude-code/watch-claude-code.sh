#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
REPO_ROOT="$(cd "$PROJECT_ROOT/.." && pwd)"
SYNC_SCRIPT="$SCRIPT_DIR/sync-claude-code.sh"
CONFIG_BIN="node $REPO_ROOT/bin/plx-config.js"

# Build watch list from config sync_sources (fallback to core_targets)
WATCH_DIRS=()
if command -v node >/dev/null 2>&1; then
    if $CONFIG_BIN json | grep -q 'sync_sources'; then
        while IFS= read -r p; do WATCH_DIRS+=("$PROJECT_ROOT/$p"); done < <($CONFIG_BIN sources | awk -F': ' '{print $2}')
    else
        while IFS= read -r dir; do
            [ -z "$dir" ] && continue
            WATCH_DIRS+=("$PROJECT_ROOT/$dir")
        done < <($CONFIG_BIN list core_targets || true)
    fi
fi
# Fallbacks if config/tool unavailable
if [ ${#WATCH_DIRS[@]} -eq 0 ]; then
    WATCH_DIRS=("$PROJECT_ROOT/agents" "$PROJECT_ROOT/prompts")
fi

check_dependencies() {
    if command -v fswatch >/dev/null 2>&1; then
        echo "✅ Using fswatch for file monitoring"
        return 0
    else
        echo "⚠️  fswatch not found. Install with: brew install fswatch"
        echo "🔄 Falling back to polling mode..."
        return 1
    fi
}

watch_with_fswatch() {
    echo "👀 Watching directories with fswatch (5s throttling):"
    for d in "${WATCH_DIRS[@]}"; do
        echo "   - $d"
    done
    echo ""
    echo "Press Ctrl+C to stop watching..."
    
    local sync_pid=""
    local last_change_time=0
    
    fswatch -r -e ".*" -i "\.md$" "${WATCH_DIRS[@]}" | while read file; do
        echo "📝 File changed: $file"
        
        current_time=$(date +%s)
        last_change_time=$current_time
        
        if [ -n "$sync_pid" ] && kill -0 "$sync_pid" 2>/dev/null; then
            echo "⏳ Cancelling previous sync timer..."
            kill "$sync_pid" 2>/dev/null || true
        fi
        
        (
            sleep 5
            if [ $last_change_time -eq $current_time ]; then
                echo "🔄 Running sync after 5s throttle..."
                "$SYNC_SCRIPT"
                echo "⏰ $(date '+%H:%M:%S') - Sync complete, watching for more changes..."
                echo ""
            fi
        ) &
        sync_pid=$!
        
        echo "⏳ Sync scheduled in 5 seconds (throttled)..."
    done
}

watch_with_polling() {
    echo "👀 Watching directories with polling (5s interval + 5s throttling):"
    for d in "${WATCH_DIRS[@]}"; do
        echo "   - $d"
    done
    echo ""
    echo "Press Ctrl+C to stop watching..."
    
    declare -A last_hashes
    last_change_time=0
    sync_scheduled=false
    
    while true; do
        change_detected=false
        for dir in "${WATCH_DIRS[@]}"; do
            if [ -d "$dir" ]; then
                current_hash=$(find "$dir" -name "*.md" -type f -exec stat -f "%m %N" {} \; 2>/dev/null | sort | md5)
            else
                current_hash=""
            fi
            if [ "${last_hashes[$dir]}" != "$current_hash" ]; then
                if [ -n "${last_hashes[$dir]}" ]; then
                    change_detected=true
                fi
                last_hashes[$dir]="$current_hash"
            fi
        done
        
        current_time=$(date +%s)
        
        if [ "$change_detected" = true ]; then
            echo "📝 Changes detected in watched directories"
            last_change_time=$current_time
            sync_scheduled=true
            echo "⏳ Sync scheduled in 5 seconds (throttled)..."
        fi
        
        if [ "$sync_scheduled" = true ] && [ $((current_time - last_change_time)) -ge 5 ]; then
            echo "🔄 Running sync after 5s throttle..."
            "$SYNC_SCRIPT"
            echo "⏰ $(date '+%H:%M:%S') - Sync complete, watching for more changes..."
            echo ""
            sync_scheduled=false
        fi
        
        sleep 1
    done
}

cleanup() {
    echo ""
    echo "🛑 Stopping file watcher..."
    exit 0
}

main() {
    echo "🚀 Starting Claude Code file watcher..."
    echo ""
    
    if [ ! -f "$SYNC_SCRIPT" ]; then
        echo "❌ Error: Sync script not found at $SYNC_SCRIPT"
        exit 1
    fi
    
    if [ ! -d "$PROMPTS_DIR" ] && [ ! -d "$AGENTS_DIR" ]; then
        echo "❌ Error: Neither prompts nor agents directory exists"
        echo "   Prompts: $PROMPTS_DIR"
        echo "   Agents: $AGENTS_DIR"
        exit 1
    fi
    
    echo "🔄 Running initial sync..."
    "$SYNC_SCRIPT"
    echo "✅ Initial sync complete!"
    echo ""
    
    trap cleanup SIGINT SIGTERM
    
    if check_dependencies; then
        watch_with_fswatch
    else
        watch_with_polling
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
