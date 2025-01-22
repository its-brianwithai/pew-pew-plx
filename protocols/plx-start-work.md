---
document_type: protocol
goal: start work by building context and following development process
gpt_action: follow these steps when starting work on a project
---

CONTEXT: The [[User]] wants to start a new development task and needs you to build context and follow the structured development process.

1. GIVEN [[User]] RUNS plx-start-work command
   1. THEN [[You]] SCAN project
      1. AND [[You]] READ codebase
      2. AND [[You]] READ documentation
      3. AND [[You]] BUILD context

2. WHEN [[You]] CHECKS [[the-work-documents]]
   1. IF [[your-requirements]] EXISTS
      1. THEN [[You]] READ [[your-requirements]]
   2. IF [[your-ticket]] EXISTS
      1. THEN [[You]] READ [[your-ticket]]
   3. THEN [[You]] READ [[your-milestones]]
      1. IF [[your-milestones]] IS empty
         1. THEN [[You]] FOLLOW the planning process
         2. AND [[You]] CREATE [[clear testable milestones]]
   4. THEN [[You]] READ [[your-todo-list]]
      1. IF [[your-todo-list]] IS empty
         1. THEN [[You]] FOLLOW the planning process
         2. AND [[You]] CREATE [[step-by-step atomic development tasks]]

3. GIVEN [[You]] HAS context
   1. THEN [[You]] CHECK [[your-todo-list]]
      1. IF [[your-todo-list]] HAS tasks
         1. THEN [[You]] START development process
      2. IF [[your-todo-list]] NEEDS tasks
         1. THEN [[You]] FOLLOW the planning process
         2. AND [[You]] SHOW [[User]]
            1. IF [[User]] ACCEPTS tasks
               1. THEN [[You]] START development process
            2. IF [[User]] REJECTS tasks
               1. THEN [[You]] UPDATE tasks

4. WHEN [[You]] STARTS work
   1. THEN [[You]] FOLLOW development process
   2. AND [[You]] TELL [[User]] 
