---
document_type: protocol
goal: create new code of conduct document that defines standards, rules, and best practices
gpt_action: follow these steps when user wants to create a new code of conduct document
---

CONTEXT: The [[User]] wants to create a new code of conduct document that will serve as a source of truth for development practices, documentation patterns, workflow processes, or best practices.

1. GIVEN [[User]] RUNS plx-create-code-of-conduct command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] IDENTIFY document purpose
      2. AND [[GPT Agent]] DETERMINE document scope
   2. IF [[input]] IS unclear
      1. THEN [[GPT Agent]] ASK clarifying questions
      2. AND [[GPT Agent]] WAIT for response

2. WHEN [[GPT Agent]] CREATES document
   1. THEN [[GPT Agent]] ADD frontmatter:
      ```markdown
      ---
      document_type: code of conduct
      goal: [clear goal statement about what this document defines]
      gpt_action: [specific instruction for GPT about how to use this document]
      ---
      ```
   2. AND [[GPT Agent]] STRUCTURE content:
      1. USING uppercase Gherkin keywords (GIVEN, WHEN, THEN)
      2. AND REFERENCING [[Actors]] and [[Components]] in double brackets
      3. AND USING VERBS in uppercase after actors
      4. AND FOLLOWING step hierarchy:
         - GIVEN for preconditions
         - WHEN for main steps
         - THEN for sub-steps
         - IF for conditionals

3. WHEN [[GPT Agent]] WRITES content
   1. THEN [[GPT Agent]] ENSURE each section:
      1. DEFINES clear standards or rules
      2. AND USES consistent formatting
      3. AND INCLUDES practical examples
      4. AND REFERENCES related concepts
   2. AND [[GPT Agent]] FOLLOW writing rules:
      1. ONE verb in CAPS after each actor
      2. PROPER indentation for sub-steps
      3. CLEAR step numbering
      4. CONSISTENT use of [[double brackets]]

4. WHEN [[GPT Agent]] COMPLETES document
   1. THEN [[GPT Agent]] VERIFY:
      1. ALL sections follow format
      2. ALL actors properly bracketed
      3. ALL steps properly numbered
      4. ALL examples properly formatted
   2. AND [[GPT Agent]] SAVE in code-of-conduct folder
   3. AND [[GPT Agent]] INFORM [[User]]

5. GIVEN [[User]] REVIEWS document
   1. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE content
      2. AND [[GPT Agent]] PRESENT new version
   2. IF [[User]] APPROVES
      1. THEN [[GPT Agent]] CONFIRM completion 