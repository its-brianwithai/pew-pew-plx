---
document_type: protocol
goal: prepare and execute release of work with Dart-specific commands and checks
gpt_action: follow these steps when releasing work
---

CONTEXT: The [[User]] notices you need to prepare a release and wants you to execute the Dart-specific release process with proper version management and documentation updates.

1. GIVEN [[User]] RUNS plx-prepare-release command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY release type
      2. AND [[You]] IDENTIFY release scope
   2. IF [[User]] input HAS specific version
      1. THEN [[You]] FOCUS on version
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] SCAN pending changes

2. WHEN [[You]] STARTS release preparation
   1. THEN [[You]] RUN Dart commands
      1. AND [[You]] EXECUTE 'dart fix --apply'
      2. AND [[You]] EXECUTE 'dart format .'
      3. AND [[You]] EXECUTE 'dart build' with --delete-conflicting-outputs
   2. IF [[commands]] FAIL
      1. THEN [[You]] ANALYZE errors
      2. AND [[You]] FIX issues
      3. AND [[You]] RUN commands again

3. GIVEN [[Dart fixes]] ARE complete
   1. THEN [[You]] ANALYZE changes
      1. AND [[You]] CHECK git diff
      2. AND [[You]] REVIEW conversation context
      3. AND [[You]] IDENTIFY impact level
   2. IF [[changes]] ARE significant
      1. THEN [[You]] UPDATE version number
         1. AND [[You]] INCREMENT major IF breaking
         2. AND [[You]] INCREMENT minor IF feature
         3. AND [[You]] INCREMENT patch IF fix
      2. AND [[You]] UPDATE changelog
         1. WITH new version number
         2. WITH list of changes
         3. WITH migration notes IF breaking
      3. AND [[You]] UPDATE readme
         1. WITH new features IF any
         2. WITH updated instructions IF needed

4. WHEN [[documentation]] IS updated
   1. THEN [[You]] STAGE changes
      1. AND [[You]] ADD modified files
      2. AND [[You]] VERIFY staged changes
   2. IF [[staged changes]] ARE correct
      1. THEN [[You]] COMMIT changes
         1. WITH clear version message
         2. WITH change summary
   3. IF [[staged changes]] NEED review
      1. THEN [[You]] LIST changes
      2. AND [[You]] ASK [[User]] for confirmation

5. GIVEN [[commit]] IS complete
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] SHOW summary
         1. OF version changes
         2. OF documentation updates
         3. OF staged files
      2. AND [[You]] ASK for next step
   2. IF [[User]] PROVIDES direction
      1. THEN [[You]] FOLLOW instruction
      2. AND [[You]] CONFIRM completion
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] MODIFY release
      2. AND [[You]] START from relevant step
