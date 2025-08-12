# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

# Checkout Branch

<instruction>
Switch to an existing git branch.
</instruction>

<constraints>
- Branch must exist locally or on remote
- If branch only exists on remote, track it automatically
</constraints>

Execute: `git checkout {{branch-name}}`