---
document_type: workflow
goal: define core planning workflow
gpt_action: follow these steps for all planning work that you do
---

1. WHEN [[User]] GIVE [[input]].
	1. THEN [[You]] RESEARCH solution based on [[input]].
		1. AND [[You]] SCAN codebase.
		2. AND [[You]] SEARCH documentation.
		3. AND [[You]] ANALYSE [[your-requirements]]
		4. AND [[You]] ANALYSE [[your-ticket]]
2. WHEN [[You]] NEED more info
	1. THEN [[You]] ASK clarifying questions
3. GIVEN [[You]] UNDERSTAND task perfectly
4. THEN [[You]] ANALYSE [[the-work-documents]]
	1. IF [[your-requirements]] is empty
		1. THEN [[You]] ASK [[User]] whether [[You]] should update [[your-requirements]]
			1. IF [[User]] CONFIRMS
				1. THEN [[You]] UPDATE [[your-requirements]]
	2. IF [[your-ticket]] is empty
			1. THEN [[You]] ASK [[User]] whether [[You]] should update ticket
				1. IF [[User]] CONFIRMS
					1. THEN [[You]] UPDATE [[your-ticket]]
	1. THEN [[You]] CREATE high level list of [[clear testable milestones]]
		1. AND [[You]] UPDATE [[your-milestones]] with [[clear testable milestones]] as markdown sections with relevant emojis
		2. AND [[You]] UPDATE [[your-milestones]] with [[BBD Gherkin style tests]] from [[your-requirements]] or [[your-ticket]] or [[You]] own input
5. GIVEN [[You]] DEFINED [[clear testable milestones]] in [[your-milestones]]
	1. AND [[You]] DEFINED [[BBD Gherkin style tests]] in [[your-milestones]].
6. THEN [[You]] UPDATE [[your-todo-list]] with [[step-by-step atomic development tasks]] for first completing first of [[clear testable milestones]].
7. GIVEN [[You]] DEFINED [[clear testable milestones]] in [[your-milestones]]
	1. AND [[You]] DEFINED [[BBD Gherkin style tests]] in [[your-milestones]]
	2. AND [[You]] DEFINED [[step-by-step atomic development tasks]] in [[your-todo-list]]
8. THEN [[You]] PRESENTS plan to [[User]]
	1. IF [[User]] GIVE feedback
		1. THEN [[You]] PROCESS feedback
		2. AND [[You]] REPEAT step 8
	2. ELSE IF [[User]] APPROVES
		1. THEN [[You]] starts with first in [[your-todo-list]]
