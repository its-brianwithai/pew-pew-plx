---
document_type: protocol
goal: archive workspace files to preserve state
gpt_action: follow these steps when tagged with this protocol
---

# 📦 Archive Workspace

When you receive this protocol, archive the current workspace files to preserve state.

## 1️⃣ Preparation

1. Default Source
   - Parent directory (`../`)
   - Contains active workspace files
   - Includes all framework files
   - Preserves file structure

2. Default Target
   - `turbo-archive` in current directory
   - Creates if doesn't exist
   - Maintains file organization
   - Preserves relationships

## 2️⃣ Archive Process

1. Run Archive Script
   ```bash
   ./archive.sh
   ```
   - Uses parent directory as source
   - Creates archive in current directory
   - Shows files before archiving
   - Asks for confirmation

2. Verify Archive
   - Check archived files
   - Verify file structure
   - Ensure completeness
   - Validate relationships

## ✅ Completion Check

1. Archive Created
   - [ ] Source files identified
   - [ ] Target directory exists
   - [ ] Files copied correctly
   - [ ] Structure preserved

2. Verification
   - [ ] All files present
   - [ ] Relationships maintained
   - [ ] No corruption
   - [ ] Archive accessible

Remember:
- Archive preserves complete workspace state
- Includes all framework and project files
- Maintains file relationships
- Creates clean backup for reference 