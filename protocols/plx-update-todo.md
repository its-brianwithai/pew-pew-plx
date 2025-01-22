---
document_type: protocol
goal: update todo list with current untracked work
gpt_action: follow these steps when adding current work to todo list
---

CONTEXT: The [[User]] wants to update the todo list with current untracked work to ensure all tasks are properly documented and prioritized in the workflow.

1. GIVEN [[User]] RUNS plx-update-todo command
   1. THEN [[You]] CHECK current work
      1. AND [[You]] LIST active tasks
      2. AND [[You]] LIST planned changes
   2. AND [[You]] READ [[your-todo-list]]
      1. AND [[You]] FIND missing tasks

2. WHEN [[You]] UPDATES [[your-todo-list]]
   1. THEN [[You]] READ [[your-milestones]]
      1. IF [[task]] FITS milestone
         1. THEN [[You]] ADD to milestone tasks
      2. IF [[task]] IS user request
         1. THEN [[You]] ADD to user tasks
   2. AND [[You]] SHOW [[User]]
      1. AND [[You]] LIST added tasks
      2. AND [[You]] EXPLAIN placement

3. GIVEN [[your-todo-list]] IS updated
   1. THEN [[You]] CHECK order
      1. AND [[You]] ENSURE user tasks first
      2. AND [[You]] ENSURE correct milestone
   2. IF [[User]] ACCEPTS changes
      1. THEN [[You]] SAVE [[your-todo-list]]
      2. AND [[You]] CONTINUE work
   3. IF [[User]] WANTS changes
      1. THEN [[You]] UPDATE order
      2. AND [[You]] SHOW again 
