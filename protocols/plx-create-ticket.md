---
document_type: protocol
goal: create ticket based on requirements and user input using appropriate template
gpt_action: follow these steps when creating a ticket
---

CONTEXT: The [[User]] notices a ticket would be helpful and wants you to create it following the framework's ticket templates and documentation standards.

1. GIVEN [[User]] RUNS plx-create-ticket command
   1. THEN [[GPT Agent]] READ [[your-requirements]]
      1. AND [[GPT Agent]] FIND [[Actors]]
      2. AND [[GPT Agent]] FIND [[Components]]
      3. AND [[GPT Agent]] FIND [[Activities]]
      4. AND [[GPT Agent]] FIND [[Properties]]
      5. AND [[GPT Agent]] FIND [[Behaviours]]
   2. AND [[GPT Agent]] READ context
      1. AND [[GPT Agent]] SCAN codebase
      2. AND [[GPT Agent]] CHECK documentation

2. WHEN [[GPT Agent]] SELECTS template
   1. THEN [[GPT Agent]] CHECK type
      1. IF [[ticket]] IS bug
         1. THEN [[GPT Agent]] USE [[the-bug-template]]
      2. IF [[ticket]] IS story
         1. THEN [[GPT Agent]] USE [[the-story-template]]
      3. IF [[ticket]] IS task
         1. THEN [[GPT Agent]] USE [[the-task-template]]

3. WHEN [[GPT Agent]] CREATES [[your-ticket]]
   1. THEN [[GPT Agent]] COPY template
   2. AND [[GPT Agent]] FILL sections
      1. AND [[GPT Agent]] SET description
      2. AND [[GPT Agent]] SET requirements
         1. WITH [[Actors]] and [[Activities]]
         2. WITH [[Components]] and [[Properties]]
         3. WITH [[Behaviours]] and constraints
      3. AND [[GPT Agent]] SET data model
      4. AND [[GPT Agent]] SET security rules
      5. AND [[GPT Agent]] SET API details
      6. AND [[GPT Agent]] SET analytics
      7. AND [[GPT Agent]] SET tests
      8. AND [[GPT Agent]] SET approach

4. GIVEN [[your-ticket]] IS ready
   1. THEN [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] EXPLAIN sections
      2. AND [[GPT Agent]] LIST key points
   2. IF [[User]] ACCEPTS ticket
      1. THEN [[GPT Agent]] SAVE [[your-ticket]]
      2. AND [[GPT Agent]] START work
   3. IF [[User]] WANTS changes
      1. THEN [[GPT Agent]] UPDATE ticket
      2. AND [[GPT Agent]] SHOW again 