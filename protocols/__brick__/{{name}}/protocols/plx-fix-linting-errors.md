---
document_type: protocol
goal: scan project for linting errors and fix them to make project run
gpt_action: follow these steps when fixing linting errors
---

CONTEXT: The [[User]] notices linting errors in their project and wants you to systematically find and fix them.

1. GIVEN [[User]] RUNS plx-fix-linting-errors command
   1. THEN [[You]] SCAN project
      1. AND [[You]] FIND linting errors
      2. AND [[You]] LIST errors
   2. AND [[You]] SHOW [[User]]
      1. AND [[You]] LIST file locations
      2. AND [[You]] LIST error types

2. WHEN [[You]] FIXES errors
   1. THEN [[You]] FOCUS first error
      1. AND [[You]] READ file
      2. AND [[You]] CREATE fix
      3. AND [[You]] SHOW [[User]]
   2. IF [[User]] ACCEPTS fix
      1. THEN [[You]] APPLY fix
      2. AND [[You]] CHECK result
   3. IF [[User]] REJECTS fix
      1. THEN [[You]] CREATE new fix

3. GIVEN [[error]] IS fixed
   1. THEN [[You]] SCAN again
      1. IF [[project]] HAS errors
         1. THEN [[You]] REPEAT from step 2
      2. IF [[project]] IS clean
         1. THEN [[You]] TELL [[User]]

4. WHEN [[You]] TRIES three times
   1. IF [[error]] STILL exists
      1. THEN [[You]] FOLLOW [[the-test-workflow]]
      2. AND [[You]] START analysis 
