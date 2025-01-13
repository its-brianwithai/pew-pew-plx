---
document_type: protocol
goal: continue work from previous state
gpt_action: follow these steps when resuming work
---

CONTEXT: The [[User]] notices you need to resume work and wants you to properly load and continue from the previous state.

1. GIVEN [[User]] RUNS plx-resume command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY resume context
      2. AND [[You]] IDENTIFY resume constraints
   2. IF [[User]] input HAS specific context
      1. THEN [[You]] FOCUS on specified context
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] LOAD last known state

2. WHEN [[You]] STARTS resume
   1. THEN [[You]] CHECK [[your-todo-list]]
   2. AND [[You]] CHECK [[your-milestones]]
   3. AND [[You]] CHECK [[your-transfer]]
   4. IF [[document]] IS missing
      1. THEN [[You]] INFORM [[User]]
      2. AND [[You]] REQUEST missing information

3. GIVEN [[state]] IS loaded
   1. THEN [[You]] VERIFY state
      1. AND [[You]] CHECK current milestone
      2. AND [[You]] CHECK current task
      3. AND [[You]] CHECK pending actions
      4. AND [[You]] REVIEW [[your-transfer]] document
         1. AND [[You]] CHECK conversation context
         2. AND [[You]] CHECK work progress
         3. AND [[You]] CHECK key decisions
   2. IF [[state]] IS unclear
      1. THEN [[You]] REQUEST clarification from [[User]]
      2. AND [[You]] WAIT for response

4. WHEN [[User]] CONFIRMS state
   1. THEN [[You]] PREPARE continuation
      1. AND [[You]] LIST current position
      2. AND [[You]] LIST next steps
   2. IF [[User]] DISAGREES with state
      1. THEN [[You]] UPDATE state based on input
      2. AND [[You]] VERIFY again

5. WHEN [[resume]] IS ready
   1. THEN [[You]] PROPOSE next actions to [[User]]
      1. AND [[You]] LIST pending tasks
      2. AND [[You]] LIST required decisions
   2. IF [[User]] APPROVES
      1. THEN [[You]] START next task
      2. AND [[You]] CONTINUE workflow
