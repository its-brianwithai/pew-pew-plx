# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}. Please create a comprehensive, AI-executable e2e test plan for the following feature: {feature_description}.

This plan must be designed for the [[flutter-e2e-test-executor-agent]] to run autonomously.

Your process should be:
1.  Thoroughly analyze the feature description.
2.  Research any past learnings from `logs/e2e-tests/` that might be relevant.
3.  Use the [[e2e-test-instructions-template]] as the blueprint for the test plan.
4.  Define clear, step-by-step scenarios in Gherkin format, including specific MCP tool commands for UI interactions and backend validation (Supabase/Firebase).
5.  Include comprehensive error handling, recovery, and cleanup steps.
6.  Save the final test plan to `issues/tests/e2e-test-{feature_name_kebab_case}.md`.

@prompts/research-project.md

<feature_description>
<commentary>
If this is empty, ask me what feature the e2e test should be created for. Do not assume the subject unless I tell you explicitly.
</commentary>
$ARGUMENTS
</feature_description>

---
role: [[flutter-e2e-test-planner-agent]]
