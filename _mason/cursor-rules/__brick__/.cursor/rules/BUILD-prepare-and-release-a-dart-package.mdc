---
description: Dart Package Release - How we prepare and release new versions of Dart packages
globs: pubspec.yaml, CHANGELOG.md, lib/**/*.dart
document_type: build_protocol
goal: Define standards for preparing and releasing Dart package versions
gpt_action: Read and apply rules when preparing package releases
---

# How We Prepare and Release a Dart Package

## Purpose
Ensure consistent and reliable package releases with proper version management and documentation.

## Trigger Conditions
- Ready to release a new package version
- Significant changes accumulated
- Bug fixes need to be published
- Breaking changes introduced

## Requirements
1. All changes must be documented in CHANGELOG.md
2. Version numbers must follow semantic versioning
3. Version in pubspec.yaml must match CHANGELOG.md
4. All changes must be committed before publishing
5. Code must be properly formatted
6. Package must pass validation checks

## Implementation Steps
1. Review and document changes:
    - Add new version section in CHANGELOG.md
    - Categorize changes (Features ✨, Improvements 🛠️, Bug fixes 🐛, Breaking 💔)
    - Use consistent emoji prefixes

2. Update version numbers:
    - Update version in pubspec.yaml
    - Ensure it matches CHANGELOG.md
    - Follow semantic versioning (MAJOR.MINOR.PATCH)

3. Format and validate code:
   ```bash
   dart fix --apply
   dart format .
   ```

4. Run publish dry-run:
   ```bash
   dart pub publish --dry-run
   ```

5. Fix any issues found during dry-run

6. Publish package:
   ```bash
   dart pub publish -f
   ```

## Examples
### Good CHANGELOG Entry
```markdown
## 🚀 Version 0.6.1 (January 2024)

### 🛠️ Improvements:
* Updated sync services to use `upsertLocalDoc` instead of `updateLocalDoc` for better consistency
```

### Bad CHANGELOG Entry
```markdown
## Version 0.6.1
- Changed some methods
- Fixed stuff
```

## Validation Checklist
- [ ] CHANGELOG.md updated with all changes
- [ ] Version numbers match in all files
- [ ] All changes committed
- [ ] Code formatted
- [ ] Dry-run passes
- [ ] No uncommitted changes before publish

## Version Number Guidelines
- MAJOR: Breaking changes (incompatible API changes)
- MINOR: New functionality (backward-compatible)
- PATCH: Bug fixes (backward-compatible)

## Emoji Key
- ✨ Features
- 🛠️ Improvements
- 🐛 Bug fixes
- 💔 Breaking changes
- ⬆️ Upgrades
- 📝 Documentation 
