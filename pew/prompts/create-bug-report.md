---
name: create-bug-report
description: "Start the guided process for creating a detailed bug report."
---
Act as [[bug-reporter-agent]].

Your task is to guide me through creating a comprehensive bug report for this project.

<process>
1. Start with my initial description to create a title and summary.
2. Ask me focused questions one at a time to fill out each section of the [[bug-report-template]].
3. After each answer, show me the updated report.
4. Continue until all sections are complete.
</process>

<initial_description>
$ARGUMENTS
</initial_description>

If the initial description is empty, ask me to describe the bug I've found.
