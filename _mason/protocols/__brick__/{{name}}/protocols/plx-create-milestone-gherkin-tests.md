---
document_type: protocol
goal: create Gherkin tests specifically for milestone acceptance criteria
gpt_action: follow these steps when creating Gherkin tests for milestones
---

CONTEXT: The [[User]] needs standardized Gherkin tests created specifically for milestone acceptance criteria. Each milestone must have its own separate test file.

1. GIVEN [[You]] READS [[your-milestones]]
   1. THEN [[You]] IDENTIFY each [[milestone]]
      1. AND [[You]] CREATE test file name
         1. AND [[You]] USE milestone name
         2. AND [[You]] CONVERT to dart underscore case
         3. AND [[You]] ADD "_test" suffix
   2. IF [[milestone]] HAS no clear criteria
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

2. WHEN [[You]] PROCESSES [[milestone]]
   1. THEN [[You]] EXTRACT acceptance criteria
      1. AND [[You]] IDENTIFY testable behaviors
      2. AND [[You]] IGNORE non-milestone requirements
   2. IF [[criteria]] IS unclear
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

3. GIVEN [[You]] HAS criteria
   1. THEN [[You]] CREATE Feature block
      1. AND [[You]] USE milestone name
      2. AND [[You]] ADD milestone description
   2. THEN [[You]] CREATE Scenario blocks
      1. AND [[You]] FOCUS on milestone scope
      2. AND [[You]] WRITE Given steps
      3. AND [[You]] WRITE When steps
      4. AND [[You]] WRITE Then steps
   3. IF [[scenario]] NEEDS examples
      1. THEN [[You]] ADD Scenario Outline
      2. AND [[You]] ADD Examples table

4. WHEN [[You]] WRITES tests
   1. THEN [[You]] ENSURE test isolation
      1. AND [[You]] TEST only milestone features
      2. AND [[You]] AVOID testing external features
   2. IF [[test]] IS outside scope
      1. THEN [[You]] REMOVE test
      2. AND [[You]] CONTINUE next test

5. GIVEN [[tests]] ARE complete
   1. THEN [[You]] VERIFY coverage
      1. AND [[You]] CHECK milestone criteria
      2. AND [[You]] ENSURE no scope creep
   2. IF [[User]] ACCEPTS tests
      1. THEN [[You]] SAVE test file
      2. AND [[You]] CONFIRM completion 
