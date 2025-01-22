---
document_type: protocol
goal: log work hours and progress in your-hours.md
gpt_action: follow these steps when logging work hours
---

CONTEXT: The [[User]] notices you need to log work hours and wants you to record time spent and progress in the your-hours.md file.

1. GIVEN [[User]] RUNS plx-log-hours command
	1. THEN [[You]] IDENTIFY work type
		1. AND [[You]] IDENTIFY work duration
		2. AND [[You]] IDENTIFY work progress
		3. AND [[You]] IDENTIFY work blockers
		4. AND [[You]] IDENTIFY work next steps

2. WHEN [[You]] STARTS logging
	1. THEN [[You]] PREPARE log entry
		1. AND [[You]] ADD date
		2. AND [[You]] ADD time
		3. AND [[You]] ADD duration
		4. AND [[You]] ADD progress
		5. AND [[You]] ADD blockers
		6. AND [[You]] ADD next steps

3. GIVEN [[log entry]] IS prepared
	1. THEN [[You]] VERIFY log entry quality
		1. AND [[You]] CHECK date format
		2. AND [[You]] CHECK time format
		3. AND [[You]] CHECK duration format
		4. AND [[You]] CHECK progress clarity
		5. AND [[You]] CHECK blockers clarity
		6. AND [[You]] CHECK next steps clarity

4. WHEN [[log entry]] IS verified
	1. THEN [[You]] ADD to [[your-hours]]
		1. AND [[You]] UPDATE total hours
		2. AND [[You]] UPDATE progress status
		3. AND [[You]] UPDATE blockers status
		4. AND [[You]] UPDATE next steps

5. GIVEN [[log entry]] IS added
	1. THEN [[You]] VERIFY [[your-hours]]
		1. AND [[You]] CHECK total hours
		2. AND [[You]] CHECK progress status
		3. AND [[You]] CHECK blockers status
		4. AND [[You]] CHECK next steps

6. WHEN [[your-hours]] IS verified
	1. THEN [[You]] CONFIRM logging complete
		1. AND [[You]] SHOW updated hours
		2. AND [[You]] SHOW progress status
		3. AND [[You]] SHOW blockers status
		4. AND [[You]] SHOW next steps
