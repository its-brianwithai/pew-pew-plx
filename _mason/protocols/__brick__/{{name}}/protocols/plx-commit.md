---
document_type: protocol
goal: prepare and execute git commits for current changes
gpt_action: follow these steps when handling git commits
---

CONTEXT: The [[User]] notices changes need to be committed and wants you to prepare and execute a git commit with proper formatting and documentation.

1. GIVEN [[User]] RUNS plx-commit command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY commit scope
      2. AND [[You]] IDENTIFY commit type
   2. IF [[User]] input HAS specific scope
      1. THEN [[You]] FOCUS on specified files
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] CHECK all changes

2. WHEN [[You]] STARTS commit process
   1. THEN [[You]] REVIEW changes
      1. AND [[You]] CHECK modified files
      2. AND [[You]] CHECK added files
      3. AND [[You]] CHECK deleted files
   2. IF [[changes]] ARE unclear
      1. THEN [[You]] REQUEST clarification from [[User]]
      2. AND [[You]] WAIT for response

3. GIVEN [[changes]] ARE reviewed
   1. THEN [[You]] PREPARE commit message
      1. AND [[You]] ADD type prefix
      2. AND [[You]] ADD clear description
      3. AND [[You]] ADD related tickets
   2. IF [[message]] NEEDS context
      1. THEN [[You]] ADD detailed body
      2. AND [[You]] ADD breaking changes

4. WHEN [[commit message]] IS ready
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] SHOW changes
      2. AND [[You]] SHOW message
   2. IF [[User]] REQUESTS changes
      1. THEN [[You]] UPDATE message
      2. AND [[You]] PRESENT again

5. WHEN [[User]] APPROVES commit
   1. THEN [[You]] EXECUTE commit
      1. AND [[You]] STAGE files
      2. AND [[You]] COMMIT changes
   2. IF [[commit]] FAILS
      1. THEN [[You]] REPORT error to [[User]]
      2. AND [[You]] PROPOSE solution
