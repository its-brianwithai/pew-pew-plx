---
name: pull-sync-claude
description: "Pull latest framework updates from the pew-pew-workspace repository and sync with Claude Code in one command."
---

You are about to pull the latest framework updates and sync with Claude Code.

This command will:
1. **Pull Latest Framework**: Download the latest updates from the main branch of pew-pew-workspace
2. **Sync with Claude**: Apply those updates to your `.claude` directory

## Step 1: Pull Latest Framework Updates

Run the following command from the project root:
```bash
make -f .pew/Makefile pull main
```

## Step 2: Sync with Claude Code

![[sync-claude]]