# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}

# Update PLX Framework

<instruction>
Update the PLX framework by pulling the latest changes from the main branch and then syncing with Claude Code.
</instruction>

<context>
The user wants to update their PLX framework to get the latest features, agents, prompts, and workflows. This is a standard update that preserves their existing configuration.
</context>

<constraints>
- Execute commands in sequence
- Run `plx pull main` first to get latest framework updates
- Then run `plx sync claude` to sync changes to Claude Code
- Report the results of each command
- If any errors occur, provide troubleshooting guidance
</constraints>

<output_format>
1. Announce you're updating the framework
2. Run `plx pull main` and show output
3. Run `plx sync claude` and show output
4. Summarize what was updated
5. Remind user to check for any new features or changes
</output_format>

---
role: @agents/meta/ultra-meta-agent.md
