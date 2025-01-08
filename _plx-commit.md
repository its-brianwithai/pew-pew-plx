---
document_type: protocol
goal: prepare and execute git commit with proper documentation
gpt_action: follow these steps when tagged with this protocol
---

# 💾 Commit Changes

When you receive this protocol, it means you need to prepare and execute a git commit with proper documentation and push the changes to the remote repository.

## 1. Review Changes
[ ] Review all modified files and their changes in detail.

Run git status and examine diffs to verify all changes are intentional, no unrelated or sensitive files are included, and all modifications align with the intended updates. This creates a clear picture of what will be committed.

## 2. Prepare Commit Message
[ ] Create a properly formatted commit message following the standard template.

Write a commit message using the format "type(scope): summary" with detailed bullet points below. Types include feat, fix, docs, style, refactor, test, and chore. Keep the summary clear and concise while capturing the key changes.

## 3. Stage and Commit
[ ] Stage all files and create the commit with the prepared message.

Add all intended files using git add, verify the staged changes with git status, and create the commit with your prepared message. This ensures all changes are properly documented in the repository.

## 4. Push Changes
[ ] Push the committed changes to the remote repository.

Execute git push to synchronize your changes with the remote repository, then verify the push was successful and the remote state matches your local changes. This completes the commit process.

Remember:
- Always review changes before committing
- Use clear, descriptive commit messages
- Follow commit message format
- Verify push success