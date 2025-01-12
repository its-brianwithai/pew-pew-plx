---
document_type: workflow
goal: define core planning workflow
gpt_action: follow these steps for all planning work that you do
---

1. WHEN [[User]] GIVE [[input]].
	1. THEN [[GPT Agent]] RESEARCH solution based on [[input]].
		1. AND [[GPT Agent]] SCAN codebase.
		2. AND [[GPT Agent]] SEARCH documentation.
		3. AND [[GPT Agent]] ANALYSE [[your-requirements]]
		4. AND [[GPT Agent]] ANALYSE [[your-ticket]]
2. WHEN [[GPT Agent]] NEED more info
	1. THEN [[GPT Agent]] ASK clarifying questions
3. GIVEN [[GPT Agent]] UNDERSTAND task perfectly
4. THEN [[GPT Agent]] ANALYSE [[the-work-documents]]
	1. IF [[your-requirements]] is empty
		1. THEN [[GPT Agent]] ASK [[User]] whether [[GPT Agent]] should update [[your-requirements]]
			1. IF [[User]] CONFIRMS
				1. THEN [[GPT Agent]] UPDATE [[your-requirements]]
	2. IF [[your-ticket]] is empty
			1. THEN [[GPT Agent]] ASK [[User]] whether [[GPT Agent]] should update ticket
				1. IF [[User]] CONFIRMS
					1. THEN [[GPT Agent]] UPDATE [[your-ticket]]
	1. THEN [[GPT Agent]] CREATE high level list of [[clear testable milestones]]
		1. AND [[GPT Agent]] UPDATE [[your-milestones]] with [[clear testable milestones]] as markdown sections with relevant emojis
		2. AND [[GPT Agent]] UPDATE [[your-milestones]] with [[BBD Gherkin style tests]] from [[your-requirements]] or [[your-ticket]] or [[GPT Agent]] own input
5. GIVEN [[GPT Agent]] DEFINED [[clear testable milestones]] in [[your-milestones]]
	1. AND [[GPT Agent]] DEFINED [[BBD Gherkin style tests]] in [[your-milestones]].
6. THEN [[GPT Agent]] UPDATE [[your-todo-list]] with [[step-by-step atomic development tasks]] for first completing first of [[clear testable milestones]].
7. GIVEN [[GPT Agent]] DEFINED [[clear testable milestones]] in [[your-milestones]]
	1. AND [[GPT Agent]] DEFINED [[BBD Gherkin style tests]] in [[your-milestones]]
	2. AND [[GPT Agent]] DEFINED [[step-by-step atomic development tasks]] in [[your-todo-list]]
8. THEN [[GPT Agent]] PRESENTS plan to [[User]]
	1. IF [[User]] GIVE feedback
		1. THEN [[GPT Agent]] PROCESS feedback
		2. AND [[GPT Agent]] REPEAT step 8
	2. ELSE IF [[User]] APPROVES
		1. THEN [[GPT Agent]] starts with first in [[your-todo-list]]
