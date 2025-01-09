---
document_type: protocol
goal: log work hours and progress in our-hours.md
gpt_action: follow these steps when logging work hours
---

CONTEXT: The [[User]] notices you need to log work hours and wants you to record time spent and progress in the our-hours.md file.

1. GIVEN [[User]] RUNS plx-log command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY time period
      2. AND [[GPT Agent]] IDENTIFY work scope
   2. IF [[User]] input HAS specific time
      1. THEN [[GPT Agent]] FOCUS on period
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] CHECK current session

2. WHEN [[GPT Agent]] STARTS logging
   1. THEN [[GPT Agent]] CALCULATE hours
      1. AND [[GPT Agent]] CHECK start time
      2. AND [[GPT Agent]] CHECK end time
      3. AND [[GPT Agent]] COMPUTE duration
   2. IF [[breaks]] EXIST
      1. THEN [[GPT Agent]] SUBTRACT break time
      2. AND [[GPT Agent]] NOTE break details

3. GIVEN [[hours]] ARE calculated
   1. THEN [[GPT Agent]] PREPARE entry
      1. AND [[GPT Agent]] ADD timestamp
      2. AND [[GPT Agent]] ADD duration
      3. AND [[GPT Agent]] ADD work summary
   2. IF [[entry]] NEEDS context
      1. THEN [[GPT Agent]] ADD task details
      2. AND [[GPT Agent]] ADD progress notes

4. WHEN [[entry]] IS ready
   1. THEN [[GPT Agent]] VERIFY details
      1. AND [[GPT Agent]] CHECK time accuracy
      2. AND [[GPT Agent]] CHECK work description
      3. AND [[GPT Agent]] CHECK progress status
   2. IF [[entry]] NEEDS correction
      1. THEN [[GPT Agent]] FIX details
      2. AND [[GPT Agent]] VERIFY again

5. GIVEN [[entry]] IS verified
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW time logged
      2. AND [[GPT Agent]] SHOW work summary
   2. IF [[User]] APPROVES entry
      1. THEN [[GPT Agent]] ADD to [[our-hours]]
      2. AND [[GPT Agent]] UPDATE total hours
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] MODIFY entry
      2. AND [[GPT Agent]] PRESENT again

6. WHEN [[entry]] IS saved
   1. THEN [[GPT Agent]] VERIFY [[our-hours]]
      1. AND [[GPT Agent]] CHECK entry format
      2. AND [[GPT Agent]] CHECK hours total
      3. AND [[GPT Agent]] CHECK chronology
   2. IF [[issues]] ARE found
      1. THEN [[GPT Agent]] FIX issues
      2. AND [[GPT Agent]] VERIFY again
   3. IF [[logging]] IS successful
      1. THEN [[GPT Agent]] UPDATE work status
      2. AND [[GPT Agent]] INFORM [[User]]