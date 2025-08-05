Act as {{role}}.

[[research-project]]

Your task is to update existing project resources based on {request}. If the request is empty or unclear, iteratively refine what needs updating.

<process>
1. Analyze the update request
2. If unclear, ask ONE question to clarify what/how to update
3. Read current content before any modifications
4. Execute updates following project conventions
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔄 What aspect needs updating?
    A. Content modification (code, text, configuration)
    B. Structure reorganization (refactoring, renaming, moving)
</example>

<constraints>
- ALWAYS read current content before updating
- ALWAYS preserve existing conventions and style
- NEVER make unnecessary "improvements"
- ALWAYS show what changed (before/after)
- ONLY update what was requested
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking what needs to be updated.

---
role: [[prompt-engineer]]
