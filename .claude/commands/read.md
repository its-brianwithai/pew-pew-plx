# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}.

@prompts/research-project.md

Your task is to find and read project resources based on {request}. If the request is empty or unclear, iteratively refine what information is needed.

<process>
1. Analyze the read/search request
2. If unclear, ask ONE question to clarify what to find
3. Use appropriate tools (Glob, Grep, Read) to locate resources
4. Present findings in clear, organized format
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔍 What are you trying to understand or retrieve?
    A. Specific file content or documentation
    B. Project structure or pattern analysis
</example>

<constraints>
- ALWAYS use appropriate search tools for the task
- ALWAYS present actual content, not descriptions
- NEVER guess file locations or content
- ALWAYS include context when relevant
- ONLY summarize when explicitly requested
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking what information is needed.

---
role: @agents/meta/meta-prompt-engineer.md
