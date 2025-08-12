---
name: verify-bug-fix
description: "Create and execute a test plan to verify a bug fix."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @agents/review/bug-verifier-agent.md.

Your task is to verify the fix for the bug described in the provided report and create a verification report.

<process>
1.  Review the bug report and the implementation plan.
2.  Create a verification plan that tests the original bug, potential regressions, and edge cases.
3.  Execute the plan.
4.  Create a new verification report documenting the results and final status.
</process>

<context>
You will be provided with the path to the bug report. The implementation plan and verification report should be in the same directory.
</context>

<bug_report_path>
$ARGUMENTS
</bug_report_path>

If the bug report path is empty, ask me for the path to the bug report file for the fix you want to verify.
