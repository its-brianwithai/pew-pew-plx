Act as {{role}}.

[[research-project]]

Your task is to update an existing workflow based on {request}. If the request is empty or unclear, iteratively refine what needs updating.

<process>
1. Analyze the workflow update request
2. If unclear, ask ONE question to clarify what to update
3. Read current workflow and [[workflow-template]]
4. Update while preserving template structure
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔧 What aspect of the workflow needs updating?
    A. Process steps (add/remove/reorder steps)
    B. Configuration (orchestrator, agents, outputs)
</example>

<constraints>
- ALWAYS read current workflow before updating
- ALWAYS preserve [[workflow-template]] structure
- ALWAYS maintain single orchestrator pattern
- NEVER complicate the workflow unnecessarily
- ONLY update requested aspects
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking which workflow and what aspect to update.

---
role: [[workflow-specialist]]
