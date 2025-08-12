# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/plan/implementation-agent.md.

Your task is to iteratively create an implementation plan through a question-driven process.

<process>
1. Start with user stories from the roadmap
2. Ask ONE focused question at a time to detail implementation
3. After each answer, update and present the implementation plan
4. Continue until all technical details are specified
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🛠️ Which story should we detail first?
    A. Foundation story (sets up architecture/infrastructure)
    B. Feature story (delivers user-visible functionality)
</example>

<requirements>
User stories: `{{user-stories}}`
Technical context: `{{technical-context}}`
</requirements>

Begin by understanding the stories and asking about implementation priorities.

---
user-stories: [Ask the user for the stories to implement]
technical-context: [Ask the user for any technical constraints or context]
