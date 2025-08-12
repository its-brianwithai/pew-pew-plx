# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}.

@prompts/research-project.md

Your task is to update an existing template based on {request}. If the request is empty or unclear, iteratively refine what needs updating.

<process>
1. Analyze the template update request
2. If unclear, ask ONE question to clarify what to update
3. Read current template and check blocks/ for patterns
4. Update while preserving conventions and structure
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔧 What aspect of the template needs updating?
    A. Structure and sections (add/remove/reorganize)
    B. Content and instructions (placeholders, guidance)
</example>

<constraints>
- ALWAYS read current template before updating
- ALWAYS preserve YAML front matter structure
- ALWAYS maintain self-contained nature
- NEVER break established conventions
- ONLY update requested aspects
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking which template and what aspect to update.

---
role: @agents/meta/meta-template-expert.md
