---
document_type: protocol
goal: create new code of conduct document that defines standards, rules, and best practices
gpt_action: follow these steps when user wants to create a new code of conduct document
---

CONTEXT: The [[User]] wants to create a new code of conduct document that will serve as a source of truth for development practices, documentation patterns, development processes, or best practices.

1. GIVEN [[User]] RUNS plx-create-code-of-conduct command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] IDENTIFY document purpose
      2. AND [[You]] DETERMINE document scope
   2. IF [[input]] IS unclear
      1. THEN [[You]] ASK clarifying questions
      2. AND [[You]] WAIT for response

2. WHEN [[You]] CREATES document
   1. THEN [[You]] ADD frontmatter:
      ```markdown
      ---
      document_type: code of conduct
      goal: [clear goal statement about what this document defines]
      gpt_action: [specific instruction for GPT about how to use this document]
      ---
      ```
   2. AND [[You]] STRUCTURE content:
      1. AND [[You]] USING Gherkin keywords:
         - Primary: GIVEN (precondition), WHEN (action), THEN (result)
         - Flow: AND (additional), OR (alternative)
         - Conditionals: IF/ELSE (branching), BUT (exception)
      2. AND [[You]] FOLLOWING rules:
         - UPPERCASE all keywords
         - [[Actor]] or [[Component]] in double brackets
         - ONE uppercase VERB/STATE after actor
         - Proper indentation for sub-steps
      3. AND [[You]] USING code elements:
         - Inline code with backticks
         - Code blocks properly indented
         - Language-specific syntax highlighting

3. WHEN [[You]] WRITES content
   1. THEN [[You]] ENSURE each section:
      1. DEFINES clear standards or rules
      2. AND [[You]] USES consistent formatting
      3. AND [[You]] INCLUDES practical examples
      4. AND [[You]] REFERENCES related concepts
   2. AND [[You]] FOLLOW writing rules:
      1. ONE verb in CAPS after each actor
      2. PROPER indentation for sub-steps
      3. CLEAR step numbering
      4. CONSISTENT use of [[double brackets]]

4. WHEN [[You]] COMPLETES document
   1. THEN [[You]] VERIFY:
      1. ALL sections follow format
      2. ALL actors properly bracketed
      3. ALL steps properly numbered
      4. ALL examples properly formatted
   2. AND [[You]] SAVE in code-of-conduct folder
   3. AND [[You]] INFORM [[User]]

5. GIVEN [[User]] REVIEWS document
   1. IF [[User]] REQUESTS changes
      1. THEN [[You]] UPDATE content
      2. AND [[You]] PRESENT new version
   2. IF [[User]] APPROVES
      1. THEN [[You]] CONFIRM completion 
