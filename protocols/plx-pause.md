---
document_type: protocol
goal: document current state and context for seamless resumption
gpt_action: follow these steps when preserving work state
---

# 🔍 State Analysis

1. [[GPT Agent]] starts [[analyze current state]]
   1. [[analyze current state]]
      1. Document timestamp
      2. Review active tasks
      3. List next steps
      4. Map dependencies
      5. IF [[state unclear]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[collect context]]
   1. [[collect context]]
      1. Active work:
```markdown
# Current State
- Active milestone
- Current task
- Progress made
- Pending steps
```
      2. Technical context:
```markdown
# Development Context
- Active decisions
- Implementation details
- Open questions
- Known blockers
```

# 📝 State Documentation

1. [[GPT Agent]] starts [[document state]]
   1. [[document state]]
      1. Create pause entry:
```markdown
# Pause Entry [YYYY-MM-DD HH:MM]

## Current Progress
- Milestone: [name]
- Task: [description]
- Status: [details]
- Completion: [percentage]

## Next Steps
- Immediate: [next action]
- Planned: [upcoming tasks]
- Blockers: [if any]
```
      2. Document decisions:
```markdown
# Active Decisions
- Technical choices
- Implementation approaches
- Pending validations
- Open questions
```

2. [[GPT Agent]] starts [[verify documentation]]
   1. [[verify documentation]]
      1. Check completeness
      2. Validate clarity
      3. Confirm accuracy
      4. IF [[documentation incomplete]]
         1. [[GPT Agent]] adds missing details

# ✅ Handoff Preparation

1. [[GPT Agent]] starts [[prepare handoff]]
   1. [[prepare handoff]]
      1. Verify state capture:
```markdown
# State Verification
- Progress documented
- Context preserved
- Decisions recorded
- Next steps clear
```
      2. Check resumption path:
```markdown
# Resumption Guide
- Entry point clear
- Dependencies listed
- Setup steps noted
- Validation points
```

2. [[GPT Agent]] presents state to [[User]]

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves