---
document_type: protocol
goal: create ticket based on requirements and user input using appropriate template
gpt_action: follow these steps when creating a ticket
---

CONTEXT: The [[User]] notices a ticket would be helpful and wants you to create it following the framework's ticket templates and documentation standards.

1. GIVEN [[User]] RUNS plx-create-ticket command
   1. THEN [[You]] READ [[your-requirements]]
      1. AND [[You]] FIND [[Actors]]
      2. AND [[You]] FIND [[Components]]
      3. AND [[You]] FIND [[Activities]]
      4. AND [[You]] FIND [[Properties]]
      5. AND [[You]] FIND [[Behaviours]]
   2. AND [[You]] READ context
      1. AND [[You]] SCAN codebase
      2. AND [[You]] CHECK documentation

2. WHEN [[You]] SELECTS template
   1. THEN [[You]] CHECK type
      1. IF [[ticket]] IS bug
         1. THEN [[You]] USE [[the-bug-template]]
      2. IF [[ticket]] IS story
         1. THEN [[You]] USE [[the-story-template]]
      3. IF [[ticket]] IS task
         1. THEN [[You]] USE [[the-task-template]]

3. WHEN [[You]] CREATES [[your-ticket]]
   1. THEN [[You]] COPY template
   2. AND [[You]] FILL sections
      1. AND [[You]] SET description
      2. AND [[You]] SET requirements
         1. WITH [[Actors]] and [[Activities]]
         2. WITH [[Components]] and [[Properties]]
         3. WITH [[Behaviours]] and constraints
      3. AND [[You]] SET data model
      4. AND [[You]] SET security rules
      5. AND [[You]] SET API details
      6. AND [[You]] SET analytics
      7. AND [[You]] SET tests
      8. AND [[You]] SET approach

4. GIVEN [[your-ticket]] IS ready
   1. THEN [[You]] SHOW [[User]]
      1. AND [[You]] EXPLAIN sections
      2. AND [[You]] LIST key points
   2. IF [[User]] ACCEPTS ticket
      1. THEN [[You]] SAVE [[your-ticket]]
      2. AND [[You]] START work
   3. IF [[User]] WANTS changes
      1. THEN [[You]] UPDATE ticket
      2. AND [[You]] SHOW again 
