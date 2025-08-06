# Open in GitHub

<instruction>
Open the current repository, file, or branch we just worked on in GitHub.
</instruction>

<context>
If it's unclear what to open, ask:
1. Repository home
2. Current file on GitHub
3. Current branch
4. Pull requests
5. Issues
</context>

<constraints>
- Use `gh` CLI or construct GitHub URL
- Get remote URL from git config
- Open specific file at current branch if recently modified
</constraints>

Execute: `gh browse {{target}}`