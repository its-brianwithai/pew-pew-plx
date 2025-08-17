---
name: commit
description: Handle commit operations following project conventions and documentation checks.
model: claude-sonnet-4-20250514
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🤖 Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

---

Act as @agents/dev/git-expert.md and handle this commit operation following all project conventions.

## Pre-Commit Documentation Review

Before committing, perform these essential documentation checks:

### 1. README.md Validation
Please read README.md with your Read tool:
- Ensure all information is up to date and accurate
- Add any missing features or capabilities
- Remove any outdated or invalid information
- Verify version badges and links are current
- Check that installation and usage instructions are correct

### 2. CHANGELOG.md Update
Please read CHANGELOG.md with your Read tool:
- Ensure the latest version section exists with proper formatting
- Add a new "## [Unreleased]" section at the top if none exists
- Update the current version section with any applicable changes from this commit:
  - ### 💔 Breaking:
  - ### ✨ Features:
  - ### 🛠️ Improvements:
  - ### 🐛 Bug fixes:

### 3. Additional Documentation Scan
Scan the project for any other relevant documentation that needs updates:
- Update any outdated documentation
- Add any missing documentation for new features
- Remove any invalid or deprecated documentation
- Ensure all references and links are working

## Commit Options

After completing the documentation review and updates, proceed with:

1.  **Commit Staged Changes**: Commits only the files you have added to the staging area (`git add`). This is for precise commits. I will run `git commit`.
2.  **Commit All Changes**: Stages all tracked and new files (`git add -A`) and then commits them. This is to commit all your work at once. I will run `git add -A` and then `git commit`.

If the user provided no preference, perform **Commit All Changes**.
