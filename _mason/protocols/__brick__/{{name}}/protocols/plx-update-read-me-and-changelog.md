---
document_type: protocol
goal: update documentation and version information after work completion
gpt_action: follow these steps when updating README and CHANGELOG
---

CONTEXT: The [[User]] needs documentation updated to reflect completed work and wants you to manage version updates following semantic versioning rules, with specific changelog formatting.

1. GIVEN [[You]] RECEIVES update request
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] IDENTIFY completed work
      2. AND [[You]] CHECK explicit version update request
   2. IF [[input]] HAS no clear details
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

2. WHEN [[You]] UPDATES [[CHANGELOG]]
   1. THEN [[You]] IDENTIFY current version
   2. IF [[User]] EXPLICITLY REQUESTS version update
      1. THEN [[You]] INCREMENT version
         1. AND [[You]] USE MINOR version IF breaking changes
         2. AND [[You]] USE PATCH version IF bug fixes
         3. AND [[You]] NEVER update MAJOR unless explicitly requested
      2. THEN [[You]] ADD new version entry
   3. IF NOT
      1. THEN [[You]] AMEND to current version
   4. THEN [[You]] FORMAT changes using ONLY these sections:
      1. AND [[You]] USE "### ✨ Features:" for new features
      2. AND [[You]] USE "### 🛠️ Improvements:" for improvements
      3. AND [[You]] USE "### 🐛 Bug fixes:" for bug fixes
      4. AND [[You]] ADD "💥 Breaking:" prefix to items ONLY when they break existing functionality
      5. AND [[You]] NEVER add empty sections
      6. AND [[You]] ADD date IF new version

3. GIVEN [[User]] REQUESTS version update
   1. THEN [[You]] UPDATE pubspec.yaml
      1. AND [[You]] LOCATE version field
      2. AND [[You]] UPDATE version number
   2. IF [[pubspec]] NOT found
      1. THEN [[You]] NOTIFY [[User]]
      2. AND [[You]] WAIT instructions

4. WHEN [[You]] UPDATES [[README]]
   1. THEN [[You]] IDENTIFY relevant sections
      1. AND [[You]] UPDATE features list
      2. AND [[You]] UPDATE usage examples
      3. AND [[You]] UPDATE version reference IF new version
   2. IF [[changes]] NEED new section
      1. THEN [[You]] ADD section
      2. AND [[You]] MAINTAIN format

5. GIVEN [[updates]] ARE complete
   1. THEN [[You]] VERIFY changes
      1. AND [[You]] CHECK consistency
      2. AND [[You]] ENSURE proper formatting
      3. AND [[You]] VERIFY no empty sections exist
   2. IF [[User]] ACCEPTS changes
      1. THEN [[You]] SAVE files
      2. AND [[You]] CONFIRM completion 
