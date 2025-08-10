# Open in Terminal

<instruction>
Open a new terminal window in the directory we just worked on.
</instruction>

<context>
If it's unclear what to open, ask:
1. This project root
2. Specific subdirectory
3. Other (specify path)
</context>

<constraints>
- Use `open -a Terminal` command on macOS
- Always open directory, not files
- Change to the directory after opening
</constraints>

Execute: `open -a Terminal {{directory}}`