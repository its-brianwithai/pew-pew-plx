[[research-project]]

Create a new questions document for the current context and activate questions document mode.

<instructions>
1. Analyze the current context and user's goals
2. Create a comprehensive questions document following [[issue-creation-instructions]] naming patterns
3. Filename: `[context-name]-questions.md` (use appropriate context identifier)
4. Structure the document with sections for different phases or topics
5. After creating the document, activate [[activate-question-mode]] to begin the iterative refinement process
</instructions>

<document-structure>
# 📋 [Project/Feature Name] Questions

**Goal:** [Clearly state the interpreted goal based on user's request]

Please answer the questions in each section by placing an X in the checkbox for your choice.
When you're done with a section, please reply with "done".

---

## 🎯 Initial Questions - Iteration 1
*[Mark complete when done: [ ]]*

[Create comprehensive yes/no questions following these priorities:]
- **Prefer YES/NO questions** to reduce cognitive load
- Focus on maximum value in four areas:
  - 🔧 **Improve**: What can be enhanced?
  - ➕ **Add**: What new elements are needed?
  - ➖ **Remove**: What should be eliminated?
  - 🚫 **Exclude**: What should be ruled out?

---

## 📝 Additional Information

If you have any additional context or requirements not covered above, please add them here:

```
[Space for free-form input]
```

---

## ✅ Answered Questions Archive

*[This section will be populated as questions are answered]*
</document-structure>

<process>
1. **Determine Context**: Identify the appropriate context name from the user's request
2. **Create Document**: Write the questions document with initial high-value questions
3. **Focus on Value**: Ensure questions target the most impactful decisions first
4. **Activate Mode**: After creating, immediately activate [[activate-question-mode]]
5. **Begin Iteration**: Start the question-answer-refine cycle
</process>

<constraints>
- ALWAYS create only ONE questions document per context
- ALWAYS use yes/no format when possible
- ALWAYS organize by value type (Improve/Add/Remove/Exclude)
- ALWAYS include space for additional context
- NEVER create multiple question documents for same context
</constraints>

Begin by identifying the context and creating the appropriate questions document.