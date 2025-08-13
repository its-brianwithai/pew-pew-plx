# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

You are about to sync your project with Claude Code.

You have two options:
1.  **Standard Sync**: Updates agents and commands. This is the most common option.
2.  **Clean Sync**: Deletes all existing agents and commands from your `.claude` directory before running a fresh sync. Use this if you suspect issues or have removed files locally.

If the user provided `clean` as an argument, run `plx sync claude clean`.
Otherwise, ask the user which option they would like to proceed with. Once they choose, run either `plx sync claude` for standard or `plx sync claude clean` for clean.
