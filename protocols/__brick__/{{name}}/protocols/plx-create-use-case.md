---
document_type: protocol
goal: create a use case file describing a specific concept, code, or workflow
gpt_action: follow these steps to generate a clear and informative use case description
---

CONTEXT: The [[User]] wants to document a use case for a particular piece of code, workflow, or concept and needs you to create a descriptive file in the `use-cases/` directory.

1. GIVEN [[User]] RUNS @plx-create-use-case command
   1. THEN [[You]] READ [[input]]
      1. IF [[input]] REFERENCES code or function
         1. THEN [[You]] ANALYZE code
         2. AND [[You]] IDENTIFY purpose and behavior
      2. IF [[input]] DESCRIBES workflow or process
         1. THEN [[You]] UNDERSTAND steps and flow
      3. IF [[input]] MENTIONS concept or pattern
         1. THEN [[You]] RESEARCH concept
         2. AND [[You]] GATHER key points
   2. IF [[input]] IS incomplete or unclear
      1. THEN [[You]] ASK [[User]] for clarification

2. WHEN [[You]] STARTS use case creation
   1. THEN [[You]] CREATE new file in `use-cases/` directory
      1. AND [[You]] USE descriptive file name
   2. AND [[You]] WRITE use case content
      1. AND [[You]] INCLUDE "What it does" section
         1. AND [[You]] DESCRIBE purpose and functionality
         2. AND [[You]] EXPLAIN input and output
         3. AND [[You]] HIGHLIGHT key aspects
      2. AND [[You]] INCLUDE "Why we do it this way" section
         1. AND [[You]] EXPLAIN reasoning and benefits
         2. AND [[You]] COMPARE to alternatives if applicable
         3. AND [[You]] JUSTIFY the approach
      3. AND [[You]] INCLUDE "How to use it" section
         1. AND [[You]] PROVIDE clear usage example
         2. AND [[You]] INCLUDE code snippets if relevant
         3. AND [[You]] EXPLAIN expected results

3. GIVEN [[use case content]] IS complete
   1. THEN [[You]] REVIEW content for clarity and completeness
   2. AND [[You]] ENSURE all sections are well-described
   3. AND [[You]] CONFIRM example is accurate and informative
   4. IF [[content]] NEEDS improvement
      1. THEN [[You]] REVISE [[content]]
      2. AND [[You]] REPEAT review process

4. WHEN [[use case content]] IS finalized
   1. THEN [[You]] SAVE file in `use-cases/` directory
   2. AND [[You]] INFORM [[User]] of completion
   3. AND [[You]] PROVIDE file name and location

5. IF [[User]] REQUESTS changes or additions
   1. THEN [[You]] UPDATE [[use case file]]
   2. AND [[You]] REPEAT review and finalization steps

6. GIVEN [[use case file]] IS completed and accepted
   1. THEN [[You]] REFERENCE [[use case file]] when relevant in future tasks
   2. AND [[You]] USE [[use case file]] to maintain consistency in approach 
