# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}. Please execute the e2e test plan located at: {test_plan_path}.

Your process should be:
1.  Read and fully understand the provided test plan.
2.  Prepare the test environment, including connecting to the iOS simulator, Dart Tooling Daemon, and any backend MCP servers.
3.  Execute all scenarios in the test plan, step-by-step.
4.  Apply intelligent error handling and recovery strategies as needed.
5.  Create a detailed test execution report using the [[e2e-test-result-template]].
6.  Save the final report to `releases/{version}/[test-plan-name]-result.md`.
7.  Persist any new learnings to `logs/e2e-tests/`.

@prompts/research-project.md

<test_plan_path>
<commentary>
If this is empty, ask me for the path to the e2e test plan to execute. You can also search for available test plans in `issues/tests/`.
</commentary>
$ARGUMENTS
</test_plan_path>

---
role: [[flutter-e2e-test-executor-agent]]
