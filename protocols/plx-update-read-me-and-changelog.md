---
document_type: protocol
goal: update documentation and version information after work completion
gpt_action: follow these steps when updating README and CHANGELOG
---

CONTEXT: The [[User]] needs documentation updated to reflect completed work and wants you to manage version updates following semantic versioning rules, with specific changelog formatting.

1. GIVEN [[GPT Agent]] RECEIVES update request
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] IDENTIFY completed work
      2. AND [[GPT Agent]] CHECK explicit version update request
   2. IF [[input]] HAS no clear details
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] UPDATES [[CHANGELOG]]
   1. THEN [[GPT Agent]] IDENTIFY current version
   2. IF [[User]] EXPLICITLY REQUESTS version update
      1. THEN [[GPT Agent]] INCREMENT version
         1. AND [[GPT Agent]] USE MINOR version IF breaking changes
         2. AND [[GPT Agent]] USE PATCH version IF bug fixes
         3. AND [[GPT Agent]] NEVER update MAJOR unless explicitly requested
      2. THEN [[GPT Agent]] ADD new version entry
   3. IF NOT
      1. THEN [[GPT Agent]] AMEND to current version
   4. THEN [[GPT Agent]] FORMAT changes using ONLY these sections:
      1. AND [[GPT Agent]] USE "### ✨ Features:" for new features
      2. AND [[GPT Agent]] USE "### 🛠️ Improvements:" for improvements
      3. AND [[GPT Agent]] USE "### 🐛 Bug fixes:" for bug fixes
      4. AND [[GPT Agent]] ADD "💥 Breaking:" prefix to items ONLY when they break existing functionality
      5. AND [[GPT Agent]] NEVER add empty sections
      6. AND [[GPT Agent]] ADD date IF new version

3. GIVEN [[User]] REQUESTS version update
   1. THEN [[GPT Agent]] UPDATE pubspec.yaml
      1. AND [[GPT Agent]] LOCATE version field
      2. AND [[GPT Agent]] UPDATE version number
   2. IF [[pubspec]] NOT found
      1. THEN [[GPT Agent]] NOTIFY [[User]]
      2. AND [[GPT Agent]] WAIT instructions

4. WHEN [[GPT Agent]] UPDATES [[README]]
   1. THEN [[GPT Agent]] IDENTIFY relevant sections
      1. AND [[GPT Agent]] UPDATE features list
      2. AND [[GPT Agent]] UPDATE usage examples
      3. AND [[GPT Agent]] UPDATE version reference IF new version
   2. IF [[changes]] NEED new section
      1. THEN [[GPT Agent]] ADD section
      2. AND [[GPT Agent]] MAINTAIN format

5. GIVEN [[updates]] ARE complete
   1. THEN [[GPT Agent]] VERIFY changes
      1. AND [[GPT Agent]] CHECK consistency
      2. AND [[GPT Agent]] ENSURE proper formatting
      3. AND [[GPT Agent]] VERIFY no empty sections exist
   2. IF [[User]] ACCEPTS changes
      1. THEN [[GPT Agent]] SAVE files
      2. AND [[GPT Agent]] CONFIRM completion 