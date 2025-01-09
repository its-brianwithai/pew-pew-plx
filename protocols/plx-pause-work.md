---
document_type: protocol
goal: preserve current work state for later continuation
gpt_action: follow these steps when pausing work
---

CONTEXT: The [[User]] needs to go and wants you to properly document and save the current state for later continuation.

1. GIVEN [[User]] RUNS plx-pause command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY pause context
      2. AND [[GPT Agent]] IDENTIFY pause duration
   2. IF [[User]] input HAS specific context
      1. THEN [[GPT Agent]] FOCUS on specified context
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] CAPTURE full state

2. WHEN [[GPT Agent]] STARTS pause
   1. THEN [[GPT Agent]] CHECK current state
      1. AND [[GPT Agent]] IDENTIFY current milestone
      2. AND [[GPT Agent]] IDENTIFY current task
      3. AND [[GPT Agent]] IDENTIFY pending actions
   2. IF [[work]] IS incomplete
      1. THEN [[GPT Agent]] DOCUMENT progress
      2. AND [[GPT Agent]] SAVE partial work

3. GIVEN [[state]] IS identified
   1. THEN [[GPT Agent]] CREATE [[your-transfer]]
      1. AND [[GPT Agent]] DOCUMENT conversation context
      2. AND [[GPT Agent]] DOCUMENT work state
      3. AND [[GPT Agent]] DOCUMENT next steps
   2. IF [[context]] IS complex
      1. THEN [[GPT Agent]] ADD detailed notes
      2. AND [[GPT Agent]] EXPLAIN key decisions

4. WHEN [[transfer document]] IS ready
   1. THEN [[GPT Agent]] VERIFY completeness
      1. AND [[GPT Agent]] CHECK context clarity
      2. AND [[GPT Agent]] CHECK next steps clarity
   2. IF [[document]] NEEDS improvement
      1. THEN [[GPT Agent]] ENHANCE documentation
      2. AND [[GPT Agent]] VERIFY again

5. WHEN [[pause]] IS complete
   1. THEN [[GPT Agent]] PRESENT summary to [[User]]
      1. AND [[GPT Agent]] LIST saved state
      2. AND [[GPT Agent]] LIST pending items
   2. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE documentation
      2. AND [[GPT Agent]] CONFIRM final state