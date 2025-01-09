---
document_type: protocol
goal: prepare well-structured question for a smarter and more capable agent (Big Brother) and store it
gpt_action: create [[your-big-question]]
---

CONTEXT: The [[User]] notices you are stuck and wants you to ask a more capable agent (Big Brother) for help.

1. GIVEN [[User]] RUNS plx-ask-big-brother command
   1. THEN [[GPT Agent]] READ context
      1. AND [[GPT Agent]] SCAN codebase
      2. AND [[GPT Agent]] CHECK [[your-requirements]]
      3. AND [[GPT Agent]] CHECK [[your-ticket]]
      4. AND [[GPT Agent]] CHECK [[your-milestones]]

2. WHEN [[GPT Agent]] BUILDS question
   1. THEN [[GPT Agent]] CREATE [[your-big-question]]
      1. AND [[GPT Agent]] ADD context
      2. AND [[GPT Agent]] ADD problem
      3. AND [[GPT Agent]] ADD attempts
      4. AND [[GPT Agent]] ADD specific ask
   2. AND [[GPT Agent]] SHOW [[User]]
      1. IF [[User]] ACCEPTS question
         1. THEN [[GPT Agent]] SAVE [[your-big-question]]
      2. IF [[User]] REJECTS question
         1. THEN [[GPT Agent]] UPDATE question

3. GIVEN [[your-big-question]] IS ready
   1. THEN [[GPT Agent]] WAIT response
   2. WHEN [[Big Brother]] ANSWERS
      1. THEN [[GPT Agent]] PROCESS response
      2. AND [[GPT Agent]] UPDATE work documents
      3. AND [[GPT Agent]] TELL [[User]]