---
document_type: protocol
goal: create todo list based on user input
gpt_action: follow these steps when creating a todo list from user input
---

CONTEXT: The [[User]] has provided input that needs to be converted into an organized todo list in [[your-todo-list]].

1. GIVEN [[GPT Agent]] RECEIVES [[User]] input
   1. THEN [[GPT Agent]] READ input carefully
   2. AND [[GPT Agent]] IDENTIFY actionable items
   3. IF [[input]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]] clarifying questions
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] UNDERSTANDS input
   1. THEN [[GPT Agent]] CREATE atomic tasks
      1. AND [[GPT Agent]] ENSURE each task is testable
      2. AND [[GPT Agent]] ENSURE tasks follow [[the-development-workflow]]
   2. IF task IS too large
      1. THEN [[GPT Agent]] BREAK into smaller tasks
      2. AND [[GPT Agent]] MAINTAIN task order

3. GIVEN [[GPT Agent]] HAS atomic tasks
   1. THEN [[GPT Agent]] UPDATE [[your-todo-list]]
      1. AND [[GPT Agent]] ADD tasks under Current Milestone
      2. AND [[GPT Agent]] PRESERVE User Added section
   2. IF [[User]] HAS priority tasks
      1. THEN [[GPT Agent]] ADD to User Added section
      2. AND [[GPT Agent]] MARK as high priority

4. WHEN [[GPT Agent]] COMPLETES todo list
   1. THEN [[GPT Agent]] VERIFY list quality
      1. AND [[GPT Agent]] CHECK task atomicity
      2. AND [[GPT Agent]] CHECK task clarity
   2. IF [[User]] ACCEPTS list
      1. THEN [[GPT Agent]] START [[the-development-workflow]] 