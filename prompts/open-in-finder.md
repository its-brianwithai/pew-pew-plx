# Open in Finder

<instruction>
Open the file or directory we just worked on in Finder.
</instruction>

<context>
If it's unclear what to open, ask:
1. This project
2. Other (specify path)
</context>

<constraints>
- Use `open` command on macOS
- Open parent directory if a file was modified
- Open project root if no specific location is clear
</constraints>

Execute: `open {{path}}`