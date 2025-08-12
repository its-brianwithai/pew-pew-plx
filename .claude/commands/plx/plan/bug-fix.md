---
name: plan-bug-fix
description: "Create a detailed technical implementation plan to fix a bug."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as @.claude/agents/bug-fix-planner-agent.md.

Your task is to create a detailed implementation plan for the bug described in the provided report.

<process>
1.  Thoroughly analyze the bug report, especially the triage notes.
2.  Investigate the codebase to confirm the root cause and plan the fix.
3.  Create a new implementation plan document using the @.claude/commands/use/implementation-plan-template.md.
4.  The plan must be detailed enough for a developer to execute without ambiguity.
</process>

<bug_report_path>
$ARGUMENTS
</bug_report_path>

If the bug report path is empty, ask me for the path to the bug report file.
