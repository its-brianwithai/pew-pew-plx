#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SYNC_SCRIPT="$SCRIPT_DIR/sync-claude-code.sh"

PROMPTS_DIR="$PROJECT_ROOT/prompts"
AGENTS_DIR="$PROJECT_ROOT/agents"

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
    echo "   - $PROMPTS_DIR"
    echo "   - $AGENTS_DIR"
    echo ""
    echo "Press Ctrl+C to stop watching..."
    
    local sync_pid=""
    local last_change_time=0
    
    fswatch -r -e ".*" -i "\.md$" "$PROMPTS_DIR" "$AGENTS_DIR" | while read file; do
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
    echo "   - $PROMPTS_DIR"
    echo "   - $AGENTS_DIR"
    echo ""
    echo "Press Ctrl+C to stop watching..."
    
    last_prompts_hash=""
    last_agents_hash=""
    last_change_time=0
    sync_scheduled=false
    
    while true; do
        if [ -d "$PROMPTS_DIR" ]; then
            current_prompts_hash=$(find "$PROMPTS_DIR" -name "*.md" -type f -exec stat -f "%m %N" {} \; 2>/dev/null | sort | md5)
        else
            current_prompts_hash=""
        fi
        
        if [ -d "$AGENTS_DIR" ]; then
            current_agents_hash=$(find "$AGENTS_DIR" -name "*.md" -type f -exec stat -f "%m %N" {} \; 2>/dev/null | sort | md5)
        else
            current_agents_hash=""
        fi
        
        current_time=$(date +%s)
        
        if [ "$current_prompts_hash" != "$last_prompts_hash" ] || [ "$current_agents_hash" != "$last_agents_hash" ]; then
            if [ -n "$last_prompts_hash" ] || [ -n "$last_agents_hash" ]; then
                echo "📝 Changes detected in watched directories"
                last_change_time=$current_time
                sync_scheduled=true
                echo "⏳ Sync scheduled in 5 seconds (throttled)..."
            fi
            last_prompts_hash="$current_prompts_hash"
            last_agents_hash="$current_agents_hash"
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
