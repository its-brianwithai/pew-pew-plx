---
name: triage-bug-report
description: "Analyze a bug report, determine priority, and perform root cause analysis."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/review/bug-triage-agent.md.

Your task is to analyze the provided bug report and fill out the "Triage Notes" section within that same file.

<process>
1.  Read the bug report to understand the issue.
2.  Analyze the codebase to perform a root cause analysis.
3.  Determine the priority and severity of the bug.
4.  Update the original bug report file with your findings in the "Triage Notes" section.
</process>

<bug_report_path>
$ARGUMENTS
</bug_report_path>

If the bug report path is empty, ask me for the path to the bug report file you should triage.
