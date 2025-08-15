---
name: plx-pull-sync-claude-clean
description: "Clean pull and sync with backup/restore functionality - backs up current .pew, pulls latest framework, syncs, and cleans up or restores on failure."
---

You are about to perform a clean framework update with full backup and restore capability.

This command will:
1. **Backup Current Framework**: Create a backup of your current `.pew` directory
2. **Pull and Sync**: Execute the standard pull-sync workflow
3. **Success Cleanup**: Remove backup directory if all operations succeed
4. **Failure Restore**: Restore from backup if any operation fails

## Safety Features
- **Automatic Backup**: Your current `.pew` directory is preserved before any changes
- **Rollback on Failure**: If pull or sync fails, your original `.pew` is automatically restored
- **Clean Success**: Backup is removed only after successful completion

## Core Operations

The core pull and sync operations follow the standard workflow:

![[pull-sync-claude]]

## Safe Execution with Backup/Restore

Run the following commands from the project root:

```bash
# 1. Create timestamp for unique backup
BACKUP_TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=".pew_backup_${BACKUP_TIMESTAMP}"

echo "🔒 Creating backup of current .pew directory..."
if [ -d ".pew" ]; then
    cp -r .pew "$BACKUP_DIR"
    echo "✅ Backup created: $BACKUP_DIR"
else
    echo "⚠️  No .pew directory found to backup"
fi

# 2. Execute standard pull-sync operations
echo "📥 Executing pull-sync operations..."
PULL_SUCCESS=false
SYNC_SUCCESS=false

# Pull latest framework updates
echo "📥 Pulling latest framework updates..."
if make -f .pew/Makefile pull main; then
    echo "✅ Framework pull successful"
    PULL_SUCCESS=true
    
    # Sync with Claude (only if pull succeeded)
    echo "🔄 Syncing with Claude Code..."
    if make -f .pew/Makefile sync claude; then
        echo "✅ Claude sync successful"
        SYNC_SUCCESS=true
    else
        echo "❌ Claude sync failed"
    fi
else
    echo "❌ Framework pull failed"
fi

# 3. Cleanup or restore based on success
if [ "$PULL_SUCCESS" = true ] && [ "$SYNC_SUCCESS" = true ]; then
    # Success - remove backup
    echo "🧹 Operations successful, cleaning up backup..."
    if [ -d "$BACKUP_DIR" ]; then
        rm -rf "$BACKUP_DIR"
        echo "✅ Backup removed: $BACKUP_DIR"
    fi
    echo "🎉 Clean sync completed successfully!"
else
    # Failure - restore from backup
    echo "💥 Operations failed, restoring from backup..."
    if [ -d "$BACKUP_DIR" ]; then
        rm -rf .pew
        mv "$BACKUP_DIR" .pew
        echo "✅ Original .pew directory restored"
        echo "🔄 You can try the operation again or investigate the issue"
    else
        echo "⚠️  No backup found to restore"
    fi
    echo "❌ Clean sync failed - original state restored"
    exit 1
fi
```

## Alternative One-Liner Version

For advanced users, you can run this as a single command:

```bash
BACKUP_TIMESTAMP=$(date +%Y%m%d_%H%M%S); BACKUP_DIR=".pew_backup_${BACKUP_TIMESTAMP}"; echo "🔒 Creating backup..."; [ -d ".pew" ] && cp -r .pew "$BACKUP_DIR" && echo "✅ Backup: $BACKUP_DIR" || echo "⚠️ No .pew to backup"; echo "📥 Pulling updates..."; if make -f .pew/Makefile pull main && echo "✅ Pull OK" && echo "🔄 Syncing..." && make -f .pew/Makefile sync claude && echo "✅ Sync OK"; then echo "🧹 Cleaning backup..."; [ -d "$BACKUP_DIR" ] && rm -rf "$BACKUP_DIR" && echo "✅ Backup removed"; echo "🎉 Clean sync success!"; else echo "💥 Failed, restoring..."; [ -d "$BACKUP_DIR" ] && rm -rf .pew && mv "$BACKUP_DIR" .pew && echo "✅ Restored from backup" || echo "⚠️ No backup to restore"; echo "❌ Clean sync failed"; exit 1; fi
```

## When to Use This Command

- **Major Framework Updates**: When you want to ensure you can rollback if something breaks
- **Experimental Pulls**: Testing new framework versions with safety net  
- **Critical Projects**: When you can't afford downtime from broken framework updates
- **Team Environments**: Ensuring consistent framework state across team members

## Recovery Notes

If something goes wrong during execution:
- Backup directories are named `.pew_backup_YYYYMMDD_HHMMSS`
- Manually restore: `rm -rf .pew && mv .pew_backup_* .pew`  
- Check logs for specific pull or sync failure reasons
- Contact framework maintainers if persistent issues occur

The backup and restore system ensures you can always return to a working state, making framework updates safer and more reliable.