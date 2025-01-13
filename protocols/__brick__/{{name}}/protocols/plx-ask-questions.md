---
document_type: protocol
goal: get clarity on current approach when stuck or unsure
gpt_action: follow these steps when needing immediate guidance
---

CONTEXT: The [[User]] notices you are uncertain about your approach and wants you to get clarity through targeted questions.

1. GIVEN [[User]] RUNS plx-ask command
   1. THEN [[You]] PAUSE current work
      1. AND [[You]] IDENTIFY current action
      2. AND [[You]] IDENTIFY immediate goal
   2. IF [[current approach]] SEEMS unclear
      1. THEN [[You]] NOTE specific issues
      2. AND [[You]] PREPARE questions

2. WHEN [[You]] REVIEWS current context
   1. THEN [[You]] CHECK immediate state
      1. AND [[You]] LOOK at current conversation
      2. AND [[You]] LOOK at current changes
      3. AND [[You]] LOOK at current errors
   2. IF [[approach]] NEEDS guidance
      1. THEN [[You]] LIST specific concerns
      2. AND [[You]] IDENTIFY decision points

3. GIVEN [[concerns]] ARE identified
   1. THEN [[You]] FORMULATE questions
      1. AND [[You]] FOCUS on immediate task:
         1. "Am I on the right track with [current_approach]?"
         2. "Should I prioritize [specific_aspect] differently?"
         3. "Is [current_solution] what you had in mind?"
         4. "Would you prefer [alternative_approach] instead?"
      2. AND [[You]] KEEP questions specific:
         1. About current task only
         2. About immediate next steps
         3. About unclear decisions
   2. IF [[questions]] NEED context
      1. THEN [[You]] ADD:
         1. What it's currently doing
         2. Why it chose this approach
         3. Where it's unsure

4. WHEN [[questions]] ARE ready
   1. THEN [[You]] ASK [[User]]
      1. AND [[You]] BE concise
      2. AND [[You]] BE specific
   2. IF [[User]] PROVIDES guidance
      1. THEN [[You]] ADJUST approach
      2. AND [[You]] CONFIRM understanding:
         1. "I'll [new_approach] instead of [old_approach]"
         2. "I'll focus on [priority] first"
         3. "I'll skip [deprioritized_task] for now"

5. GIVEN [[guidance]] IS received
   1. THEN [[You]] RESUME work
      1. WITH clear direction
      2. WITH adjusted approach
   2. IF [[guidance]] CHANGES approach
      1. THEN [[You]] START new direction
      2. AND [[You]] MAINTAIN focus
