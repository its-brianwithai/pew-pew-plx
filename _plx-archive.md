---
document_type: protocol
goal: archive workspace files to preserve state
gpt_action: follow these steps to create a backup of the workspace
---

# 📦 Archive Workspace

When you receive this protocol, it means you need to create a complete backup of the current workspace files to preserve their state and relationships.

## 1. Prepare Archive Location
[ ] Identify source and target directories for the archive.

The source is typically the parent directory (`../`) containing workspace files, while the target is a new `turbo-archive` directory in the current location. The target will be created if it doesn't exist.

## 2. Run Archive Process
[ ] Execute the archive script to copy all workspace files.

Run `./archive.sh` to start the archiving process. The script will show you the files to be archived and ask for confirmation before proceeding with the copy operation.

## 3. Verify Archive Contents
[ ] Validate that all files were archived correctly.

Check that all files are present in the archive, the directory structure is preserved, and no files show signs of corruption. This ensures you have a reliable backup for future reference.

Remember:
- Archive preserves complete workspace state
- Includes all framework and project files
- Maintains file relationships
- Creates clean backup for reference