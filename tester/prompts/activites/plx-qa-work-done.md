Please perform an extensive code review based on my {focus_points} and {user_requests} to the best of your ability based on your system instructions, project conventions and known best practices.

## Starting Point

- Run linting command for project and fix issues related to work done.

## Code Quality

```yaml
focus_points:
  - There is logging in places where it makes sense to have logging for debugging purposes.
  - There is sensible documentation added on class, method and variable level.
  - There is proper user feedback where a UI/UX expert would expect feedback given to the user in the form toasts, notifications or dialogs, feedback is always handled 1 step before the UI layer - most likely a view model.
  - There are timeouts, debouncer, throttlers and/or isolates in place where it makes sense to do so to improve UX, performance and/or scalability.
  - Any user facing strings are properly translated per localization standards of this project (if applicable).
  - Hard coded strings should always either be a constant, an extension method of an enum or translated for user feedback. The only time hard coded strings are allowed is when it’s for debugging purposes.
  - Try catch clauses (only) exist in the places where catching the error makes sense.
  - Classes and methods are kept sensibly small and follow the 1 responsibility principle as much as practically possible.
  - Methods and variables have sensible naming following project conventions.
  - The code is practically optimized for performance and security where an experienced senior software developer would deem it necessary to do so.
  - The code is free of unused variables and methods.
  - Methods are private when they are only used inside the class.
  - Disposable resources are disposed where they should be.
  - Classes contain and are organised per {class_structure}.
  - {project_documents} are free of invalid information and updated with latest information.

class_structure:
    // 📍 LOCATOR ------------------------------------------------------------------------------- \\
    // 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
    // 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
    // 👂 LISTENERS ----------------------------------------------------------------------------- \\
    // ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
    // 🎩 STATE --------------------------------------------------------------------------------- \\
    // 🛠 UTIL ---------------------------------------------------------------------------------- \\
    // 🧲 FETCHERS ------------------------------------------------------------------------------ \\
    // 🏗️ HELPERS ------------------------------------------------------------------------------- \\
    // 🪄 MUTATORS ------------------------------------------------------------------------------ \\

project_documents:
  - README.md
  - docs/

user_requests:
  - Always follow best practices and project conventions when judging {focus_points}.
  - Fix all the issues you find in the code review.
```

## Test Preparations

1   **Method Granularity and Single Responsibility Principle (SRP):**
*   Refactor methods to strictly adhere to SRP. Each method should have one clear responsibility.
*   Break down complex methods into smaller, more granular units. This improves clarity and allows for more focused unit tests with minimal side effects.
*   Ensure that the new methods are named clearly to reflect their purpose. Create flutter getters when no parameters are needed. Refrain from putting `get` in the name.
    2   **Enhancing Testability via Return Values:**
*   Where it makes sense and does *not* alter core logic or introduce unnecessary complexity, modify methods to return values that can be directly asserted in tests.
    3   **Visibility for Testing (`@visibleForTesting`):**
*   If private methods (e.g., `_privateMethod`) contain logic that is essential to test independently, make them public (e.g., `publicMethod`) and add the `@visibleForTesting` annotation. Use this judiciously.
    4   **Logging:**
*   **Logging:** Integrate sensible logging statements (e.g., method entry/exit, key decisions, error handling).
    5   **General Testability Improvements:**
*   Apply other refactoring techniques beneficial for testability, such as:
*   Extracting pure functions.
*   Reducing reliance on mutable state or global variables.
*   Consider passing an optional nullable parameter to the method allowing the caller to override a global variable where sensible to do so (optionalVar ?? globalVar).
*   Clarifying method signatures and interfaces.

Remember:
- DO NOT ADD CLASSES THROUGH THE CONSTRUCTOR. WE USE DEPENDENCY INJECTION.
- MAKE ANY PRIVATE METHODS (_method()) THAT YOU WANT TO TEST, PUBLIC (method()) WHEN YOU ADD @visibleForTesting
- DO NOT MAKE PRIVATE METHODS PUBLIC IF THEY ARE NOT TO BE TESTED
- DO NOT START THE METHOD WITH AN UNDERSCORE IF @visibleForTesting IS ABOVE IT - THIS MEANS YOU ALSO HAVE TO CHANGE THE PLACES WHERE IT IS CALLED.
- DO NOT REMOVE EXISTIdevNG DART DOC COMMENTS IF THEY MAKE SENSE
- DO NOT AWAIT METHODS THAT THROTTLE, DEBOUNCE OR SIMILAR
- DO NOT MAKE DEPENDENCIES PUBLIC - WE CAN LOCATE THEM WITH GET_IT IN THE TESTS

## Test Quality

- Review the provided tests thoroughly. Apply the following checklist to ensure the tests meet all quality standards and project requirements:
- High Quality: Confirm that all tests are robust, reliable, and maintainable.
- Guideline Adherence: Verify that all tests strictly follow the project's established coding and testing guidelines and best practices.
- Consistency: Ensure the tests are consistent in style, structure, and conventions with other existing tests in the project.
- Relevance: Check that tests focus exclusively on the functionalities and code paths relevant to the intended scope. Confirm they do not test unrelated features.
- Scope Adherence: Verify that tests do not cover any functionality that was not explicitly requested or intended for testing.
- No Empty Tests: DEFINITELY ensure there are no empty test methods or test suites. Every test must contain meaningful assertions.
- No Skipped/Commented Tests: DEFINITELY ensure no tests are skipped (e.g., via skip annotations) or commented out due to unresolved issues. All tests must be active and executable.
- No Workarounds: DEFINITELY ensure there are no workarounds implemented within the test code to bypass issues in the code under test or the testing environment. Tests must accurately reflect the system's state.
- No TODOs: DEFINITELY ensure no "TODO", "FIXME", or similar markers indicating unresolved tasks are left in the test code.
- No Shallow Mimicking Classes: NEVER approve tests that create new classes solely to mimic the interface of a real class if such mimics do not provide meaningful test behavior or facilitate genuine interaction verification. Tests should use appropriate and robust mocking, stubbing, or faking techniques to genuinely isolate the unit under test and enable thorough verification.
