---
document_type: protocol
goal: prepare and execute release with proper documentation and version control
gpt_action: follow these steps when preparing and executing releases
---

# 🔍 Change Review

1. [[GPT Agent]] starts [[analyze changes]]
   1. [[analyze changes]]
      1. Run git status
      2. Review modifications
      3. Check completeness
      4. Verify correctness
      5. IF [[changes unclear]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[assess impact]]
   1. [[assess impact]]
      1. Review changes:
```markdown
# Change Analysis
- Modified files
- Added features
- Fixed issues
- Breaking changes
```
      2. Check dependencies:
```markdown
# Dependency Check
- Version updates
- API changes
- Migration needs
- Compatibility issues
```

# 📝 Release Documentation

1. [[GPT Agent]] starts [[update version]]
   1. [[update version]]
      1. Update pubspec:
```markdown
# Version Updates
- pubspec.yaml version
- Dependencies check
- SDK constraints
- Platform support
```

2. [[GPT Agent]] starts [[update docs]]
   1. [[update docs]]
      1. Update changelog:
```markdown
# CHANGELOG.md Updates
## [Version X.Y.Z] - YYYY-MM-DD
### Added
- New feature 1
- New feature 2

### Changed
- Change 1
- Change 2

### Fixed
- Fix 1
- Fix 2

### Breaking
- Breaking change 1
- Migration guide
```
      2. Update readme:
```markdown
# README.md Updates
- Feature list
- Usage examples
- API documentation
- Setup instructions
```

3. [[GPT Agent]] starts [[verify documentation]]
   1. [[verify documentation]]
      1. Check completeness
      2. Validate accuracy
      3. Confirm formatting
      4. IF [[documentation incomplete]]
         1. [[GPT Agent]] adds missing details

# 🚀 Release Execution

1. [[GPT Agent]] starts [[prepare code]]
   1. [[prepare code]]
      1. Clean and build:
```markdown
# Code Preparation
- Run builder delete conflicting outputs
- Run tests
- Fix failing tests
- Run dart fix
- Run dart format
```
      2. Verify preparation:
```markdown
# Code Verification
- All tests passing
- Code formatted
- No conflicting outputs
- No pending fixes
```

2. [[GPT Agent]] starts [[execute release]]
   1. [[execute release]]
      1. Stage changes:
```markdown
# Release Process
- Stage files (git add)
- Review diff (git diff --cached)
- Create commit
- Push changes
```
      2. Verify release:
```markdown
# Release Verification
- Remote sync status
- Documentation updates
- Version consistency
- Deployment readiness
```

3. [[GPT Agent]] starts [[publish release]]
   1. [[publish release]]
      1. Execute publish:
```markdown
# Publish Steps
- Run dry publish command
- Run publish command
- Verify package listing
- Check availability
- Validate installation
```

4. [[GPT Agent]] starts [[process next steps]]
   1. [[process next steps]]
      1. Get user input
      2. Execute actions:
         - Create pull request
         - Deploy to environment
         - Update dependents
         - Run migrations
      3. IF [[steps incomplete]]
         1. [[GPT Agent]] continues execution

5. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves