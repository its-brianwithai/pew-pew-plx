---
document_type: protocol
goal: check todo list to understand next required actions
gpt_action: follow these steps when checking what to do next
---

CONTEXT: The [[User]] notices you need direction and wants you to check your todo list for next actions.

1. GIVEN [[User]] RUNS plx-check-todo command
   1. THEN [[GPT Agent]] READ [[your-todo-list]]
      1. AND [[GPT Agent]] CHECK user tasks
      2. AND [[GPT Agent]] CHECK current [[milestone]]
      3. AND [[GPT Agent]] CHECK completed tasks

2. WHEN [[GPT Agent]] FINDS tasks
   1. IF [[your-todo-list]] HAS user tasks
      1. THEN [[GPT Agent]] FOCUS user tasks
      2. AND [[GPT Agent]] TELL [[User]]
   2. IF [[your-todo-list]] HAS milestone tasks
      1. THEN [[GPT Agent]] FOCUS current task
      2. AND [[GPT Agent]] TELL [[User]]
   3. IF [[your-todo-list]] IS empty
      1. THEN [[GPT Agent]] FOLLOW [[the-planning-workflow]]

3. GIVEN [[GPT Agent]] HAS next task
   1. THEN [[GPT Agent]] EXPLAIN task
      1. AND [[GPT Agent]] SHOW context
      2. AND [[GPT Agent]] LIST dependencies
   2. AND [[GPT Agent]] ASK [[User]] to proceed 