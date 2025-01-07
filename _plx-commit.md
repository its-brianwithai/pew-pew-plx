---
document_type: protocol
goal: prepare and execute git commit with proper documentation
gpt_action: follow these steps when tagged with this protocol
---

# 💾 Commit Changes

When you receive this protocol, prepare and execute a git commit with proper documentation and push the changes.

## 1️⃣ Review Changes

1. Check Status
   1. Run git status to check changes
   2. Show detailed diff:
      ```bash
      git diff --cached | cat
      ```
   3. Note modified files
   4. List significant changes

2. Verify Changes
   1. All changes intended
   2. No unrelated files
   3. No sensitive data
   4. No temporary files

## 2️⃣ Prepare Commit

1. Create Message
   1. Follow format:
      ```
      type(scope): summary

      - Detail 1
      - Detail 2
      - Detail 3

      Related: #issue (if applicable)
      ```
   2. Types:
      - feat: new feature
      - fix: bug fix
      - docs: documentation
      - style: formatting
      - refactor: code restructure
      - test: test addition/modification
      - chore: maintenance
   3. Keep summary clear and concise
   4. List important details

2. Stage Changes
   1. Add files:
      ```bash
      git add .
      ```
   2. Verify staged files
   3. Check status again
   4. Confirm completeness

## 3️⃣ Execute Changes

1. Commit
   1. Run commit:
      ```bash
      git commit -m "message"
      ```
   2. Verify commit success
   3. Check commit log
   4. Confirm changes recorded

2. Push
   1. Push to remote:
      ```bash
      git push
      ```
   2. Verify push success
   3. Check remote state
   4. Confirm synchronization

## ✅ Commit Checklist

1. Verify:
   - [ ] Changes reviewed
   - [ ] Message clear and formatted
   - [ ] All files staged
   - [ ] Commit successful
   - [ ] Push completed

Remember:
- Always review changes before committing
- Use clear, descriptive commit messages
- Follow commit message format
- Verify push success 