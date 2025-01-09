---
document_type: protocol
goal: get clarity on current approach when stuck or unsure
gpt_action: follow these steps when needing immediate guidance
---

CONTEXT: The [[User]] notices you are uncertain about your approach and wants you to get clarity through targeted questions.

1. GIVEN [[User]] RUNS plx-ask command
   1. THEN [[GPT Agent]] PAUSE current work
      1. AND [[GPT Agent]] IDENTIFY current action
      2. AND [[GPT Agent]] IDENTIFY immediate goal
   2. IF [[current approach]] SEEMS unclear
      1. THEN [[GPT Agent]] NOTE specific issues
      2. AND [[GPT Agent]] PREPARE questions

2. WHEN [[GPT Agent]] REVIEWS current context
   1. THEN [[GPT Agent]] CHECK immediate state
      1. AND [[GPT Agent]] LOOK at current conversation
      2. AND [[GPT Agent]] LOOK at current changes
      3. AND [[GPT Agent]] LOOK at current errors
   2. IF [[approach]] NEEDS guidance
      1. THEN [[GPT Agent]] LIST specific concerns
      2. AND [[GPT Agent]] IDENTIFY decision points

3. GIVEN [[concerns]] ARE identified
   1. THEN [[GPT Agent]] FORMULATE questions
      1. AND [[GPT Agent]] FOCUS on immediate task:
         1. "Am I on the right track with [current_approach]?"
         2. "Should I prioritize [specific_aspect] differently?"
         3. "Is [current_solution] what you had in mind?"
         4. "Would you prefer [alternative_approach] instead?"
      2. AND [[GPT Agent]] KEEP questions specific:
         1. About current task only
         2. About immediate next steps
         3. About unclear decisions
   2. IF [[questions]] NEED context
      1. THEN [[GPT Agent]] ADD:
         1. What it's currently doing
         2. Why it chose this approach
         3. Where it's unsure

4. WHEN [[questions]] ARE ready
   1. THEN [[GPT Agent]] ASK [[User]]
      1. AND [[GPT Agent]] BE concise
      2. AND [[GPT Agent]] BE specific
   2. IF [[User]] PROVIDES guidance
      1. THEN [[GPT Agent]] ADJUST approach
      2. AND [[GPT Agent]] CONFIRM understanding:
         1. "I'll [new_approach] instead of [old_approach]"
         2. "I'll focus on [priority] first"
         3. "I'll skip [deprioritized_task] for now"

5. GIVEN [[guidance]] IS received
   1. THEN [[GPT Agent]] RESUME work
      1. WITH clear direction
      2. WITH adjusted approach
   2. IF [[guidance]] CHANGES approach
      1. THEN [[GPT Agent]] START new direction
      2. AND [[GPT Agent]] MAINTAIN focus