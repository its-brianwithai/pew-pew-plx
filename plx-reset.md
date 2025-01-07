---
document_type: protocol
goal: reset workspace to original state while preserving history
gpt_action: follow these steps when tagged with this protocol
---

# 🔄 Reset Workspace

When you receive this protocol, archive current state and reset to original files.

## 1️⃣ Archive Current State

1. Follow plx-archive protocol
   1. Run archive script:
      ```bash
      ./archive.sh
      ```
      - Default source: `../` (one folder up)
      - Default target: `turbo-archive` in current directory
      - Review files before proceeding
      - Confirm archive operation

2. Verify Archive
   - Check archived files
   - Verify file structure
   - Ensure completeness

## 2️⃣ Reset Process

1. Clean Workspace
   1. Remove current your-*.md files
   2. Remove current our-*.md files
   3. Keep CHANGELOG.md
   4. Keep LICENSE if exists

2. Restore Core Files
   1. Run copy framework script:
      ```bash
      ./copy-framework.sh
      ```
      - Default target: `../` (one folder up)
      - Review files to be copied
      - Confirm copy operation
   2. Initialize new our-hours.md
   3. Verify file structure
   4. Check file integrity

## ✅ Completion Check

1. Archive Verified
   - [ ] Current state archived
   - [ ] Files preserved
   - [ ] Structure maintained
   - [ ] Links intact

2. Reset Complete
   - [ ] Original files restored
   - [ ] New hours log created
   - [ ] Structure verified
   - [ ] Ready for use

Remember: 
- Always archive before reset
- Preserve work history
- Maintain file structure
- Initialize fresh logs 