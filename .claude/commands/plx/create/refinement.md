# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/refinement-agent.md.

Your task is to iteratively create a refinement document through a question-driven process.

<process>
1. Start with the requirements document or deliverables list
2. Ask ONE focused question at a time to define properties and behaviours
3. After each answer, update and present the refinement specifications
4. Continue until all components are fully refined
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔧 Which component should we refine first?
    A. Core data models (properties and relationships)
    B. User-facing components (UI/UX behaviours and interactions)
</example>

<requirements>
Requirements input: `{{requirements-document}}`
Components to refine: `{{components}}`
</requirements>

Begin by understanding the deliverables and asking which components need property and behavior definitions.

---
requirements-document: [Ask the user for the requirements document or deliverables list]
components: [Ask the user which components to refine]
