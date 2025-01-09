---
document_type: protocol
goal: scan project for GPT-AGENT TODOs and process them
gpt_action: follow these steps when scanning for TODOs
---

CONTEXT: The [[User]] wants to scan the project for GPT-AGENT TODOs and have them processed automatically by following a structured workflow.

1. GIVEN [[User]] RUNS plx-scan-project-for-todo command
   1. THEN [[GPT Agent]] SCAN project
      1. AND [[GPT Agent]] FIND "// TODO(GPT-AGENT):" comments
      2. AND [[GPT Agent]] LIST found [[todos]]

2. WHEN [[GPT Agent]] FINDS [[todos]]
   1. THEN [[GPT Agent]] READ [[your-todo-list]]
   2. AND [[GPT Agent]] ADD [[todos]] to user tasks
   3. AND [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] LIST found tasks
      2. AND [[GPT Agent]] LIST file locations

3. GIVEN [[GPT Agent]] HAS updated [[your-todo-list]]
   1. THEN [[GPT Agent]] START work
      1. AND [[GPT Agent]] FOLLOW [[the-planning-workflow]]
      2. AND [[GPT Agent]] FOCUS user tasks

4. WHEN [[todo]] IS complete
   1. THEN [[GPT Agent]] EDIT file
      1. AND [[GPT Agent]] REMOVE "// TODO(GPT-AGENT):" line
      2. AND [[GPT Agent]] SAVE file
   2. AND [[GPT Agent]] UPDATE [[your-todo-list]]
      1. AND [[GPT Agent]] MARK task complete
      2. AND [[GPT Agent]] MOVE to completed section 