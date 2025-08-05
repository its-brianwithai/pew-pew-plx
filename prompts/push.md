---
name: push
description: "Commit and push changes to remote repository in one workflow"
---
# Push Changes

You are about to commit and push file changes to the remote repository.

You have two options:
1.  **Push Staged Changes**: Commits only the files you have added to the staging area (`git add`), then pushes. This is for precise commits. I will run `git commit` then `git push`.
2.  **Push All Changes**: Stages all tracked and new files (`git add -A`), commits them, then pushes. This is to commit and push all your work at once. I will run `git add -A`, then `git commit`, then `git push`.

If the user provided `all` as an argument, perform **Push All Changes**.
Otherwise, ask the user to choose between "staged" and "all".

Once the push type is determined, follow these guidelines:

**Commit Guidelines:**
- [ ] I will understand the context of the changes by running `git status`.
- [ ] I will always start with a project key in square brackets (e.g., [XXX-123]), looking at previous commits if unsure.
- [ ] I will use the imperative mood ("Add" not "Added").
- [ ] I will keep the first line under 50 characters.
- [ ] I will provide a detailed description in subsequent lines when needed.
- [ ] I will not include "Claude" in the commit message.
- [ ] I will not add a Claude signature or co-authored-by line.
- [ ] I will not add the "Generated with Claude Code" text.
- [ ] I will follow git commit message best practices.

**Pre-Commit Checklist:**
- **Documentation:**
  - [ ] Update the @CHANGELOG.md following project conventions.
  - [ ] Update the @release_notes.json (if present) with user-facing release notes.
  - [ ] Update @assets/md/changelog_nl.md and @assets/md/changelog_en.md (if present).
  - [ ] Update the @README.md if needed.
  - [ ] Update any other relevant project documentation.
- **Issue Management:**
  - [ ] Update any active local or GitHub issues mentioned in this conversation.

**Push Process:**
1. First, verify remote status: `git remote -v`
2. Check current branch: `git branch --show-current`
3. After successful commit, push to remote:
   - If branch exists on remote: `git push`
   - If new branch: `git push -u origin <branch-name>`
4. Verify push was successful
5. If working on a feature branch, remind user they may want to create a PR using [[create-pull-request]]

**Push Guidelines:**
- [ ] Ensure all tests pass before pushing (if applicable)
- [ ] Verify no sensitive information is being pushed
- [ ] Check that branch naming follows project conventions
- [ ] Confirm you're pushing to the correct remote and branch

---
all: [Optional: Include "all" to stage all changes before committing and pushing]
