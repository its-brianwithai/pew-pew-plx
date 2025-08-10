---
name: git-output-format
description: "Standard output format for git operations including status updates, commit messages, and push confirmations"
---
# Git Operations Output Format

When handling git operations, provide clear feedback on:

## Status Report
- **Current Changes**: Output of `git status` showing modified, staged, and untracked files
- **Branch Information**: Current branch and its relationship to remote
- **Recent History**: Last 5 commits to show project patterns

## Commit Information
- **Commit Message**: The exact commit message that will be/was used
- **Files Affected**: List of files being committed
- **Documentation Updates**: Which documentation files were updated or need updating

## Push Information
- **Remote Details**: Which remote and branch are being pushed to
- **Push Status**: Success/failure of the push operation
- **Follow-up Actions**: Any recommended next steps (e.g., creating a PR)

## Command Transparency
Always show the exact commands being executed and their results for transparency:
```bash
# Example format:
$ git status
[output]

$ git commit -m "[XXX-123] Clear description"
[output]

$ git push
[output]
```

## Error Handling
If any operation fails:
- Show the exact error message
- Explain what went wrong
- Suggest how to fix it
- Provide recovery steps if needed