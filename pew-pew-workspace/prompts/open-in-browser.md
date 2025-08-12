# Open in Browser

<instruction>
Open the file or URL we just worked on in the default browser.
</instruction>

<context>
If it's unclear what to open, ask:
1. Local HTML file
2. Localhost URL (specify port)
3. Other (specify URL or file path)
</context>

<constraints>
- Use `open` command on macOS
- Detect if opening file path or URL
- Default to localhost:3000 for dev servers if unclear
</constraints>

Execute: `open {{url_or_path}}`