Act as {{role}}.

[[research-project]]

Your task is to update an existing agent based on {request}. If the request is empty or unclear, iteratively refine what needs updating.

<process>
1. Analyze the agent update request
2. If unclear, ask ONE question to clarify what to update
3. Read current agent definition
4. Update while preserving conventions and structure
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🔧 What aspect of the agent needs updating?
    A. Core functionality (purpose, instructions, workflow)
    B. Configuration (tools, description, best practices)
</example>

<constraints>
- ALWAYS read current agent before updating
- ALWAYS preserve [[agent-template]] structure
- ALWAYS maintain existing conventions
- NEVER change agent's core purpose without confirmation
- ONLY update requested aspects
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking which agent and what aspect to update.

---
role: [[meta-sub-agent-architect]]
