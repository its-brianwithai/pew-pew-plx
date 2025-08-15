# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}.

@prompts/research-project.md

Your task is to delete project resources based on {request}. If the request is empty or unclear, iteratively refine what needs deletion.

<process>
1. Analyze the deletion request
2. If unclear, ask ONE question to clarify what to delete
3. Check dependencies and impacts before deletion
4. Execute deletion with proper cleanup
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🗑️ What needs to be removed?
    A. Single file or resource
    B. Multiple related files or entire component
</example>

<constraints>
- ALWAYS verify file existence before deletion
- ALWAYS check for dependencies and references
- ALWAYS get confirmation for critical deletions
- ALWAYS clean up related references
- NEVER delete without understanding impact
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking what should be deleted.

---
role: @agents/meta/meta-prompt-engineer.md
