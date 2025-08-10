---
name: clear-claude-code-history
description: "Clear accumulated chat history from Claude Code's .claude.json configuration file to reduce file size and improve performance"
color: Red
---
# Clear Claude Code History

When this command is used, execute the bash script to clear all project history from Claude Code's configuration file while preserving all other settings.

---

<instruction>
Clear the accumulated chat history from Claude Code's .claude.json configuration file to reduce file size and improve performance. This removes only the "history" arrays from each project while preserving all other configuration and settings.
</instruction>

<context>
Claude Code stores chat history for every project in ~/.claude.json. Over time, this file grows significantly large as it accumulates history for all projects. The file structure contains a "projects" key at root level with project paths as keys, each containing an object with a "history" array that needs to be cleared periodically.
</context>

<script>
```bash
#!/bin/bash

# Clear Claude Code history from .claude.json
CLAUDE_CONFIG="$HOME/.claude.json"

# Check if file exists
if [ ! -f "$CLAUDE_CONFIG" ]; then
    echo "❌ Claude Code config not found at: $CLAUDE_CONFIG"
    exit 1
fi

# Create backup
BACKUP_FILE="${CLAUDE_CONFIG}.backup.$(date +%Y%m%d_%H%M%S)"
cp "$CLAUDE_CONFIG" "$BACKUP_FILE"
echo "✅ Created backup: $BACKUP_FILE"

# Clear history for all projects using jq
if command -v jq &> /dev/null; then
    # Use jq to clear history arrays
    jq '.projects |= with_entries(.value.history = [])' "$CLAUDE_CONFIG" > "${CLAUDE_CONFIG}.tmp" && \
    mv "${CLAUDE_CONFIG}.tmp" "$CLAUDE_CONFIG"
    
    # Count cleared projects
    PROJECT_COUNT=$(jq '.projects | keys | length' "$CLAUDE_CONFIG")
    
    # Calculate size reduction
    ORIGINAL_SIZE=$(stat -f%z "$BACKUP_FILE" 2>/dev/null || stat -c%s "$BACKUP_FILE" 2>/dev/null)
    NEW_SIZE=$(stat -f%z "$CLAUDE_CONFIG" 2>/dev/null || stat -c%s "$CLAUDE_CONFIG" 2>/dev/null)
    SIZE_REDUCTION=$((ORIGINAL_SIZE - NEW_SIZE))
    SIZE_REDUCTION_MB=$(echo "scale=2; $SIZE_REDUCTION / 1048576" | bc)
    
    echo "✅ Cleared history for $PROJECT_COUNT projects"
    echo "📉 File size reduced by ${SIZE_REDUCTION_MB}MB ($(echo "scale=1; $SIZE_REDUCTION * 100 / $ORIGINAL_SIZE" | bc)%)"
    echo "📁 Original: $(echo "scale=2; $ORIGINAL_SIZE / 1048576" | bc)MB → New: $(echo "scale=2; $NEW_SIZE / 1048576" | bc)MB"
else
    echo "❌ jq is required but not installed. Install with: brew install jq (macOS) or apt-get install jq (Linux)"
    exit 1
fi

echo "✨ Claude Code history cleared successfully!"
```
</script>

<constraints>
- Must preserve all non-history configuration data
- Must create a timestamped backup before modification
- Must use atomic file operations to prevent corruption
- Must handle both macOS and Linux file systems
- Requires jq for safe JSON manipulation
</constraints>

<output_format>
Execute the bash script and report:
1. Number of projects processed
2. File size reduction achieved
3. Backup file location
4. Confirmation of successful completion
</output_format>

<usage>
Run this command when:
- Claude Code feels sluggish due to large config file
- Starting fresh conversations while preserving settings
- Regular maintenance (monthly recommended)
- Before sharing or debugging configuration issues
</usage>

<example>
User: /plx:clear-claude-code-history
Assistant: I'll clear the accumulated chat history from your Claude Code configuration.

[Executes script]

✅ Created backup: /Users/username/.claude.json.backup.20240109_143022
✅ Cleared history for 48 projects  
📉 File size reduced by 15.3MB (87%)
📁 Original: 17.5MB → New: 2.2MB
✨ Claude Code history cleared successfully!

Your Claude Code history has been cleared while preserving all settings. A backup was saved in case you need to restore any conversation history.
</example>