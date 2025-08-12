---
name: git-instructions
description: "Standard git operation instructions for commits, pushes, and repository management following project conventions"
---
# Git Operation Instructions

## Commit Guidelines

### Commit Message Format
- Start with a project key in square brackets (e.g., [XXX-123]), looking at previous commits if unsure
- Use the imperative mood ("Add" not "Added")
- Keep the first line under 50 characters
- Provide a detailed description in subsequent lines when needed
- Follow git commit message best practices

### Pre-Commit Checklist

**Documentation:**
- Update [[CHANGELOG]] following project conventions
- Update [[release_notes]] (if present) with user-facing release notes
- Update [[changelog_nl]] and [[changelog_en]] (if present)
- Update [[README]] if needed
- Update any other relevant project documentation

**Issue Management:**
- Update any active local or GitHub issues mentioned in the conversation

### Commit Message Restrictions
- Do not include "Claude" in the commit message
- Do not add a Claude signature or co-authored-by line
- Do not add "Generated with Claude Code" text
- Do not use past tense ("Added" instead of "Add")
- Do not exceed 50 characters on the first line
- Do not omit the project key prefix

## Push Guidelines

### Push Process
1. First, verify remote status: `git remote -v`
2. Check current branch: `git branch --show-current`
3. After successful commit, push to remote:
   - If branch exists on remote: `git push`
   - If new branch: `git push -u origin <branch-name>`
4. Verify push was successful
5. If working on a feature branch, remind user they may want to create a PR using [[create-pr]]

### Push Safety Checklist
- Ensure all tests pass before pushing (if applicable)
- Verify no sensitive information is being pushed
- Check that branch naming follows project conventions
- Confirm you're pushing to the correct remote and branch

## Analysis Steps
1. Always run `git status` first to understand the current state of changes
2. Check `git log --oneline -5` to understand project commit patterns
3. Apply commit guidelines and follow the strict commit message format
4. Double-check that all guidelines are followed before finalizing