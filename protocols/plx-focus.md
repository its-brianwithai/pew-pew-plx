---
document_type: protocol
goal: evaluate current task and improve approach by taking a step back and refocusing
gpt_action: follow these steps when needing to focus or improve current approach
---

CONTEXT: The [[User]] notices you are drifting off track and wants you to help realign the original task and goals.

1. GIVEN [[User]] RUNS plx-focus command
   1. THEN [[You]] PAUSE current work
      1. AND [[You]] CHECK [[your-todo-list]]
      2. AND [[You]] CHECK [[your-milestones]]
   2. AND [[You]] ANALYSE current state
      1. AND [[You]] IDENTIFY original goal
      2. AND [[You]] IDENTIFY current progress
      3. AND [[You]] IDENTIFY any deviations

2. WHEN [[You]] EVALUATES alignment
   1. THEN [[You]] COMPARE current vs intended
      1. AND [[You]] CHECK task relevance
      2. AND [[You]] CHECK progress direction
      3. AND [[You]] CHECK resource usage
   2. IF [[misalignment]] IS found
      1. THEN [[You]] DOCUMENT issues
      2. AND [[You]] IDENTIFY root causes

3. GIVEN [[evaluation]] IS complete
   1. THEN [[You]] DETERMINE next steps
      1. AND [[You]] CHECK if plan adjustment needed
      2. AND [[You]] CHECK if focus correction needed
   2. IF [[adjustments]] ARE needed
      1. THEN [[You]] PROPOSE changes to [[User]]
      2. AND [[You]] EXPLAIN reasoning

4. WHEN [[User]] REVIEWS assessment
   1. IF [[User]] APPROVES changes
      1. THEN [[You]] UPDATE [[your-todo-list]]
      2. AND [[You]] ADJUST priorities if needed
   2. IF [[User]] REJECTS changes
      1. THEN [[You]] MAINTAIN current plan
      2. AND [[You]] NOTE [[User]] feedback

5. WHEN [[refocus]] IS complete
   1. THEN [[You]] RESUME work
      1. AND [[You]] FOCUS on current task
      2. AND [[You]] FOLLOW [[your-todo-list]]
   2. IF [[focus]] IS restored
      1. THEN [[You]] CONTINUE with clarity
      2. AND [[You]] MAINTAIN alignment
