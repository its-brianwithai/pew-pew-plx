---
document_type: protocol
goal: continue work from previous state
gpt_action: follow these steps when resuming work
---

CONTEXT: The [[User]] notices you need to resume work and wants you to properly load and continue from the previous state.

1. GIVEN [[User]] RUNS plx-resume command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY resume context
      2. AND [[GPT Agent]] IDENTIFY resume constraints
   2. IF [[User]] input HAS specific context
      1. THEN [[GPT Agent]] FOCUS on specified context
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] LOAD last known state

2. WHEN [[GPT Agent]] STARTS resume
   1. THEN [[GPT Agent]] CHECK [[your-todo-list]]
   2. AND [[GPT Agent]] CHECK [[your-milestones]]
   3. AND [[GPT Agent]] CHECK [[your-transfer]]
   4. IF [[document]] IS missing
      1. THEN [[GPT Agent]] INFORM [[User]]
      2. AND [[GPT Agent]] REQUEST missing information

3. GIVEN [[state]] IS loaded
   1. THEN [[GPT Agent]] VERIFY state
      1. AND [[GPT Agent]] CHECK current milestone
      2. AND [[GPT Agent]] CHECK current task
      3. AND [[GPT Agent]] CHECK pending actions
      4. AND [[GPT Agent]] REVIEW [[your-transfer]] document
         1. AND [[GPT Agent]] CHECK conversation context
         2. AND [[GPT Agent]] CHECK work progress
         3. AND [[GPT Agent]] CHECK key decisions
   2. IF [[state]] IS unclear
      1. THEN [[GPT Agent]] REQUEST clarification from [[User]]
      2. AND [[GPT Agent]] WAIT for response

4. WHEN [[User]] CONFIRMS state
   1. THEN [[GPT Agent]] PREPARE continuation
      1. AND [[GPT Agent]] LIST current position
      2. AND [[GPT Agent]] LIST next steps
   2. IF [[User]] DISAGREES with state
      1. THEN [[GPT Agent]] UPDATE state based on input
      2. AND [[GPT Agent]] VERIFY again

5. WHEN [[resume]] IS ready
   1. THEN [[GPT Agent]] PROPOSE next actions to [[User]]
      1. AND [[GPT Agent]] LIST pending tasks
      2. AND [[GPT Agent]] LIST required decisions
   2. IF [[User]] APPROVES
      1. THEN [[GPT Agent]] START next task
      2. AND [[GPT Agent]] CONTINUE workflow