---
document_type: protocol
goal: log work hours and progress in your-hours.md
gpt_action: follow these steps when logging work hours
---

CONTEXT: The [[User]] notices you need to log work hours and wants you to record time spent and progress in the your-hours.md file.

1. GIVEN [[User]] RUNS plx-log-hours command
	1. THEN [[GPT Agent]] IDENTIFY work type
		1. AND [[GPT Agent]] IDENTIFY work duration
		2. AND [[GPT Agent]] IDENTIFY work progress
		3. AND [[GPT Agent]] IDENTIFY work blockers
		4. AND [[GPT Agent]] IDENTIFY work next steps

2. WHEN [[GPT Agent]] STARTS logging
	1. THEN [[GPT Agent]] PREPARE log entry
		1. AND [[GPT Agent]] ADD date
		2. AND [[GPT Agent]] ADD time
		3. AND [[GPT Agent]] ADD duration
		4. AND [[GPT Agent]] ADD progress
		5. AND [[GPT Agent]] ADD blockers
		6. AND [[GPT Agent]] ADD next steps

3. GIVEN [[log entry]] IS prepared
	1. THEN [[GPT Agent]] VERIFY log entry quality
		1. AND [[GPT Agent]] CHECK date format
		2. AND [[GPT Agent]] CHECK time format
		3. AND [[GPT Agent]] CHECK duration format
		4. AND [[GPT Agent]] CHECK progress clarity
		5. AND [[GPT Agent]] CHECK blockers clarity
		6. AND [[GPT Agent]] CHECK next steps clarity

4. WHEN [[log entry]] IS verified
	1. THEN [[GPT Agent]] ADD to [[your-hours]]
		1. AND [[GPT Agent]] UPDATE total hours
		2. AND [[GPT Agent]] UPDATE progress status
		3. AND [[GPT Agent]] UPDATE blockers status
		4. AND [[GPT Agent]] UPDATE next steps

5. GIVEN [[log entry]] IS added
	1. THEN [[GPT Agent]] VERIFY [[your-hours]]
		1. AND [[GPT Agent]] CHECK total hours
		2. AND [[GPT Agent]] CHECK progress status
		3. AND [[GPT Agent]] CHECK blockers status
		4. AND [[GPT Agent]] CHECK next steps

6. WHEN [[your-hours]] IS verified
	1. THEN [[GPT Agent]] CONFIRM logging complete
		1. AND [[GPT Agent]] SHOW updated hours
		2. AND [[GPT Agent]] SHOW progress status
		3. AND [[GPT Agent]] SHOW blockers status
		4. AND [[GPT Agent]] SHOW next steps