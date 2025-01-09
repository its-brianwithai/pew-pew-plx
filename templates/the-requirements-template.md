---
document_type: template
goal: provide a structured way to document requirements
gpt_action: use as foundation for your requirements document
---

# 👤 Actors & 🧩 Components (Who or what)
> - Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).

> - What benefits from this? · Who maintains this? · What do users interact with? · What shows information? · What processes data? · What stores data? · What external systems are involved? · What needs to be monitored?

> - GPT Instructions: Start by listing all nouns from your feature description - these are your potential actors and components. Then expand this list by asking: who uses it, what do they interact with, what shows information, what stores data, and what processes data? For each item, decide if it's an Actor (can perform actions) or Component (is acted upon). Finally, break down any complex components into smaller, more manageable pieces.

> - Possible Parents: Itself
> - Link actors and components to their (optional) parent by starting with the parent in [[double square brackets]] and the actor(s)/component(s) beneath it. Example:
> 	- [[parent]]
> 		- [[Actor]]
> 		- [[Component]]
---

- [ ]

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).

> - What can each actor do? · What should happen automatically? · What needs user input? · What happens periodically? · What triggers other activities? · What needs to be logged? · What needs to be measured? · What needs authorization?

> - GPT Instructions: Take each Actor and Component and list everything they can do, must do, or should do automatically. Start each activity with a verb (create, update, delete, etc.) and make it specific. Think about: user interactions, system automations, periodic tasks, and data operations. Don't worry about the "how" yet - focus on what needs to happen.

> - Possible Parents: Actor, Component
> - Link activities to their parent by starting with the parent in [[double square brackets]] and the activitity beneath it. Example:
> 	- [[parent]]
> 		- [[Create item]]
> 		- [[Delete item]]
---

- [ ]

## 🌊 Activity Flows & Scenarios (What in which order?)
> - Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.

> - What's the ideal path? · What could fail? · What needs validation? · What needs confirmation? · What's time sensitive? · What needs recovery steps? · What should be cached? · What should be retried? · What needs rollback?

> - GPT Instructions: For each Activity think of the perfect scenario (Happy Flow) - what happens when everything works? Then optionally add Error Flows by asking "what could go wrong?" at each step. Finally, consider edge cases like no connection, empty states, or loading states. Break each flow into atomic (indivisible) actions that can be clearly implemented and tested. Prefix each atomic action with BDD Gherkin keywords: GIVEN, WHEN, THEN, AND, BUT.

> - Possible Parents: Activities, Itself
> - Link activity flows to their parent by starting with the parent in [[double square brackets]] and the activity flow(s) beneath it. Example:
> 	- [[parent]]
> 		- GIVEN [[User]] is at [[Home Screen]]
> 		- WHEN [[User]] [[taps create item button]]
> 		- THEN [[System]] [[shows create item feedback]]
> 		- AND [[System]] [[creates database item]]
> 		- BUT [[System]] [[does not navigate]]
---

- [ ]

# 📝 Properties (Which values?)
> - Describes a value or configuration that belongs to an object (examples include width, color, id, name).

> - What identifies it? · What describes it? · What configures it? · What measures it? · What styles it? · What formats it? · What tracks it? · What groups it? · What orders it?

> - GPT Instructions: For each object in your system, think about its data needs in three categories: identity (what makes it unique), configuration (what can be changed), and state (what can vary). Consider what needs to be stored, displayed, measured, or tracked. Make sure each property has a clear type and purpose.

> - Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Scenario, Behaviour
> - Link properties to their parent by starting with the parent in [[double square brackets]] and the property/properties beneath it. Example:
> 	- [[parent]]
> 		- [[name : string]]
---

- [ ]

# 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> - Defines how something looks, works and performs Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.

> - When should it change? · How should it respond? · What are the limits? · What needs validation? · What needs animation? · What needs protection? · What should be cached? · What should be optimized? · What should be monitored? · What needs fallback? · How should it scale? · What should be logged? · How should it fail? · What should be measured? · What needs authorization?

> - GPT Instructions: Think about each object's rules and constraints in terms of: limits (max/min values, allowed inputs), timing (when, how often), security (who can access), and performance (what needs to be fast). Focus on behaviours that can be clearly tested - if you can't write a test for it, make it more specific.

> - Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Scenario, Property
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

> - Possible Parents: Everything (optional)
> - Link questions to their (optional) parent by starting with the parent in [[double square brackets]] and the question(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] [[Do we need a limit?]]
> 		- [ ] [[Is this safe?]]
---

- [ ]

# 🎯 Roles, 📝 Tasks & 🎓 Suggested Approach
> - Each behaviour, property, activity (flow), scenario, atomic action, actor, component must directly or indirectly (by parents) cascade down to a todo with assigned role. Creating a task for a parent and completing it automatically covers its children unless children have open tasks themselves.

> - Who's responsible for what?

> - GPT Instructions: Review all items in the requirements and create clear specific tasks for implementation. Every item should have at least one task. Group tasks by role (UI/UX, Frontend, Backend, etc.) and ensure they're specific enough to be actionable and testable.

> - Possible Parents: Everything (optional)
> - Link tasks to their parent by starting with the parent in [[double square brackets]] and the task(s) beneath it. Example:
> 	- [ ] [[parent]]
> 		- [ ] Make a cool design
> 		- [ ] Get some feedback
---

- [ ] UI/UX Designer
- [ ] Frontend Developer
- [ ] Backend Developer
- [ ] Data Engineer
- [ ] DevOps Engineer
- [ ] Project Manager
- [ ] Marketeer

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
