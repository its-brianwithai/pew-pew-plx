Review the provided tests thoroughly. Apply the following checklist to ensure the tests meet all quality standards and project requirements:
High Quality: Confirm that all tests are robust, reliable, and maintainable.
Guideline Adherence: Verify that all tests strictly follow the project's established coding and testing guidelines and best practices.
Consistency: Ensure the tests are consistent in style, structure, and conventions with other existing tests in the project.
Relevance: Check that tests focus exclusively on the functionalities and code paths relevant to the intended scope. Confirm they do not test unrelated features.
Scope Adherence: Verify that tests do not cover any functionality that was not explicitly requested or intended for testing.
No Empty Tests: DEFINITELY ensure there are no empty test methods or test suites. Every test must contain meaningful assertions.
No Skipped/Commented Tests: DEFINITELY ensure no tests are skipped (e.g., via skip annotations) or commented out due to unresolved issues. All tests must be active and executable.
No Workarounds: DEFINITELY ensure there are no workarounds implemented within the test code to bypass issues in the code under test or the testing environment. Tests must accurately reflect the system's state.
No TODOs: DEFINITELY ensure no "TODO", "FIXME", or similar markers indicating unresolved tasks are left in the test code.
No Shallow Mimicking Classes: NEVER approve tests that create new classes solely to mimic the interface of a real class if such mimics do not provide meaningful test behavior or facilitate genuine interaction verification. Tests should use appropriate and robust mocking, stubbing, or faking techniques to genuinely isolate the unit under test and enable thorough verification.
