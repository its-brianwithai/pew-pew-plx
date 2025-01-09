---
document_type: protocol
goal: prepare and execute release of work with Dart-specific commands and checks
gpt_action: follow these steps when releasing work
---

CONTEXT: The [[User]] notices you need to prepare a release and wants you to execute the Dart-specific release process with proper version management and documentation updates.

1. GIVEN [[User]] RUNS plx-prepare-release command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY release type
      2. AND [[GPT Agent]] IDENTIFY release scope
   2. IF [[User]] input HAS specific version
      1. THEN [[GPT Agent]] FOCUS on version
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] SCAN pending changes

2. WHEN [[GPT Agent]] STARTS release preparation
   1. THEN [[GPT Agent]] RUN Dart commands
      1. AND [[GPT Agent]] EXECUTE 'dart fix --apply'
      2. AND [[GPT Agent]] EXECUTE 'dart format .'
      3. AND [[GPT Agent]] EXECUTE 'dart build' with --delete-conflicting-outputs
   2. IF [[commands]] FAIL
      1. THEN [[GPT Agent]] ANALYZE errors
      2. AND [[GPT Agent]] FIX issues
      3. AND [[GPT Agent]] RUN commands again

3. GIVEN [[Dart fixes]] ARE complete
   1. THEN [[GPT Agent]] ANALYZE changes
      1. AND [[GPT Agent]] CHECK git diff
      2. AND [[GPT Agent]] REVIEW conversation context
      3. AND [[GPT Agent]] IDENTIFY impact level
   2. IF [[changes]] ARE significant
      1. THEN [[GPT Agent]] UPDATE version number
         1. AND [[GPT Agent]] INCREMENT major IF breaking
         2. AND [[GPT Agent]] INCREMENT minor IF feature
         3. AND [[GPT Agent]] INCREMENT patch IF fix
      2. AND [[GPT Agent]] UPDATE changelog
         1. WITH new version number
         2. WITH list of changes
         3. WITH migration notes IF breaking
      3. AND [[GPT Agent]] UPDATE readme
         1. WITH new features IF any
         2. WITH updated instructions IF needed

4. WHEN [[documentation]] IS updated
   1. THEN [[GPT Agent]] STAGE changes
      1. AND [[GPT Agent]] ADD modified files
      2. AND [[GPT Agent]] VERIFY staged changes
   2. IF [[staged changes]] ARE correct
      1. THEN [[GPT Agent]] COMMIT changes
         1. WITH clear version message
         2. WITH change summary
   3. IF [[staged changes]] NEED review
      1. THEN [[GPT Agent]] LIST changes
      2. AND [[GPT Agent]] ASK [[User]] for confirmation

5. GIVEN [[commit]] IS complete
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW summary
         1. OF version changes
         2. OF documentation updates
         3. OF staged files
      2. AND [[GPT Agent]] ASK for next step
   2. IF [[User]] PROVIDES direction
      1. THEN [[GPT Agent]] FOLLOW instruction
      2. AND [[GPT Agent]] CONFIRM completion
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] MODIFY release
      2. AND [[GPT Agent]] START from relevant step
