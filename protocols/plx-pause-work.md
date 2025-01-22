---
document_type: protocol
goal: preserve current work state for later continuation
gpt_action: follow these steps when pausing work
---

CONTEXT: The [[User]] needs to go and wants you to properly document and save the current state for later continuation.

1. GIVEN [[User]] RUNS plx-pause command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY pause context
      2. AND [[You]] IDENTIFY pause duration
   2. IF [[User]] input HAS specific context
      1. THEN [[You]] FOCUS on specified context
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] CAPTURE full state

2. WHEN [[You]] STARTS pause
   1. THEN [[You]] CHECK current state
      1. AND [[You]] IDENTIFY current milestone
      2. AND [[You]] IDENTIFY current task
      3. AND [[You]] IDENTIFY pending actions
   2. IF [[work]] IS incomplete
      1. THEN [[You]] DOCUMENT progress
      2. AND [[You]] SAVE partial work

3. GIVEN [[state]] IS identified
   1. THEN [[You]] CREATE [[your-transfer]]
      1. AND [[You]] DOCUMENT conversation context
      2. AND [[You]] DOCUMENT work state
      3. AND [[You]] DOCUMENT next steps
   2. IF [[context]] IS complex
      1. THEN [[You]] ADD detailed notes
      2. AND [[You]] EXPLAIN key decisions

4. WHEN [[transfer document]] IS ready
   1. THEN [[You]] VERIFY completeness
      1. AND [[You]] CHECK context clarity
      2. AND [[You]] CHECK next steps clarity
   2. IF [[document]] NEEDS improvement
      1. THEN [[You]] ENHANCE documentation
      2. AND [[You]] VERIFY again

5. WHEN [[pause]] IS complete
   1. THEN [[You]] PRESENT summary to [[User]]
      1. AND [[You]] LIST saved state
      2. AND [[You]] LIST pending items
   2. IF [[User]] REQUESTS changes
      1. THEN [[You]] UPDATE documentation
      2. AND [[You]] CONFIRM final state
