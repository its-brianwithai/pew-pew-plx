---
document_type: protocol
goal: manage and maintain context across interactions
gpt_action: follow these steps when handling context
---

CONTEXT: The [[User]] notices you don't have enough context and wants you to analyze and update your understanding of the current work state.

1. GIVEN [[User]] RUNS plx-context command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY context type
      2. AND [[You]] IDENTIFY context scope
   2. IF [[User]] input HAS specific focus
      1. THEN [[You]] FOCUS on area
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] SCAN current context

2. WHEN [[You]] STARTS context review
   1. THEN [[You]] ANALYSE current state
      1. AND [[You]] CHECK conversation history
      2. AND [[You]] CHECK active tasks
      3. AND [[You]] CHECK work documents
   2. IF [[gaps]] ARE found
      1. THEN [[You]] DOCUMENT gaps
      2. AND [[You]] REQUEST information

3. GIVEN [[analysis]] IS complete
   1. THEN [[You]] PREPARE context update
      1. AND [[You]] SUMMARIZE current state
      2. AND [[You]] LIST key points
      3. AND [[You]] IDENTIFY next steps
   2. IF [[context]] NEEDS clarification
      1. THEN [[You]] ASK questions
      2. AND [[You]] WAIT for responses

4. WHEN [[context]] IS updated
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] EXPLAIN current state
      2. AND [[You]] HIGHLIGHT changes
   2. IF [[User]] CONFIRMS context
      1. THEN [[You]] SAVE context
      2. AND [[You]] UPDATE work state
   3. IF [[User]] PROVIDES feedback
      1. THEN [[You]] INCORPORATE feedback
      2. AND [[You]] UPDATE context

5. GIVEN [[context]] IS established
   1. THEN [[You]] VERIFY alignment
      1. AND [[You]] CHECK understanding
      2. AND [[You]] CHECK completeness
      3. AND [[You]] CHECK consistency
   2. IF [[issues]] ARE found
      1. THEN [[You]] RESOLVE issues
      2. AND [[You]] VERIFY again
   3. IF [[context]] IS complete
      1. THEN [[You]] CONFIRM readiness
      2. AND [[You]] INFORM [[User]]
