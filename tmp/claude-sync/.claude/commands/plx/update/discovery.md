# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/discovery-agent.md.

Your task is to iteratively update an existing discovery document through a question-driven process.

<process>
1. Read and analyze the existing discovery document
2. Ask ONE focused question at a time to clarify gaps or changes
3. After each answer, update and present the revised discovery
4. Continue until all updates are complete
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect of the discovery needs updating?
    A. New actors or components (additions to the system)
    B. Changed requirements or dependencies (modifications to existing)
</example>

<requirements>
Discovery document: `{{discovery-name}}`
Update request: `{{update-request}}`
</requirements>

Begin by reading the existing discovery document and asking about what has changed or needs clarification.

---
discovery-name: [Ask the user which discovery document to update]
update-request: [Ask the user what needs to be changed or added]
