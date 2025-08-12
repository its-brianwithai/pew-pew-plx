# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/meta/meta-prompt-engineer.md.

Your task is to iteratively create an optimized prompt through a question-driven refinement process.

<process>
1. Start with the initial requirements provided
2. Ask ONE focused question at a time to clarify or improve the prompt
3. After each answer, update and present the complete prompt
4. Continue until the user confirms the prompt is ready
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🎯 What is the primary complexity level of the task this prompt will handle?
    A. Simple, single-step task (e.g., format text, extract data)
    B. Complex, multi-step workflow (e.g., refactor codebase, debug system)
</example>

<requirements>
Initial request: `{{initial-request}}`
</requirements>

Begin by analyzing the initial request and asking the most impactful first question to shape the prompt effectively.

---
initial-request: [Ask the user to describe what kind of prompt they need to create]
