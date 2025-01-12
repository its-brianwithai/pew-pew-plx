---
document_type: protocol
goal: create new protocol following standardized format
gpt_action: follow these steps when creating a new protocol
---

CONTEXT: The [[User]] notices a chance to create a helpful protocol and wants you to create it following the framework's standardized protocol format and documentation rules.

1. GIVEN [[User]] RUNS plx-create-protocol command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] FIND [[protocol]] name
      2. AND [[GPT Agent]] FIND [[protocol]] purpose
   2. IF [[input]] HAS details
      1. THEN [[GPT Agent]] USE details
   3. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]]

2. WHEN [[GPT Agent]] STARTS creation
   1. THEN [[GPT Agent]] WRITE [[frontmatter]]
      1. AND [[GPT Agent]] SET type
      2. AND [[GPT Agent]] SET goal
      3. AND [[GPT Agent]] SET action
   2. IF [[frontmatter]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

3. GIVEN [[frontmatter]] IS ready
   1. THEN [[GPT Agent]] ADD context
      1. AND [[GPT Agent]] WRITE "CONTEXT: REASON FOR PROTOCOL AND OR IMPORTANT RELEVANT BACKGROUND INFO" (one sentence)
      2. AND [[GPT Agent]] ADD situation
      3. AND [[GPT Agent]] ADD "and wants you to"
      4. AND [[GPT Agent]] ADD goal
   2. AND [[GPT Agent]] BUILD steps
      1. AND [[GPT Agent]] START [[command]]
      2. AND [[GPT Agent]] ADD [[actions]]
      3. AND [[GPT Agent]] SET state
   3. IF [[steps]] NEEDS branches
      1. THEN [[GPT Agent]] ADD conditions
      2. AND [[GPT Agent]] ADD paths

4. WHEN [[GPT Agent]] WRITES content
   1. THEN [[GPT Agent]] USE format
      1. AND [[GPT Agent]] USE Gherkin keywords:
         - Primary: GIVEN (precondition), WHEN (action), THEN (result)
         - Flow: AND (additional), OR (alternative)
         - Conditionals: IF/ELSE (branching), BUT (exception)
      2. AND [[GPT Agent]] FOLLOW rules:
         - UPPERCASE all keywords
         - [[Actor]] or [[Component]] in double brackets
         - ONE uppercase VERB/STATE after actor
         - Proper indentation for sub-steps
      3. AND [[GPT Agent]] USE code elements:
         - Inline code with backticks
         - Code blocks properly indented
         - Language-specific syntax highlighting
   2. IF [[format]] IS wrong
      1. THEN [[GPT Agent]] FIX format
      2. AND [[GPT Agent]] CHECK again

5. GIVEN [[protocol]] IS done
   1. THEN [[GPT Agent]] CHECK quality
      1. AND [[GPT Agent]] CHECK steps
      2. AND [[GPT Agent]] CHECK flow
      3. AND [[GPT Agent]] CHECK handling
   2. IF [[User]] ACCEPTS [[protocol]]
      1. THEN [[GPT Agent]] SAVE [[protocol]]
      2. AND [[GPT Agent]] TELL [[User]]