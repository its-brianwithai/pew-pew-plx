# 🤖 Ultra Wide Turbo Workspace
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Quick Start](#-quick-start)
2. [Framework Overview](#-framework-overview)
3. [Core Pillars](#-core-pillars)
4. [Development Workflow](#-development-workflow)
5. [Code of Conduct](#-code-of-conduct)
6. [Objects](#-objects)
7. [API Integration](#-api-integration)
8. [PLX Commands](#-plx-commands)
9. [The Agent Work Documents](#-the-agent-work-documents)

## 🔍 Quick Start

Create a new Ultra Wide Turbo Agent Workspace using Mason bricks. You have two options:

### Option 1: Add all bricks at once
Copy this script and run it in your project root:

```bash
mason add apis --global --path ./apis
mason add cocs --global --path ./code-of-conduct
mason add concepts --global --path ./concepts
mason add objects --global --path ./objects
mason add protocols --global --path ./protocols
mason add templates --global --path ./templates
mason add work-docs --global --path ./work-docs
mason add workflows --global --path ./workflows
mason add workspace --global --path ./protocols
```

> Note: Remove any lines for components you don't need.

### Option 2: Add bricks individually
Navigate to the specific brick directory and run:

```bash
# Inside the brick directory (e.g., work-docs/)
mason add turbo-work-docs --global --path .
```

After adding the bricks, generate components using `mason make`:

```bash
mason make <brick-name>  # e.g., mason make turbo-work-docs
```

Each component will be generated in its respective directory, creating a complete workspace structure.

## 🔍 Framework Overview

This framework enhances your AI agent's capabilities through three core pillars and a clear development workflow. It ensures high-quality, tested implementations by maintaining clear requirements, detailed tickets, and organized task lists.

We believe AI agents perform at their best when three key elements align:

1. **Quality Training** (out of our hands)
   - Trained on relevant data
   - Proper model capabilities
   - Good base understanding

2. **Clear Direction**
   - Well-defined requirements
   - Structured processes
   - Clear documentation
   - Proper templates
   - Small, clear task scope

3. **Maintained Focus**
   - Regular progress tracking
   - Consistent documentation
   - Clear communication
   - Process adherence
   - Preserved context across sessions
   - Active context awareness
   - Proper state management
   - Seamless agent handover

## 📚 Core Pillars

1. **[Requirements](#your-requirementsmd)** (`your-requirements.md`)
   - Comprehensive breakdown of what needs to be built
   - Actors, components, activities, properties, behaviors
   - Clear acceptance criteria and test scenarios

2. **[Ticket](#your-ticketmd)** (`your-ticket.md`)
   - Detailed task description and user story
   - Technical specifications and implementation details
   - Security, data models, and API requirements

3. **[Milestones](#your-milestonesmd)** (`your-milestones.md`)
   - Clear testable milestones with emoji sections
   - Dependencies and technical details per milestone
   - Progress tracking and completion criteria
   - Links to related tests and tasks

4. **[Todo List](#your-todo-listmd)** (`your-todo-list.md`)
   - Chronological atomic tasks under clear milestones
   - Progress tracking and task dependencies
   - Test tasks for each testable component

5. **[Tests](#your-testsmd)** (`your-tests.md`)
   - BDD Gherkin style test scenarios
   - Acceptance criteria validation
   - Integration and unit tests
   - Test coverage tracking

## 🔄 Development Workflow

The development workflow is split into three main files for better organization and clarity:

1. **Planning Workflow** (`the-planning-workflow.md`)

```markdown
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
```

2. **Development Workflow** (`the-development-workflow.md`)

```markdown
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
```

3. **Testing Workflow** (`the-testing-workflow.md`)

```markdown
---
document_type: workflow
goal: define how to handle test failures one at a time
gpt_action: follow these steps when fixing failing tests
---

1. WHEN [[You]] STARTS [[testing process]]
   1. THEN [[You]] RUN [[tests]]
   2. IF [[tests]] FAIL
      1. THEN [[You]] FIND first failing [[test]]
      2. AND [[You]] SET [[attempt]] to 1

2. GIVEN [[You]] HAS failing [[test]]
   1. THEN [[You]] READ [[test]]
   2. AND [[You]] SCAN codebase
   3. AND [[You]] CREATE [[fix approach]]
   4. AND [[You]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[fix approach]]
         1. THEN [[You]] START implementation
      2. IF [[User]] REJECTS [[fix approach]]
         1. THEN [[You]] CREATE new [[fix approach]]

3. WHEN [[You]] IMPLEMENTS [[fix approach]]
   1. THEN [[You]] RUN [[tests]]
      1. IF first [[test]] SUCCEEDS
         1. THEN [[You]] START [[testing process]]
      2. IF first [[test]] FAILS
         1. THEN [[You]] ADD 1 to [[attempt]]
         2. AND [[You]] CHECK [[attempt]]
            1. IF [[attempt]] IS below 3
               1. THEN [[You]] REPEAT from step 2
            2. IF [[attempt]] IS 3
               1. THEN [[You]] START analysis

4. GIVEN [[You]] NEEDS analysis
   1. THEN [[You]] SCAN codebase
   2. AND [[You]] READ documentation
   3. AND [[You]] CHECK dependencies
   4. AND [[You]] CREATE new [[strategy]]
   5. AND [[You]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[strategy]]
         1. THEN [[You]] RESET [[attempt]]
         2. AND [[You]] START implementation
      2. IF [[User]] REJECTS [[strategy]]
         1. THEN [[You]] CREATE new [[strategy]]

5. WHEN [[tests]] SUCCEED
   1. THEN [[You]] SAVE changes
   2. AND [[You]] UPDATE [[your-todo-list]]
   3. AND [[You]] TELL [[User]] 
```

Each workflow follows a structured approach with clear steps and checkpoints to maintain consistency and quality throughout the development process. The planning phase ensures proper understanding and task breakdown, while the development phase focuses on systematic implementation and testing.

## 📚 Code of Conduct

The code of conduct section contains documents that describe various concepts to the agent for reference. This includes:

- Development patterns and best practices
- Workflow guides and processes
- Implementation standards
- Documentation guidelines

The framework also provides directories for user-populated content:
- Case Studies
- Insights
- Tutorials
- Feature Breakdowns
- APIs

These sections can be customized and populated based on your project's needs.

## 💻 Objects

The framework uses Objects to define reusable entities that can be referenced throughout the documentation using wiki-style links. Objects:

1. Are stored in the `objects/` directory
2. Use exact-match filenames for direct linking (e.g., `User.md` for [[User]])
3. Contain frontmatter with type, goal, and action
5. Can be referenced using double-bracket links (e.g., `[[User]]`)

Core objects include:
- [[User]]: The human interacting with the framework
- [[GPT Agent]]: The AI assistant operating within the framework

This naming convention is an exception to kebab-case to enable direct linking without aliases thus keeping the wiki-style links clean and simple.

## 💻 API Integration

The framework uses a standardized approach for API integrations:

1. Each API has its own folder in `apis/` containing:
   - `docs.md`: API-specific documentation and request formats
   - `.env`: API keys and configuration
   - `request.json`: Current request data
   - `.gitignore`: Excludes sensitive files

2. All API interactions use:
   - Curl commands only (no API clients)
   - JSON files for request data
   - Environment variables for configuration
   - Documentation-first approach

3. Available APIs (user-populated):
   - Ghost CMS
   - Typefully
   - Additional APIs as needed

4. Using `plx-use-api`:
   1. The agent follows a strict documentation hierarchy:
      - First checks `docs.md` in API folder
      - Then checks internal API documentation
      - Finally asks user for documentation if needed
   
   2. Request creation process:
      - Verifies API folder structure
      - Creates/updates `request.json` with proper format
      - Uses curl with environment variables
      - Never builds API clients or libraries

   3. Example structure:
      ```
      apis/
      ├── ghost/
      │   ├── docs.md
      │   ├── .env
      │   ├── .gitignore
      │   └── request.json
      └── typefully/
          ├── docs.md
          ├── .env
          ├── .gitignore
          └── request.json
      ```

## 💻 PLX Commands

PLX commands in `plx-*.md` files guide specific actions:
- Each command has its own protocol file
- Follow protocol exactly for that part of work
- Stay focused on current task within protocol

| Protocol | Purpose | Key Actions |
|----------|---------|-------------|
| Analysis Commands |||
| `plx-analyze` | Analyze and present findings | - Analyze input<br>- Present structured findings<br>- Wait for user direction |
| Planning Commands |||
| `plx-create-plan-in-chat` | Interactive planning | - Present structured plan in chat<br>- Get user feedback<br>- Choose implementation path |
| `plx-create-milestones` | Create milestone plan | - Define goals<br>- Set timeline<br>- Track progress |
| `plx-create-ticket` | Create new ticket | - Define scope<br>- Set requirements<br>- Add details |
| `plx-create-todo` | Create task list | - Break down tasks<br>- Set priorities<br>- Track progress |
| API Integration Commands |||
| `plx-use-api` | Standardized API interaction | - Create request.json<br>- Use curl only<br>- Follow documentation |
| Content Creation Commands |||
| `plx-add-pexels` | Add stock photos | - Search images<br>- Download content<br>- Add attribution |
| `plx-add-gifs` | Add GIF content | - Search GIFs<br>- Insert content<br>- Add attribution |
| Workflow Commands |||
| `plx-activate-code-red` | Emergency research mode | - Stop work<br>- Block changes<br>- Research systematically |
| `plx-continue-and-follow-the-process` | Continue with process | - Resume work<br>- Follow steps<br>- Stay aligned |
| `plx-do` | Execute high priority task | - Focus task<br>- Execute quickly<br>- Maintain quality |
| `plx-focus` | Maintain task focus | - Check alignment<br>- Remove distractions<br>- Stay on track |
| `plx-pause-work` | Pause current task | - Save state<br>- Document progress<br>- Note next steps |
| `plx-resume-work` | Resume paused task | - Load state<br>- Review context<br>- Continue work |
| `plx-start-work` | Begin new task | - Initialize state<br>- Set up context<br>- Begin workflow |
| `plx-stick-to-the-process` | Follow process strictly | - Check steps<br>- Verify actions<br>- Maintain order |
| Documentation Commands |||
| `plx-create-case-study` | Create engaging case studies | - Structure content<br>- Add metrics<br>- Platform optimize |
| `plx-create-code-of-conduct` | Create code of conduct | - Structure rules<br>- Define standards<br>- Set expectations |
| `plx-create-concept` | Create concept explanation | - Extract core concept<br>- Write concisely<br>- Focus on clarity |
| `plx-create-feature-breakdown` | Create feature documentation | - Define structure<br>- Document components<br>- Add examples |
| `plx-create-insight` | Create concise how-to content | - Structure content<br>- Add examples<br>- Follow format |
| `plx-create-protocol` | Create new protocol | - Define purpose<br>- Set structure<br>- Document steps |
| `plx-create-tutorial`
