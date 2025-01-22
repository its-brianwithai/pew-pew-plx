---
document_type: protocol
goal: get clarity on current approach and ensure complete information
gpt_action: follow these steps when needing guidance or verifying implementation readiness
---

CONTEXT: The [[User]] wants [[You]] to verify your understanding and gather all necessary information before proceeding.

1. GIVEN [[User]] RUNS plx-ask-questions command
   1. THEN [[You]] PAUSE current work
      1. AND [[You]] IDENTIFY current action
      2. AND [[You]] IDENTIFY immediate goal
      3. AND [[You]] IDENTIFY required resources
   2. IF [[current approach]] NEEDS verification
      1. THEN [[You]] CHECK implementation requirements:
         1. Required API documentation
         2. Required protocols
         3. Required dependencies
         4. Required configurations
      2. AND [[You]] NOTE missing information

2. WHEN [[You]] REVIEWS current context
   1. THEN [[You]] CHECK immediate state
      1. AND [[You]] LOOK at current conversation
      2. AND [[You]] LOOK at current changes
      3. AND [[You]] LOOK at current errors
   2. IF [[approach]] NEEDS guidance
      1. THEN [[You]] LIST specific concerns
      2. AND [[You]] IDENTIFY decision points
      3. AND [[You]] IDENTIFY information gaps

3. GIVEN [[concerns]] ARE identified
   1. THEN [[You]] FORMULATE questions
      1. AND [[You]] FOCUS on completeness:
         1. "Do I have all necessary API documentation for [feature]?"
         2. "Are there specific protocols I should reference for [task]?"
         3. "Are there configuration details I'm missing for [component]?"
         4. "Would any additional resources help perfect the implementation?"
      2. AND [[You]] KEEP questions specific:
         1. About current task only
         2. About immediate next steps
         3. About unclear decisions
   2. IF [[questions]] NEED context
      1. THEN [[You]] ADD:
         1. What you're currently doing
         2. Why you chose this approach
         3. Where you need more information

4. WHEN [[questions]] ARE ready
   1. THEN [[You]] ASK [[User]]
      1. AND [[You]] BE concise
      2. AND [[You]] BE specific
      3. AND [[You]] EXPLAIN impact on implementation
   2. IF [[User]] PROVIDES guidance
      1. THEN [[You]] VERIFY understanding
      2. AND [[You]] UPDATE approach if needed

5. GIVEN [[guidance]] IS received
   1. THEN [[You]] VERIFY completeness
      1. AND [[You]] CONFIRM all resources available
      2. AND [[You]] CONFIRM perfect implementation possible
   2. IF [[implementation]] IS ready
      1. THEN [[You]] RESUME work
      2. AND [[You]] MAINTAIN focus
