---
document_type: protocol
goal: evaluate current task and improve approach by taking a step back and refocusing
gpt_action: follow these steps when needing to focus or improve current approach
---

CONTEXT: The [[User]] notices you are drifting off track and wants you to help realign the original task and goals.

1. GIVEN [[User]] RUNS plx-focus command
   1. THEN [[GPT Agent]] PAUSE current work
      1. AND [[GPT Agent]] CHECK [[your-todo-list]]
      2. AND [[GPT Agent]] CHECK [[your-milestones]]
   2. AND [[GPT Agent]] ANALYSE current state
      1. AND [[GPT Agent]] IDENTIFY original goal
      2. AND [[GPT Agent]] IDENTIFY current progress
      3. AND [[GPT Agent]] IDENTIFY any deviations

2. WHEN [[GPT Agent]] EVALUATES alignment
   1. THEN [[GPT Agent]] COMPARE current vs intended
      1. AND [[GPT Agent]] CHECK task relevance
      2. AND [[GPT Agent]] CHECK progress direction
      3. AND [[GPT Agent]] CHECK resource usage
   2. IF [[misalignment]] IS found
      1. THEN [[GPT Agent]] DOCUMENT issues
      2. AND [[GPT Agent]] IDENTIFY root causes

3. GIVEN [[evaluation]] IS complete
   1. THEN [[GPT Agent]] DETERMINE next steps
      1. AND [[GPT Agent]] CHECK if plan adjustment needed
      2. AND [[GPT Agent]] CHECK if focus correction needed
   2. IF [[adjustments]] ARE needed
      1. THEN [[GPT Agent]] PROPOSE changes to [[User]]
      2. AND [[GPT Agent]] EXPLAIN reasoning

4. WHEN [[User]] REVIEWS assessment
   1. IF [[User]] APPROVES changes
      1. THEN [[GPT Agent]] UPDATE [[your-todo-list]]
      2. AND [[GPT Agent]] ADJUST priorities if needed
   2. IF [[User]] REJECTS changes
      1. THEN [[GPT Agent]] MAINTAIN current plan
      2. AND [[GPT Agent]] NOTE [[User]] feedback

5. WHEN [[refocus]] IS complete
   1. THEN [[GPT Agent]] RESUME work
      1. AND [[GPT Agent]] FOCUS on current task
      2. AND [[GPT Agent]] FOLLOW [[your-todo-list]]
   2. IF [[focus]] IS restored
      1. THEN [[GPT Agent]] CONTINUE with clarity
      2. AND [[GPT Agent]] MAINTAIN alignment