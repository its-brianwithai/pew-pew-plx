# Release v0.5.0 - Framework Consolidation

## 🎉 Major Architectural Improvement

This release introduces a significant restructuring of the Pew Pew Workspace framework, consolidating all framework files into a dedicated `.pew/` directory to provide clear separation between framework and user project files.

## 🔄 Breaking Changes

⚠️ **This is a breaking change that requires reinstallation for existing projects**

### Framework Structure Migration
All framework files have been moved from the root directory to `.pew/`:
- `Makefile` → `.pew/Makefile`
- `install.sh` → `.pew/install.sh`
- `scripts/` → `.pew/scripts/`

### Command Changes
- **Old**: `make sync claude` or `plx sync claude`
- **New**: `make -f .pew/Makefile sync claude`

All make commands now require the `-f .pew/Makefile` flag to specify the new location.

## ✨ What's New

### Clean Project Structure
- Root directory now contains **only** user project files
- All framework components isolated in `.pew/` directory
- Clear separation of concerns between framework and project

### Updated Installation
The Quick Start command has been updated to properly handle the new structure:
```bash
rm -rf /tmp/pew-pew && git clone --depth 1 https://github.com/its-brianwithai/pew-pew-workspace.git /tmp/pew-pew && cd "$(pwd)" && mkdir -p .pew && for dir in agents prompts templates workflows instructions modes blocks output-formats personas scripts Makefile install.sh; do if [ -f "/tmp/pew-pew/.pew/$dir" ]; then cp "/tmp/pew-pew/.pew/$dir" ".pew/$dir"; elif [ -d "/tmp/pew-pew/.pew/$dir" ]; then mkdir -p ".pew/$dir" && cp -r "/tmp/pew-pew/.pew/$dir"/* ".pew/$dir"/ 2>/dev/null || true; fi; done && cp /tmp/pew-pew/.pew/plx.yaml .pew/plx.yaml && ./.pew/scripts/claude-code/sync-claude-code.sh && rm -rf /tmp/pew-pew
```

## 🛠️ Improvements

### Documentation Updates
- All documentation updated to reflect new structure
- CLAUDE.md updated with new command patterns
- README.md Quick Start section completely rewritten
- Removed references to deprecated `plx` command

### Path Resolution
- All scripts updated to correctly resolve paths from new location
- PROJECT_ROOT calculation adjusted for additional directory depth
- Internal script references maintained and tested

## 📋 Migration Guide

### For Existing Projects

1. **Backup your project** (especially any custom modifications)

2. **Remove old framework files**:
   ```bash
   rm -rf Makefile install.sh scripts/
   ```

3. **Run the new Quick Start command** (see above)

4. **Update any custom scripts** that reference the old paths:
   - Change `./scripts/` to `./.pew/scripts/`
   - Update make commands to use `-f .pew/Makefile`

### For New Projects

Simply run the Quick Start command from the README - no additional steps needed!

## 🔍 Technical Details

### Implementation Approach
The migration was completed using a 4-checkpoint strategy:
1. **Checkpoint 1**: Duplicate structure in `.pew/` without breaking existing functionality
2. **Checkpoint 2**: Update all internal path references
3. **Checkpoint 3**: Update documentation and external references
4. **Checkpoint 4**: Remove legacy files from root

### Files Affected
- 23 files modified or relocated
- All 17 sync scripts updated with new path resolution
- Documentation comprehensively updated

## 🙏 Acknowledgments

Thanks to all contributors and users who provided feedback on the framework structure. This change addresses the common concern about framework files cluttering project roots.

## 📝 Notes

- No backwards compatibility is provided - this is a clean break
- Direct script execution still works: `./.pew/scripts/claude-code/sync-claude-code.sh`
- The `.pew/plx.yaml` configuration system remains unchanged

## 🔗 Links

- [Pull Request #5](https://github.com/its-brianwithai/pew-pew-workspace/pull/5)
- [Issue #4](https://github.com/its-brianwithai/pew-pew-workspace/issues/4)

---

*Release Date: [To be added when PR is merged]*
*Version: v0.5.0*