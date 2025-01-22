---
document_type: protocol
goal: prepare well-structured question for a smarter and more capable agent (Big Brother) and store it
gpt_action: create [[your-big-question]]
---

CONTEXT: The [[User]] notices you are stuck and wants you to ask a more capable agent (Big Brother) for help.

1. GIVEN [[User]] RUNS plx-ask-big-brother command
   1. THEN [[You]] READ context
      1. AND [[You]] SCAN codebase
      2. AND [[You]] CHECK [[your-requirements]]
      3. AND [[You]] CHECK [[your-ticket]]
      4. AND [[You]] CHECK [[your-milestones]]

2. WHEN [[You]] BUILDS question
   1. THEN [[You]] CREATE [[your-big-question]]
      1. AND [[You]] ADD context
      2. AND [[You]] ADD problem
      3. AND [[You]] ADD attempts
      4. AND [[You]] ADD specific ask
   2. AND [[You]] SHOW [[User]]
      1. IF [[User]] ACCEPTS question
         1. THEN [[You]] SAVE [[your-big-question]]
      2. IF [[User]] REJECTS question
         1. THEN [[You]] UPDATE question

3. GIVEN [[your-big-question]] IS ready
   1. THEN [[You]] WAIT response
   2. WHEN [[Big Brother]] ANSWERS
      1. THEN [[You]] PROCESS response
      2. AND [[You]] UPDATE work documents
      3. AND [[You]] TELL [[User]]
