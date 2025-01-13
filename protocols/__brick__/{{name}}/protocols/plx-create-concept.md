---
document_type: protocol
goal: create a concept file that explains a specific concept in a direct, clear way
gpt_action: follow these steps to generate a concept file from existing documentation or user input
---

CONTEXT: The [[User]] wants to extract or create a clear, focused explanation of a concept and needs you to create a concept file in the `concepts/` directory with a name that starts with "the-".

1. GIVEN [[User]] RUNS @plx-create-concept command
   1. THEN [[You]] READ [[input]]
      1. IF [[input]] REFERENCES existing documentation
         1. THEN [[You]] EXTRACT core concept
      2. IF [[input]] DESCRIBES new concept
         1. THEN [[You]] UNDERSTAND concept details
   2. IF [[input]] IS unclear
      1. THEN [[You]] ASK [[User]] for clarification

2. WHEN [[You]] STARTS concept creation
   1. THEN [[You]] CREATE file name
      1. AND [[You]] START with "the-"
      2. AND [[You]] USE descriptive name
      3. Example: "the-gherkin-language" or "the-class-structure"
   2. AND [[You]] CREATE file in `concepts/` directory
   3. AND [[You]] WRITE frontmatter
      ```markdown
      ---
      document_type: concept
      goal: explain [concept name] clearly and concisely
      gpt_action: use this as reference when working with [concept name]
      ---
      ```

3. GIVEN [[concept file]] IS ready
   1. THEN [[You]] WRITE concept content
      1. AND [[You]] FOCUS on clarity
      2. AND [[You]] BE short and concise
      3. AND [[You]] INCLUDE examples if helpful
      4. AND [[You]] AVOID unnecessary explanation
   2. IF [[concept]] IS from existing documentation
      1. THEN [[You]] EXTRACT only essential parts
      2. AND [[You]] MAINTAIN original meaning
      3. AND [[You]] SIMPLIFY if possible

4. WHEN [[concept content]] IS complete
   1. THEN [[You]] SAVE file
   2. AND [[You]] INFORM [[User]]
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] UPDATE content
      2. AND [[You]] MAINTAIN simplicity and clarity 
