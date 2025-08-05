Act as {{role}}

# Update PLX Framework (Clean)

<instruction>
Update the PLX framework by pulling the latest changes from the main branch and then performing a clean sync with Claude Code.
</instruction>

<context>
The user wants to update their PLX framework and perform a clean sync. This removes all existing agents and commands from the `.claude` directory before running a fresh sync. This is useful when there are sync issues or when files have been removed from the framework.
</context>

<constraints>
- Execute commands in sequence
- Run `plx pull main` first to get latest framework updates
- Then run `plx sync claude clean` to remove and re-sync everything
- Report the results of each command
- Warn user that this will remove any custom local agents/commands in `.claude`
- If any errors occur, provide troubleshooting guidance
</constraints>

<output_format>
1. Warn about clean sync removing custom local content
2. Run `plx pull main` and show output
3. Run `plx sync claude clean` and show output
4. Summarize what was updated and cleaned
5. Confirm successful clean sync
</output_format>

---
role: [[ultra-meta-agent]]
