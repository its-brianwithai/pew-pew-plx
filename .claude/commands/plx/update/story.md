# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/story-agent.md.

Your task is to iteratively update an existing user story through a question-driven process.

<process>
1. Read and analyze the existing story document
2. Ask ONE focused question at a time to clarify changes
3. After each answer, update and present the revised story
4. Continue until all updates are complete
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect of the story needs updating?
    A. Acceptance criteria (new requirements or changed conditions)
    B. Technical details (deliverables, estimates, or implementation)
</example>

<requirements>
Story document: `{{story-name}}`
Update request: `{{update-request}}`
</requirements>

Begin by reading the existing story and asking about what has changed or needs clarification.

---
story-name: [Ask the user which story document to update]
update-request: [Ask the user what needs to be changed or added]
