---
document_type: protocol
goal: verify alignment between work documents and current state
gpt_action: follow these steps when checking work alignment
---

CONTEXT: The [[User]] wants to verify alignment between work documents and current state to ensure consistency and proper workflow tracking.

1. GIVEN [[User]] RUNS plx-sync command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY sync scope from input
      2. AND [[GPT Agent]] IDENTIFY sync targets from input
   2. IF [[User]] input HAS specific targets
      1. THEN [[GPT Agent]] FOCUS on specified documents
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] CHECK all work documents

2. WHEN [[GPT Agent]] STARTS sync
   1. THEN [[GPT Agent]] CHECK [[your-requirements]]
   2. AND [[GPT Agent]] CHECK [[your-ticket]]
   3. AND [[GPT Agent]] CHECK [[your-todo-list]]
   4. AND [[GPT Agent]] CHECK [[your-milestones]]
   5. IF [[document]] IS missing
      1. THEN [[GPT Agent]] INFORM [[User]]
      2. AND [[GPT Agent]] PROPOSE creation

3. GIVEN [[documents]] ARE available
   1. THEN [[GPT Agent]] VERIFY alignment
      1. AND [[GPT Agent]] CHECK requirements match ticket
      2. AND [[GPT Agent]] CHECK todo items match milestones
      3. AND [[GPT Agent]] CHECK milestone status
   2. IF [[misalignment]] IS found
      1. THEN [[GPT Agent]] DOCUMENT issues
      2. AND [[GPT Agent]] PROPOSE fixes to [[User]]

4. WHEN [[User]] REVIEWS issues
   1. IF [[User]] APPROVES fixes
      1. THEN [[GPT Agent]] IMPLEMENT approved changes
      2. AND [[GPT Agent]] VERIFY changes
   2. IF [[User]] REJECTS fixes
      1. THEN [[GPT Agent]] REQUEST guidance
      2. AND [[GPT Agent]] WAIT for [[User]] input

5. WHEN [[sync]] IS complete
   1. THEN [[GPT Agent]] GENERATE report for [[User]]
      1. AND [[GPT Agent]] LIST checked documents
      2. AND [[GPT Agent]] LIST fixed issues
      3. AND [[GPT Agent]] LIST remaining issues
   2. IF [[issues]] REMAIN
      1. THEN [[GPT Agent]] PROPOSE action plan
      2. AND [[GPT Agent]] WAIT for [[User]] response