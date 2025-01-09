---
document_type: protocol
goal: realign with workflow and get back on track
gpt_action: follow these steps when needing to realign with the process
---

CONTEXT: The [[User]] notices workflow deviation and wants you to realign with the proper process by analyzing the current state and making corrections.

1. GIVEN [[User]] RUNS plx-stick-to-the-process command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY current context
      2. AND [[GPT Agent]] IDENTIFY process concerns
   2. IF [[User]] input HAS specific concerns
      1. THEN [[GPT Agent]] FOCUS on those concerns
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] CHECK entire process state

2. WHEN [[GPT Agent]] STARTS analysis
   1. THEN [[GPT Agent]] CHECK [[your-todo-list]]
   2. AND [[GPT Agent]] CHECK [[your-milestones]]
   3. AND [[GPT Agent]] CHECK current workflow phase
   4. IF [[workflow]] IS unclear
      1. THEN [[GPT Agent]] REQUEST clarification from [[User]]
      2. AND [[GPT Agent]] WAIT for response

3. GIVEN [[workflow state]] IS known
   1. THEN [[GPT Agent]] VERIFY process alignment
      1. AND [[GPT Agent]] CHECK correct workflow steps
      2. AND [[GPT Agent]] CHECK task sequence
      3. AND [[GPT Agent]] CHECK milestone progress
   2. IF [[misalignment]] IS found
      1. THEN [[GPT Agent]] DOCUMENT issues
      2. AND [[GPT Agent]] PROPOSE corrections to [[User]]

4. WHEN [[User]] REVIEWS alignment
   1. IF [[User]] APPROVES corrections
      1. THEN [[GPT Agent]] IMPLEMENT realignment
      2. AND [[GPT Agent]] UPDATE work documents
   2. IF [[User]] REJECTS corrections
      1. THEN [[GPT Agent]] REQUEST guidance
      2. AND [[GPT Agent]] WAIT for [[User]] input

5. WHEN [[realignment]] IS complete
   1. THEN [[GPT Agent]] CONFIRM next steps with [[User]]
      1. AND [[GPT Agent]] LIST corrected issues
      2. AND [[GPT Agent]] PROPOSE path forward
   2. IF [[User]] CONFIRMS path
      1. THEN [[GPT Agent]] RESUME workflow
      2. AND [[GPT Agent]] CONTINUE with next task