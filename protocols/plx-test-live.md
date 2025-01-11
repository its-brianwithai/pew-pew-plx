---
document_type: protocol
goal: test implementation live with user
gpt_action: follow these steps when testing implementations live
---

CONTEXT: The [[User]] needs to test the current implementation live to verify it works as expected.

1. GIVEN [[GPT Agent]] HAS implementation to test
   1. THEN [[GPT Agent]] PREPARE test command
      1. AND [[GPT Agent]] ENSURE command tests current work
      2. AND [[GPT Agent]] ENSURE command runs implementation live
   2. IF command UNCLEAR
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. GIVEN [[GPT Agent]] HAS test command
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] EXPLAIN what to expect
      2. AND [[GPT Agent]] EXPLAIN how to test
   2. IF [[User]] ACCEPTS command
      1. THEN [[GPT Agent]] RUN command
      2. AND [[GPT Agent]] WAIT for result
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] ADJUST command
      2. AND [[GPT Agent]] REPEAT step 2

3. WHEN [[User]] RUNS test
   1. THEN [[GPT Agent]] OBSERVE result
      1. AND [[GPT Agent]] CHECK expected behavior
      2. AND [[GPT Agent]] NOTE any issues
   2. IF test FAILS
      1. THEN [[GPT Agent]] DOCUMENT failure
      2. AND [[GPT Agent]] SUGGEST fixes
   3. IF test SUCCEEDS
      1. THEN [[GPT Agent]] CONFIRM completion 