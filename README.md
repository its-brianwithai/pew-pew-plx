# 🤖 Ultra Wide Turbo Workspace
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

> Credit: This mode system is inspired by [DaleLJefferson's original plan vs act mode concept](https://forum.cursor.com/t/plan-vs-act-modes/43550), which has been extended to include additional operational modes for enhanced workflow control.

```markdown
You have five (5) modes of operation:

1. PLAN mode - You will work with the user to define a plan, you will gather all the information you need to make the changes but will not make any changes.
2. DOC mode - You will update relevant '@your-' work documents but will not make any other changes.
3. ACT mode - You will make changes to the codebase based on the plan.
4. REFLECT mode - You will reflect on work done ask if you are 100% sure this is perfect? You will scan all related files until you are 100% sure and nothing can go wrong. You will use all tools at your disposable untill you achieve 100% certainty.
5. QA mode - You will process feedback by scanning for TODO's in changed files and any input from the user.

- You start in PLAN mode and will not move to ACT mode until the plan is approved by the user.
- You can switch between DOC, REFLECT, QA and PLAN as needed.
- You will print `# Mode: NAMEOFMODE` at the beginning of each response.
- Unless the user explicity asks you to move to act mode, by typing `ACT`, you will stay in plan mode.
- You will move back to PLAN mode after every response, unless the response litteraly instructs a different mode.
- If the user asks you to take an action while in plan mode you will remind them that you are in plan mode and that they need to approve the plan first.
- When in plan mode always output the full updated plan in every response.
- A plan must always include a numbered checklist with atomic development steps that start with a verb and include the action.
- Each step must include a 'how'.
```

## 📑 Table of Contents
1. [Quick Start](#-quick-start)
2. [Framework Overview](#-framework-overview)
3. [Core Pillars](#-core-pillars)
4. [Issues](#-issues)
5. [Code of Conduct](#-code-of-conduct)
6. [Objects](#-objects)
7. [API Integration](#-api-integration)
8. [PLX Commands](#-plx-commands)
9. [The Agent Work Documents](#-the-agent-work-documents)

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
cd _mason
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

## 📚 Core Pillars

The framework is built on six core work documents that guide the development process:

1. **[Requirements](work-docs/your-requirements.md)**
   Used for breaking down all aspects of what needs to be built, including actors, components, activities, properties, behaviors, acceptance criteria and test scenarios.

2. **[Ticket](work-docs/your-ticket.md)**
   Used for containing task descriptions, user stories, technical specifications, implementation details, security considerations, data models and API requirements.

3. **[Milestones](work-docs/your-milestones.md)**
   Used for breaking down the work into clear testable milestones, tracking dependencies, technical details, progress and completion criteria while maintaining links to related tests and tasks.

4. **[Todo List](work-docs/your-todo-list.md)**
   Used for tracking chronological atomic tasks organized by milestone, including progress tracking, task dependencies and test tasks for each testable component.

5. **[Tests](work-docs/your-tests.md)**
   Used for defining (BDD Gherkin style) test scenarios, validating acceptance criteria, writing integration and unit tests, and tracking test coverage.

6. **[Backlog](work-docs/your-backlog.md)**
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

To create a new issue add the issue brick by running the `add_make_issue_brick.sh` script and then:

```bash
mason make issue
```

It will ask you for the issue folder and name, creating a structured workspace for that specific issue with all necessary documentation.
