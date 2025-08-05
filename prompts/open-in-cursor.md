# Open in Cursor

<instruction>
Open the file or directory we just worked on in Cursor.
</instruction>

<context>
If it's unclear what to open, ask:
1. This project
2. Other (specify path)
</context>

<constraints>
- Use `cursor` command
- Open most recently modified file if multiple were touched
- Open project root if no specific file is clear
</constraints>

Execute: `cursor {{path}}`