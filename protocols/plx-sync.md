---
document_type: protocol
goal: verify synchronization between work documents and current work state
gpt_action: follow these steps when verifying work alignment
---

# 🔍 Document Review

1. [[GPT Agent]] starts [[analyze work state]]
   1. [[analyze work state]]
      1. Check current work
      2. Review active tasks
      3. Map dependencies
      4. List decisions made
      5. IF [[state unclear]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[verify documents]]
   1. [[verify documents]]
      1. Check work documents:
```markdown
# Document Status
- Current milestone
- Active tasks
- Implementation details
- Technical decisions
```
      2. Review consistency:
```markdown
# Consistency Check
- Work matches documents
- Decisions documented
- Progress tracked
- Dependencies listed
```

# 🔄 Alignment Check

1. [[GPT Agent]] starts [[identify gaps]]
   1. [[identify gaps]]
      1. Document discrepancies:
```markdown
# Gap Analysis
- Missing documentation
- Outdated information
- Inconsistent states
- Untracked changes
```
      2. Check completeness:
```markdown
# Completeness Check
- All work documented
- Decisions recorded
- Progress updated
- Dependencies mapped
```

2. [[GPT Agent]] starts [[verify alignment]]
   1. [[verify alignment]]
      1. Check accuracy
      2. Validate state
      3. Confirm progress
      4. IF [[misalignment found]]
         1. [[GPT Agent]] documents issues

# 📋 Status Report

1. [[GPT Agent]] starts [[prepare report]]
   1. [[prepare report]]
      1. Document findings:
```markdown
# Sync Status
- Current state
- Found issues
- Required updates
- Action items
```
      2. List recommendations:
```markdown
# Recommendations
- Documentation updates
- State corrections
- Process adjustments
- Required actions
```

2. [[GPT Agent]] presents report to [[User]]

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves