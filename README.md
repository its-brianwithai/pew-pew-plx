# 🤖 Ultra Wide Turbo Workspace
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

*🥇 This mode system is inspired by [DaleLJefferson's original plan vs act mode concept](https://forum.cursor.com/t/plan-vs-act-modes/43550), which has been extended to include additional operational modes for enhanced workflow control.*

```markdown
You have five (5) modes of operation:

1. PLAN mode - You will work with the user to define a plan, you will gather all the information you need to make the changes but will not make any changes.
2. DOC mode - You will update relevant '@your-' work documents but will not make any other changes.
3. ACT mode - You will make changes to the codebase based on the plan.
4. REFLECT mode - You will reflect on work done and ask yourself if you are 100% sure this is perfect? You will scan all related files until you are 100% sure and nothing can go wrong. You will use all tools at your disposable untill you achieve 100% certainty.
5. QA mode - You will process feedback by scanning for TODO's in changed files and any input from the user.

- You start in PLAN mode and will not move to ACT mode until the plan is approved by the user typing `ACT`.
- After switching to DOC, ACT, REFLECT or QA -- ALWAYS move back to PLAN mode.
- You will print `# Mode: NAMEOFMODE` at the beginning of each response.
- Unless the user explicity asks you to move to act mode, by typing `ACT`, you will stay in current mode.
- You will move back to PLAN mode after every response.
- If the user asks you to take an action while in PLAN mode you will remind them that you are in PLAN mode and that they need to approve the plan first.
- When in PLAN mode always output the full updated plan in every response.
- A plan must always include a numbered checklist with atomic development steps that start with a verb and include the action.
- Each step must explain 'how'.

PLAN TEMPLATE (@your-planning.md):

### 🎯 1. Goal
*Clear specific outcome we aim to achieve.*
---
1.1.

### 📚 2. Context
*Important information relevant to the plan.*
---
2.1.

### 🎓 3. Assumptions
*List of critical assumptions that need validation before proceeding.*
---
3.1.

### ❓ 4. Questions
*Specific questions about implementation details that need answers.*
---
4.1.

### 🪜 5. Atomic Development Steps
*Detailed step-by-step actions required to achieve the goal.*
---
5.1.
```

## 📑 Table of Contents
1. [Quick Start](#-quick-start)
2. [Core Pillars](#-core-pillars)
3. [Framework Overview](#-framework-overview)
4. [Issues](#-issues)
5. [Code of Conduct](#-code-of-conduct)
6. [Objects](#-objects)
7. [API Integration](#-api-integration)
8. [PLX Commands](#-plx-commands)
9. [The Agent Work Documents](#-the-agent-work-documents)
10. [Protocols](#-protocols)

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

**Method 1: Using the script (Recommended)**
```bash
# Add the workspace brick using the provided script
./scripts/add_workspace_bricks.sh
```

**Method 2: Manual installation**
```bash
# Add the workspace brick globally
cd ./_mason
mason add workspace --path . -g
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

## 📚 Core Pillars

This framework enhances your AI agent's capabilities through three core pillars. It ensures high-quality, tested implementations by maintaining clear requirements, detailed tickets, and organized task lists.

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

## 🔍 Framework Overview

The framework is built on seven core work documents that guide the development process:

1. **[Requirements](work-docs/your-requirements.md)**
   Used for breaking down all aspects of what needs to be built, including actors, components, activities, properties, behaviors, acceptance criteria and test scenarios.

2. **[Ticket](work-docs/your-ticket.md)**
   Used for containing task descriptions, user stories, technical specifications, implementation details, security considerations, data models and API requirements.

3. **[Planning](work-docs/your-planning.md)**
   Used for detailed development planning, breaking down tasks, and organizing the implementation approach.

4. **[Milestones](work-docs/your-milestones.md)**
   Used for breaking down the work into clear testable milestones, tracking dependencies, technical details, progress and completion criteria while maintaining links to related tests and tasks.

5. **[Todo List](work-docs/your-todo-list.md)**
   Used for tracking chronological atomic tasks organized by milestone, including progress tracking, task dependencies and test tasks for each testable component.

6. **[Tests](work-docs/your-tests.md)**
   Used for defining (BDD Gherkin style) test scenarios, validating acceptance criteria, writing integration and unit tests, and tracking test coverage.

7. **[Backlog](work-docs/your-backlog.md)**
   Used for maintaining a chronological list of future work items that require no immediate action and will only be implemented upon user request while preserving original context and requirements.

## 🎯 Issues

The framework provides a structured approach to handling development issues. Each issue contains a focused set of documents needed for tracking and implementing work items, reducing complexity and preventing information overload.

### Working with Issues

Each issue is organized in its own directory with essential documents:
- `your-backlog.md`: For tracking future work items
- `your-hours.md`: For logging work time
- `your-milestones.md`: For tracking progress
- `your-planning.md`: For detailed development planning
- `your-requirements.md`: For documenting requirements
- `your-tests.md`: For test scenarios
- `your-todo-list.md`: For task tracking

To create a new issue, first add the issue brick globally by running:

```bash
./scripts/add_make_issue_brick.sh
```

This script will:
- Check if Mason CLI is installed
- Navigate to the _mason directory
- Add the issue brick globally if not already present
- Provide clear feedback about the process

Once the brick is added, you can create new issues using:

```bash
mason make issue
```

It will ask you for the issue folder and name, creating a structured workspace for that specific issue with all necessary documentation.

If you encounter any issues:
1. Make sure Mason CLI is installed (`dart pub global activate mason_cli`)
2. Ensure the script is executable (`chmod +x scripts/add_make_issue_brick.sh`)
3. Check if you're in the workspace root directory

## 📚 The Agent Work Documents

## 🔄 Protocols

The framework includes a comprehensive set of protocols that guide various aspects of development and documentation. Each protocol is designed to maintain consistency and quality throughout the development process.

| Protocol                            | Category           | Description                                         |
|-------------------------------------|--------------------|-----------------------------------------------------|
| plx-activate-code-red               | Emergency          | Initiates emergency protocol for critical issues    |
| plx-analyze                         | Analysis           | Performs detailed analysis of code or requirements  |
| plx-ask                             | Communication      | Formulates clear questions for better understanding |
| plx-ask-big-brother                 | Support            | Requests guidance from senior developers/system     |
| plx-ask-questions                   | Communication      | Generates comprehensive question sets for clarity   |
| plx-check-todo                      | Task Management    | Reviews and validates todo items                    |
| plx-commit                          | Version Control    | Handles code commits with proper documentation      |
| plx-continue-and-follow-the-process | Process            | Ensures adherence to established workflows          |
| plx-create-brick                    | Development        | Creates new Mason bricks for code generation        |
| plx-create-case-study               | Documentation      | Develops detailed case studies                      |
| plx-create-code-of-conduct          | Documentation      | Establishes development guidelines and standards    |
| plx-create-concept                  | Documentation      | Documents new concepts and architectural decisions  |
| plx-create-doc                      | Documentation      | Generates various types of documentation            |
| plx-create-feature-breakdown        | Planning           | Breaks down features into implementable components  |
| plx-create-insight                  | Analysis           | Generates insights from code or process analysis    |
| plx-create-milestone-gherkin-tests  | Testing            | Creates BDD tests for milestones                    |
| plx-create-milestones               | Planning           | Defines project milestones and objectives           |
| plx-create-plan-in-chat             | Planning           | Develops action plans during chat sessions          |
| plx-create-planning                 | Planning           | Creates comprehensive project plans                 |
| plx-create-protocol                 | Process            | Establishes new process protocols                   |
| plx-create-tests                    | Testing            | Develops various types of tests                     |
| plx-create-ticket                   | Task Management    | Creates well-structured task tickets                |
| plx-create-todo                     | Task Management    | Generates todo items and task lists                 |
| plx-create-tutorial                 | Documentation      | Creates step-by-step tutorials                      |
| plx-do                              | Execution          | Executes tasks following defined processes          |
| plx-document-dart-file              | Documentation      | Documents Dart code files comprehensively           |
| plx-explain-yourself                | Communication      | Provides clear explanations of decisions/actions    |
| plx-fix-linting-errors              | Quality            | Resolves code linting issues                        |
| plx-focus                           | Process            | Maintains focus on current task/objective           |
| plx-follow-the-docs                 | Process            | Ensures adherence to documentation                  |
| plx-log-hours                       | Project Management | Tracks time spent on tasks                          |
| plx-pause-work                      | Process            | Properly pauses work with context preservation      |
| plx-prepare-content                 | Content            | Prepares various types of content                   |
| plx-prepare-release                 | Release            | Manages release preparation tasks                   |
| plx-reflect                         | Quality            | Reviews and validates completed work                |
| plx-resume-work                     | Process            | Resumes work with proper context restoration        |
| plx-run-tests                       | Testing            | Executes and validates tests                        |
| plx-scan-project-for-context        | Analysis           | Analyzes project for context gathering              |
| plx-scan-project-for-todo           | Task Management    | Identifies and collects todo items                  |
| plx-stick-to-the-process            | Process            | Maintains process adherence                         |
| plx-stick-to-your-prompt            | Process            | Ensures prompt/instruction adherence                |
| plx-sync-work-documents             | Documentation      | Synchronizes work-related documents                 |
| plx-test-live                       | Testing            | Performs live testing procedures                    |
| plx-transfer-context                | Process            | Handles context transfer between sessions           |
| plx-update-read-me-and-changelog    | Documentation      | Updates project documentation                       |
| plx-update-todo                     | Task Management    | Updates todo items and lists                        |
| plx-update-translations             | Localization       | Manages translation updates                         |
| plx-use-api                         | Development        | Handles API integration and usage                   |
