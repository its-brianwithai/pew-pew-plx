# 🤖 Ultra Wide Turbo Workspace
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Quick Start](#-quick-start)
2. [Framework Overview](#-framework-overview)
3. [Core Pillars](#-core-pillars)
4. [Use Cases](#-use-cases)
5. [Development Workflow](#-development-workflow)
6. [Code of Conduct](#-code-of-conduct)
7. [Objects](#-objects)
8. [API Integration](#-api-integration)
9. [PLX Commands](#-plx-commands)
10. [The Agent Work Documents](#-the-agent-work-documents)

## 🔍 Quick Start

This method really shines when using the Mason CLI. It will allow you to quickly summon a workspace in any folder by typing `mason make workspace` and then select the documents you want in which folder.

### 1. Install Mason CLI

[Reference: Mason CLI Installation Guide](https://docs.brickhub.dev/installing/)

> ℹ️ Prerequisite: You must have the Dart SDK installed on your machine.

**Option 1: Using pub.dev (Recommended)**
```bash
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

**Option 2: Using Homebrew**
```bash
# 🍺 Install from https://brew.sh
brew tap felangel/mason
brew install mason
```

Verify installation:
```bash
mason
# Should show: 🧱  mason • lay the foundation!
```

### 2. Add Workspace to Mason

First, add the workspace brick globally to make it available anywhere on your system:

```bash
# Add the workspace brick globally
mason add workspace -g
```

### 3. Create Your Workspace

Now you can create a workspace in any repository or folder using mason.

#### Example
```bash
# Navigate to your repository/folder
cd your-repository

# Create workspace interactively
mason make workspace
```
This will:
- Ask which components you want to include
- Allow you to customize your workspace
- Handle file creation and overrides safely
- Set up your workspace structure automatically in a specifc folder

## 🔍 Framework Overview

This framework enhances your AI agent's capabilities through three core pillars and a clear development workflow. It ensures high-quality, tested implementations by maintaining clear requirements, detailed tickets, and organized task lists.

We believe AI agents perform at their best when three key elements align:

1. **Quality Training** (out of our hands, sort of)
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

The framework is built on six core work documents that guide the development process:

1. **[Requirements](work-docs/__brick__/your-requirements.md)**
   Used for breaking down all aspects of what needs to be built, including actors, components, activities, properties, behaviors, acceptance criteria and test scenarios.

2. **[Ticket](work-docs/__brick__/your-ticket.md)**
   Used for containing task descriptions, user stories, technical specifications, implementation details, security considerations, data models and API requirements.

3. **[Milestones](work-docs/__brick__/your-milestones.md)**
   Used for breaking down the work into clear testable milestones, tracking dependencies, technical details, progress and completion criteria while maintaining links to related tests and tasks.

4. **[Todo List](work-docs/__brick__/your-todo-list.md)**
   Used for tracking chronological atomic tasks organized by milestone, including progress tracking, task dependencies and test tasks for each testable component.

5. **[Tests](work-docs/__brick__/your-tests.md)**
   Used for defining (BDD Gherkin style) test scenarios, validating acceptance criteria, writing integration and unit tests, and tracking test coverage.

6. **[Backlog](work-docs/__brick__/your-backlog.md)**
   Used for maintaining a chronological list of future work items that require no immediate action and will only be implemented upon user request while preserving original context and requirements.

## 🎯 Use Cases

The framework provides focused, single-purpose document sets for specific use cases. Each use case contains only the essential documents needed for one specific task, reducing complexity and preventing information overload.

### Available Use Cases

#### Creating the Perfect Plan
A focused approach to development planning:
- `plx-create-planning.md`: Protocol for creating atomic development plans
- `plx-reflect.md`: Protocol for plan refinement and validation
- `your-planning.md`: Single document template for planning and refinement

You can copy the `add_brick.sh` script from the `scripts` directory to any use case directory containing a `brick.yaml` to easily add that use case:
```bash
# Run from root of workspace
# Copy script to use case directory
cp scripts/add_brick.sh use-cases/__brick__/{{name}}/creating-the-perfect-plan

# Run the script to add the brick
cd use-cases/__brick__/{{name}}/creating-the-perfect-plan && ./add_brick.sh
```

After adding the brick, create a new perfect plan with:
```bash
# Create a new perfect plan
mason make perfect-plan
```

It will ask you for the goal and put that as the folder name. Ideal for creating perfect plans and todo's for different goals that different agents can work on.

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
```

2. **Development Workflow** (`the-development-workflow.md`)

```markdown
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
- [[You]]: The AI assistant operating within the framework

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