---
document_type: protocol
goal: update todo list with current untracked work
gpt_action: follow these steps when adding current work to todo list
---

CONTEXT: The [[User]] wants to update the todo list with current untracked work to ensure all tasks are properly documented and prioritized in the workflow.

1. GIVEN [[User]] RUNS plx-update-todo command
   1. THEN [[GPT Agent]] CHECK current work
      1. AND [[GPT Agent]] LIST active tasks
      2. AND [[GPT Agent]] LIST planned changes
   2. AND [[GPT Agent]] READ [[your-todo-list]]
      1. AND [[GPT Agent]] FIND missing tasks

2. WHEN [[GPT Agent]] UPDATES [[your-todo-list]]
   1. THEN [[GPT Agent]] READ [[your-milestones]]
      1. IF [[task]] FITS milestone
         1. THEN [[GPT Agent]] ADD to milestone tasks
      2. IF [[task]] IS user request
         1. THEN [[GPT Agent]] ADD to user tasks
   2. AND [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] LIST added tasks
      2. AND [[GPT Agent]] EXPLAIN placement

3. GIVEN [[your-todo-list]] IS updated
   1. THEN [[GPT Agent]] CHECK order
      1. AND [[GPT Agent]] ENSURE user tasks first
      2. AND [[GPT Agent]] ENSURE correct milestone
   2. IF [[User]] ACCEPTS changes
      1. THEN [[GPT Agent]] SAVE [[your-todo-list]]
      2. AND [[GPT Agent]] CONTINUE work
   3. IF [[User]] WANTS changes
      1. THEN [[GPT Agent]] UPDATE order
      2. AND [[GPT Agent]] SHOW again 