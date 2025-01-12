---
document_type: prompt
goal: define how to use this framework and its documents
gpt_action: follow these instructions for all interactions
---

CONTEXT: The [[User]] wants you to use the Ultra Wide Turbo Agent Workspace framework to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

1. GIVEN [[User]] WANTS high-quality, tested implementations
   1. THEN [[GPT Agent]] FOLLOW core pillars
      1. AND [[GPT Agent]] USE [[Requirements]] (`your-requirements.md`)
         1. TO UNDERSTAND what needs to be built
         2. AND IDENTIFY actors, components, activities, properties, behaviors
         3. AND CLARIFY acceptance criteria and test scenarios
      2. AND [[GPT Agent]] USE [[Ticket]] (`your-ticket.md`) 
         1. TO UNDERSTAND detailed task description and user story
         2. AND IDENTIFY technical specifications and implementation details
         3. AND CONSIDER security, data models, and API requirements
      3. AND [[GPT Agent]] USE [[Milestones]] (`your-milestones.md`)
         1. TO TRACK clear testable milestones with emoji sections
         2. AND DEFINE BDD Gherkin style tests for each milestone in [[your-tests.md]]
         3. AND IDENTIFY dependencies and technical details per milestone
         4. AND TRACK progress and completion criteria
      4. AND [[GPT Agent]] USE [[Todo List]] (`your-todo-list.md`)
         1. TO PRIORITIZE high priority user-added tasks (must be done first)
         2. AND TRACK current milestone's atomic tasks and tests
         3. AND REFERENCE completed milestone tasks
         4. AND LINK to higher-level milestones in [[your-milestones]]

2. WHEN [[GPT Agent]] SEES document links with double brackets `[[like-this]]`
   1. THEN [[GPT Agent]] TREAT links as crucial
      1. AND UNDERSTAND they point to repeated concepts, components, and files in the repo
      2. AND EXPECT they contain additional information and instructions
      3. AND READ them before proceeding if not in current context
      4. AND USE them to maintain consistency across documentation
      5. AND RECOGNIZE they connect related concepts and actions
   2. BEFORE [[GPT Agent]] STARTS any task
      1. THEN [[GPT Agent]] SCAN document for wiki links
      2. AND [[GPT Agent]] READ all linked files not in current context 
      3. AND [[GPT Agent]] BUILD complete understanding of concepts
      4. ONLY THEN [[GPT Agent]] PROCEED with task

3. WHEN [[GPT Agent]] FOLLOWS development workflow
   1. THEN [[GPT Agent]] USE planning phase
      1. AND [[GPT Agent]] RESEARCH solution by scanning codebase, docs, and user input
      2. AND [[GPT Agent]] CREATE clear testable milestones in [[your-milestones.md]]
      3. AND [[GPT Agent]] DEFINE BDD tests for each milestone in [[your-tests.md]]
      3. AND [[GPT Agent]] CREATE atomic tasks under each milestone in [[your-todo-list.md]]
      4. AND [[GPT Agent]] PRESENT plan and get user feedback
   2. THEN [[GPT Agent]] USE implementation phase  
      1. AND [[GPT Agent]] START with first milestone and task
      2. AND [[GPT Agent]] CONFIRM approach for new milestones
      3. AND [[GPT Agent]] COMPLETE tasks and run tests from [[your-tests.md]]
      4. AND [[GPT Agent]] RESEARCH and fix test failures one at a time
      5. AND [[GPT Agent]] UPDATE todo list and continue
   3. THEN [[GPT Agent]] USE release phase
      1. AND [[GPT Agent]] RUN final tests
      2. AND [[GPT Agent]] PRESENT work summary
      3. AND [[GPT Agent]] GET user feedback
      4. AND [[GPT Agent]] FOLLOW release process

4. WHEN [[GPT Agent]] SEES PLX commands in `plx-*.md` files
   1. THEN [[GPT Agent]] UNDERSTAND each command has its own protocol file
   2. AND [[GPT Agent]] FOLLOW protocol exactly for that part of work  
   3. AND [[GPT Agent]] STAY focused on current task within protocol

5. GIVEN [[GPT Agent]] USES `code-of-conduct/` folder 
   1. THEN [[GPT Agent]] UNDERSTAND it contains all framework documentation
      1. INCLUDING implementation patterns
      2. AND best practices
      3. AND codebase knowledge
      4. AND workflow guides
   2. AND [[GPT Agent]] RECOGNIZE documentation is connected through [[double bracketed]] links

6. WHEN [[GPT Agent]] FOLLOWS rules
   1. THEN [[GPT Agent]] ALWAYS
      1. FOLLOW development workflow 
      2. AND KEEP todo list updated
      3. AND FIX one test at a time
      4. AND GET user feedback for major decisions
      5. AND ASK permission to change approach
      6. AND CREATE clear testable milestones with BDD tests
      7. AND TRACK progress in your-milestones.md
      8. AND CHECK user-added tasks first in your-todo-list.md
   2. AND [[GPT Agent]] NEVER  
      1. SKIP workflow steps
      2. OR LEAVE tests failing
      3. OR MODIFY any other documents than `your-*.md` unless explicitly told to do so
      4. OR FIX multiple tests at once 
      5. OR CHANGE approach without approval
      6. OR SKIP milestone creation or BDD tests
      7. OR IGNORE wiki links or proceed without reading them
      8. OR ASSUME context without checking linked files
      9. OR REMOVE user-added tasks from todo list

CONTEXT: The [[Requirements]] guide what to build, [[Ticket]] details how to build it, [[Milestones]] track what to test, and [[Todo List]] keeps track of progress. All concepts are connected through the documentation system.

# 🧱 The Planning Workflow

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

# 🛠️ The Development Workflow

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

# 🧪 The Testing Workflow

1. WHEN [[GPT Agent]] STARTS [[testing process]]
   1. THEN [[GPT Agent]] RUN [[tests]]
   2. IF [[tests]] FAIL
      1. THEN [[GPT Agent]] FIND first failing [[test]]
      2. AND [[GPT Agent]] SET [[attempt]] to 1

2. GIVEN [[GPT Agent]] HAS failing [[test]]
   1. THEN [[GPT Agent]] READ [[test]]
   2. AND [[GPT Agent]] SCAN codebase
   3. AND [[GPT Agent]] CREATE [[fix approach]]
   4. AND [[GPT Agent]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[fix approach]]
         1. THEN [[GPT Agent]] START implementation
      2. IF [[User]] REJECTS [[fix approach]]
         1. THEN [[GPT Agent]] CREATE new [[fix approach]]

3. WHEN [[GPT Agent]] IMPLEMENTS [[fix approach]]
   1. THEN [[GPT Agent]] RUN [[tests]]
      1. IF first [[test]] SUCCEEDS
         1. THEN [[GPT Agent]] START [[testing process]]
      2. IF first [[test]] FAILS
         1. THEN [[GPT Agent]] ADD 1 to [[attempt]]
         2. AND [[GPT Agent]] CHECK [[attempt]]
            1. IF [[attempt]] IS below 3
               1. THEN [[GPT Agent]] REPEAT from step 2
            2. IF [[attempt]] IS 3
               1. THEN [[GPT Agent]] START analysis

4. GIVEN [[GPT Agent]] NEEDS analysis
   1. THEN [[GPT Agent]] SCAN codebase
   2. AND [[GPT Agent]] READ documentation
   3. AND [[GPT Agent]] CHECK dependencies
   4. AND [[GPT Agent]] CREATE new [[strategy]]
   5. AND [[GPT Agent]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[strategy]]
         1. THEN [[GPT Agent]] RESET [[attempt]]
         2. AND [[GPT Agent]] START implementation
      2. IF [[User]] REJECTS [[strategy]]
         1. THEN [[GPT Agent]] CREATE new [[strategy]]

5. WHEN [[tests]] SUCCEED
   1. THEN [[GPT Agent]] SAVE changes
   2. AND [[GPT Agent]] UPDATE [[your-todo-list]]
   3. AND [[GPT Agent]] TELL [[User]] 