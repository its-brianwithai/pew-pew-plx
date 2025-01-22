---
document_type: protocol
goal: create new protocol following standardized format
gpt_action: follow these steps when creating a new protocol
---

CONTEXT: The [[User]] notices a chance to create a helpful protocol and wants you to create it following the framework's standardized protocol format and documentation rules.

1. GIVEN [[User]] RUNS plx-create-protocol command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] FIND [[protocol]] name
      2. AND [[You]] FIND [[protocol]] purpose
   2. IF [[input]] HAS details
      1. THEN [[You]] USE details
   3. IF [[input]] IS empty
      1. THEN [[You]] ASK [[User]]

2. WHEN [[You]] STARTS creation
   1. THEN [[You]] WRITE [[frontmatter]]
      1. AND [[You]] SET type
      2. AND [[You]] SET goal
      3. AND [[You]] SET action
   2. IF [[frontmatter]] IS unclear
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

3. GIVEN [[frontmatter]] IS ready
   1. THEN [[You]] ADD context
      1. AND [[You]] WRITE "CONTEXT: REASON FOR PROTOCOL AND OR IMPORTANT RELEVANT BACKGROUND INFO" (one sentence)
      2. AND [[You]] ADD situation
      3. AND [[You]] ADD "and wants you to"
      4. AND [[You]] ADD goal
   2. AND [[You]] BUILD steps
      1. AND [[You]] START [[command]]
      2. AND [[You]] ADD [[actions]]
      3. AND [[You]] SET state
   3. IF [[steps]] NEEDS branches
      1. THEN [[You]] ADD conditions
      2. AND [[You]] ADD paths

4. WHEN [[You]] WRITES content
   1. THEN [[You]] USE format
      1. AND [[You]] USE Gherkin keywords:
         - Primary: GIVEN (precondition), WHEN (action), THEN (result)
         - Flow: AND (additional), OR (alternative)
         - Conditionals: IF/ELSE (branching), BUT (exception)
      2. AND [[You]] FOLLOW rules:
         - UPPERCASE all keywords
         - [[Actor]] or [[Component]] in double brackets
         - ONE uppercase VERB/STATE after actor
         - Proper indentation for sub-steps
      3. AND [[You]] USE code elements:
         - Inline code with backticks
         - Code blocks properly indented
         - Language-specific syntax highlighting
   2. IF [[format]] IS wrong
      1. THEN [[You]] FIX format
      2. AND [[You]] CHECK again

5. GIVEN [[protocol]] IS done
   1. THEN [[You]] CHECK quality
      1. AND [[You]] CHECK steps
      2. AND [[You]] CHECK flow
      3. AND [[You]] CHECK handling
   2. IF [[User]] ACCEPTS [[protocol]]
      1. THEN [[You]] SAVE [[protocol]]
      2. AND [[You]] TELL [[User]]
