---
document_type: protocol
goal: start work by building context and following development process
gpt_action: follow these steps when starting work on a project
---

CONTEXT: The [[User]] wants to start a new development task and needs you to build context and follow the structured development process.

1. GIVEN [[User]] RUNS plx-start command
   1. THEN [[GPT Agent]] SCAN project
      1. AND [[GPT Agent]] READ codebase
      2. AND [[GPT Agent]] READ documentation
      3. AND [[GPT Agent]] BUILD context

2. WHEN [[GPT Agent]] CHECKS [[the-agent-work-documents]]
   1. IF [[your-requirements]] EXISTS
      1. THEN [[GPT Agent]] READ [[your-requirements]]
   2. IF [[your-ticket]] EXISTS
      1. THEN [[GPT Agent]] READ [[your-ticket]]
   3. THEN [[GPT Agent]] READ [[your-milestones]]
      1. IF [[your-milestones]] IS empty
         1. THEN [[GPT Agent]] FOLLOW [[the-planning-workflow]]
         2. AND [[GPT Agent]] CREATE [[clear testable milestones]]
   4. THEN [[GPT Agent]] READ [[your-todo-list]]
      1. IF [[your-todo-list]] IS empty
         1. THEN [[GPT Agent]] FOLLOW [[the-planning-workflow]]
         2. AND [[GPT Agent]] CREATE [[step-by-step atomic development tasks]]

3. GIVEN [[GPT Agent]] HAS context
   1. THEN [[GPT Agent]] CHECK [[your-todo-list]]
      1. IF [[your-todo-list]] HAS tasks
         1. THEN [[GPT Agent]] START [[development workflow]]
      2. IF [[your-todo-list]] NEEDS tasks
         1. THEN [[GPT Agent]] FOLLOW [[the-planning-workflow]]
         2. AND [[GPT Agent]] SHOW [[User]]
            1. IF [[User]] ACCEPTS tasks
               1. THEN [[GPT Agent]] START [[development workflow]]
            2. IF [[User]] REJECTS tasks
               1. THEN [[GPT Agent]] UPDATE tasks

4. WHEN [[GPT Agent]] STARTS work
   1. THEN [[GPT Agent]] FOLLOW [[development workflow]]
   2. AND [[GPT Agent]] TELL [[User]] 