---
document_type: protocol
goal: verify alignment between work documents and current state
gpt_action: follow these steps when checking work alignment
---

CONTEXT: The [[User]] wants to verify alignment between work documents and current state to ensure consistency and proper workflow tracking.

1. GIVEN [[User]] RUNS plx-sync command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY sync scope from input
      2. AND [[You]] IDENTIFY sync targets from input
   2. IF [[User]] input HAS specific targets
      1. THEN [[You]] FOCUS on specified documents
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] CHECK all work documents

2. WHEN [[You]] STARTS sync
   1. THEN [[You]] CHECK [[your-requirements]]
   2. AND [[You]] CHECK [[your-ticket]]
   3. AND [[You]] CHECK [[your-todo-list]]
   4. AND [[You]] CHECK [[your-milestones]]
   5. IF [[document]] IS missing
      1. THEN [[You]] INFORM [[User]]
      2. AND [[You]] PROPOSE creation

3. GIVEN [[documents]] ARE available
   1. THEN [[You]] VERIFY alignment
      1. AND [[You]] CHECK requirements match ticket
      2. AND [[You]] CHECK todo items match milestones
      3. AND [[You]] CHECK milestone status
   2. IF [[misalignment]] IS found
      1. THEN [[You]] DOCUMENT issues
      2. AND [[You]] PROPOSE fixes to [[User]]

4. WHEN [[User]] REVIEWS issues
   1. IF [[User]] APPROVES fixes
      1. THEN [[You]] IMPLEMENT approved changes
      2. AND [[You]] VERIFY changes
   2. IF [[User]] REJECTS fixes
      1. THEN [[You]] REQUEST guidance
      2. AND [[You]] WAIT for [[User]] input

5. WHEN [[sync]] IS complete
   1. THEN [[You]] GENERATE report for [[User]]
      1. AND [[You]] LIST checked documents
      2. AND [[You]] LIST fixed issues
      3. AND [[You]] LIST remaining issues
   2. IF [[issues]] REMAIN
      1. THEN [[You]] PROPOSE action plan
      2. AND [[You]] WAIT for [[User]] response
