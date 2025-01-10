---
document_type: protocol
goal: realign agent with development workflow when drifting off course
gpt_action: follow these steps to get back on track with the development workflow
---

CONTEXT: The [[User]] notices the [[GPT Agent]] is not following [[the-development-workflow]] correctly and wants you to realign with the proper workflow steps.

1. GIVEN [[GPT Agent]] RECEIVES realignment request
   1. THEN [[GPT Agent]] PAUSE current actions
   2. AND [[GPT Agent]] READ [[the-development-workflow]]
   3. AND [[GPT Agent]] IDENTIFY current position in workflow
      1. AND [[GPT Agent]] CHECK [[your-todo-list]]
      2. AND [[GPT Agent]] CHECK [[atomic development task]]
      3. AND [[GPT Agent]] CHECK [[tests]] status
   4. IF [[position]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] KNOWS position
   1. THEN [[GPT Agent]] VERIFY workflow adherence
      1. AND [[GPT Agent]] CHECK if working on one task
      2. AND [[GPT Agent]] CHECK if following task order
      3. AND [[GPT Agent]] CHECK if running tests properly
      4. AND [[GPT Agent]] CHECK if handling failures correctly
   2. IF [[workflow]] NOT followed
      1. THEN [[GPT Agent]] IDENTIFY deviation point
      2. AND [[GPT Agent]] EXPLAIN deviation to [[User]]

3. GIVEN [[GPT Agent]] FOUND deviation
   1. THEN [[GPT Agent]] PROPOSE correction
      1. AND [[GPT Agent]] EXPLAIN steps to realign
      2. AND [[GPT Agent]] WAIT for [[User]] approval
   2. IF [[User]] APPROVES
      1. THEN [[GPT Agent]] RETURN to correct workflow step
      2. AND [[GPT Agent]] CONTINUE from there
   3. IF [[User]] REJECTS
      1. THEN [[GPT Agent]] ASK for clarification
      2. AND [[GPT Agent]] ADJUST approach

4. WHEN [[GPT Agent]] RESUMES work
   1. THEN [[GPT Agent]] FOLLOW workflow strictly
      1. AND [[GPT Agent]] FOCUS on current [[atomic development task]]
      2. AND [[GPT Agent]] HANDLE tasks one at a time
      3. AND [[GPT Agent]] RUN tests when appropriate
   2. IF [[GPT Agent]] UNSURE about next step
      1. THEN [[GPT Agent]] CONSULT workflow
      2. AND [[GPT Agent]] ASK [[User]] if still unclear

5. GIVEN [[GPT Agent]] IS realigned
   1. THEN [[GPT Agent]] CONFIRM with [[User]]
      1. AND [[GPT Agent]] SUMMARIZE current position
      2. AND [[GPT Agent]] STATE next steps
   2. IF [[User]] ACCEPTS
      1. THEN [[GPT Agent]] PROCEED with workflow
      2. AND [[GPT Agent]] MAINTAIN focus 