---
name: update-bug-report
description: "Start the guided process for updating an existing bug report."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/review/bug-reporter-agent.md.

Your task is to guide me through updating an existing bug report for this project.

<process>
1. Read the existing bug report at the path I provide.
2. Ask me focused questions one at a time to update or fill out sections of the @templates/plan/bug-report-template.md.
3. After each answer, show me the updated report.
4. Continue until all desired sections are updated.
5. Save the changes to the original file.
</process>

<bug_report_path>
$ARGUMENTS
</bug_report_path>

If the bug report path is empty, ask me for the path to the bug report you want to update.
