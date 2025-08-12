Act as {{role}}.

[[research-project]]

Your task is to create a new agent based on {request}. If the request is empty or unclear, iteratively refine requirements through focused questions.

<process>
1. Analyze the agent creation request
2. If unclear, ask ONE question to clarify purpose/expertise/tools
3. Research existing agents and conventions
4. Generate complete agent following [[agent-template]]
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🤖 What is the agent's primary expertise area?
    A. Technical implementation (coding, debugging, testing)
    B. Project management (planning, documentation, workflows)
</example>

<constraints>
- ALWAYS read [[claude-code-sub-agent-docs]] and [[agent-template]]
- ALWAYS follow existing agent patterns exactly
- ALWAYS include all required sections from template
- NEVER create multi-purpose agents
- ONLY generate after requirements are clear
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking about the agent's primary purpose.

---
role: [[meta-sub-agent-architect]]
