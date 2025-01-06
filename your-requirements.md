---
document_type: personal
goal: define and track feature requirements
gpt_action: structure and maintain requirements following template
---

# 📋 Your Requirements

Use this document to define and track requirements for your features and projects. This structured approach helps ensure nothing important is missed during implementation.

## 📚 How to Use This Document

1. **When to Create Requirements**
   1. At the start of any new feature
   2. When making significant changes
   3. When breaking down complex tasks

2. **How to Break Down Requirements**
   1. Start with Actors & Components (the nouns)
   2. Define their Activities (the verbs)
   3. Add Properties (the data)
   4. Define Behaviors (the rules)

3. **Integration Points**
   1. Create milestone in [your-todo-list](your-todo-list.md) for each major requirement
   2. Define test cases in [the-testing-process](the-testing-process.md)
   3. Log decisions and changes in [your-memory](your-memory.md)

4. **Requirement Lifecycle**
   1. Draft → Review → Implement → Test → Complete
   2. Track status using ⚪ Draft, 🟡 In Progress, 🟢 Complete
   3. Log all changes with timestamp in [your-memory](your-memory.md)

## 📝 Template

# 👤 Actors & 🧩 Components (Who or what)
> *Someone or something that can perform actions or be interacted with.*
> What benefits from this? · Who maintains this? · What do users interact with? · What shows information? · What processes data? · What stores data? · What external systems are involved? · What needs to be monitored?
> Possible Parents: Actor, Component
> GPT Instructions: Start by listing all nouns from your feature description - these are your potential actors and components. Then expand this list by asking: who uses it, what do they interact with, what shows information, what stores data, and what processes data? For each item, decide if it's an Actor (can perform actions) or Component (is acted upon).

1. [[Example Actor]] ⚪
   - Status: Draft
   - Milestone: [[M1: Implement Actor]]
   - Tests: [[T1: Actor Tests]]
   - Memory: [[Decision: Actor Design]]

2. [[Example Component]] 🟡
   - Status: In Progress
   - Milestone: [[M2: Build Component]]
   - Tests: [[T2: Component Tests]]
   - Memory: [[Research: Component Architecture]]

# 🎬 Activities (Who or what does what?)
> *Actions that an Actor or Component performs.*
> What can each actor do? · What should happen automatically? · What needs user input? · What happens periodically? · What triggers other activities? · What needs to be logged? · What needs to be measured? · What needs authorization?
> Possible Parents: Actor, Component
> GPT Instructions: Take each Actor and Component and list everything they can do, must do, or should do automatically. Start each activity with a verb and make it specific.

1. [[Example Actor]]
   1. [[Create an example]] 🟡
      - Status: In Progress
      - Milestone: [[M3: Create Function]]
      - Tests: [[T3: Creation Tests]]
      - Memory: [[Design: Creation Flow]]
   
   2. [[Delete an example]] ⚪
      - Status: Draft
      - Milestone: [[M4: Delete Function]]
      - Tests: [[T4: Deletion Tests]]
      - Memory: [[Research: Deletion Impact]]

2. [[Example Component]]
   1. [[Sync examples]] 🟢
      - Status: Complete
      - Milestone: [[M5: Sync Feature]]
      - Tests: [[T5: Sync Tests]]
      - Memory: [[Implementation: Sync Logic]]

## 🌊 Activity Flows & Scenarios
> *Sequences of actions that map out the steps to complete an Activity.*
> What's the ideal path? · What could fail? · What needs validation? · What needs confirmation? · What's time sensitive? · What needs recovery steps? · What should be cached? · What should be retried? · What needs rollback?
> Possible Parents: Activity
> GPT Instructions: For each Activity, map out the perfect scenario (Happy Flow) and error scenarios. Break each flow into atomic actions.

1. [[Create an example]]
   1. Happy Flow 🟡
      1. [[Tap create button]]
      2. [[Enter name]]
      3. [[Tap save]]
   
   2. Error Flow ⚪
      1. [[Show validation error]]
      2. [[Log error]]
      3. [[Retry save]]

# 📝 Properties
> *Values or configuration that belongs to an object.*
> What identifies it? · What describes it? · What configures it? · What measures it? · What styles it? · What formats it? · What tracks it? · What groups it? · What orders it?
> Possible Parents: Actor, Component, Activity, Flow
> GPT Instructions: For each object, define its unique identifiers, configuration options, and state variables.

1. [[Show loading indicator]]
   - Status: 🟡 In Progress
   - Properties:
     1. message: "Loading..."
     2. duration: 2000ms
   - Tests: [[T6: Loading Tests]]

# 🛠️ Behaviors
> *How something looks, works and performs.*
> When should it change? · How should it respond? · What are the limits? · What needs validation? · What needs animation? · What needs protection? · What should be cached? · What should be optimized? · What should be monitored?
> Possible Parents: Actor, Component, Activity, Flow, Property
> GPT Instructions: Define rules, constraints, and behaviors that can be clearly tested.

1. [[Create an example]]
   - Status: 🟡 In Progress
   - Rules:
     1. Only admins can create
     2. Max 1000 items
   - Tests: [[T7: Creation Rules]]

# 🧪 Unit Tests
> *Tests that verify the implementation.*
> What behaviors can be verified? · What rules can be tested? · What calculations need validation? · What transformations should be checked? · What edge cases need testing?
> Possible Parents: Activity, Property, Behavior
> GPT Instructions: Define test cases following AAA pattern (Arrange, Act, Assert). Focus on behaviors that can be programmatically verified.

1. [[Create an example]]
   1. Admin Creation Test 🟡
      - Arrange:
        1. Create admin user
        2. Mock auth service
      - Act:
        1. Call create()
      - Assert:
        1. Verify success
        2. Check item count

# 💡 Ideas & 🪵 Backlog
> *Future improvements and alternatives.*
> What could be added later? · What's too complex now? · What needs more research? · What would be nice to have? · What are alternative approaches?
> GPT Instructions: Note down future enhancements and alternatives while working through requirements.

1. [[Batch Operations]] ⚪
   - Bulk create/delete
   - Performance optimization
   - Memory: [[Research: Batch Processing]]

# ❓ Questions
> *Uncertainties that need clarification.*
> What's unclear? · What needs decision? · What are the edge cases? · What could be improved? · What are we missing?
> GPT Instructions: Note questions that could impact implementation or user experience.

1. [[Analytics Integration]] ⚪
   - Which events to track?
   - Memory: [[Question: Analytics Requirements]]

# 🎯 Roles & 📝 Todo's
> *Implementation tasks by role.*
> Who's responsible for what?
> GPT Instructions: Create specific, actionable todos for each role, linked to requirements.

1. UI/UX Designer
   1. [[Design create flow]] 🟡
      - Link: [[Create an example]]
      - Milestone: [[M6: UI Design]]

2. Frontend Developer
   1. [[Implement create form]] ⚪
      - Link: [[Create an example]]
      - Milestone: [[M7: Frontend Implementation]]