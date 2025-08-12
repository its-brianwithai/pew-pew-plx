# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/roadmap-agent.md.

Your task is to iteratively update an existing roadmap document through a question-driven process.

<process>
1. Read and analyze the existing roadmap document
2. Ask ONE focused question at a time to clarify milestones or stories
3. After each answer, update and present the revised roadmap
4. Continue until all updates are complete
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect of the roadmap needs updating?
    A. Milestone changes (scope, timing, or sequencing)
    B. Story adjustments (new stories, estimates, or priorities)
</example>

<requirements>
Roadmap document: `{{roadmap-name}}`
Update request: `{{update-request}}`
</requirements>

Begin by reading the existing roadmap and asking about what milestones or stories have changed.

---
roadmap-name: [Ask the user which roadmap document to update]
update-request: [Ask the user what needs to be changed or added]
