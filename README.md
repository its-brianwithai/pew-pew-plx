# 🤖 Ultra Wide Turbo Agent Workspace

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Framework Overview](#-framework-overview)
2. [Core Pillars](#-core-pillars)
3. [Development Workflow](#-development-workflow)
4. [PLX Commands](#-plx-commands)
5. [Agent Work Documents](#-agent-work-documents)
6. [Wiki](#-wiki)

## 🔍 Quick Start

Create a new Ultra Wide Turbo Agent Workspace using the provided script:

```bash
./scripts/create_workspace.sh
```

The script will:
1. Generate a default workspace name (e.g. `turbo-workspace-0801-wed-01`)
   - Format: `turbo-workspace-MMDD-ddd-NN`
   - `MM`: Month (08)
   - `DD`: Day (01)
   - `ddd`: Day of week (wed)
   - `NN`: Sequential number (01)

2. Let you select which components to include:
   - Agent Work Documents (your-*.md files)
   - Protocols
   - Workflows
   - Templates
   - Wiki
   - Prompts

3. Create the workspace with:
   - Selected components
   - Empty CHANGELOG.md
   - Empty README.md

You can also provide a custom name when prompted. You can find your workspaces in the `workspaces` folder.

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

1. **[Requirements](#requirements)** (`your-requirements.md`)
   - Comprehensive breakdown of what needs to be built
   - Actors, components, activities, properties, behaviors
   - Clear acceptance criteria and test scenarios

2. **[Ticket](#ticket)** (`your-ticket.md`)
   - Detailed task description and user story
   - Technical specifications and implementation details
   - Security, data models, and API requirements

3. **[Todo List](#todo-list)** (`your-todo-list.md`)
   - Chronological atomic tasks under clear milestones
   - Progress tracking and task dependencies
   - Test tasks for each testable component

4. **[Transfer](#transfer)** (`your-transfer.md`)
   - Conversation context and key decisions
   - Current work state and progress
   - Next steps and blockers
   - Seamless agent handover

## 🔄 Development Workflow

The development workflow is split into two main files for better organization and clarity:

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
4. THEN [[GPT Agent]] ANALYSE [[the-agent-work-documents]]
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

Each workflow follows a structured approach with clear steps and checkpoints to maintain consistency and quality throughout the development process. The planning phase ensures proper understanding and task breakdown, while the development phase focuses on systematic implementation and testing.

## 📚 Wiki

The wiki category that contains documents that describe various concepts to the agent for reference:

## 💻 PLX Commands

PLX commands in `plx-*.md` files guide specific actions:
- Each command has its own protocol file
- Follow protocol exactly for that part of work
- Stay focused on current task within protocol

| Protocol | Purpose | Key Actions |
|----------|---------|-------------|
| `plx-ask-big-brother` | Get help from more capable agent | - Details current issue<br>- Provides context<br>- Lists attempts<br>- Gets guidance |
| `plx-ask-questions` | Gather necessary information | - Identifies gaps<br>- Asks clear questions<br>- Validates understanding |
| `plx-check-todo` | Review todo list status | - Scans todo items<br>- Checks completion<br>- Updates progress |
| `plx-commit` | Handle git commits | - Reviews changes<br>- Formats messages<br>- Executes commit |
| `plx-config` | Configure framework behavior | - Customizes framework<br>- Updates workspace<br>- Maintains consistency |
| `plx-continue-and-follow-the-process` | Resume work with process adherence | - Reviews state<br>- Follows workflow<br>- Maintains focus |
| `plx-create-doc` | Create new documentation | - Analyzes needs<br>- Creates structure<br>- Writes content |
| `plx-create-milestone-gherkin-tests` | Create standardized milestone tests | - Creates test files<br>- Writes Gherkin tests<br>- Ensures test isolation |
| `plx-create-milestones` | Define project milestones | - Plans phases<br>- Sets goals<br>- Tracks progress |
| `plx-create-protocol` | Create new protocol | - Defines purpose<br>- Sets structure<br>- Documents steps |
| `plx-create-ticket` | Create work ticket | - Describes task<br>- Sets requirements<br>- Defines criteria |
| `plx-document-dart-file` | Document Dart code | - Analyzes code<br>- Writes docs<br>- Verifies format |
| `plx-fix-errors` | Resolve code issues | - Analyzes errors<br>- Implements fixes<br>- Verifies solution |
| `plx-focus` | Maintain task focus | - Reviews goals<br>- Checks alignment<br>- Maintains direction |
| `plx-follow-development-workflow` | Realign with development workflow | - Checks position<br>- Identifies deviation<br>- Corrects course |
| `plx-follow-planning-workflow` | Realign with planning workflow | - Checks position<br>- Identifies deviation<br>- Corrects course |
| `plx-follow-test-workflow` | Realign with test workflow | - Checks position<br>- Identifies deviation<br>- Corrects course |
| `plx-follow-the-docs` | Follow documentation guidelines | - Reviews docs<br>- Follows patterns<br>- Maintains standards |
| `plx-log-hours` | Track work time | - Records time<br>- Notes progress<br>- Updates status |
| `plx-pause-work` | Pause current work | - Saves state<br>- Documents progress<br>- Prepares handoff |
| `plx-prepare-content` | Create content | - Plans content<br>- Creates drafts<br>- Reviews quality |
| `plx-prepare-release` | Prepare version release | - Reviews changes<br>- Updates docs<br>- Creates release |
| `plx-refresh-context` | Update work context | - Reviews state<br>- Updates context<br>- Maintains focus |
| `plx-resume-work` | Resume paused work | - Loads state<br>- Reviews context<br>- Continues tasks |
| `plx-run-tests` | Execute test suite | - Runs tests<br>- Checks results<br>- Fixes issues |
| `plx-scan-project-for-todo` | Find pending tasks | - Scans files<br>- Lists todos<br>- Updates list |
| `plx-start-work` | Begin new workflow | - Sets up work<br>- Initializes state<br>- Starts process |
| `plx-stick-to-the-process` | Maintain process adherence | - Checks workflow<br>- Verifies steps<br>- Stays aligned |
| `plx-sync-work-documents` | Synchronize documentation | - Reviews docs<br>- Updates content<br>- Maintains consistency |
| `plx-transfer-context` | Transfer work context | - Summarizes state<br>- Documents progress<br>- Enables handover |
| `plx-update-read-me-and-changelog` | Update documentation | - Updates changelog<br>- Updates README<br>- Maintains consistency |
| `plx-update-todo` | Update task list | - Reviews tasks<br>- Updates status<br>- Maintains progress |

## 📝 Agent Work Documents

These documents are maintained by the agent to track work, requirements, and progress. They form the core documentation that ensures consistent delivery and maintained context throughout the development process.

### your-requirements.md

```markdown
---
document_type: agent work document
goal: getting as clear as possible what needs to be done
gpt_action: use as a reference work to understand exactly what (still) needs to be done and document progress
---

# 👤 Actors & 🧩 Components (Who or what)
> - Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).
> - Possible Parents: Itself
---

- [ ]

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).
> - Possible Parents: Actors, Components
---

- [ ]

## 🌊 Activity Flows & Scenarios (What in which order?)
> - Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.
> - Possible Parents: Activities, Itself
---

- [ ]

# 📝 Properties (Which values?)
> - Describes a value or configuration that belongs to an object (examples include width, color, id, name).
> - Possible Parents: Actors, Components, Activities, Activity Flows, Scenarios, Atomic Actions, Scenarios, Behaviours
---

- [ ]

# 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> - Defines how something looks, works and performs Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.
> - Possible Parents: Anything
---

- [ ]

# 💡 Ideas & 🪵 Backlog
> - Anything that could be added later, too complex now, needs more research, would be nice to have, or alternative approaches.
> - Possible Parents: Anything (optional)
---

- [ ]

# 🔖 Context
> - Optional extra information about certain concepts used to clarify 

# ❓ Questions
> - Questions that need to be answered to clarify requirements.
> - Possible Parents: Anything (optional)
---

- [ ]

# 🧪 Unit & Integration Tests  
> - Tests that verify the implementation and verifies an item as completed.
> - Possible Parents: Activities, Activity Flows, Properties, Behaviours, Tasks
---

- [ ]


# 🎯 Roles, 📝 Tasks & 🎓 Suggested Approach
> - Each behaviour, property, activity (flow), scenario, atomic action, actor, component must directly or indirectly (by parents) cascade down to a todo with assigned role. Creating a task for a parent and completing it automatically covers its children unless children have open tasks themselves.
> - Possible Parents: Anything (optional)
---

- [ ] UI/UX Designer
- [ ] Frontend Developer
- [ ] Backend Developer
- [ ] Data Engineer
- [ ] DevOps Engineer
- [ ] Project Manager
- [ ] Marketeer
```

### your-ticket.md

```markdown
---
document_type: agent work document
goal: document and track implementation details, requirements, and acceptance criteria
gpt_action: use as reference for documenting details and defining acceptance criteria
---

# 🔖 Description
> 💡 *A short and descriptive introduction of the problem we are going to solve.*
---

# 🗣 User Story
> 💡 ***As a*** *ROLE* ***I want*** *BEHAVIOUR* ***so that*** *REASON.*
---

# ⚙️ Requirements
> 💡 *Add a link to your-requirements.md here*
---

# 💾 Data Model
> 💡 *Old and new data models that will be created and/or altered when this feature is added.*
---

# 🔒 Security Rules
> 💡 *Old and new security rules with roles and access that should be created and/or altered. Include create, read, update and delete.*
---

# 🐒 API
> 💡 *Old and new API calls that should be created and/or altered.*
---

# 📊 Analytics
> 💡 *Old and new analytics that should be created and/or altered when this feature is added. Include a name, when it’s fired and optional properties.*
---

# ☎️ Impact Communication
> 💡 *Who / which teams should we inform about the impact of releasing this ticket? Sales, marketing, data, CS, other?*
---

# 🧪 Tests
> 💡 *Components/flows/code that would benefit from tests and which scenario's should be tested.*
---

# 🤝 Acceptance Test
> 💡 *Which scenario’s should we test in the acceptance test? So that we can make sure that this ticket does what it is supposed to do without any unexpected errors.*
---

# 🎨 UI/UX Behaviour
> 💡 *Anything to take note of regarding the behaviour of UI/UX elements (if applicable). Think of position, behaviour when elements do not fit the screen, feedback on elements and properties of animations.*
---

# 📝 Suggested Approach
> 💡 *With knowledge of the current codebase, try to define a best suggested approach. Think of current components used, flow of data and UI elements.*
---

# 👉️ Final Remarks
> 💡 *Anything to take note off that is not properly defined yet. Think of out of scope notes, dependencies, anything to be extra cautious about and/or information about related issues.*
---

# ✅ Pull Request Checklist
> 💡 *Before submitting your PR make sure you've gone through this checklist carefully. Each item represents a crucial aspect of code quality and reliability. Take your time to verify each point - your thoroughness here helps maintain our high standards and makes the review process smoother.*
---

- [ ] I have read the 'Description' and 'Requirements'/'Expected Result' one last time and confirm to have tested the functionality/fix of this ticket thoroughly, and everything is working exactly as described in those sections.
- [ ] I have tested the functionality on both Android and iOS.
- [ ] I have double-checked the design file and confirm that the current implementation is a pixel-perfect clone of the original design.
- [ ] I considered any security risks and took the appropriate actions accordingly, such as placing the right security tag and defining and/or implementing any actions under the heading 'Security'.
- [ ] I have added short, descriptive, and maintainable documentation to all new classes and methods.
- [ ] I have added short, descriptive, and maintainable logging to each new piece of code where it seems logical to do so for debugging/crash reporting purposes.
- [ ] I have added sensible error handling using try/catch statements and optional custom exceptions where needed.
- [ ] I did a full round of QA of my own code and can confirm that the upcoming PR contains my best possible version of this ticket.
```

### your-milestones.md

```markdown
---
document_type: agent work document
goal: track high-level milestones and overall project progress
gpt_action: maintain organized milestone list and track overall project direction
---

# 🚀 [M1] Milestone Title
> - Each milestone represents a significant project phase or feature.
> - Detailed tasks for the current milestone are tracked in [[your-todo-list.md]].
---
- [ ] Initial BDD Milestone Result Confirmation Test Placeholder
- [ ] Initial BDD Milestone Result Confirmation Test Placeholder

# 🚀 [M2] Milestone Title
> - Each milestone represents a significant project phase or feature.
> - Detailed tasks for the current milestone are tracked in [[your-todo-list.md]].
---
- [ ] Initial BDD Milestone Result Confirmation Test Placeholder
- [ ] Initial BDD Milestone Result Confirmation Test Placeholder
```

### your-todo-list.md

```markdown
---
---
document_type: agent work document
goal: track tasks for current milestone
gpt_action: maintain organized atomic task list for current milestone
---

# 🔥 User Added (Do These First! - Don't Remove This Section!!)
> - User may, at any time, add tasks with high priority to your todo, which you can find here. Complete these first above all other tasks.
---
- [ ] None at the moment

# 🚀 Current Milestone
> - Tasks for the current milestone only.
> - Higher level milestones are tracked in [[your-milestones]].
---
- [ ] Initial task placeholder

# ✅ Completed Milestone
> - Completed tasks of a previously completed milestone for agent personal reference and context refresh.
---
- [X] Initial completed task placeholder
```

### your-transfer.md

```markdown
---
document_type: agent work document
goal: transfer current context and work state to new agent
gpt_action: read this document to quickly understand current context and continue work
---

# 📝 Conversation Summary
> Key points and decisions from the conversation so far

# 📊 Current Work State
> Status of work documents and tasks

# ⏭️ Next Steps
> Immediate actions for the new agent
```

This document is created by the `plx-transfer` protocol to enable seamless handover between agents. It captures:
- Conversation context and key decisions
- Current work state across all documents
- Clear next steps and any blockers
- User preferences and requirements
