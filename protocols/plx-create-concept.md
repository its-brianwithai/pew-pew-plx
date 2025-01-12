---
document_type: protocol
goal: create a concept file that explains a specific concept in a direct, clear way
gpt_action: follow these steps to generate a concept file from existing documentation or user input
---

CONTEXT: The [[User]] wants to extract or create a clear, focused explanation of a concept and needs you to create a concept file in the `concepts/` directory with a name that starts with "the-".

1. GIVEN [[User]] RUNS @plx-create-concept command
   1. THEN [[GPT Agent]] READ [[input]]
      1. IF [[input]] REFERENCES existing documentation
         1. THEN [[GPT Agent]] EXTRACT core concept
      2. IF [[input]] DESCRIBES new concept
         1. THEN [[GPT Agent]] UNDERSTAND concept details
   2. IF [[input]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]] for clarification

2. WHEN [[GPT Agent]] STARTS concept creation
   1. THEN [[GPT Agent]] CREATE file name
      1. AND [[GPT Agent]] START with "the-"
      2. AND [[GPT Agent]] USE descriptive name
      3. Example: "the-gherkin-language" or "the-class-structure"
   2. AND [[GPT Agent]] CREATE file in `concepts/` directory
   3. AND [[GPT Agent]] WRITE frontmatter
      ```markdown
      ---
      document_type: concept
      goal: explain [concept name] clearly and concisely
      gpt_action: use this as reference when working with [concept name]
      ---
      ```

3. GIVEN [[concept file]] IS ready
   1. THEN [[GPT Agent]] WRITE concept content
      1. AND [[GPT Agent]] FOCUS on clarity
      2. AND [[GPT Agent]] BE short and concise
      3. AND [[GPT Agent]] INCLUDE examples if helpful
      4. AND [[GPT Agent]] AVOID unnecessary explanation
   2. IF [[concept]] IS from existing documentation
      1. THEN [[GPT Agent]] EXTRACT only essential parts
      2. AND [[GPT Agent]] MAINTAIN original meaning
      3. AND [[GPT Agent]] SIMPLIFY if possible

4. WHEN [[concept content]] IS complete
   1. THEN [[GPT Agent]] SAVE file
   2. AND [[GPT Agent]] INFORM [[User]]
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE content
      2. AND [[GPT Agent]] MAINTAIN simplicity and clarity 