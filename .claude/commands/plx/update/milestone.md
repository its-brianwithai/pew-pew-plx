# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/roadmap-agent.md.

Your task is to iteratively update an existing milestone document through a question-driven process.

<process>
1. Read and analyze the existing milestone document
2. Ask ONE focused question at a time to clarify changes
3. After each answer, update and present the revised milestone
4. Continue until all updates are complete
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect of the milestone needs updating?
    A. Scope changes (deliverables or acceptance criteria)
    B. Timeline adjustments (dates or dependencies)
</example>

<requirements>
Milestone document: `{{milestone-name}}`
Update request: `{{update-request}}`
</requirements>

Begin by reading the existing milestone and asking about what has changed or needs adjustment.

---
milestone-name: [Ask the user which milestone document to update]
update-request: [Ask the user what needs to be changed or added]
