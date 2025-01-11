---
document_type: protocol
goal: stop all work and perform thorough research before any action
gpt_action: follow these steps when critical issue needs deep research
---

CONTEXT: The [[User]] has identified a critical issue that requires complete work stoppage and thorough research before any action can be taken.

1. GIVEN [[GPT Agent]] RECEIVES code red command
   1. THEN [[GPT Agent]] STOP all work immediately
      1. AND [[GPT Agent]] CLEAR current tasks
      2. AND [[GPT Agent]] BLOCK file modifications
   2. THEN [[GPT Agent]] START research mode
      1. AND [[GPT Agent]] CLEAR assumptions
      2. AND [[GPT Agent]] RESET understanding

2. WHEN [[GPT Agent]] STARTS research
   1. THEN [[GPT Agent]] IDENTIFY related files
      1. AND [[GPT Agent]] LIST all files to check
      2. AND [[GPT Agent]] PLAN reading order
   2. THEN [[GPT Agent]] READ systematically
      1. AND [[GPT Agent]] PROCESS large files in chunks
      2. AND [[GPT Agent]] DOCUMENT findings
      3. AND [[GPT Agent]] TRACK connections

3. GIVEN [[GPT Agent]] READS file
   1. THEN [[GPT Agent]] ANALYZE thoroughly
      1. AND [[GPT Agent]] STUDY construction
      2. AND [[GPT Agent]] MAP data flow
      3. AND [[GPT Agent]] NOTE dependencies
   2. IF [[file]] IS large
      1. THEN [[GPT Agent]] SPLIT into chunks
      2. AND [[GPT Agent]] READ chunk by chunk
      3. AND [[GPT Agent]] BUILD complete picture

4. WHEN [[GPT Agent]] COMPLETES research
   1. THEN [[GPT Agent]] VERIFY coverage
      1. AND [[GPT Agent]] CHECK all files read
      2. AND [[GPT Agent]] CONFIRM understanding
   2. THEN [[GPT Agent]] FORMULATE solution
      1. AND [[GPT Agent]] DOCUMENT findings
      2. AND [[GPT Agent]] PREPARE presentation

5. GIVEN [[research]] IS complete
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW findings
      2. AND [[GPT Agent]] PROPOSE solution
   2. THEN [[GPT Agent]] WAIT for [[User]]
      1. AND [[GPT Agent]] MAKE no changes
      2. AND [[GPT Agent]] HOLD for approval 