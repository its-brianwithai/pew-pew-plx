---
document_type: protocol
goal: create Gherkin tests specifically for milestone acceptance criteria
gpt_action: follow these steps when creating Gherkin tests for milestones
---

CONTEXT: The [[User]] needs standardized Gherkin tests created specifically for milestone acceptance criteria. Each milestone must have its own separate test file.

1. GIVEN [[GPT Agent]] READS [[your-milestones]]
   1. THEN [[GPT Agent]] IDENTIFY each [[milestone]]
      1. AND [[GPT Agent]] CREATE test file name
         1. AND [[GPT Agent]] USE milestone name
         2. AND [[GPT Agent]] CONVERT to dart underscore case
         3. AND [[GPT Agent]] ADD "_test" suffix
   2. IF [[milestone]] HAS no clear criteria
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] PROCESSES [[milestone]]
   1. THEN [[GPT Agent]] EXTRACT acceptance criteria
      1. AND [[GPT Agent]] IDENTIFY testable behaviors
      2. AND [[GPT Agent]] IGNORE non-milestone requirements
   2. IF [[criteria]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

3. GIVEN [[GPT Agent]] HAS criteria
   1. THEN [[GPT Agent]] CREATE Feature block
      1. AND [[GPT Agent]] USE milestone name
      2. AND [[GPT Agent]] ADD milestone description
   2. THEN [[GPT Agent]] CREATE Scenario blocks
      1. AND [[GPT Agent]] FOCUS on milestone scope
      2. AND [[GPT Agent]] WRITE Given steps
      3. AND [[GPT Agent]] WRITE When steps
      4. AND [[GPT Agent]] WRITE Then steps
   3. IF [[scenario]] NEEDS examples
      1. THEN [[GPT Agent]] ADD Scenario Outline
      2. AND [[GPT Agent]] ADD Examples table

4. WHEN [[GPT Agent]] WRITES tests
   1. THEN [[GPT Agent]] ENSURE test isolation
      1. AND [[GPT Agent]] TEST only milestone features
      2. AND [[GPT Agent]] AVOID testing external features
   2. IF [[test]] IS outside scope
      1. THEN [[GPT Agent]] REMOVE test
      2. AND [[GPT Agent]] CONTINUE next test

5. GIVEN [[tests]] ARE complete
   1. THEN [[GPT Agent]] VERIFY coverage
      1. AND [[GPT Agent]] CHECK milestone criteria
      2. AND [[GPT Agent]] ENSURE no scope creep
   2. IF [[User]] ACCEPTS tests
      1. THEN [[GPT Agent]] SAVE test file
      2. AND [[GPT Agent]] CONFIRM completion 