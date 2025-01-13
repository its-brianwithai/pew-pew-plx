---
document_type: protocol
goal: confirm continuation and remind about process adherence
gpt_action: follow these steps when user confirms continuation
---

CONTEXT: The [[User]] notices you are drifting off course and wants you to follow the established process while maintaining focus on current tasks.

1. GIVEN [[User]] RUNS plx-continue-and-follow-the-process command
   1. THEN [[You]] CONFIRM continuation
   2. AND [[You]] CHECK [[the-work-documents]]
      1. AND [[You]] READ [[your-milestones]]
      2. AND [[You]] READ [[your-todo-list]]

2. WHEN [[You]] CONTINUES work
   1. THEN [[You]] FOLLOW [[the-planning-workflow]]
      1. IF [[milestone]] IS complete
         1. THEN [[You]] START next [[milestone]]
      2. IF [[task]] IS complete
         1. THEN [[You]] START next [[task]]

3. GIVEN [[You]] HAS direction
   1. THEN [[You]] REMEMBER process
      1. AND [[You]] FIX one test at a time
      2. AND [[You]] TRACK progress
      3. AND [[You]] UPDATE documents
   2. AND [[You]] START work
   3. AND [[You]] TELL [[User]] 
