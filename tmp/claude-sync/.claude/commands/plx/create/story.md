# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/story-agent.md.

Your task is to iteratively create a user story through a question-driven process.

<process>
1. Start with the story context from a milestone or feature request
2. Ask ONE focused question at a time to detail the story
3. After each answer, update and present the story definition
4. Continue until the story is fully documented with acceptance criteria
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🎯 Who is the primary user for this story?
    A. End user (customer using the product)
    B. Internal user (admin, support, operations)
</example>

<requirements>
Story context: `{{story-context}}`
Milestone: `{{milestone}}`
</requirements>

Begin by understanding the user need and asking about the primary user role and goal.

---
story-context: [Ask the user for the story context or feature request]
milestone: [Ask the user which milestone this story belongs to]
