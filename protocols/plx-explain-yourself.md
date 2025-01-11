---
document_type: protocol
goal: explain current understanding, proposed solution, and next steps
gpt_action: follow these steps when user needs thorough explanation of your thinking
---

CONTEXT: The [[User]] needs a clear explanation of what the [[GPT Agent]] thinks is happening and how it plans to solve it.

1. GIVEN [[GPT Agent]] RECEIVES explain command
   1. THEN [[GPT Agent]] PAUSE current work
      1. AND [[GPT Agent]] ORGANIZE thoughts
      2. AND [[GPT Agent]] PREPARE explanation
   2. THEN [[GPT Agent]] EXPLAIN issue
      1. AND [[GPT Agent]] DESCRIBE symptoms
      2. AND [[GPT Agent]] IDENTIFY root causes
      3. AND [[GPT Agent]] HIGHLIGHT dependencies

2. WHEN [[GPT Agent]] PRESENTS understanding
   1. THEN [[GPT Agent]] EXPLAIN
      1. AND [[GPT Agent]] DESCRIBE current situation
      2. AND [[GPT Agent]] LIST observed problems
      3. AND [[GPT Agent]] SHOW related components
   2. THEN [[GPT Agent]] CLARIFY thinking
      1. AND [[GPT Agent]] EXPLAIN reasoning
      2. AND [[GPT Agent]] SHOW evidence
      3. AND [[GPT Agent]] ADMIT uncertainties

3. GIVEN [[understanding]] IS presented
   1. THEN [[GPT Agent]] PROPOSE solution
      1. AND [[GPT Agent]] OUTLINE approach
      2. AND [[GPT Agent]] LIST steps needed
      3. AND [[GPT Agent]] EXPLAIN expected results
   2. THEN [[GPT Agent]] DETAIL risks
      1. AND [[GPT Agent]] IDENTIFY potential issues
      2. AND [[GPT Agent]] SUGGEST mitigations

4. WHEN [[solution]] IS explained
   1. THEN [[GPT Agent]] LIST next steps
      1. AND [[GPT Agent]] BREAK DOWN actions
      2. AND [[GPT Agent]] SHOW dependencies
      3. AND [[GPT Agent]] ESTIMATE impact
   2. THEN [[GPT Agent]] REQUEST approval
      1. AND [[GPT Agent]] WAIT for [[User]]
      2. AND [[GPT Agent]] MAKE no changes

5. GIVEN [[User]] RESPONDS
   1. IF [[User]] APPROVES
      1. THEN [[GPT Agent]] PROCEED with plan
   2. IF [[User]] REJECTS
      1. THEN [[GPT Agent]] REVISE approach
      2. AND [[GPT Agent]] START from step 1
   3. IF [[User]] ASKS questions
      1. THEN [[GPT Agent]] PROVIDE details
      2. AND [[GPT Agent]] CLARIFY points 