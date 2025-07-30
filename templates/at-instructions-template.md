---
name: at-instructions-template
description: Use this when you need to document AI-executable acceptance tests for Flutter applications using Dart MCP and iOS Simulator MCP servers. This template structures end-to-end integration tests that AI agents can run autonomously.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🤖 AI Acceptance Test Plan: [Feature Name]

> 💡 *Comprehensive test plan for AI agents to autonomously validate Flutter app features through iOS Simulator using MCP tools. This document enables end-to-end testing without human intervention.*

[Brief description of the feature being tested and its critical user flows]

## 📋 Test Metadata

> 💡 *Essential information about the test plan including dependencies, data requirements, and testing scope.*

- **Feature**: [Name of the feature or module]
- **Date Created**: [YYYY-MM-DD]
- **Related Story**: [[story-name]] 
- **Related Components**: [[component-1]], [[component-2]]
- **Prerequisites**: 
  - Flutter app running in iOS Simulator
  - DTD URI available (obtain via "Copy DTD URI to clipboard" action)
  - Test data prepared in [specify location/format]
  - [Any other prerequisites]

## 🎯 Test Objectives

> 💡 *Clear definition of what these tests aim to validate and the acceptance criteria they verify.*

[List the main objectives this test plan addresses, e.g.:]
- Verify [primary user flow] works end-to-end
- Validate error handling for [specific scenarios]
- Ensure data persistence across [operations]
- Confirm UI feedback for all user actions

## 🧪 Test Scenarios

> 💡 *Detailed test scenarios using Gherkin format with step-by-step instructions and MCP tool specifications. Each scenario should be self-contained and repeatable.*

### Scenario 1: [Happy Path - Descriptive Name]

**Given** [initial state/precondition]

| Step | Action                  | MCP Tool                               | Expected Result                    |
|------|-------------------------|----------------------------------------|------------------------------------|
| 1.1  | Connect to Flutter app  | `connect_dart_tooling_daemon` with URI | Connection established             |
| 1.2  | Verify current screen   | `ui_describe_all`                      | [Expected screen] elements visible |
| 1.3  | [Additional setup step] | [Tool]                                 | [Expected outcome]                 |

**When** [user action or trigger]

| Step | Action              | MCP Tool                                      | Expected Result     |
|------|---------------------|-----------------------------------------------|---------------------|
| 2.1  | [Specific action]   | `ui_tap` on element with text "[Button Text]" | [Expected response] |
| 2.2  | Wait for transition | Wait 500ms                                    | Animation complete  |
| 2.3  | [Follow-up action]  | [Appropriate tool]                            | [Expected state]    |

**Then** [expected outcome]

| Step | Action                  | MCP Tool             | Expected Result          |
|------|-------------------------|----------------------|--------------------------|
| 3.1  | Verify final state      | `ui_describe_all`    | [List expected elements] |
| 3.2  | Check for errors        | `get_runtime_errors` | No runtime errors        |
| 3.3  | [Specific verification] | [Tool]               | [Expected validation]    |

### Scenario 2: [Edge Case - Descriptive Name]

**Given** [edge case setup]

| Step | Action                      | MCP Tool | Expected Result  |
|------|-----------------------------|----------|------------------|
| 1.1  | [Setup steps for edge case] | [Tools]  | [Expected state] |

**When** [edge case trigger]

| Step | Action             | MCP Tool | Expected Result     |
|------|--------------------|----------|---------------------|
| 2.1  | [Edge case action] | [Tool]   | [Expected behavior] |

**Then** [edge case handling]

| Step | Action               | MCP Tool | Expected Result     |
|------|----------------------|----------|---------------------|
| 3.1  | [Verification steps] | [Tools]  | [Expected handling] |

### Scenario 3: [Error Path - Descriptive Name]

**Given** [error condition setup]

| Step | Action                   | MCP Tool | Expected Result             |
|------|--------------------------|----------|-----------------------------|
| 1.1  | [Create error condition] | [Tools]  | Error condition established |

**When** [action that triggers error]

| Step | Action                 | MCP Tool | Expected Result  |
|------|------------------------|----------|------------------|
| 2.1  | [Trigger error action] | [Tool]   | Action attempted |

**Then** [proper error handling]

| Step | Action                  | MCP Tool             | Expected Result                              |
|------|-------------------------|----------------------|----------------------------------------------|
| 3.1  | Check error state       | `get_runtime_errors` | [Expected error] captured                    |
| 3.2  | Verify user feedback    | `ui_describe_all`    | Error message "[Expected message]" displayed |
| 3.3  | [Recovery verification] | [Tool]               | [Expected recovery state]                    |

## 🚨 Error Handling & Recovery

> 💡 *Structured approach for handling test failures, capturing diagnostics, and attempting recovery before marking tests as failed.*

### On Test Failure

1. **Capture Diagnostics**

   | Tool                 | Purpose               | Output                                         |
   |----------------------|-----------------------|------------------------------------------------|
   | `screenshot`         | Visual state capture  | Save to test_results/[feature]_[timestamp].png |
   | `get_runtime_errors` | Capture error details | Log all runtime errors with stack traces       |
   | `get_widget_tree`    | UI hierarchy snapshot | Save complete widget structure                 |
   | `ui_describe_all`    | Current screen state  | Log all visible elements and their properties  |

2. **Attempt Recovery**

   | Condition                    | Recovery Action                                                  | Success Criteria                          |
   |------------------------------|------------------------------------------------------------------|-------------------------------------------|
   | Element not found            | Wait 1s, retry with `ui_describe_all`                            | Element becomes visible within 3 attempts |
   | Navigation stuck             | `hot_reload`, wait 2s                                            | Expected screen loads                     |
   | Runtime error                | Clear errors with `get_runtime_errors(clear=true)`, `hot_reload` | No errors after reload                    |
   | Unexpected state             | Navigate to home via [specific navigation], restart flow         | Back at known starting state              |
   | [Feature-specific condition] | [Feature-specific recovery]                                      | [Feature-specific success]                |

3. **Failure Criteria**
   - Recovery attempted 3 times without success
   - Critical runtime error that persists after reload
   - App crash or simulator freeze detected
   - Test timeout exceeded (5 minutes per scenario)
   - [Feature-specific failure conditions]

## 🧹 Test Cleanup

> 💡 *Steps to ensure the test environment is reset after each test run, maintaining test independence.*

| Step | Action                     | MCP Tool                                | Purpose                     |
|------|----------------------------|-----------------------------------------|-----------------------------|
| 1    | [Reset app state]          | [Tools needed]                          | Clear test data             |
| 2    | [Navigate to home]         | [Navigation tools]                      | Return to known state       |
| 3    | [Clear any test artifacts] | [Tools]                                 | Remove test-created data    |
| 4    | Verify clean state         | `ui_describe_all`, `get_runtime_errors` | Confirm ready for next test |

## 📝 Notes for AI Agent

> 💡 *Important guidance and tips for the AI agent executing these tests to handle common scenarios and edge cases.*

### Element Selection Strategy
- Primary: Look for elements by exact text match
- Secondary: Use accessibility labels or identifiers
- Fallback: Use `ui_describe_all` to find elements by partial text or position
- For dynamic content: Allow up to 3 seconds for elements to appear

### Timing Considerations
- Allow 300-500ms between UI interactions for animations
- After each `hot_reload`, wait 1-2 seconds before proceeding
- For network operations, implement appropriate timeouts
- [Feature-specific timing requirements]

### Data Handling
- Test data location: [Specify where/how test data is stored]
- User credentials: [Specify test account details or reference]
- Expected test outputs: [Where test results should be logged]

### Known Issues & Workarounds
- [List any known issues with the feature or test environment]
- [Provide specific workarounds if available]

## ✅ Test Completion Criteria

> 💡 *Clear definition of when the test suite is considered complete and what constitutes a passing test run.*

The test suite is considered complete when:
- [ ] All scenarios execute without unrecoverable failures
- [ ] No critical runtime errors remain unhandled
- [ ] All expected UI states are verified
- [ ] Error scenarios properly display user feedback
- [ ] Test cleanup successfully resets the environment
- [ ] [Additional feature-specific criteria]
