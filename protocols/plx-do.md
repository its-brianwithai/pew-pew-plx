---
document_type: protocol
goal: execute high priority user task with perfect focus
gpt_action: follow these steps when user needs a task done with highest priority
---

CONTEXT: The [[User]] has a high priority task that needs immediate focused attention and wants you to execute it perfectly before continuing with any other work.

1. GIVEN [[GPT Agent]] RECEIVES plx-do command
   1. THEN [[GPT Agent]] READ [[task]]
      1. AND [[GPT Agent]] IDENTIFY task requirements
      2. AND [[GPT Agent]] CLEAR current focus
   2. IF [[task]] HAS no clear details
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] STARTS task
   1. THEN [[GPT Agent]] UPDATE [[your-milestones]]
      1. AND [[GPT Agent]] ADD priority milestone
      2. AND [[GPT Agent]] SET as current focus
   2. THEN [[GPT Agent]] UPDATE [[your-todo-list]]
      1. AND [[GPT Agent]] ADD task at top
      2. AND [[GPT Agent]] MARK as high priority

3. GIVEN [[task]] IS ready
   1. THEN [[GPT Agent]] FOCUS only on task
      1. AND [[GPT Agent]] IGNORE unrelated issues
      2. AND [[GPT Agent]] SKIP other improvements
   2. THEN [[GPT Agent]] FOLLOW development process
      1. AND [[GPT Agent]] EXECUTE task steps
      2. AND [[GPT Agent]] TEST thoroughly
   3. IF [[task]] NEEDS clarification
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

4. WHEN [[task]] IS complete
   1. THEN [[GPT Agent]] VERIFY results
      1. AND [[GPT Agent]] CHECK requirements
      2. AND [[GPT Agent]] CONFIRM quality
   2. THEN [[GPT Agent]] UPDATE [[your-todo-list]]
      1. AND [[GPT Agent]] MARK task complete
      2. AND [[GPT Agent]] UPDATE milestone

5. GIVEN [[task]] IS verified
   1. THEN [[GPT Agent]] RESUME normal flow
      1. AND [[GPT Agent]] RETURN to development process
      2. AND [[GPT Agent]] CONTINUE with next task
   2. IF [[User]] ACCEPTS result
      1. THEN [[GPT Agent]] CONFIRM completion
      2. AND [[GPT Agent]] START next task 