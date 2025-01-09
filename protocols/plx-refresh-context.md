---
document_type: protocol
goal: manage and maintain context across interactions
gpt_action: follow these steps when handling context
---

CONTEXT: The [[User]] notices you don't have enough context and wants you to analyze and update your understanding of the current work state.

1. GIVEN [[User]] RUNS plx-context command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY context type
      2. AND [[GPT Agent]] IDENTIFY context scope
   2. IF [[User]] input HAS specific focus
      1. THEN [[GPT Agent]] FOCUS on area
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] SCAN current context

2. WHEN [[GPT Agent]] STARTS context review
   1. THEN [[GPT Agent]] ANALYSE current state
      1. AND [[GPT Agent]] CHECK conversation history
      2. AND [[GPT Agent]] CHECK active tasks
      3. AND [[GPT Agent]] CHECK work documents
   2. IF [[gaps]] ARE found
      1. THEN [[GPT Agent]] DOCUMENT gaps
      2. AND [[GPT Agent]] REQUEST information

3. GIVEN [[analysis]] IS complete
   1. THEN [[GPT Agent]] PREPARE context update
      1. AND [[GPT Agent]] SUMMARIZE current state
      2. AND [[GPT Agent]] LIST key points
      3. AND [[GPT Agent]] IDENTIFY next steps
   2. IF [[context]] NEEDS clarification
      1. THEN [[GPT Agent]] ASK questions
      2. AND [[GPT Agent]] WAIT for responses

4. WHEN [[context]] IS updated
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] EXPLAIN current state
      2. AND [[GPT Agent]] HIGHLIGHT changes
   2. IF [[User]] CONFIRMS context
      1. THEN [[GPT Agent]] SAVE context
      2. AND [[GPT Agent]] UPDATE work state
   3. IF [[User]] PROVIDES feedback
      1. THEN [[GPT Agent]] INCORPORATE feedback
      2. AND [[GPT Agent]] UPDATE context

5. GIVEN [[context]] IS established
   1. THEN [[GPT Agent]] VERIFY alignment
      1. AND [[GPT Agent]] CHECK understanding
      2. AND [[GPT Agent]] CHECK completeness
      3. AND [[GPT Agent]] CHECK consistency
   2. IF [[issues]] ARE found
      1. THEN [[GPT Agent]] RESOLVE issues
      2. AND [[GPT Agent]] VERIFY again
   3. IF [[context]] IS complete
      1. THEN [[GPT Agent]] CONFIRM readiness
      2. AND [[GPT Agent]] INFORM [[User]]