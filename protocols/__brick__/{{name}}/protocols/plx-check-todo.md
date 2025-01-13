---
document_type: protocol
goal: check todo list to understand next required actions
gpt_action: follow these steps when checking what to do next
---

CONTEXT: The [[User]] notices you need direction and wants you to check your todo list for next actions.

1. GIVEN [[User]] RUNS plx-check-todo command
   1. THEN [[You]] READ [[your-todo-list]]
      1. AND [[You]] CHECK user tasks
      2. AND [[You]] CHECK current [[milestone]]
      3. AND [[You]] CHECK completed tasks

2. WHEN [[You]] FINDS tasks
   1. IF [[your-todo-list]] HAS user tasks
      1. THEN [[You]] FOCUS user tasks
      2. AND [[You]] TELL [[User]]
   2. IF [[your-todo-list]] HAS milestone tasks
      1. THEN [[You]] FOCUS current task
      2. AND [[You]] TELL [[User]]
   3. IF [[your-todo-list]] IS empty
      1. THEN [[You]] FOLLOW [[the-planning-workflow]]

3. GIVEN [[You]] HAS next task
   1. THEN [[You]] EXPLAIN task
      1. AND [[You]] SHOW context
      2. AND [[You]] LIST dependencies
   2. AND [[You]] ASK [[User]] to proceed 
