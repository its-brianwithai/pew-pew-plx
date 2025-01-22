---
document_type: protocol
goal: realign with workflow and get back on track
gpt_action: follow these steps when needing to realign with the process
---

CONTEXT: The [[User]] notices process deviation and wants you to realign with the proper process by analyzing the current state and making corrections.

1. GIVEN [[User]] RUNS plx-stick-to-the-process command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY current context
      2. AND [[You]] IDENTIFY process concerns
   2. IF [[User]] input HAS specific concerns
      1. THEN [[You]] FOCUS on those concerns
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] CHECK entire process state

2. WHEN [[You]] STARTS analysis
   1. THEN [[You]] CHECK [[your-todo-list]]
   2. AND [[You]] CHECK [[your-milestones]]
   3. AND [[You]] CHECK current process phase
   4. IF [[workflow]] IS unclear
      1. THEN [[You]] REQUEST clarification from [[User]]
      2. AND [[You]] WAIT for response

3. GIVEN [[process state]] IS known
   1. THEN [[You]] VERIFY process alignment
      1. AND [[You]] CHECK correct process steps
      2. AND [[You]] CHECK task sequence
      3. AND [[You]] CHECK milestone progress
   2. IF [[misalignment]] IS found
      1. THEN [[You]] DOCUMENT issues
      2. AND [[You]] PROPOSE corrections to [[User]]

4. WHEN [[User]] REVIEWS alignment
   1. IF [[User]] APPROVES corrections
      1. THEN [[You]] IMPLEMENT realignment
      2. AND [[You]] UPDATE work documents
   2. IF [[User]] REJECTS corrections
      1. THEN [[You]] REQUEST guidance
      2. AND [[You]] WAIT for [[User]] input

5. WHEN [[realignment]] IS complete
   1. THEN [[You]] CONFIRM next steps with [[User]]
      1. AND [[You]] LIST corrected issues
      2. AND [[You]] PROPOSE path forward
   2. IF [[User]] CONFIRMS path
      1. THEN [[You]] RESUME process
      2. AND [[You]] CONTINUE with next task
