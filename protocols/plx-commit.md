---
document_type: protocol
goal: prepare and execute git commit with proper documentation
gpt_action: follow these steps when handling git commits
---

# 🔍 Change Analysis

1. [[GPT Agent]] starts [[review changes]]
   1. [[review changes]]
      1. Run git status
      2. Examine diffs
      3. Verify intended changes
      4. Check for sensitive files
      5. IF [[unintended changes found]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[analyze impact]]
   1. [[analyze impact]]
      1. Review modifications:
```markdown
# Change Review
- Modified files
- Added files
- Deleted files
- Renamed files
```
      2. Verify alignment:
```markdown
# Alignment Check
- Changes match intent
- No unrelated changes
- No sensitive data
- All changes documented
```

# 📝 Commit Preparation

1. [[GPT Agent]] starts [[prepare message]]
   1. [[prepare message]]
      1. Format commit message:
```markdown
# Message Format
type(scope): summary

- Detailed change 1
- Detailed change 2
- Detailed change 3

Types: feat, fix, docs, style, refactor, test, chore
```
      2. IF [[message unclear]]
         1. [[GPT Agent]] refines message
         2. [[GPT Agent]] adds more details

2. [[GPT Agent]] starts [[verify message]]
   1. [[verify message]]
      1. Check format compliance
      2. Validate clarity
      3. Confirm completeness
      4. IF [[message incomplete]]
         1. [[GPT Agent]] adds missing details

# 🚀 Commit Execution

1. [[GPT Agent]] starts [[execute commit]]
   1. [[execute commit]]
      1. Stage changes:
```markdown
# Staging Process
- git add for intended files
- git status to verify
- Confirm staged state
```
      2. Create commit:
```markdown
# Commit Process
- Execute git commit
- Verify commit created
- Check commit log
```

2. [[GPT Agent]] starts [[push changes]]
   1. [[push changes]]
      1. Execute git push
      2. Verify remote state
      3. IF [[push fails]]
         1. [[GPT Agent]] analyzes error
         2. [[GPT Agent]] resolves issue

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves