# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/roadmap-agent.md.

Your task is to iteratively create a roadmap document through a question-driven process.

<process>
1. Start with the refinement document or deliverables list
2. Ask ONE focused question at a time to organize milestones and stories
3. After each answer, update and present the roadmap
4. Continue until all work is organized and estimated
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 📅 How should we organize the milestones?
    A. By technical dependencies (foundation → features → polish)
    B. By user value (MVP → enhanced → advanced)
</example>

<requirements>
Refinement input: `{{refinement-document}}`
Timeline constraints: `{{timeline}}`
</requirements>

Begin by understanding the deliverables and asking about milestone organization strategy.

---
refinement-document: [Ask the user for the refinement document or deliverables list]
timeline: [Ask the user about any timeline constraints or goals]
