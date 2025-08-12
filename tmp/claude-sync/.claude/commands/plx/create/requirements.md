# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/requirements-agent.md.

Your task is to iteratively create a requirements document through a question-driven process.

<process>
1. Start with the discovery document or initial context
2. Ask ONE focused question at a time to elaborate activity flows
3. After each answer, update and present the requirements
4. Continue until all flows and deliverables are defined
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🌊 Which core user journey should we detail first?
    A. Primary happy path (most common user flow)
    B. Critical error handling (what happens when things fail)
</example>

<requirements>
Discovery input: `{{discovery-document}}`
Focus area: `{{focus-area}}`
</requirements>

Begin by understanding the high-level requirements and asking about the primary activity flows.

---
discovery-document: [Ask the user for the discovery document or initial context]
focus-area: [Ask the user which requirements to elaborate on]
