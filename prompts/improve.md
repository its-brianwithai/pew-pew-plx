[[research-project]]

Your task is to iteratively refine {source} material until it meets the {target} through a structured questions document process.

<process>
1. Start with the provided source material (or blank slate if none)
2. Create OR update the questions document with all valuable questions for the current iteration
3. Ask the user to fill in their answers by placing X in the checkboxes
4. Wait for the user to say "done" before analyzing
5. Update the output based on all answers comprehensively
6. Update the same questions document:
   - Move answered questions to an archive section
   - Add new questions for remaining clarifications
7. Continue until the user confirms the target is met
</process>

<template>
# 📋 [Topic] Questions

Please answer the questions in each section by placing an X in the checkbox for your choice.
When you're done with a section, please reply with "done".

---

## 🎯 Current Questions - Iteration [Number]
*[Mark complete when done: [ ]]*

### 1. [Core Yes/No Question]

[ ] **Yes** - [What this means/implies]
[ ] **No** - [What this means/implies]

### 2. 🔧 [Improvement Question]

Should we improve [specific aspect]?
[ ] **Yes** - [How it would be enhanced]
[ ] **No** - [Keep as is]

### 3. ➕ [Addition Questions]

Do you want to add:
[ ] **Feature A** - [Brief description]
[ ] **Feature B** - [Brief description]
[ ] **Feature C** - [Brief description]

### 4. ➖ [Removal Question]

Should we remove [specific item]?
[ ] **Yes** - [What gets removed]
[ ] **No** - [Keep it]

### 5. 🚫 [Exclusion Questions]

Should we explicitly exclude:
[ ] **Option X** - [Won't be considered]
[ ] **Option Y** - [Won't be considered]

---

## 📝 Additional Context

If you have any additional information not covered above, please add it here:

```
[Space for free-form input]
```

---

## ✅ Answered Questions Archive

### Iteration [Number] - Completed [Date]
[Previous questions with [X] marked answers preserved here]
</template>

<constraints>
- ALWAYS maintain a single questions document throughout the process
- ALWAYS update the existing document rather than creating new ones
- ALWAYS preserve answered questions in an archive section
- ALWAYS use markdown checkboxes [ ] for answers
- ALWAYS wait for "done" before processing responses
- ALWAYS follow existing project conventions exactly
- NEVER introduce unsolicited changes or "better" solutions
- ALWAYS act as devil's advocate to challenge assumptions
- ALWAYS **prefer YES/NO questions** to reduce cognitive load
- ALWAYS focus on maximum value in four areas:
  - 🔧 Improve (enhance existing)
  - ➕ Add (introduce new)
  - ➖ Remove (eliminate unnecessary)
  - 🚫 Exclude (rule out options)
- ALWAYS use multiple yes/no questions instead of complex multi-choice when possible
- ALWAYS group related questions together
- ALWAYS include space for custom/additional input
</constraints>

<source>
$ARGUMENTS
</source>

<target>
[Ask the user for their target/goal if not provided]
</target>

Begin by analyzing the source material and creating/updating the questions document covering all aspects that need clarification or improvement. If a questions document already exists, update it with new questions while preserving the answered ones in the archive section.
