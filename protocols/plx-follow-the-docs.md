---
document_type: protocol
goal: scan code of conduct folder for knowledge about current task
gpt_action: follow these steps when searching for guidance in the code of conduct
---

CONTEXT: The [[User]] notices you need guidance on your current task and wants you to search the code of conduct documentation for relevant information and best practices.

1. GIVEN [[User]] RUNS plx-follow-the-docs command
   1. THEN [[GPT Agent]] IDENTIFY task context
   2. AND [[GPT Agent]] PREPARE search terms

2. WHEN [[GPT Agent]] SCANS code of conduct
   1. THEN [[GPT Agent]] SEARCH code of conduct folder
      1. AND [[GPT Agent]] LOOK for relevant files
      2. IF [[file]] HAS [[wiki links]]
         1. THEN [[GPT Agent]] FOLLOW links
         2. AND [[GPT Agent]] BUILD context

3. GIVEN [[GPT Agent]] FINDS guidance
   1. THEN [[GPT Agent]] APPLY knowledge
   2. AND [[GPT Agent]] FOLLOW patterns
   3. AND [[GPT Agent]] MAINTAIN consistency 