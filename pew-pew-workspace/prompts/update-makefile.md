Act as {{role}}.

[[research-project]]

Your task is to update an existing Makefile based on {request}. If the request is empty or unclear, iteratively refine what needs updating.

<process>
1. Analyze the Makefile update request
2. If unclear, ask ONE question to clarify what to update
3. Read current Makefile and check project conventions
4. Update while preserving GNU Make best practices
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔧 What aspect of the Makefile needs updating?
    A. Build targets and rules (compilation, linking, dependencies)
    B. Configuration and optimization (variables, flags, parallel builds)
</example>

<constraints>
- ALWAYS read current Makefile before updating
- ALWAYS use TABs for recipe indentation
- ALWAYS preserve existing project conventions
- NEVER break existing functionality
- ONLY update requested aspects
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking what specific Makefile improvements are needed.

---
role: [[makefile-expert]]
