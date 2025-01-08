---
document_type: protocol
goal: reset workspace to original state while preserving history
gpt_action: follow these steps when tagged with this protocol
---

# 🔄 Reset Workspace

When you receive this protocol, it means you need to archive the current workspace state and reset to original framework files while preserving history.

## 1. Archive Current State
[ ] Run the archive script to preserve current workspace.

Execute `./archive.sh` to archive files from `../` to `turbo-archive`, reviewing files and confirming the operation to ensure all current work is safely preserved.

## 2. Clean Workspace
[ ] Remove working files while preserving core documentation.

Remove all your-*.md and our-*.md files from the workspace, keeping only CHANGELOG.md and LICENSE files to maintain project history and compliance.

## 3. Restore Framework
[ ] Copy fresh framework files to workspace.

Execute `./copy-framework.sh` to restore core framework files to `../`, then initialize a new our-hours.md file and verify the integrity of all restored files.

## 4. Verify Reset
[ ] Confirm workspace is properly reset and ready for use.

Check that the archive is complete, original files are restored correctly, new logs are initialized, and the workspace structure matches framework requirements.

Remember:
- Always archive before reset
- Preserve work history
- Maintain file structure
- Initialize fresh logs