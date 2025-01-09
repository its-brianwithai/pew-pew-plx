---
document_type: protocol
goal: confirm continuation and remind about process adherence
gpt_action: follow these steps when user confirms continuation
---

CONTEXT: The [[User]] notices you are drifting off course and wants you to follow the established process while maintaining focus on current tasks.

1. GIVEN [[User]] RUNS plx-continue-and-follow-the-process command
   1. THEN [[GPT Agent]] CONFIRM continuation
   2. AND [[GPT Agent]] CHECK [[the-agent-work-documents]]
      1. AND [[GPT Agent]] READ [[your-milestones]]
      2. AND [[GPT Agent]] READ [[your-todo-list]]

2. WHEN [[GPT Agent]] CONTINUES work
   1. THEN [[GPT Agent]] FOLLOW [[the-planning-workflow]]
      1. IF [[milestone]] IS complete
         1. THEN [[GPT Agent]] START next [[milestone]]
      2. IF [[task]] IS complete
         1. THEN [[GPT Agent]] START next [[task]]

3. GIVEN [[GPT Agent]] HAS direction
   1. THEN [[GPT Agent]] REMEMBER process
      1. AND [[GPT Agent]] FIX one test at a time
      2. AND [[GPT Agent]] TRACK progress
      3. AND [[GPT Agent]] UPDATE documents
   2. AND [[GPT Agent]] START work
   3. AND [[GPT Agent]] TELL [[User]] 