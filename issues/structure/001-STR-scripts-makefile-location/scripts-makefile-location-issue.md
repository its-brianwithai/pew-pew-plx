# 📁 Issue: Scripts and Makefile Location

Scripts and Makefile should reside in .pew instead of root directory

**GitHub Issue:** #4  
**Pull Request:** (pending creation)

---

## 📝 Initial Requirement

### Requirements
1. **System** should have scripts and Makefile in .pew/ directory instead of root
2. **System** should handle the fact that commands expect Makefile in root
3. **System** should handle the fact that scripts have paths expecting current structure
4. **Developer** should be able to perform a careful refactor to avoid breaking existing functionality
5. **System** should NOT maintain backwards compatibility - all references must be updated to new paths
6. **Quick Start command** in README.md should be updated to call `.pew/scripts/` instead of root scripts
7. **install.sh** should also move to `.pew/` - NO files from this repo should remain in root
8. **Root directory** should only contain user's project files, with .pew/ as the only framework directory
9. **Refactoring** should happen in testable checkpoints, not one atomic change

---

## 🌊 Actor Flow
*How does this refactoring happen in sequence?*

### Event Sequence
1. **Developer** → creates → new directory structure in .pew/
   - Data: Makefile, install.sh, scripts/ directory
2. **Developer** → moves → files to new locations
   - Data: All scripts and Makefile relocated
3. **Developer** → updates → internal script references
   - Data: Path updates in all .sh files
4. **Developer** → updates → Makefile references
   - Data: Commands now point to .pew/ paths
5. **Developer** → tests → sync functionality
   - Data: Verification that sync still works
6. **Developer** → updates → documentation
   - Data: README.md, CLAUDE.md with new paths
7. **Developer** → removes → old root files
   - Data: Clean root directory

---

## 📦 Deliverables
*What needs to be created, updated, or deleted?*

### Event 1: Create new directory structure
- **Create**: `.pew/Makefile` (new location)
- **Create**: `.pew/install.sh` (new location)
- **Create**: `.pew/scripts/claude-code/` (ensure exists)

### Event 2: Move files to new locations
- **Move**: `Makefile` → `.pew/Makefile`
- **Move**: `install.sh` → `.pew/install.sh`
- **Move**: `scripts/` → `.pew/scripts/`

### Event 3: Update internal script references
- **Update**: All `.sh` files in `.pew/scripts/claude-code/` to use new relative paths
- **Update**: `plx-yaml-parser.sh` path references
- **Update**: `sync-claude-code.sh` path to find project root correctly

### Event 4: Update Makefile references
- **Update**: `.pew/Makefile` to reference `.pew/scripts/claude-code/*.sh`
- **Update**: Remove hardcoded `./scripts/` references

### Event 5: Test sync functionality
- **Update**: `test-sync.sh` to work with new structure
- **Verify**: Sync process finds files in `.pew/` correctly

### Event 6: Update documentation
- **Update**: `README.md` Quick Start command to use `.pew/` paths
- **Update**: `README.md` file structure documentation
- **Update**: `CLAUDE.md` to reflect new paths
- **Update**: Any references to `make` commands

### Event 7: Remove old files
- **Delete**: Root `Makefile`
- **Delete**: Root `install.sh`
- **Delete**: Root `scripts/` directory

---

## ✅ Acceptance Criteria

### What should always go right?
- [ ] All sync scripts work from new `.pew/scripts/` location
- [ ] Makefile commands function correctly from `.pew/Makefile`
- [ ] Quick Start command successfully sets up framework in new projects
- [ ] Test script validates sync process correctly
- [ ] All internal path references resolve correctly
- [ ] Framework files are completely isolated in `.pew/` directory
- [ ] If possible without root files: `make` commands callable from root using `make -f .pew/Makefile`

### What should never go wrong?
- [ ] No broken paths after refactoring
- [ ] No scripts fail due to incorrect relative paths
- [ ] No files left in root directory from framework
- [ ] No loss of functionality during migration
- [ ] No circular dependencies in path resolution

### What should always be?
- [ ] Root directory contains ONLY user project files
- [ ] `.pew/` directory contains ALL framework files
- [ ] All scripts can find project root correctly
- [ ] Documentation accurately reflects new structure
- [ ] Path resolution works from any working directory

### What should never be?
- [ ] Framework files in root directory
- [ ] Hardcoded absolute paths in scripts
- [ ] Mixed old/new path references
- [ ] Requirement for backwards compatibility code
- [ ] Confusion about where framework files live

---

## 🎯 Implementation Checkpoints
*Break down deliverables into testable, deployable increments*

### Checkpoint 1: Duplicate Structure (Safe Foundation)
**Scope:** Create new structure without breaking existing functionality
**Events:** Event 1 (Create new directory structure)
**Deliverables:** 
- Copy Makefile to `.pew/Makefile`
- Copy install.sh to `.pew/install.sh`
- Copy scripts/ to `.pew/scripts/`
**Can ship:** No (preparation only)
**Acceptance:**
- [ ] New `.pew/` structure exists with all files
- [ ] Original files still work unchanged
- [ ] No functionality broken

### Checkpoint 2: Update Internal References
**Scope:** Make `.pew/` scripts self-contained and functional
**Events:** Event 3 (Update internal script references)
**Deliverables:**
- Update all `.pew/scripts/claude-code/*.sh` path references
- Update `.pew/Makefile` to use `.pew/scripts/` paths
- Ensure scripts find project root from new location
**Can ship:** No (dual structure exists)
**Acceptance:**
- [ ] `.pew/scripts/claude-code/sync-claude-code.sh` works when called directly
- [ ] `.pew/Makefile` commands work with `make -f .pew/Makefile sync claude`
- [ ] Test script passes from new location

### Checkpoint 3: Update Documentation & External References
**Scope:** Point all documentation and README to new structure
**Events:** Event 6 (Update documentation)
**Deliverables:**
- Update README.md Quick Start command
- Update CLAUDE.md paths
- Update all documentation references
**Can ship:** Yes (with migration notes)
**Acceptance:**
- [ ] Quick Start command uses `.pew/` paths
- [ ] Documentation reflects new structure
- [ ] Installation instructions updated

### Checkpoint 4: Remove Legacy Structure
**Scope:** Clean up root directory
**Events:** Event 7 (Remove old files)
**Deliverables:**
- Delete root Makefile
- Delete root install.sh  
- Delete root scripts/ directory
**Can ship:** Yes (final state)
**Acceptance:**
- [ ] Root directory has no framework files
- [ ] All functionality works from `.pew/`
- [ ] Clean separation achieved