---
document_type: protocol
goal: prepare and execute git commits for current changes
gpt_action: follow these steps when handling git commits
---

CONTEXT: The [[User]] notices changes need to be committed and wants you to prepare and execute a git commit with proper formatting and documentation.

1. GIVEN [[User]] RUNS plx-commit command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY commit scope
      2. AND [[GPT Agent]] IDENTIFY commit type
   2. IF [[User]] input HAS specific scope
      1. THEN [[GPT Agent]] FOCUS on specified files
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] CHECK all changes

2. WHEN [[GPT Agent]] STARTS commit process
   1. THEN [[GPT Agent]] REVIEW changes
      1. AND [[GPT Agent]] CHECK modified files
      2. AND [[GPT Agent]] CHECK added files
      3. AND [[GPT Agent]] CHECK deleted files
   2. IF [[changes]] ARE unclear
      1. THEN [[GPT Agent]] REQUEST clarification from [[User]]
      2. AND [[GPT Agent]] WAIT for response

3. GIVEN [[changes]] ARE reviewed
   1. THEN [[GPT Agent]] PREPARE commit message
      1. AND [[GPT Agent]] ADD type prefix
      2. AND [[GPT Agent]] ADD clear description
      3. AND [[GPT Agent]] ADD related tickets
   2. IF [[message]] NEEDS context
      1. THEN [[GPT Agent]] ADD detailed body
      2. AND [[GPT Agent]] ADD breaking changes

4. WHEN [[commit message]] IS ready
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW changes
      2. AND [[GPT Agent]] SHOW message
   2. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE message
      2. AND [[GPT Agent]] PRESENT again

5. WHEN [[User]] APPROVES commit
   1. THEN [[GPT Agent]] EXECUTE commit
      1. AND [[GPT Agent]] STAGE files
      2. AND [[GPT Agent]] COMMIT changes
   2. IF [[commit]] FAILS
      1. THEN [[GPT Agent]] REPORT error to [[User]]
      2. AND [[GPT Agent]] PROPOSE solution