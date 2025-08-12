# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/implementation-agent.md.

Your task is to iteratively update an existing implementation plan through a question-driven process.

<process>
1. Read and analyze the existing implementation plan
2. Ask ONE focused question at a time to clarify technical details
3. After each answer, update and present the revised plan
4. Continue until all updates are complete
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect of the implementation needs updating?
    A. Technical approach (CRUD operations, architecture changes)
    B. Acceptance criteria (test requirements, quality standards)
</example>

<requirements>
Implementation plan: `{{plan-name}}`
Update request: `{{update-request}}`
</requirements>

Begin by reading the existing plan and asking about what technical details have changed.

---
plan-name: [Ask the user which implementation plan to update]
update-request: [Ask the user what needs to be changed or added]
