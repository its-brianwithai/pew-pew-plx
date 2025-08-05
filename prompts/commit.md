You are about to commit file changes.

You have two options:
1.  **Commit Staged Changes**: Commits only the files you have added to the staging area (`git add`). This is for precise commits. I will run `git commit`.
2.  **Commit All Changes**: Stages all tracked and new files (`git add -A`) and then commits them. This is to commit all your work at once. I will run `git add -A` and then `git commit`.

If the user provided `all` as an argument, perform **Commit All Changes**.
Otherwise, ask the user to choose between "staged" and "all".

Once the commit type is determined, follow these guidelines for the commit message and pre-commit checks:

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
