---
document_type: protocol
goal: test implementation live with user
gpt_action: follow these steps when testing implementations live
---

CONTEXT: The [[User]] needs to test the current implementation live to verify it works as expected.

1. GIVEN [[You]] HAS implementation to test
   1. THEN [[You]] PREPARE test command
      1. AND [[You]] ENSURE command tests current work
      2. AND [[You]] ENSURE command runs implementation live
   2. IF command UNCLEAR
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

2. GIVEN [[You]] HAS test command
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] EXPLAIN what to expect
      2. AND [[You]] EXPLAIN how to test
   2. IF [[User]] ACCEPTS command
      1. THEN [[You]] RUN command
      2. AND [[You]] WAIT for result
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] ADJUST command
      2. AND [[You]] REPEAT step 2

3. WHEN [[User]] RUNS test
   1. THEN [[You]] OBSERVE result
      1. AND [[You]] CHECK expected behavior
      2. AND [[You]] NOTE any issues
   2. IF test FAILS
      1. THEN [[You]] DOCUMENT failure
      2. AND [[You]] SUGGEST fixes
   3. IF test SUCCEEDS
      1. THEN [[You]] CONFIRM completion 
