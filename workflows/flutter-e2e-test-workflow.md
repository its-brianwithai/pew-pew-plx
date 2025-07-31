# Flutter E2E Testing Workflow

This document outlines the workflow for creating, executing, and learning from AI-driven e2e tests for Flutter applications.

## 1. Plan E2E Tests
- **Agent**: [[flutter-e2e-test-planner-agent]]
- **Input**: Feature requirements, user stories, or a PRD.
- **Process**: The planner agent analyzes the requirements and creates a comprehensive e2e test plan. This plan includes UI interactions, backend validations (using Supabase/Firebase MCP servers), and error handling scenarios.
- **Output**: A detailed e2e test plan document, based on the [[e2e-test-instructions-template]].

## 2. Execute E2E Tests
- **Agent**: [[flutter-e2e-test-executor-agent]]
- **Input**: An e2e test plan.
- **Process**: The executor agent autonomously runs the test plan. It interacts with the iOS Simulator, the Flutter app's Dart Tooling Daemon, and the Supabase/Firebase backend via MCP servers. It records all steps, captures diagnostics on failure, and attempts recovery.
- **Output**: A detailed test result document, based on the [[e2e-test-result-template]].

## 3. Review Test Results
- **Role**: Developer / QA Engineer
- **Input**: The test result document.
- **Process**: Review the pass/fail status of scenarios. Analyze failures, diagnostics, and performance metrics.
- **Output**: Actionable items for developers (bug fixes, performance improvements) and test engineers (test plan improvements).

## 4. Persist Learnings
- **Agent**: [[flutter-e2e-test-executor-agent]]
- **Input**: Test execution results and analysis.
- **Process**: The executor agent identifies patterns, successful strategies, and new flaky areas. It documents these insights.
- **Output**: A learning log stored in `logs/e2e-tests/`. This log is used by the planner and executor in future runs to improve reliability and efficiency.