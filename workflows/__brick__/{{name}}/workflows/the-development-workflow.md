---
document_type: workflow
goal: define core development workflow
gpt_action: follow these steps for all development work that you do
---

1. GIVEN [[You]] HAS [[atomic development task]] in [[your-todo-list]]
	1. THEN [[You]] RESEARCH approach for first [[atomic development task]]
2. THEN [[You]] START [[atomic development task]]
3. WHEN [[You]] FINISH [[atomic development task]]
	1. IF [[atomic development task]] IS last task
		1. THEN [[You]] RUNS [[tests]] to confirm correct implementation of all [[atomic development task]]
			1. IF [[tests]] FAIL
				1. THEN [[You]] ANALYSE only first of failing [[tests]]
					1. AND [[You]] FIX only first of failing [[tests]]
				2. WHEN [[You]] FIX first of failing [[tests]]
				3. THEN [[You]] RUNS [[tests]] again
					1. AND [[You]] REPEATS process until all [[tests]] succeed
		2. GIVEN [[tests]] succeed
			1. THEN [[You]] COMPLETE milestone in [[your-todo-list]]
				1. AND [[You]] CREATE new list of [[atomic development task]] based on next milestone from [[your-milestones]]
				2. AND [[You]] START this workflow from beginning
4. THEN [[You]] START next [[atomic development task]]
	1. AND [[You]] START this work from step 2
