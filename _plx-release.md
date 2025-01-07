---
document_type: protocol
goal: prepare and execute release with proper documentation and version control
gpt_action: follow these steps when tagged with this protocol
---

# 🚀 Release Changes

When you receive this protocol, prepare and execute a release by ensuring all changes are properly documented, committed, and pushed.

## 1️⃣ Stage Changes

1. Add Open Files
   1. Run git status to check changes
   2. Stage modified files:
      ```bash
      git add .
      ```
   3. Note staged files
   4. Verify completeness

2. Review Changes
   1. Show detailed diff:
      ```bash
      git diff --cached | cat
      ```
   2. Review modifications
   3. Note significant changes
   4. List affected components

## 2️⃣ Update Documentation

1. Update CHANGELOG.md
   1. Determine version bump (major/minor/patch)
   2. Add new version section
   3. Document changes:
      - Added features
      - Changed functionality
      - Fixed issues
      - Breaking changes

2. Update README.md
   1. Check feature list
   2. Verify command documentation
   3. Update examples if needed
   4. Ensure accuracy

3. Check Related Files
   1. Find files with relationships:
      - Context files (*.context.md)
      - History files (*.history.md)
      - Test files
      - Documentation
   2. Update related content
   3. Ensure consistency
   4. Verify links

## 3️⃣ Version Control

1. Commit Changes
   1. Create commit message:
      ```
      Release vX.Y.Z:
      - Added: [features]
      - Changed: [modifications]
      - Fixed: [fixes]
      - Breaking: [changes]
      ```
   2. Execute commit:
      ```bash
      git commit -m "message"
      ```

2. Push Changes
   1. Push to remote:
      ```bash
      git push
      ```
   2. Verify push success
   3. Check remote state
   4. Confirm synchronization

## 4️⃣ User Input

1. Request Next Steps
   1. "Release changes are ready. What's next in the release process?"
      - Create pull request?
      - Deploy to environment?
      - Publish package?
      - Create release tag?
      - Run deployment checks?
      - Update dependencies?

2. Process Release Steps
   1. Execute requested processes
   2. Document deployment status
   3. Track release progress
   4. Update release notes

## ✅ Release Checklist

1. Verify:
   - [ ] All changes staged
   - [ ] CHANGELOG.md updated
   - [ ] README.md accurate
   - [ ] Related files consistent
   - [ ] Commit message clear
   - [ ] Changes pushed
   - [ ] Release steps identified
   - [ ] Process completed

Remember:
- Always show git diff before committing
- Keep CHANGELOG.md organized
- Maintain documentation accuracy
- Check related file consistency
- Get user input for next release steps 