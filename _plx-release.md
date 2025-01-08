---
document_type: protocol
goal: prepare and execute release with proper documentation and version control
gpt_action: follow these steps when tagged with this protocol
---

# 🚀 Release Changes

When you receive this protocol, it means you need to prepare and execute a release by ensuring all changes are properly documented, committed, and pushed.

## 1. Stage Changes
[ ] Stage and review all modified files using git.

Run git status to check changes, stage files with git add, then review the detailed diff with git diff --cached to verify all modifications are complete and correct.

## 2. Update Documentation
[ ] Update CHANGELOG.md and README.md with all changes.

Document version bump, new features, changes, fixes and breaking changes in CHANGELOG.md. Update README.md feature list, examples and documentation. Ensure all related context files, history files and documentation remain consistent.

## 3. Commit and Push
[ ] Create descriptive commit and push to remote.

Create a detailed commit message documenting all changes, commit with git commit, then push to remote with git push and verify successful synchronization.

## 4. Process Release
[ ] Get user input on next release steps.

Request and execute next steps like creating pull request, deploying to environment, publishing package, creating release tag, running deployment checks or updating dependencies based on user needs.

Remember:
- Always show git diff before committing
- Keep CHANGELOG.md organized
- Maintain documentation accuracy
- Check related file consistency
- Get user input for next release steps