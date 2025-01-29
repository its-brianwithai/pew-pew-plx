---
description: Changelog - How we document changes in a consistent and clear format
globs: CHANGELOG.md, changelog.md
document_type: build_protocol
goal: Define standards for maintaining changelog documentation
gpt_action: Read and apply rules when updating changelog entries
---

# How We Update The Changelog

## Purpose
Maintain a consistent and clear changelog that effectively communicates changes to users and maintainers.

## Trigger Conditions
- Adding new features
- Making improvements
- Fixing bugs
- Making breaking changes
- Releasing a new version

## Requirements
1. Follow semantic versioning (MAJOR.MINOR.PATCH)
2. Use consistent section headers
3. Group changes by type
4. Use clear, concise descriptions
5. Reference relevant issue/PR numbers when applicable

## Implementation Steps
1. Add new semantic version header:
   ```markdown
   ## 🚀 Version X.Y.Z (Month Year)
   ---
   ```

2. Add required section headers (if they have content):
   ```markdown
   ### 💔 Breaking:
   ### ✨ Features:
   ### 🛠️ Improvements:
   ### 🐛 Bug fixes:
   ```

3. Add bullet points under appropriate sections:
   - Use clear, concise language
   - Start with a verb
   - Reference code in backticks
   - No emoji prefixes in bullet points

4. Order sections consistently:
   1. Breaking changes (if any)
   2. Features
   3. Improvements
   4. Bug fixes

## Examples
### Good Example
```markdown
## 🚀 Version 0.6.0 (January 2024)
---
### ✨ Features:
* Added `upsertLocalDocs` method for consistent batch local operations

### 🛠️ Improvements:
* Improved upsert operations to always use `createDoc` with `merge: true`
* Removed incorrect exists checks in upsert operations

### 🐛 Bug fixes:
* Fixed incorrect document creation skipping in upsert operations
```

### Bad Example
```markdown
## Version 0.6.0
* **✨ New:** Added upsertLocalDocs method
* **🔄 Change:** Improved upsert operations
* **🛠️ Fix:** Fixed document creation
```

## Validation Checklist
- [ ] Version follows semantic versioning
- [ ] Version header includes month and year
- [ ] Horizontal rule after version header
- [ ] Required sections are present (if they have content)
- [ ] Changes are grouped by type
- [ ] Bullet points are clear and concise
- [ ] Code references use backticks
- [ ] No emoji prefixes in bullet points
- [ ] Sections are in correct order 
