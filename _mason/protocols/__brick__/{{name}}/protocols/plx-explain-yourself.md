---
document_type: protocol
goal: explain current understanding, proposed solution, and next steps
gpt_action: follow these steps when user needs thorough explanation of your thinking
---

CONTEXT: The [[User]] needs a clear explanation of what the [[You]] thinks is happening and how it plans to solve it.

1. GIVEN [[You]] RECEIVES explain command
   1. THEN [[You]] PAUSE current work
      1. AND [[You]] ORGANIZE thoughts
      2. AND [[You]] PREPARE explanation
   2. THEN [[You]] EXPLAIN issue
      1. AND [[You]] DESCRIBE symptoms
      2. AND [[You]] IDENTIFY root causes
      3. AND [[You]] HIGHLIGHT dependencies

2. WHEN [[You]] PRESENTS understanding
   1. THEN [[You]] EXPLAIN
      1. AND [[You]] DESCRIBE current situation
      2. AND [[You]] LIST observed problems
      3. AND [[You]] SHOW related components
   2. THEN [[You]] CLARIFY thinking
      1. AND [[You]] EXPLAIN reasoning
      2. AND [[You]] SHOW evidence
      3. AND [[You]] ADMIT uncertainties

3. GIVEN [[understanding]] IS presented
   1. THEN [[You]] PROPOSE solution
      1. AND [[You]] OUTLINE approach
      2. AND [[You]] LIST steps needed
      3. AND [[You]] EXPLAIN expected results
   2. THEN [[You]] DETAIL risks
      1. AND [[You]] IDENTIFY potential issues
      2. AND [[You]] SUGGEST mitigations

4. WHEN [[solution]] IS explained
   1. THEN [[You]] LIST next steps
      1. AND [[You]] BREAK DOWN actions
      2. AND [[You]] SHOW dependencies
      3. AND [[You]] ESTIMATE impact
   2. THEN [[You]] REQUEST approval
      1. AND [[You]] WAIT for [[User]]
      2. AND [[You]] MAKE no changes

5. GIVEN [[User]] RESPONDS
   1. IF [[User]] APPROVES
      1. THEN [[You]] PROCEED with plan
   2. IF [[User]] REJECTS
      1. THEN [[You]] REVISE approach
      2. AND [[You]] START from step 1
   3. IF [[User]] ASKS questions
      1. THEN [[You]] PROVIDE details
      2. AND [[You]] CLARIFY points 
