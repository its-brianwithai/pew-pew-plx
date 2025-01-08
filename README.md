# 🤖 Ultra Wide Turbo Agent Workspace

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Framework Overview](#-framework-overview)
2. [Core Pillars](#-core-pillars)
3. [Development Workflow](#-development-workflow)
4. [PLX Commands](#-plx-commands)
5. [Agent Work Documents](#-agent-work-documents)

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
   - Knowledge
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

The development workflow follows a structured three-phase approach to ensure high-quality, tested implementations. Each phase has clear steps and checkpoints to maintain consistency and quality throughout the development process:

---
document_type: workflow
goal: define core development workflow
gpt_action: follow these steps for all development work that you do
---

# 🧱 Planning

1. [[User]] gives [[input]]
2. [[GPT Agent]] start with [[research solution]] based on [[input]]
	1. [[research solution]]
		1. Scan codebase
		2. Scan documentation
		3. Scan user input
		4. Ask clarifying questions
3. [[GPT Agent]] [[create plan]]
	1. [[create plan]]
		1. Create clear step-by-step list of [[chronological atomic tasks]]
		2. Divide tasks under [[clear milestones]]
		3. Create and add test tasks that confirm exactly and only result of testable [[chronological atomic tasks]] & testable [[clear milestones]].
4. [[GPT Agent]] presents plan
5. [[User]] and [[GPT Agent]] enter [[feedback loop]]
	1. [[feedback loop]]
		1. IF [[User]] gives feedback
			1. [[GPT Agent]] process feedback
		2. [[User]] and [[GPT Agent]] repeat until [[User]] approves
6. [[GPT Agent]] starts with implementation of plan

# 🛠️ Development

1. [[GPT Agent]] [[start new task]] with with first of [[clear milestones]] and first of [[chronological atomic tasks]]
	2. [[start new task]]
		1. IF [[Task is first of new milestone]]
			1. [[GPT Agent]] confirms approach
			2. [[User]] and [[GPT Agent]] enter [[feedback loop]]
			3. [[GPT Agent]] start with implementation of task
		2. [[GPT Agent]] completes task
			1. IF [[Task is test]]
				1. [[GPT Agent]] starts [[testing process]]
					1. IF [[Tests fail]]
						1. [[GPT Agent]] analyses first failing test
						2. [[GPT Agent]] [[research solution]] to create [[fix test approach]]
						3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
						4. [[GPT Agent]] start with implementation of [[fix test approach]]
						5. [[GPT Agent]] repeats [[testing process]]
		3. [[GPT Agent]] updates [[your-todo-list]]
		4. [[GPT Agent]] [[start new task]]

# 🚀 Release

1. [[GPT Agent]] starts [[testing process]]
2. [[GPT Agent]] presents summary of all work done to [[User]]
3. [[GPT Agent]] and [[User]] enter [[feedback loop]]
4. [[GPT Agent]] asks [[User]] for release process
5. [[GPT Agent]] is a hero

## 💻 PLX Commands

PLX commands in `plx-*.md` files guide specific actions:
- Each command has its own protocol file
- Follow protocol exactly for that part of work
- Stay focused on current task within protocol

| Protocol | Purpose | Key Actions |
|----------|---------|-------------|
| `plx-add` | Add new content | - Processes additions<br>- Updates tests<br>- Maintains consistency<br>- Verifies changes |
| `plx-ask` | Self-check information needs | - Reviews current task<br>- Identifies unclear points<br>- Improves understanding<br>- Enhances approach |
| `plx-ask-smarter-agent` | Get help from smarter agent | - Details current issue<br>- Provides full context<br>- Lists all attempts<br>- Shares understanding |
| `plx-commit` | Handle git commits | - Reviews changes<br>- Formats messages<br>- Executes commit<br>- Pushes changes |
| `plx-config` | Configure framework behavior | - Customizes framework<br>- Adapts to project needs<br>- Updates workspace files<br>- Maintains consistency |
| `plx-content` | Process content creation | - Analyzes sources<br>- Creates content<br>- Verifies quality<br>- Integrates feedback |
| `plx-context` | Build conversation context | - Scans repository<br>- Reviews core files<br>- Builds understanding<br>- Verifies context |
| `plx-dart-document` | Create Dart documentation | - Analyzes topic<br>- Creates structure<br>- Writes content<br>- Verifies quality |
| `plx-focus` | Evaluate current task | - Reviews current milestone<br>- Questions approach<br>- Finds improvements<br>- Suggests optimizations |
| `plx-log` | Record work activities | - Analyzes session<br>- Creates log entry<br>- Verifies details<br>- Updates status |
| `plx-pause` | Preserve current state | - Analyzes state<br>- Documents context<br>- Prepares handoff<br>- Enables resumption |
| `plx-release` | Prepare and execute release | - Reviews changes<br>- Updates documentation<br>- Executes release<br>- Processes next steps |
| `plx-resume` | Continue work | - Analyzes pause state<br>- Plans continuation<br>- Verifies readiness<br>- Resumes work |
| `plx-stick-to-the-process` | Realign with workflow | - Checks process<br>- Locates position<br>- Verifies alignment<br>- Resumes correctly |
| `plx-sync` | Verify work alignment | - Reviews documents<br>- Checks alignment<br>- Identifies gaps<br>- Reports status |
| `plx-test` | Execute testing process | - Analyzes tests<br>- Reports status<br>- Resolves failures<br>- Verifies completion |
| `plx-transfer` | Create transfer document | - Summarizes context<br>- Documents work state<br>- Defines next steps<br>- Enables handover |

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

> - What benefits from this? · Who maintains this? · What do users interact with? · What shows information? · What processes data? · What stores data? · What external systems are involved? · What needs to be monitored?

> - GPT Instructions: Start by listing all nouns from your feature description - these are your potential actors and components. Then expand this list by asking: who uses it, what do they interact with, what shows information, what stores data, and what processes data? For each item, decide if it's an Actor (can perform actions) or Component (is acted upon). Finally, break down any complex components into smaller, more manageable pieces.

> - Possible Parents: Actors, Components
> - Link actors and components to their (optional) parent by starting with the parent in [[double square brackets]] and the actor(s)/component(s) beneath it. Example:
> 	- [[parent]]
> 		- [[actor]]
> 		- [[component]]
---

- [ ] 

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).

> - What can each actor do? · What should happen automatically? · What needs user input? · What happens periodically? · What triggers other activities? · What needs to be logged? · What needs to be measured? · What needs authorization?

> - GPT Instructions: Take each Actor and Component and list everything they can do, must do, or should do automatically. Start each activity with a verb (create, update, delete, etc.) and make it specific. Think about: user interactions, system automations, periodic tasks, and data operations. Don't worry about the "how" yet - focus on what needs to happen.

> - Possible Parents: Actors, Components
> - Link activities to their parent by starting with the parent in [[double square brackets]] and the activitity beneath it. Example:
> 	- [[parent]]
> 		- [[Create item]]
> 		- [[Delete item]]
---

- [ ] 

## 🌊 Activity Flows & Scenarios (What in which order?)
> - Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.

> - What's the ideal path? · What could fail? · What needs validation? · What needs confirmation? · What's time sensitive? · What needs recovery steps? · What should be cached? · What should be retried? · What needs rollback?

> - GPT Instructions: For each Activity think of the perfect scenario (Happy Flow) - what happens when everything works? Then optionally add Error Flows by asking "what could go wrong?" at each step. Finally, consider edge cases like no connection, empty states, or loading states. Break each flow into atomic (indivisible) actions that can be clearly implemented and tested.

> - Possible Parents: Activities
> - Link activity flows to their parent by starting with the parent in [[double square brackets]] and the activity flow(s) beneath it. Example:
> 	- [[parent]]
> 		- [[User tap button]]
> 		- [[System show feedback]]
---

- [ ] 

# 📝 Properties (Which values?)
> - Describes a value or configuration that belongs to an object (examples include width, color, id, name).

> - What identifies it? · What describes it? · What configures it? · What measures it? · What styles it? · What formats it? · What tracks it? · What groups it? · What orders it?

> - GPT Instructions: For each object in your system, think about its data needs in three categories: identity (what makes it unique), configuration (what can be changed), and state (what can vary). Consider what needs to be stored, displayed, measured, or tracked. Make sure each property has a clear type and purpose.

> - Possible Parents: Actors, Components, Activities, Activity Flows, Scenarios, Atomic Actions, Scenarios, Behaviours
> - Link properties to their parent by starting with the parent in [[double square brackets]] and the property/properties beneath it. Example:
> 	- [[parent]]
> 		- [[name : string]]
---

- [ ] 

# 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> - Defines how something looks, works and performs Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.

> - When should it change? · How should it respond? · What are the limits? · What needs validation? · What needs animation? · What needs protection? · What should be cached? · What should be optimized? · What should be monitored? · What needs fallback? · How should it scale? · What should be logged? · How should it fail? · What should be measured? · What needs authorization?

> - GPT Instructions: Think about each object's rules and constraints in terms of: limits (max/min values, allowed inputs), timing (when, how often), security (who can access), and performance (what needs to be fast). Focus on behaviours that can be clearly tested - if you can't write a test for it, make it more specific.

> - Possible Parents: Anything
> - Link behaviours to their parent by starting with the parent in [[double square brackets]] and the behaviour(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] [[Should fail when length is 100+ characters]]
> 		- [ ] [[Should not show when list is empty]]
---

- [ ] 

# 💡 Ideas & 🪵 Backlog
> - Anything that could be added later, too complex now, needs more research, would be nice to have, or alternative approaches.

> - What could be added later? · What's too complex now? · What needs more research? · What would be nice to have? · What are alternative approaches? · What could be automated?

> - GPT Instructions: While working through the requirements, note down any ideas that come up but don't fit the current scope. Think about: future enhancements, alternative approaches, performance improvements, and nice-to-have features. Don't discard ideas just because they're complex - they might be valuable later.

> - Possible Parents: Anything (optional)
> - Link ideas and backlog items to their (optional) parent by starting with the parent in [[double square brackets]] and the idea(s)/backlog item(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] [[Do we need a limit?]]
> 		- [ ] [[Is this safe?]]
---

- [ ] 

# ❓ Questions
> - Questions that need to be answered to clarify requirements.

> - What's unclear? · What needs decision? · What are the edge cases? · What could be improved? · What are we missing? · What assumptions are we making? · What risks exist? · What dependencies are there?

> - GPT Instructions: Throughout the process, note any uncertainties or assumptions you make. Focus on questions that could impact implementation or user experience.

> - Possible Parents: Anything (optional)
> - Link questions to their (optional) parent by starting with the parent in [[double square brackets]] and the question(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] [[Do we need a limit?]]
> 		- [ ] [[Is this safe?]]
---

- [ ] 

# 🧪 Unit & Integration Tests  
> - Tests that verify the implementation and verifies an item as completed.

> - GPT Instructions: Create focused unit tests for the main activities and their key flows, without overdoing it. Testing the core success paths of activities is usually sufficient, with optional coverage of different activity flows where they're critical to functionality. Keep tests simple and meaningful.

> - Possible Parents: Activities, Activity Flows, Properties, Behaviours, Tasks
> - Link tests to their parent by starting with the parent in [[double square brackets]] and the test(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] [[Test activity success path]]
> 		- [ ] [[Test activity with invalid inputs]]
---

- [ ]


# 🎯 Roles & 📝 Tasks
> - Each behaviour, property, activity (flow), scenario, atomic action, actor, component must directly or indirectly (by parents) cascade down to a todo with assigned role. Creating a task for a parent and completing it automatically covers its children unless children have open tasks themselves.

> - Who's responsible for what?

> - GPT Instructions: Review all items in the requirements and create clear specific tasks for implementation. Every item should have at least one task. Group tasks by role (UI/UX, Frontend, Backend, etc.) and ensure they're specific enough to be actionable and testable.

> - Possible Parents: Anything (optional)
> - Link tasks to their parent by starting with the parent in [[double square brackets]] and the task(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] Make a cool design
> 		- [ ] Get some feedback
---

- [ ] UI/UX Designer
    - [ ] 
- [ ] Frontend Developer
    - [ ] 
- [ ] Backend Developer
    - [ ] 
- [ ] Data Engineer
    - [ ] 
- [ ] DevOps Engineer
    - [ ] 
- [ ] Project Manager
    - [ ] 
- [ ] Marketeer
    - [ ] 

<!--
# 🎯 Strategy Guide
> How to use this template.
---
Start anywhere that makes sense: user-focused (Actors), feature-focused (Activities), data-focused (Properties), or rules-focused (Behaviours). For each item you add, link it to related items using double [[square brackets]], add its properties and behaviours, and create todos for implementation.

Every item in this template has a checkbox. Checking off an item means:
- The item itself is fully implemented
- All its children (sub-items) are fully implemented 
- All its relationships are properly connected
- All its required tests are passing

Only check off a parent item when ALL its children are complete.

# 🔗 Relationship Guide (How to connect items)
> Every item in the requirements should be connected to other items and/or a todo. This creates a complete, traceable network of requirements. Creating a task for a parent and completing it automatically covers its children unless children have open tasks themselves.
---

## Common Relationships
- [[Actor]]
	- [[Activities]]
		- [[Activity Flows]]
			- [[Atomic Actions]]
		- [[Behaviours]]
- [[Component]]
	- [[Activities]]
		- [[Activity Flows]]
			- [[Atomic Actions]]
		- [[Behaviours]]
- [[Properties]]
	- [[Behaviours]]

## How to Map
Start with any item and ask:
- What uses this?
- What does this use?
- What properties does it have?
- What behaviours does it follow?
- What activities is it involved in?

## Validation
After completing each section, verify:
1. All items use [[square brackets]] to indicate relationships (if applicable)
2. All items have relationships (if applicable)
3. All items have todos
-->
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

### your-todo-list.md

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
