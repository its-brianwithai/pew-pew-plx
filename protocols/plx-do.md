---
document_type: protocol
goal: execute high priority user task with perfect focus
gpt_action: follow these steps when user needs a task done with highest priority
---

CONTEXT: The [[User]] has a high priority task that needs immediate focused attention and wants you to execute it perfectly before continuing with any other work.

1. GIVEN [[You]] RECEIVES plx-do command
   1. THEN [[You]] READ [[task]]
      1. AND [[You]] IDENTIFY task requirements
      2. AND [[You]] CLEAR current focus
   2. IF [[task]] HAS no clear details
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

2. WHEN [[You]] STARTS task
   1. THEN [[You]] UPDATE [[your-milestones]]
      1. AND [[You]] ADD priority milestone
      2. AND [[You]] SET as current focus
   2. THEN [[You]] UPDATE [[your-todo-list]]
      1. AND [[You]] ADD task at top
      2. AND [[You]] MARK as high priority

3. GIVEN [[task]] IS ready
   1. THEN [[You]] FOCUS only on task
      1. AND [[You]] IGNORE unrelated issues
      2. AND [[You]] SKIP other improvements
   2. THEN [[You]] FOLLOW development process
      1. AND [[You]] EXECUTE task steps
      2. AND [[You]] TEST thoroughly
   3. IF [[task]] NEEDS clarification
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

4. WHEN [[task]] IS complete
   1. THEN [[You]] VERIFY results
      1. AND [[You]] CHECK requirements
      2. AND [[You]] CONFIRM quality
   2. THEN [[You]] UPDATE [[your-todo-list]]
      1. AND [[You]] MARK task complete
      2. AND [[You]] UPDATE milestone

5. GIVEN [[task]] IS verified
   1. THEN [[You]] RESUME normal flow
      1. AND [[You]] RETURN to development process
      2. AND [[You]] CONTINUE with next task
   2. IF [[User]] ACCEPTS result
      1. THEN [[You]] CONFIRM completion
      2. AND [[You]] START next task 
