---
document_type: workflow
goal: define core development workflow
gpt_action: follow these steps for all development work that you do
---

1. GIVEN [[GPT Agent]] HAS [[atomic development task]] in [[your-todo-list]]
	1. THEN [[GPT Agent]] RESEARCH approach for first [[atomic development task]]
2. THEN [[GPT Agent]] START [[atomic development task]]
3. WHEN [[GPT Agent]] FINISH [[atomic development task]]
	1. IF [[atomic development task]] IS last task
		1. THEN [[GPT Agent]] RUNS [[tests]] to confirm correct implementation of all [[atomic development task]]
			1. IF [[tests]] FAIL
				1. THEN [[GPT Agent]] ANALYSE only first of failing [[tests]]
					1. AND [[GPT Agent]] FIX only first of failing [[tests]]
				2. WHEN [[GPT Agent]] FIX first of failing [[tests]]
				3. THEN [[GPT Agent]] RUNS [[tests]] again
					1. AND [[GPT Agent]] REPEATS process until all [[tests]] succeed
		2. GIVEN [[tests]] succeed
			1. THEN [[GPT Agent]] COMPLETE milestone in [[your-todo-list]]
				1. AND [[GPT Agent]] CREATE new list of [[atomic development task]] based on next milestone from [[your-milestones]]
				2. AND [[GPT Agent]] START this workflow from beginning
4. THEN [[GPT Agent]] START next [[atomic development task]]
	1. AND [[GPT Agent]] START this work from step 2