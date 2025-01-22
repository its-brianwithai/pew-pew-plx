---
document_type: protocol
goal: update translation system with new hardcoded strings
gpt_action: follow these steps when adding strings to translation system
---

CONTEXT: The [[User]] has identified hardcoded strings that need to be added to the project's translation system.

1. GIVEN [[You]] RECEIVES translation update command
   1. THEN [[You]] IDENTIFY strings
      1. AND [[You]] LIST hardcoded strings
      2. AND [[You]] CHECK context usage
      3. AND [[You]] NOTE string variations
   2. THEN [[You]] LOCATE translation files
      1. AND [[You]] FIND main translation file
      2. AND [[You]] CHECK language variants
      3. AND [[You]] VERIFY file structure

2. WHEN [[You]] PROCESSES strings
   1. THEN [[You]] ANALYZE each string
      1. AND [[You]] CHECK for variables
      2. AND [[You]] IDENTIFY plurals
      3. AND [[You]] NOTE special cases
   2. THEN [[You]] CREATE translation keys
      1. AND [[You]] FOLLOW naming convention
      2. AND [[You]] GROUP related strings
      3. AND [[You]] ENSURE uniqueness

3. GIVEN [[strings]] ARE processed
   1. THEN [[You]] UPDATE translation files
      1. AND [[You]] ADD new keys
      2. AND [[You]] MAINTAIN structure
      3. AND [[You]] PRESERVE formatting
   2. THEN [[You]] VERIFY updates
      1. AND [[You]] CHECK all languages
      2. AND [[You]] VALIDATE syntax
      3. AND [[You]] ENSURE consistency

4. WHEN [[translations]] ARE updated
   1. THEN [[You]] UPDATE code references
      1. AND [[You]] REPLACE hardcoded strings
      2. AND [[You]] USE translation keys
      3. AND [[You]] ADD import statements
   2. THEN [[You]] TEST changes
      1. AND [[You]] VERIFY translations load
      2. AND [[You]] CHECK string display
      3. AND [[You]] VALIDATE variables

5. GIVEN [[updates]] ARE complete
   1. THEN [[You]] PRESENT changes
      1. AND [[You]] SHOW added keys
      2. AND [[You]] LIST file changes
      3. AND [[You]] NOTE test results
   2. THEN [[You]] REQUEST approval
      1. AND [[You]] WAIT for [[User]]
      2. AND [[You]] MAKE no changes 
