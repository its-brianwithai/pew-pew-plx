---
document_type: protocol
goal: create new document based on user input following framework rules
gpt_action: follow these steps when creating new documents
---

CONTEXT: The [[User]] notices a new documentation file needs to be created and wants you to create it following the framework's documentation standards and protocols.

1. GIVEN [[User]] RUNS plx-create-doc command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] FIND [[document]] type
      2. AND [[You]] FIND [[document]] goal
      3. AND [[You]] FIND [[action]]
   2. IF [[input]] IS empty
      1. THEN [[You]] ASK [[User]]

2. WHEN [[You]] STARTS creation
   1. THEN [[You]] WRITE [[frontmatter]]
      ```markdown
      ---
      document_type: [protocol|workflow|code-of-conduct|prompt|template]
      goal: [clear goal statement]
      gpt_action: [specific instruction for GPT]
      ---
      ```
   2. IF [[frontmatter]] NEEDS review
      1. THEN [[You]] CHECK format
      2. AND [[You]] FIX errors

3. WHEN [[You]] BUILDS structure
   1. THEN [[You]] CREATE sections
   2. AND [[You]] ADD emoji
   3. AND [[You]] WRITE headers

4. GIVEN [[structure]] IS ready
   1. THEN [[You]] WRITE content
      1. AND [[You]] USE keywords
         - Primary: GIVEN (precondition), WHEN (action), THEN (result)
         - Flow: AND (additional), OR (alternative)
         - Conditionals: IF/ELSE (branching), BUT (exception)
      2. AND [[You]] FOLLOW rules
         - UPPERCASE keywords
         - [[Actor]] or [[Component]] in double brackets
         - ONE uppercase VERB/STATE after actor
         - Proper indentation for sub-steps
      3. AND [[You]] USE code elements
         - Inline code with backticks
         - Code blocks properly indented
         - Language-specific syntax highlighting

5. WHEN [[You]] ADDS code
   1. THEN [[You]] USE markdown
      ```example
      ```language
      code here
      ```
      ```
   2. IF [[code]] NEEDS context
      1. THEN [[You]] ADD comments

6. GIVEN [[document]] IS complete
   1. THEN [[You]] CHECK quality
      1. AND [[You]] CHECK format
      2. AND [[You]] CHECK sections
      3. AND [[You]] CHECK style
   2. IF [[document]] HAS errors
      1. THEN [[You]] FIX [[document]]
      2. AND [[You]] CHECK again
   3. IF [[document]] IS ready
      1. THEN [[You]] SAVE [[document]]
      2. AND [[You]] TELL [[User]] 
