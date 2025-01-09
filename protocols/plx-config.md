---
document_type: protocol
goal: manage and update configuration settings
gpt_action: follow these steps when working with configuration files
---

CONTEXT: The [[User]] notices configuration settings need to be managed and wants you to handle updates and changes to config files safely.

1. GIVEN [[User]] RUNS plx-config command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY config type
      2. AND [[GPT Agent]] IDENTIFY config scope
   2. IF [[User]] input HAS specific file
      1. THEN [[GPT Agent]] FOCUS on file
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] SCAN config files

2. WHEN [[GPT Agent]] STARTS configuration
   1. THEN [[GPT Agent]] ANALYSE current settings
      1. AND [[GPT Agent]] CHECK environment variables
      2. AND [[GPT Agent]] CHECK config files
      3. AND [[GPT Agent]] CHECK dependencies
   2. IF [[conflicts]] ARE found
      1. THEN [[GPT Agent]] DOCUMENT conflicts
      2. AND [[GPT Agent]] PROPOSE solutions

3. GIVEN [[analysis]] IS complete
   1. THEN [[GPT Agent]] PREPARE changes
      1. AND [[GPT Agent]] CREATE backup if needed
      2. AND [[GPT Agent]] MODIFY settings
      3. AND [[GPT Agent]] UPDATE dependencies
   2. IF [[changes]] NEED validation
      1. THEN [[GPT Agent]] CREATE validation plan
      2. AND [[GPT Agent]] ADD test cases

4. WHEN [[changes]] ARE ready
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] EXPLAIN changes
      2. AND [[GPT Agent]] EXPLAIN impact
   2. IF [[User]] APPROVES changes
      1. THEN [[GPT Agent]] IMPLEMENT changes
      2. AND [[GPT Agent]] VERIFY settings
   3. IF [[User]] REQUESTS modifications
      1. THEN [[GPT Agent]] UPDATE changes
      2. AND [[GPT Agent]] PRESENT again

5. GIVEN [[implementation]] IS complete
   1. THEN [[GPT Agent]] VERIFY configuration
      1. AND [[GPT Agent]] CHECK settings
      2. AND [[GPT Agent]] CHECK dependencies
      3. AND [[GPT Agent]] CHECK functionality
   2. IF [[issues]] ARE found
      1. THEN [[GPT Agent]] FIX issues
      2. AND [[GPT Agent]] VERIFY again
   3. IF [[changes]] ARE successful
      1. THEN [[GPT Agent]] UPDATE documentation
      2. AND [[GPT Agent]] INFORM [[User]]