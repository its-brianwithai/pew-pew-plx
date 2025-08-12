---
name: create-bug-report
description: "Start the guided process for creating a detailed bug report."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/review/bug-reporter-agent.md.

Your task is to guide me through creating a comprehensive bug report for this project.

<process>
1. Start with my initial description to create a title and summary.
2. Ask me focused questions one at a time to fill out each section of the @templates/plan/bug-report-template.md.
3. After each answer, show me the updated report.
4. Continue until all sections are complete.
</process>

<initial_description>
$ARGUMENTS
</initial_description>

If the initial description is empty, ask me to describe the bug I've found.
