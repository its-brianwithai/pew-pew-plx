---
document_type: protocol
goal: create a use case file describing a specific concept, code, or workflow
gpt_action: follow these steps to generate a clear and informative use case description
---

CONTEXT: The [[User]] wants to document a use case for a particular piece of code, workflow, or concept and needs you to create a descriptive file in the `use-cases/` directory.

1. GIVEN [[User]] RUNS @plx-create-use-case command
   1. THEN [[GPT Agent]] READ [[input]]
      1. IF [[input]] REFERENCES code or function
         1. THEN [[GPT Agent]] ANALYZE code
         2. AND [[GPT Agent]] IDENTIFY purpose and behavior
      2. IF [[input]] DESCRIBES workflow or process
         1. THEN [[GPT Agent]] UNDERSTAND steps and flow
      3. IF [[input]] MENTIONS concept or pattern
         1. THEN [[GPT Agent]] RESEARCH concept
         2. AND [[GPT Agent]] GATHER key points
   2. IF [[input]] IS incomplete or unclear
      1. THEN [[GPT Agent]] ASK [[User]] for clarification

2. WHEN [[GPT Agent]] STARTS use case creation
   1. THEN [[GPT Agent]] CREATE new file in `use-cases/` directory
      1. AND [[GPT Agent]] USE descriptive file name
   2. AND [[GPT Agent]] WRITE use case content
      1. AND [[GPT Agent]] INCLUDE "What it does" section
         1. AND [[GPT Agent]] DESCRIBE purpose and functionality
         2. AND [[GPT Agent]] EXPLAIN input and output
         3. AND [[GPT Agent]] HIGHLIGHT key aspects
      2. AND [[GPT Agent]] INCLUDE "Why we do it this way" section
         1. AND [[GPT Agent]] EXPLAIN reasoning and benefits
         2. AND [[GPT Agent]] COMPARE to alternatives if applicable
         3. AND [[GPT Agent]] JUSTIFY the approach
      3. AND [[GPT Agent]] INCLUDE "How to use it" section
         1. AND [[GPT Agent]] PROVIDE clear usage example
         2. AND [[GPT Agent]] INCLUDE code snippets if relevant
         3. AND [[GPT Agent]] EXPLAIN expected results

3. GIVEN [[use case content]] IS complete
   1. THEN [[GPT Agent]] REVIEW content for clarity and completeness
   2. AND [[GPT Agent]] ENSURE all sections are well-described
   3. AND [[GPT Agent]] CONFIRM example is accurate and informative
   4. IF [[content]] NEEDS improvement
      1. THEN [[GPT Agent]] REVISE [[content]]
      2. AND [[GPT Agent]] REPEAT review process

4. WHEN [[use case content]] IS finalized
   1. THEN [[GPT Agent]] SAVE file in `use-cases/` directory
   2. AND [[GPT Agent]] INFORM [[User]] of completion
   3. AND [[GPT Agent]] PROVIDE file name and location

5. IF [[User]] REQUESTS changes or additions
   1. THEN [[GPT Agent]] UPDATE [[use case file]]
   2. AND [[GPT Agent]] REPEAT review and finalization steps

6. GIVEN [[use case file]] IS completed and accepted
   1. THEN [[GPT Agent]] REFERENCE [[use case file]] when relevant in future tasks
   2. AND [[GPT Agent]] USE [[use case file]] to maintain consistency in approach 