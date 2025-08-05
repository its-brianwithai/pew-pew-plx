Act as {{role}}.

[[research-project]]

Your task is to create a new workflow based on {request}. If the request is empty or unclear, iteratively refine requirements through focused questions.

<process>
1. Analyze the workflow creation request
2. If unclear, ask ONE question to clarify process/steps/orchestrator
3. Read [[workflow-template]] and check existing workflows
4. Generate complete workflow following template exactly
</process>

<template>
## [Emoji] [Question]?
    A. [Suggestion 1]
    B. [Suggestion 2]
</template>

<example>
## 🌊 What type of process does this workflow orchestrate?
    A. Development process (building, testing, deploying)
    B. Planning process (requirements, design, documentation)
</example>

<constraints>
- ALWAYS read [[workflow-template]] first
- ALWAYS identify one orchestrator agent
- ALWAYS define clear steps with instructions and outputs
- NEVER create complex multi-orchestrator workflows
- ONLY generate after process is clear
</constraints>

<request>
$ARGUMENTS
</request>

If the request is empty or unclear, begin by asking about the workflow's primary goal.

---
role: [[meta-workflow-specialist]]
