# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

# Create Branch

<instruction>
Create a new git branch with the specified name.
</instruction>

<constraints>
- Branch name must follow git naming conventions
- Use lowercase with hyphens for word separation
- Prefix with feature/, bugfix/, hotfix/, or other project convention if applicable
</constraints>

Execute: `git checkout -b {{branch-name}}`