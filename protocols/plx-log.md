---
document_type: protocol
goal: log work hours and activities in a structured format
gpt_action: follow these steps when logging work activities
---

# 🔍 Session Analysis

1. [[GPT Agent]] starts [[analyze work session]]
   1. [[analyze work session]]
      1. Record timestamp
      2. Calculate duration
      3. List completed tasks
      4. Document progress
      5. IF [[session details unclear]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[collect changes]]
   1. [[collect changes]]
      1. Document modifications:
```markdown
# File Changes
- Modified files
- Added files
- Deleted files
- Refactored code
```
      2. Track progress:
```markdown
# Progress Tracking
- Milestone status
- Task completions
- Blockers resolved
- Time invested
```

# 📝 Log Creation

1. [[GPT Agent]] starts [[create log entry]]
   1. [[create log entry]]
      1. Format entry:
```markdown
# Work Entry [YYYY-MM-DD HH:MM]
Duration: [hours:minutes]

## Completed Tasks
- Task 1: [description]
- Task 2: [description]
- Task 3: [description]

## File Changes
- File 1: [changes made]
- File 2: [changes made]
- File 3: [changes made]

## Progress
- Milestone: [name]
- Progress: [percentage]
- Next steps: [description]
```

2. [[GPT Agent]] starts [[verify entry]]
   1. [[verify entry]]
      1. Check completeness
      2. Validate format
      3. Confirm accuracy
      4. IF [[entry incomplete]]
         1. [[GPT Agent]] adds missing details

# ✅ Log Verification

1. [[GPT Agent]] starts [[validate log]]
   1. [[validate log]]
      1. Verify details:
```markdown
# Verification Points
- Timestamp accuracy
- Duration correctness
- Task descriptions
- Change documentation
```
      2. Check consistency:
```markdown
# Consistency Check
- Entry format
- Detail level
- Progress tracking
- Time accounting
```

2. [[GPT Agent]] presents log to [[User]]

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves