# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/discovery-agent.md.

Your task is to iteratively create a discovery document through a question-driven process.

<process>
1. Start with the initial request provided
2. Ask ONE focused question at a time to uncover requirements and context
3. After each answer, update and present the discovery findings
4. Continue until all actors, components, requirements, and dependencies are clear
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🎯 What is the primary goal or problem this project addresses?
    A. New feature or capability (describe what users will be able to do)
    B. Improvement or fix (describe current pain points)
</example>

<requirements>
Initial request: `{{initial-request}}`
</requirements>

Begin by analyzing the initial request and asking about the core problem or opportunity being addressed.

---
initial-request: [Ask the user to describe their project request or idea]
