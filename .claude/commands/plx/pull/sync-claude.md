---
name: pull-sync-claude
description: "Pull latest framework updates from the pew-pew-workspace repository and sync with Claude Code in one command."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

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

You are about to sync your project with Claude Code.

This will update your agents and commands based on the configuration in `.pew/plx.yaml`. The sync automatically handles cleaning and updating your `.claude` directory as needed.

Run `make -f .pew/Makefile sync claude` from the project root.
