---
document_type: protocol
goal: scan project for linting errors and fix them to make project run
gpt_action: follow these steps when fixing linting errors
---

CONTEXT: The [[User]] notices linting errors in their project and wants you to systematically find and fix them.

1. GIVEN [[User]] RUNS plx-fix-linting-errors command
   1. THEN [[GPT Agent]] SCAN project
      1. AND [[GPT Agent]] FIND linting errors
      2. AND [[GPT Agent]] LIST errors
   2. AND [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] LIST file locations
      2. AND [[GPT Agent]] LIST error types

2. WHEN [[GPT Agent]] FIXES errors
   1. THEN [[GPT Agent]] FOCUS first error
      1. AND [[GPT Agent]] READ file
      2. AND [[GPT Agent]] CREATE fix
      3. AND [[GPT Agent]] SHOW [[User]]
   2. IF [[User]] ACCEPTS fix
      1. THEN [[GPT Agent]] APPLY fix
      2. AND [[GPT Agent]] CHECK result
   3. IF [[User]] REJECTS fix
      1. THEN [[GPT Agent]] CREATE new fix

3. GIVEN [[error]] IS fixed
   1. THEN [[GPT Agent]] SCAN again
      1. IF [[project]] HAS errors
         1. THEN [[GPT Agent]] REPEAT from step 2
      2. IF [[project]] IS clean
         1. THEN [[GPT Agent]] TELL [[User]]

4. WHEN [[GPT Agent]] TRIES three times
   1. IF [[error]] STILL exists
      1. THEN [[GPT Agent]] FOLLOW [[the-test-workflow]]
      2. AND [[GPT Agent]] START analysis 
