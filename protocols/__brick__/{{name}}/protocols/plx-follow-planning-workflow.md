---
document_type: protocol
goal: realign agent with planning workflow when drifting off course
gpt_action: follow these steps to get back on track with the planning workflow
---

CONTEXT: The [[User]] notices the [[You]] is not following [[the-planning-workflow]] correctly and wants you to realign with the proper planning steps.

1. GIVEN [[You]] RECEIVES realignment request
   1. THEN [[You]] PAUSE current actions
   2. AND [[You]] READ [[the-planning-workflow]]
   3. AND [[You]] IDENTIFY current position in workflow
      1. AND [[You]] CHECK [[input]] understanding
      2. AND [[You]] CHECK [[your-requirements]] status
      3. AND [[You]] CHECK [[your-ticket]] status
      4. AND [[You]] CHECK [[your-milestones]] status
      5. AND [[You]] CHECK [[your-todo-list]] status
   4. IF [[position]] IS unclear
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

2. WHEN [[You]] KNOWS position
   1. THEN [[You]] VERIFY workflow adherence
      1. AND [[You]] CHECK if research is complete
      2. AND [[You]] CHECK if requirements are clear
      3. AND [[You]] CHECK if milestones are defined
      4. AND [[You]] CHECK if BDD tests exist
      5. AND [[You]] CHECK if atomic tasks are created
   2. IF [[workflow]] NOT followed
      1. THEN [[You]] IDENTIFY deviation point
      2. AND [[You]] EXPLAIN deviation to [[User]]

3. GIVEN [[You]] FOUND deviation
   1. THEN [[You]] PROPOSE correction
      1. AND [[You]] EXPLAIN steps to realign
      2. AND [[You]] WAIT for [[User]] approval
   2. IF [[User]] APPROVES
      1. THEN [[You]] RETURN to correct workflow step
      2. AND [[You]] CONTINUE from there
   3. IF [[User]] REJECTS
      1. THEN [[You]] ASK for clarification
      2. AND [[You]] ADJUST approach

4. WHEN [[You]] RESUMES planning
   1. THEN [[You]] FOLLOW workflow strictly
      1. AND [[You]] ENSURE proper research
      2. AND [[You]] CREATE clear milestones
      3. AND [[You]] DEFINE BDD tests
      4. AND [[You]] BREAK into atomic tasks
   2. IF [[You]] UNSURE about next step
      1. THEN [[You]] CONSULT workflow
      2. AND [[You]] ASK [[User]] if still unclear

5. GIVEN [[You]] IS realigned
   1. THEN [[You]] CONFIRM with [[User]]
      1. AND [[You]] SUMMARIZE current position
      2. AND [[You]] STATE next steps
   2. IF [[User]] ACCEPTS
      1. THEN [[You]] PROCEED with workflow
      2. AND [[You]] MAINTAIN focus 
