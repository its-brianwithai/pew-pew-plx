# Flutter E2E Testing Workflow

This document outlines the workflow for creating, executing, and learning from AI-driven e2e tests for Flutter applications.

## 1. Plan & Execute E2E Tests
- **Agent**: [[flutter-test-agent]]
- **Input**: Feature requirements, user stories, or a PRD.
- **Process**: The test agent analyzes the requirements. If a test plan doesn't exist, it creates one based on the [[e2e-test-instructions-template]]. It then autonomously runs the test plan, interacting with the iOS Simulator, the Flutter app's Dart Tooling Daemon, and the Supabase/Firebase backend via MCP servers. It records all steps, captures diagnostics on failure, and attempts recovery.
- **Output**: A detailed test plan (if created) and a detailed test result document, based on the [[e2e-test-result-template]].

## 2. Review Test Results
- **Role**: Developer / QA Engineer
- **Input**: The test result document.
- **Process**: Review the pass/fail status of scenarios. Analyze failures, diagnostics, and performance metrics.
- **Output**: Actionable items for developers (bug fixes, performance improvements) and test engineers (test plan improvements).

## 3. Persist Learnings
- **Agent**: [[flutter-test-agent]]
- **Input**: Test execution results and analysis.
- **Process**: The test agent identifies patterns, successful strategies, and new flaky areas. It documents these insights.
- **Output**: A learning log stored in `logs/e2e-tests/`. This log is used by the agent in future runs to improve reliability and efficiency.