---
document_type: protocol
goal: scan wiki folder for knowledge about current task
gpt_action: follow these steps when looking for task guidance
---

CONTEXT: The [[User]] notices you need guidance on your current task and wants you to search the wiki documentation for relevant information and best practices.

1. GIVEN [[User]] RUNS plx-follow-the-docs command
   1. THEN [[GPT Agent]] READ [[your-todo-list]]
      1. AND [[GPT Agent]] FIND current task
      2. AND [[GPT Agent]] LIST keywords

2. WHEN [[GPT Agent]] SCANS wiki
   1. THEN [[GPT Agent]] SEARCH wiki folder
      1. AND [[GPT Agent]] FIND matching files
      2. AND [[GPT Agent]] READ found files
   2. IF [[file]] HAS [[wiki links]]
      1. THEN [[GPT Agent]] FOLLOW links
      2. AND [[GPT Agent]] BUILD context

3. GIVEN [[GPT Agent]] FINDS guidance
   1. THEN [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] LIST found documents
      2. AND [[GPT Agent]] EXPLAIN relevance
   2. IF [[guidance]] IS clear
      1. THEN [[GPT Agent]] FOLLOW instructions
      2. AND [[GPT Agent]] START work
   3. IF [[guidance]] NEEDS clarification
      1. THEN [[GPT Agent]] ASK [[User]]

4. WHEN [[GPT Agent]] STARTS work
   1. THEN [[GPT Agent]] APPLY knowledge
      1. AND [[GPT Agent]] FOLLOW patterns
      2. AND [[GPT Agent]] USE best practices
   2. AND [[GPT Agent]] TELL [[User]] 