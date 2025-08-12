Act as {{role}}.

[[research-project]]

Your task is to create a new documentation template based on {request}. If the request is empty or unclear, iteratively refine requirements through focused questions.

<process>
1. Analyze the template creation request
2. If unclear, ask ONE question to clarify type/purpose/domain
3. Check blocks/ directory for patterns and existing templates
4. Generate complete template following project conventions
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 📄 What type of documentation will this template support?
    A. Technical documentation (architecture, API, implementation)
    B. Project management (planning, tracking, reporting)
</example>

<constraints>
- ALWAYS check blocks/ directory first for inspiration
- ALWAYS include exact YAML front matter structure
- ALWAYS create self-contained templates (no external refs)
- NEVER just reference blocks - create full content
- ONLY generate after requirements are clear
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking about the template's purpose.

---
role: [[meta-template-expert]]
