# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

# Open in IntelliJ

<instruction>
Open the file or project we just worked on in IntelliJ IDEA.
</instruction>

<context>
If it's unclear what to open, ask:
1. This project
2. Other (specify path)
</context>

<constraints>
- Use `idea` command
- Open specific file if one was modified
- Open project root if multiple files or unclear
</constraints>

Execute: `idea {{path}}`