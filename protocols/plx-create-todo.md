---
document_type: protocol
goal: create todo list based on user input
gpt_action: follow these steps when creating a todo list from user input
---

CONTEXT: The [[User]] has provided input that needs to be converted into an organized todo list in [[your-todo-list]].

1. GIVEN [[You]] RECEIVES [[User]] input
   1. THEN [[You]] READ input carefully
   2. AND [[You]] IDENTIFY actionable items
   3. IF [[input]] IS unclear
      1. THEN [[You]] ASK [[User]] clarifying questions
      2. AND [[You]] WAIT response

2. WHEN [[You]] UNDERSTANDS input
   1. THEN [[You]] CREATE atomic tasks
      1. AND [[You]] ENSURE each task is testable
      2. AND [[You]] ENSURE tasks follow the development process
   2. IF task IS too large
      1. THEN [[You]] BREAK into smaller tasks
      2. AND [[You]] MAINTAIN task order

3. GIVEN [[You]] HAS atomic tasks
   1. THEN [[You]] UPDATE [[your-todo-list]]
      1. AND [[You]] ADD tasks under Current Milestone
      2. AND [[You]] PRESERVE User Added section
   2. IF [[User]] HAS priority tasks
      1. THEN [[You]] ADD to User Added section
      2. AND [[You]] MARK as high priority

4. WHEN [[You]] COMPLETES todo list
   1. THEN [[You]] VERIFY list quality
      1. AND [[You]] CHECK task atomicity
      2. AND [[You]] CHECK task clarity
   2. IF [[User]] ACCEPTS list
      1. THEN [[You]] START the development process 
