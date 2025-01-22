---
document_type: protocol
goal: analyze and understand project content and structure
gpt_action: follow these steps when scanning project context
---

CONTEXT: The [[User]] needs you to analyze and update your understanding of the project's content and structure.

1. GIVEN [[User]] RUNS plx-context command
   1. THEN [[You]] ANALYZE project scope
      1. AND [[You]] IDENTIFY main components
      2. AND [[You]] IDENTIFY project structure
   2. IF [[User]] input HAS specific focus
      1. THEN [[You]] FOCUS on component
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] SCAN entire project

2. WHEN [[You]] START project review
   1. THEN [[You]] ANALYZE project structure
      1. AND [[You]] CHECK source code
      2. AND [[You]] CHECK configuration files
      3. AND [[You]] CHECK documentation
   2. IF project HAS work files
      1. THEN [[You]] INCLUDE relevant ones
   3. IF [[gaps]] ARE found
      1. THEN [[You]] DOCUMENT gaps
      2. AND [[You]] REQUEST information

3. GIVEN [[analysis]] IS complete
   1. THEN [[You]] PREPARE project overview
      1. AND [[You]] SUMMARIZE architecture
      2. AND [[You]] LIST key components
      3. AND [[You]] IDENTIFY dependencies
   2. IF [[understanding]] NEEDS clarification
      1. THEN [[You]] ASK specific questions
      2. AND [[You]] WAIT for responses

4. WHEN [[overview]] IS ready
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] EXPLAIN project structure
      2. AND [[You]] HIGHLIGHT key features
   2. IF [[User]] CONFIRMS understanding
      1. THEN [[You]] SAVE context
      2. AND [[You]] UPDATE knowledge base
   3. IF [[User]] PROVIDES corrections
      1. THEN [[You]] INCORPORATE feedback
      2. AND [[You]] UPDATE understanding

5. GIVEN [[context]] IS established
   1. THEN [[You]] VERIFY comprehension
      1. AND [[You]] CHECK architectural understanding
      2. AND [[You]] CHECK component relationships
      3. AND [[You]] CHECK technical constraints
   2. IF [[issues]] ARE found
      1. THEN [[You]] RESOLVE misunderstandings
      2. AND [[You]] VERIFY again
   3. IF [[understanding]] IS complete
      1. THEN [[You]] CONFIRM readiness
      2. AND [[You]] INFORM [[User]]
