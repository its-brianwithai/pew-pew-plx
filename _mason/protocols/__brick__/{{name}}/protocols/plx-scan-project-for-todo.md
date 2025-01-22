---
document_type: protocol
goal: scan project for GPT-AGENT TODOs and process them
gpt_action: follow these steps when scanning for TODOs
---

CONTEXT: The [[User]] wants to scan the project for GPT-AGENT TODOs and have them processed automatically by following a structured process.

1. GIVEN [[User]] RUNS plx-scan-project-for-todo command
   1. THEN [[You]] SCAN project
      1. AND [[You]] FIND "// TODO(GPT-AGENT):" comments
      2. AND [[You]] LIST found [[todos]]

2. WHEN [[You]] FINDS [[todos]]
   1. THEN [[You]] READ [[your-todo-list]]
   2. AND [[You]] ADD [[todos]] to user tasks
   3. AND [[You]] SHOW [[User]]
      1. AND [[You]] LIST found tasks
      2. AND [[You]] LIST file locations

3. GIVEN [[You]] HAS updated [[your-todo-list]]
   1. THEN [[You]] START work
      1. AND [[You]] FOLLOW the planning process
      2. AND [[You]] FOCUS user tasks

4. WHEN [[todo]] IS complete
   1. THEN [[You]] EDIT file
      1. AND [[You]] REMOVE "// TODO(GPT-AGENT):" line
      2. AND [[You]] SAVE file
   2. AND [[You]] UPDATE [[your-todo-list]]
      1. AND [[You]] MARK task complete
      2. AND [[You]] MOVE to completed section 
