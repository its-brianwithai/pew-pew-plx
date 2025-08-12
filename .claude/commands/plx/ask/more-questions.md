# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

@prompts/research-project.md

Update the existing questions document with additional focused questions about a specific subject that needs more clarity before proceeding.

<instructions>
1. Identify the specific subject or area that needs clarification
2. Read the existing questions document to understand context and what's been answered
3. Update the document by adding a new section for targeted clarification questions
4. Focus on the specific gaps or ambiguities that are blocking progress
5. Maintain the same document structure and archive pattern
</instructions>

<update-template>
## 🔍 Clarification Needed: [Specific Subject]
*[Added on: [Date] - Iteration [Number]]*
*[Mark complete when done: [ ]]*

**Why we need clarity:** [Brief explanation of what's unclear or blocking]

### Focused Questions:

#### 1. [Specific aspect needing clarity]?

[ ] **Yes** - [What this clarifies]
[ ] **No** - [Alternative understanding]

#### 2. Do you mean [interpretation A] rather than [interpretation B]?

[ ] **Interpretation A** - [Description]
[ ] **Interpretation B** - [Description]

#### 3. Should [specific detail] be included?

[ ] **Yes** - [Impact of inclusion]
[ ] **No** - [Impact of exclusion]

#### 4. Is [assumption] correct?

[ ] **Yes** - We'll proceed with [consequence]
[ ] **No** - Please clarify in additional context below

---
</update-template>

<process>
1. **Identify Gap**: Pinpoint exactly what needs clarification
2. **Explain Need**: Add context about why this clarity is needed
3. **Create Targeted Questions**: Focus only on the blocking issues
4. **Maintain Structure**: Add new section without disrupting existing content
5. **Request Answers**: Ask user to answer these specific questions
</process>

<constraints>
- ALWAYS update the existing questions document, never create a new one
- ALWAYS explain why the clarification is needed
- ALWAYS keep questions focused on the specific blocking issue
- ALWAYS use yes/no format when possible
- ALWAYS preserve all previous questions and answers
- NEVER ask questions already answered in the archive
</constraints>

<example-usage>
"I need more clarity about the authentication requirements before we can proceed with the user stories. Let me update the questions document with some specific questions about authentication."

[Then add focused section about authentication details]
</example-usage>

Begin by identifying what specific subject needs clarification and updating the questions document accordingly.