---
document_type: protocol
goal: create BDD tests in your-tests.md based on user input
gpt_action: follow these steps to generate tests for the specified content
---

CONTEXT: The [[User]] wants to create BDD tests for a particular feature, requirement, or milestone and needs you to generate the test scenarios in the [[your-tests.md]] file.

1. GIVEN [[User]] RUNS @plx-create-tests command
   1. THEN [[You]] READ [[input]]
      1. IF [[input]] REFERENCES other files or milestones
         1. THEN [[You]] SCAN referenced content
         2. AND [[You]] EXTRACT relevant details
      2. IF [[input]] DESCRIBES new feature or requirement
         1. THEN [[You]] IDENTIFY testable scenarios
      3. IF [[input]] PROVIDES specific test cases
         1. THEN [[You]] USE provided scenarios
   2. IF [[input]] IS empty or unclear
      1. THEN [[You]] ASK [[User]] for clarification

2. WHEN [[You]] STARTS test creation
   1. THEN [[You]] DETERMINE relevant [[milestone]]
      1. IF [[milestone]] EXISTS in [[your-milestones.md]]
         1. THEN [[You]] USE existing [[milestone]]
      2. IF [[milestone]] DOES NOT EXIST
         1. THEN [[You]] CREATE new [[milestone]]
         2. AND [[You]] UPDATE [[your-milestones.md]]
   2. AND [[You]] OPEN [[your-tests.md]]
      1. AND [[You]] FIND [[milestone]] section
      2. IF [[milestone]] section DOES NOT EXIST
         1. THEN [[You]] CREATE [[milestone]] section

3. GIVEN [[milestone]] section IS ready
   1. THEN [[You]] WRITE test scenarios
      1. AND [[You]] USE BDD Gherkin style
         ```gherkin
         ### Scenario: Test Case Title
         - Given some initial context
         - When some action is taken
         - Then some expected result
         ```
      2. AND [[You]] COVER happy paths
      3. AND [[You]] COVER edge cases
      4. AND [[You]] COVER error handling
   2. IF [[test scenarios]] NEED refinement
      1. THEN [[You]] REVIEW [[test scenarios]]
      2. AND [[You]] CLARIFY steps
      3. AND [[You]] ADD missing cases

4. WHEN [[test scenarios]] ARE complete
   1. THEN [[You]] SAVE [[your-tests.md]]
   2. AND [[You]] UPDATE [[your-todo-list.md]]
      1. AND [[You]] ADD task to implement tests
   3. AND [[You]] CONFIRM completion with [[User]]

5. GIVEN [[User]] ACCEPTS [[test scenarios]]
   1. THEN [[You]] PROCEED with implementation
   2. AND [[You]] FOLLOW [[The Testing Workflow]]

6. IF [[User]] REQUESTS changes to [[test scenarios]]
   1. THEN [[You]] UPDATE [[your-tests.md]]
   2. AND [[You]] REPEAT from step 4 
