<file_map>
idea-context-refine-plan-act-review
├── 00-all-teams
│   ├── all-act-team.md
│   ├── all-context-team.md
│   ├── all-plan-team.md
│   ├── all-refinement-team.md
│   ├── all-requirements-team.md
│   ├── all-research-team.md
│   └── all-review-team.md
├── 01-research-team
│   ├── brainstorm-template.md
│   ├── idea-template.md
│   ├── README.md
│   ├── research-template.md
│   ├── you-are-brainstorm-agent.md
│   ├── you-are-idea-agent.md
│   ├── you-are-research-agent.md
│   └── you-are-research-orchestrator-agent.md
├── 02-context-team
│   ├── bad-examples-template.md
│   ├── best-practices-template.md
│   ├── collection-template.md
│   ├── good-examples-template.md
│   ├── personal-preferences-template.md
│   ├── README.md
│   ├── suggested-approach-template.md
│   ├── you-are-bad-examples-agent.md
│   ├── you-are-best-practices-agent.md
│   ├── you-are-collection-agent.md
│   ├── you-are-context-orchestrator-agent.md
│   ├── you-are-good-examples-agent.md
│   ├── you-are-personal-preferences-agent.md
│   └── you-are-suggested-approach-agent.md
├── 03-requirements-team
│   ├── README.md
│   ├── requirements-template.md
│   ├── you-are-activities-agent.md
│   ├── you-are-actors-components-agent.md
│   ├── you-are-behaviours-agent.md
│   ├── you-are-properties-agent.md
│   ├── you-are-requirements-orchestrator-agent.md
│   └── you-are-scenarios-agent.md
├── 04-refinement-team
│   ├── architecture-template.md
│   ├── prd-template.md
│   ├── README.md
│   ├── you-are-architecture-agent.md
│   ├── you-are-prd-agent.md
│   └── you-are-refinement-orchestrator-agent.md
├── 05-plan-team
│   ├── developement-plan-template.md
│   ├── epic-template.md
│   ├── README.md
│   ├── roadmap-template.md
│   ├── story-template.md
│   ├── task-template.md
│   ├── you-are-development-plan-agent.md
│   ├── you-are-epic-agent.md
│   ├── you-are-plan-orchestrator-agent.md
│   ├── you-are-roadmap-agent.md
│   ├── you-are-story-agent.md
│   └── you-are-task-agent.md
├── 06-act-team
│   ├── README.md
│   ├── result-report-template.md
│   ├── you-are-acceptance-test-agent.md
│   ├── you-are-act-orchestrator-agent.md
│   ├── you-are-lead-developer-agent.md
│   ├── you-are-result-report-agent.md
│   └── you-are-unit-tester-agent.md
├── 07-review-team
│   ├── acceptance-criteria-template.md
│   ├── feedback-template.md
│   ├── quality-standards-template.md
│   ├── README.md
│   ├── restrictions-template.md
│   ├── rules-template.md
│   ├── you-are-acceptance-criteria-agent.md
│   ├── you-are-code-review-agent.md
│   ├── you-are-feedback-agent.md
│   ├── you-are-quality-standards-agent.md
│   ├── you-are-restrictions-agent.md
│   ├── you-are-review-orchestrator-agent.md
│   └── you-are-rules-agent.md
├── README.md
└── you-are-team-orchestrator-agent.md

</file_map>

<file_contents>
File: 05-plan-team/developement-plan-template.md
```md
# 📋 Development Plan: {title}

> Comprehensive project planning document for {project_name} breaking down work into manageable milestones and tasks. Defines actors, components, activities, and technical specifications to ensure clear communication and executable delivery plans.

## 🎯 1. Project Overview
A brief summary of the project, including its main objectives and key features. Clearly state the end goals formulated in your analysis.
- [ ] Read the project overview:
    - [Brief summary of the project, including end goals]

## 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

### 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance. Use the `@path/to/file.md` format.*
*   `@path/to/relevant/feature_description.md` - (Relevance: High-level overview of the feature)
*   `@path/to/existing/module_if_related/` - (Relevance: Code for related existing functionality)
*   *Example: @docs/data_models.md - (Relevance: Definitions of existing data structures)*

### 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
*   `[Link to User Stories or Epic]` - (Relevance: User-centric view of the requirements)
*   `[Link to UI Mockups/Prototypes (Figma, etc.)]` - (Relevance: Visual and interaction design)
*   *Example: https://www.w3.org/TR/WCAG21/ - (Relevance: Accessibility guidelines if applicable)*

### 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
*   `[Context point 1: e.g., These requirements are for the MVP (Minimum Viable Product) release.]`
*   `[Context point 2: e.g., The system must integrate with the existing authentication service.]`
*   *Example: Performance is a key consideration; avoid solutions known to be resource-intensive.*

## 📋 2. Requirements
> Detailed requirements specification for {system/feature} documenting functional and non-functional requirements. Captures actors, components, activities, behaviors, and properties to ensure all aspects are thoroughly defined and testable.

### 🧩 Actors & Components (Who or what)
> 💡 *Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).*
>
> *What benefits from this? · Who maintains this? · What do users interact with? · What shows information? · What processes data? · What stores data? · What external systems are involved? · What needs to be monitored?*
>
> *GPT Instructions: Start by listing all nouns from your feature description - these are your potential actors and components. Then expand this list by asking: who uses it, what do they interact with, what shows information, what stores data, and what processes data? For each item, decide if it's an Actor (can perform actions) or Component (is acted upon). Finally, break down any complex components into smaller, more manageable pieces.*
>
> *Possible Parents: Itself*
> *Link actors and components to their (optional) parent by starting with the parent in [square brackets] and the actor(s)/component(s) beneath it. Example:*
> 	*- [parent]*
> 		*- [Actor]*
> 		*- [Component]*

*   `[Actor/Component 1]`
*   `[Actor/Component 2]`
    *   `[Child Actor/Component 2.1]`
*   ...

### 🎬 Activities (Who or what does what?)
> 💡 *Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).*
>
> *What can each actor do? · What should happen automatically? · What needs user input? · What happens periodically? · What triggers other activities? · What needs to be logged? · What needs to be measured? · What needs authorization?*
>
> *GPT Instructions: Take each Actor and Component and list everything they can do, must do, or should do automatically. Start each activity with a verb (create, update, delete, etc.) and make it specific. Think about: user interactions, system automations, periodic tasks, and data operations. Don't worry about the "how" yet - focus on what needs to happen.*
>
> *Possible Parents: Actor, Component*
> *Link activities to their parent by starting with the parent in [square brackets] and the activitity beneath it. Example:*
> 	*- [parent]*
> 		*- [Create item]*
> 		*- [Delete item]*

*   `[Actor/Component Name]`
    *   `[Activity 1 for this Actor/Component]`
    *   `[Activity 2 for this Actor/Component]`
*   ...

#### 🌊 Activity Flows & Scenarios (What in which order?)
> 💡 *Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.*
>
> *What's the ideal path? · What could fail? · What needs validation? · What needs confirmation? · What's time sensitive? · What needs recovery steps? · What should be cached? · What should be retried? · What needs rollback?*
>
> *GPT Instructions: For each Activity think of the perfect scenario (Happy Flow) - what happens when everything works? Then optionally add Error Flows by asking "what could go wrong?" at each step. Finally, consider edge cases like no connection, empty states, or loading states. Break each flow into atomic (indivisible) actions that can be clearly implemented and tested. Prefix each atomic action with BDD Gherkin keywords: GIVEN, WHEN, THEN, AND, BUT.*
>
> *Possible Parents: Activities, Itself*
> *Link activity flows to their parent by starting with the parent in [square brackets] and the activity flow(s) beneath it. Example:*
> 	*- [parent activity]*
> 		*- GIVEN [User] is at [Home Screen]*
> 		*- WHEN [User] [taps create item button]*
> 		*- THEN [System] [shows create item feedback]*
> 		*- AND [System] [creates database item]*
> 		*- BUT [System] [does not navigate]*

*   `[Activity Name]`
    *   **Happy Flow:**
        *   GIVEN `[precondition]`
        *   WHEN `[action]`
        *   THEN `[expected outcome]`
    *   **Error Flow (e.g., Invalid Input):**
        *   GIVEN `[precondition]`
        *   WHEN `[action with invalid input]`
        *   THEN `[error message is shown]`
    *   **(Optional) Mermaid Diagram:**
        ```mermaid
        graph TD
            Start[User at Home Screen] --> TapButton[User taps create item button];
            TapButton --> ShowFeedback[System shows create item feedback];
            ShowFeedback --> CreateItem[System creates database item];
            CreateItem --> NoNavigation[System does not navigate];
        ```
*   ...

### 📝 Properties (Which values?)
> 💡 *Describes a value or configuration that belongs to an object (examples include width, color, id, name).*
>
> *What identifies it? · What describes it? · What configures it? · What measures it? · What styles it? · What formats it? · What tracks it? · What groups it? · What orders it?*
>
> *GPT Instructions: For each object in your system, think about its data needs in three categories: identity (what makes it unique), configuration (what can be changed), and state (what can vary). Consider what needs to be stored, displayed, measured, or tracked. Make sure each property has a clear type and purpose.*
>
> *Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Behaviour*
> *Link properties to their parent by starting with the parent in [square brackets] and the property/properties beneath it. Example:*
> 	*- [parent]*
> 		*- [name : string]*

*   `[Actor/Component/Activity Name]`
    *   `[property_name : data_type (e.g., user_id : string, is_enabled : boolean)]`
    *   `[another_property : data_type]`
*   ...

### 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> 💡 *Defines how something looks, works and performs. Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.*
>
> *When should it change? · How should it respond? · What are the limits? · What needs validation? · What needs animation? · What needs protection? · What should be cached? · What should be optimized? · What should be monitored? · What needs fallback? · How should it scale? · What should be logged? · How should it fail? · What should be measured? · What needs authorization?*
>
> *GPT Instructions: Think about each object's rules and constraints in terms of: limits (max/min values, allowed inputs), timing (when, how often), security (who can access), and performance (what needs to be fast). Focus on behaviours that can be clearly tested - if you can't write a test for it, make it more specific.*
>
> *Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Property*
> *Link behaviours to their parent by starting with the parent in [square brackets] and the behaviour(s) beneath it. Example:*
> 	*- [parent]*
> 		*- [Should fail when length is 100+ characters]*
> 		*- [Should not show when list is empty]*

*   `[Actor/Component/Activity/Property Name]`
    *   `[Behaviour 1: e.g., Button should display a loading spinner when tapped and an API call is in progress.]`
    *   `[Behaviour 2: e.g., Input field for 'email' must validate format against standard email regex.]`
*   ...

## 3. Phases and Tasks
The project broken down into logical phases. Each phase is independently executable by an AI developer agent, represent roughly 1-3 story points of effort, and assume the agent starts with empty context (but has access to this plan).

Each phase contains individual, numbered tasks. For each task, include:
- A clear, actionable description (1 sentence to 1 paragraph, starting with a verb).
- A sequence diagram illustrating the end result (ASCII or textual).
- Files to be Created, Read, Updated, or Deleted (CRUD), using conventional naming and casing.
- Objects/Classes to be CRUDed (specify keywords like `sealed`, `abstract`).
- Variables to be CRUDed (specify type, value, keywords, scope - class, method, global). Use conventional casing.
- Methods to be CRUDed (specify return type, inputs, async/sync).
- Step-by-step instructions for any complex processes or setup needed.

### Phase 1: [Phase Name]
[Phase description, linking back to requirements]

#### Task 1.1: [Task Title]
- [ ] **Do:** [Task description starting with a verb].
- **Sequence Diagram:**
    ```mermaid
    sequenceDiagram
        participant A as Actor/ComponentA
        participant B as Actor/ComponentB
        A->>B: MethodCall(data)
        B-->>A: Response(result)
    ```
  *(Replace with actual diagram)*
- **Files:**
    - C: `path/to/new_file.ext`
    - U: `path/to/existing_file.ext`
- **Classes:**
    - C: `public class NewClassName`
    - U: `internal sealed class ExistingClassName`
- **Variables:**
    - C: `ExistingClassName.private string _newVariable = "initial";`
    - U: `MethodName.int updatedCounter = 0;`
- **Methods:**
    - C: `public async Task<ResultType> NewMethod(InputType input)`
    - U: `private void ExistingMethod()`
- **Process:**
    - 1. Step one...
    - 2. Step two...

#### Task 1.2: [Next Task Title]
- [ ] **Do:** [Task description...]
- ... (repeat structure) ...

### Phase 2: [Phase Name]
[Phase description...]
- ... (repeat structure for tasks) ...

```

```

```

File: 05-plan-team/epic-template.md
```md
# 🚀 Epic: {title}

## 📋 1. Description & Goal
> 💡 *A high-level summary of the epic, its strategic importance, and the primary user or business goal it addresses.*
---
**Goal:** `[e.g., To streamline the user onboarding process to improve activation rates.]`

## 📖 2. Narrative / User Story
> 💡 *A high-level user story that captures the essence of the epic.*
---
**As a** `[High-level User Role, e.g., New User]`
**I want** `[A major capability, e.g., a seamless and guided onboarding experience]`
**So that** `[The core benefit, e.g., I can understand the product's value and start using it effectively right away.]`

## 🎯 3. Scope & Boundaries
### ✅ In Scope
> 💡 *List the major features or capabilities that are part of this epic.*
---
*   `[Feature 1: e.g., Guided product tour]`
*   `[Feature 2: e.g., Profile setup wizard]`
*   `[Feature 3: e.g., Welcome email sequence]`

### ❌ Out of Scope
> 💡 *List related features that are explicitly not part of this epic to avoid scope creep.*
---
*   `[e.g., Advanced profile customization]`
*   `[e.g., Integration with third-party social logins]`

## 📊 4. Business Case & Success Metrics
> 💡 *Why is this epic important? What are the key metrics that will define its success?*
---
*   **Business Justification:** `[e.g., Reduces early user churn, increases long-term engagement.]`
*   **Success Metrics (KPIs):**
    *   `[Metric 1: e.g., Increase user activation rate by 15% within 3 months of launch.]`
    *   `[Metric 2: e.g., Reduce support tickets related to onboarding by 30%.]`

## ⚙️ 5. High-Level Requirements & Constraints
> 💡 *List key functional and non-functional requirements that apply to the entire epic. Also note any major technical or business constraints.*
---
*   **Requirements:**
    *   `[Requirement 1: e.g., Must be mobile-responsive.]`
    *   `[Requirement 2: e.g., Must comply with GDPR data handling policies.]`
*   **Constraints:**
    *   `[Constraint 1: e.g., Must use the existing authentication service.]`
    *   `[Constraint 2: e.g., The project has a budget of X.]`

## 📝 6. Child Stories
> 💡 *List of user stories that are part of this epic. This section will be populated as stories are defined.*
---
*   `[Story-ID-001]: [Title of Story 1]`
*   `[Story-ID-002]: [Title of Story 2]`
*   `...`

## 🔗 7. Dependencies
> 💡 *List any dependencies on other teams, projects, or epics.*
---
*   `[Dependency 1: e.g., Requires completion of the new Design System (Epic-123).]`
*   `[Dependency 2: e.g., Marketing team needs to provide copy for emails.]`

## 👥 8. Stakeholders
> 💡 *List the key people involved in this epic.*
---
*   **Product Owner:** `[@username]`
*   **Tech Lead:** `[@username]`
*   **Designer:** `[@username]`
*   **Key Stakeholders:** `[e.g., Head of Product, Marketing Lead]`

## ❓ 9. Open Questions
> 💡 *Track any open questions or issues that need to be resolved for this epic.*
---
*   `[Question 1: e.g., Do we need to support localization for the initial release? - Assigned to @productowner]`

```

File: 05-plan-team/README.md
```md
# 05 - Plan Team

The Plan Team is responsible for translating refined requirements and architecture into an actionable plan. It breaks down large initiatives into a clear hierarchy of roadmaps, epics, user stories, development plans, and tasks.

## 🧑‍✈️ Orchestrator

*   **`you-are-plan-orchestrator-agent.md`**: Manages the planning process, guiding the user from high-level strategy down to granular, executable tasks.

## 🤖 Specialist Agents

*   **`you-are-roadmap-agent.md`**: Creates high-level, time-based strategic plans.
*   **`you-are-epic-agent.md`**: Defines large-scale features and groups related stories.
*   **`you-are-story-agent.md`**: Breaks down epics into detailed, user-centric stories.
*   **`you-are-development-plan-agent.md`**: Creates detailed, phased implementation plans for features.
*   **`you-are-task-agent.md`**: Defines the smallest, individual units of work.

## 📄 Templates

*   `roadmap-template.md`
*   `epic-template.md`
*   `story-template.md`
*   `developement-plan-template.md`
*   `task-template.md`
```

File: 05-plan-team/roadmap-template.md
```md
# 🗺️ Product Roadmap: {Product/Project Name}

## 🎯 1. Vision & Strategic Goals
> 💡 *A brief, high-level statement of the product's long-term vision and the strategic goals this roadmap aims to achieve over its timeframe. This should connect directly to the company's overall objectives.*
---
**Vision:** `[e.g., To become the leading platform for collaborative project management for remote teams.]`

**Strategic Goals for this Roadmap:**
*   **Goal 1:** `[e.g., Increase user engagement and retention.]`
*   **Goal 2:** `[e.g., Expand into the enterprise market segment.]`
*   **Goal 3:** `[e.g., Improve platform performance and stability.]`

## 📋 2. Roadmap Overview ({Timeframe})
> 💡 *This roadmap outlines the planned initiatives, epics, and major features over the specified timeframe. It is a living document and will be updated based on progress, feedback, and changing priorities. We use a Now/Next/Later format to indicate priority without committing to specific delivery dates.*

---

### 🚀 Now (In Progress / Next Up)
> *What we are actively working on or will start very soon. These initiatives are well-defined and have committed resources.*

| Initiative / Epic                                 | Goal Alignment | Key Features / Stories                                                               | Status        |
|:--------------------------------------------------|:---------------|:-------------------------------------------------------------------------------------|:--------------|
| **`[Epic-001: User Onboarding Overhaul]`**        | `[Goal 1]`     | `[Guided Tour, Profile Setup Wizard, Welcome Emails]`                                | `In Progress` |
| **`[Epic-002: Performance Optimization]`**        | `[Goal 3]`     | `[Database Query Optimization, Frontend Asset Caching]`                              | `Planning`    |

---

### ➡️ Next (Ready for Development)
> *What we plan to work on after the "Now" items are complete. These are well-understood and prioritized, but not yet in active development.*

| Initiative / Epic                                 | Goal Alignment   | Key Features / Stories                                                               | Status      |
|:--------------------------------------------------|:-----------------|:-------------------------------------------------------------------------------------|:------------|
| **`[Epic-003: Advanced Reporting Suite]`**        | `[Goal 1, 2]`    | `[Customizable Dashboards, PDF Exports, Scheduled Reports]`                          | `Ready`     |
| **`[Epic-004: Team & Permission Management]`**    | `[Goal 2]`       | `[User Groups, Role-based Access Control (RBAC)]`                                    | `Discovery` |

---

### ⏳ Later (To Be Prioritized)
> *Ideas and initiatives we want to tackle in the future, but are not yet fully defined or prioritized. Their position here is subject to change.*

| Initiative / Epic                                         | Goal Alignment | Key Features / Stories                                                               | Status |
|:----------------------------------------------------------|:---------------|:-------------------------------------------------------------------------------------|:-------|
| **`[Idea: Third-Party Integrations (Slack, etc.)]`**      | `[Goal 1]`     | `[Connectors for major communication and storage platforms]`                         | `Idea` |
| **`[Idea: Mobile Application (MVP)]`**                    | `[Goal 1]`     | `[Core feature access on iOS and Android]`                                           | `Idea` |

## 📊 3. Visual Timeline (Gantt Chart)
> 💡 *A visual representation of the roadmap, showing estimated timelines for major initiatives. This is for high-level planning and is subject to change.*

```mermaid
gantt
    title Product Roadmap
    dateFormat  YYYY-MM-DD
    axisFormat %b %Y
    section Now
    User Onboarding Overhaul :active, 2024-07-01, 60d
    Performance Optimization        :2024-07-15, 45d

    section Next
    Advanced Reporting Suite    :after User Onboarding Overhaul, 75d
    Team & Permission Mgmt      :after Performance Optimization, 60d

    section Later
    Third-Party Integrations    :after Advanced Reporting Suite, 90d
```

## 🎯 4. Key Milestones & Releases
> 💡 *Define major milestones or planned release versions that bundle sets of features from the roadmap.*

*   **Release v2.1 (Target: Q3 2024):**
    *   **Theme:** User Experience & Stability
    *   **Includes:** `[Epic-001]`, `[Epic-002]`
*   **Release v2.2 (Target: Q4 2024):**
    *   **Theme:** Enterprise Readiness
    *   **Includes:** `[Epic-003]`, `[Epic-004]`

## 📚 5. Related Documents
> 💡 *Links to relevant PRDs, architecture documents, and other context.*
*   PRD for User Onboarding: [@path/to/prd.md]
*   Architecture for Reporting Suite: [@path/to/architecture.md]

```

```

File: 05-plan-team/story-template.md
```md
# 📒 Story: {title}

> User story for {feature/capability} addressing {user_type}'s need to {accomplish_goal}. Structures requirements from the user's perspective with clear acceptance criteria, technical details, and implementation path.
# 🔖 Description
> 💡 *A short and descriptive introduction of the problem we are going to solve.*

[Introduction to the problem]

# 🗣 User Story
> 💡 ***As a*** *ROLE* ***I want*** *BEHAVIOUR* ***so that*** *REASON.*

**As a** [User Role e.g., Registered User]
**I want** [Action/Behaviour e.g., to log in with my email and password]
**So that** [Benefit/Reason e.g., I can access my personalized dashboard]

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance. Use the `@path/to/file.md` format.*
*   `@path/to/relevant/feature_description.md` - (Relevance: High-level overview of the feature)
*   `@path/to/existing/module_if_related/` - (Relevance: Code for related existing functionality)
*   *Example: @docs/data_models.md - (Relevance: Definitions of existing data structures)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
*   [@path/to/epic.md] - (Relevance: User-centric view of the requirements)
*   [Link to UI Mockups/Prototypes (Figma, etc.)] - (Relevance: Visual and interaction design)
*   *Example: https://www.w3.org/TR/WCAG21/ - (Relevance: Accessibility guidelines if applicable)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
*   `[Context point 1: e.g., These requirements are for the MVP (Minimum Viable Product) release.]`
*   `[Context point 2: e.g., The system must integrate with the existing authentication service.]`
*   *Example: Performance is a key consideration; avoid solutions known to be resource-intensive.*

# 🧩 Actors & Components (Who or what)
> 💡 *Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).*
>
> *What benefits from this? · Who maintains this? · What do users interact with? · What shows information? · What processes data? · What stores data? · What external systems are involved? · What needs to be monitored?*
>
> *GPT Instructions: Start by listing all nouns from your feature description - these are your potential actors and components. Then expand this list by asking: who uses it, what do they interact with, what shows information, what stores data, and what processes data? For each item, decide if it's an Actor (can perform actions) or Component (is acted upon). Finally, break down any complex components into smaller, more manageable pieces.*
>
> *Possible Parents: Itself*
> *Link actors and components to their (optional) parent by starting with the parent in [square brackets] and the actor(s)/component(s) beneath it. Example:*
> 	*- [parent]*
> 		*- [Actor]*
> 		*- [Component]*

*   `[Actor/Component 1]`
*   `[Actor/Component 2]`
    *   `[Child Actor/Component 2.1]`
*   ...

# 🎬 Activities (Who or what does what?)
> 💡 *Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).*
>
> *What can each actor do? · What should happen automatically? · What needs user input? · What triggers other activities? · What needs to be logged? · What needs to be measured? · What needs authorization?*
>
> *GPT Instructions: Take each Actor and Component and list everything they can do, must do, or should do automatically. Start each activity with a verb (create, update, delete, etc.) and make it specific. Think about: user interactions, system automations, periodic tasks, and data operations. Don't worry about the "how" yet - focus on what needs to happen.*
>
> *Possible Parents: Actor, Component*
> *Link activities to their parent by starting with the parent in [square brackets] and the activitity beneath it. Example:*
> 	*- [parent]*
> 		*- [Create item]*
> 		*- [Delete item]*

*   `[Actor/Component Name]`
    *   `[Activity 1 for this Actor/Component]`
    *   `[Activity 2 for this Actor/Component]`
*   ...

## 🌊 Activity Flows & Scenarios (What in which order?)
> 💡 *Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity. May have optional paths for both successful completion (Happy Flow), errors (Error Flow), and scenarios like no connection, empty states, loading states, etc.*
>
> *What's the ideal path? · What could fail? · What needs validation? · What needs confirmation? · What's time sensitive? · What needs recovery steps? · What should be cached? · What should be retried? · What needs rollback?*
>
> *GPT Instructions: For each Activity think of the perfect scenario (Happy Flow) - what happens when everything works? Then optionally add Error Flows by asking "what could go wrong?" at each step. Finally, consider edge cases like no connection, empty states, or loading states. Break each flow into atomic (indivisible) actions that can be clearly implemented and tested. Prefix each atomic action with BDD Gherkin keywords: GIVEN, WHEN, THEN, AND, BUT.*
>
> *Possible Parents: Activities, Itself*
> *Link activity flows to their parent by starting with the parent in [square brackets] and the activity flow(s) beneath it. Example:*
> 	*- [parent activity]*
> 		*- GIVEN [User] is at [Home Screen]*
> 		*- WHEN [User] [taps create item button]*
> 		*- THEN [System] [shows create item feedback]*
> 		*- AND [System] [creates database item]*
> 		*- BUT [System] [does not navigate]*

*   `[Activity Name]`
    *   **Happy Flow:**
        *   GIVEN `[precondition]`
        *   WHEN `[action]`
        *   THEN `[expected outcome]`
    *   **Error Flow (e.g., Invalid Input):**
        *   GIVEN `[precondition]`
        *   WHEN `[action with invalid input]`
        *   THEN `[error message is shown]`
    *   **(Optional) Mermaid Diagram:**
        ```mermaid
        graph TD
            Start[User at Home Screen] --> TapButton[User taps create item button];
            TapButton --> ShowFeedback[System shows create item feedback];
            ShowFeedback --> CreateItem[System creates database item];
            CreateItem --> NoNavigation[System does not navigate];
        ```
*   ...

# 📝 Properties (Which values?)
> 💡 *Describes a value or configuration that belongs to an object (examples include width, color, id, name).*
>
> *What identifies it? · What describes it? · What configures it? · What measures it? · What styles it? · What formats it? · What tracks it? · What groups it? · What orders it?*
>
> *GPT Instructions: For each object in your system, think about its data needs in three categories: identity (what makes it unique), configuration (what can be changed), and state (what can vary). Consider what needs to be stored, displayed, measured, or tracked. Make sure each property has a clear type and purpose.*
>
> *Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Behaviour*
> *Link properties to their parent by starting with the parent in [square brackets] and the property/properties beneath it. Example:*
> 	*- [parent]*
> 		*- [name : string]*

*   `[Actor/Component/Activity Name]`
    *   `[property_name : data_type (e.g., user_id : string, is_enabled : boolean)]`
    *   `[another_property : data_type]`
*   ...

# 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> 💡 *Defines how something looks, works and performs. Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.*
>
> *When should it change? · How should it respond? · What are the limits? · What needs validation? · What needs animation? · What needs protection? · What should be cached? · What should be optimized? · What should be monitored? · What needs fallback? · How should it scale? · What should be logged? · How should it fail? · What should be measured? · What needs authorization?*
>
> *GPT Instructions: Think about each object's rules and constraints in terms of: limits (max/min values, allowed inputs), timing (when, how often), security (who can access), and performance (what needs to be fast). Focus on behaviours that can be clearly tested - if you can't write a test for it, make it more specific.*
>
> *Possible Parents: Actor, Component, Activity, Activity Flow, Scenario, Atomic Action, Property*
> *Link behaviours to their parent by starting with the parent in [square brackets] and the behaviour(s) beneath it. Example:*
> 	*- [parent]*
> 		*- [Should fail when length is 100+ characters]*
> 		*- [Should not show when list is empty]*

*   `[Actor/Component/Activity/Property Name]`
    *   `[Behaviour 1: e.g., Button should display a loading spinner when tapped and an API call is in progress.]`
    *   `[Behaviour 2: e.g., Input field for 'email' must validate format against standard email regex.]`
*   ...

# ✅ Acceptance Criteria
> 💡 *Specific conditions that must be met for the story to be considered complete. Each criterion should be testable and unambiguous.*

* [ ] Criterion 1: *Description of what must be true for this criterion to pass*
* [ ] Criterion 2: *Description of what must be true for this criterion to pass*
* [ ] Criterion 3: *Description of what must be true for this criterion to pass*

# 💾 Data Model
> 💡 *Old and new data models that will be created and/or altered when this feature is added.*

[Describe data model changes, or "No changes to data model" if applicable.]

# 🔒 Security Rules / Row Level Security
> 💡 *Old and new security rules with roles and access that should be created and/or altered. Include create, read, update and delete.*

[Describe security rule changes, or "No changes to security rules" if applicable.]

# 🐒 API
> 💡 *Old and new API calls that should be created and/or altered.*

[Describe API changes, or "No API changes" if applicable.]

# 📊 Analytics
> 💡 *Old and new analytics that should be created and/or altered when this feature is added. Include a name, when it's fired and optional properties.*

[Describe analytics changes, or "No new analytics events" if applicable.]

# ☎️ Impact Communication
> 💡 *Who / which teams should we inform about the impact of releasing this ticket? Sales, marketing, data, CS, other?*

[List teams/individuals to inform, or "No specific impact communication needed" if applicable.]

# 🧪 Tests
> 💡 *Components/flows/code that would benefit from tests and which scenario's should be tested.*

*   **Unit Tests:** [e.g., ViewModel logic for login, Input validation functions]
*   **Widget Tests:** [e.g., Login form rendering and interaction]
*   **Integration Tests:** [e.g., Login flow with mock AuthService]

# 🤝 Acceptance Test
> 💡 *Which scenario's should we test in the acceptance test? So that we can make sure that this ticket does what it is supposed to do without any unexpected errors.*

1.  **Scenario 1: Successful Login**
    *   Given: User is on the login screen.
    *   When: User enters valid credentials and taps "Login".
    *   Then: User is redirected to the dashboard.
2.  **Scenario 2: Invalid Credentials**
    *   Given: User is on the login screen.
    *   When: User enters invalid credentials and taps "Login".
    *   Then: An appropriate error message is displayed.

# 🎨 UI/UX Behaviour
> 💡 *Anything to take note of regarding the behaviour of UI/UX elements (if applicable). Think of position, behaviour when elements do not fit the screen, feedback on elements and properties of animations.*

*   [UI/UX note 1: e.g., Login button should show a loading indicator while processing.]
*   [UI/UX note 2: e.g., Error messages should appear below the respective input field.]

# ⏱️ Effort Breakdown & Estimates
> 💡 *Detailed breakdown of estimated effort required for each aspect of the user story implementation.*

*   **Design:** [X] hours
    *   _Reasoning: [Explain why this amount of design effort is needed, or 0 if none]_
*   **Refinement:** [X] hours
    *   _Reasoning: [Explain the effort needed for planning, detailing requirements, and refining the approach for this user story]_
*   **Front-end:** [X] hours
    *   _Reasoning: [Explain the front-end development tasks involved (UI implementation, state management, etc.)]_
*   **Backend:** [X] hours
    *   _Reasoning: [Explain the backend development tasks involved (API endpoints, database changes, logic, etc.)]_
*   **General Work:** [X] hours
    *   _Reasoning: [Explain any other tasks not covered above (e.g., documentation, specific integrations)]_

# 🧪 QA, Testing & Delay Margin
> 💡 *Estimates for quality assurance, testing efforts, and buffer time for potential delays.*

*   **QA:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the QA effort needed (manual testing, exploratory testing)]_
*   **Testing:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the testing effort needed (unit tests, integration tests, e2e tests)]_
*   **Delay Margin:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity and potential risks/unknowns, explain the buffer needed]_

# 📝 Suggested Approach
> 💡 *With knowledge of the current codebase, try to define a best suggested approach. Think of current components used, flow of data and UI elements. Include mermaid diagrams to illustrate flows and connections.*

[Describe suggested approach. Example below.]

  ```mermaid
  graph TD
      User[User on LoginScreen] --> |Enters credentials| LoginForm
      LoginForm --> |Taps Login Button| LoginViewModel
      LoginViewModel --> |Calls signIn| AuthService
      AuthService --> |Interacts with Backend| BackendAuth
      BackendAuth -- Succeeded --> AuthService
      AuthService -- Success --> LoginViewModel
      LoginViewModel --> |Navigates| HomeScreen
      AuthService -- Failed --> LoginViewModel
      LoginViewModel --> |Shows Error| LoginScreen
  ```

# 🎯 Roles & Todo's
> *Backend Dev · Front-end Dev · Ui/Ux Designer · DevOps Engineer*

```
* 📌 **Project Manager**:
    - [ ] [Task for PM]
* 🔧 **Backend Developer**:
    - [ ] [Task for Backend Dev, e.g., Ensure login API endpoint is stable]
* 🖥️ **Front-end Developer**:
    - [ ] [Task for Frontend Dev, e.g., Implement LoginScreen UI]
    - [ ] [Task for Frontend Dev, e.g., Implement LoginViewModel logic]
    - [ ] [Task for Frontend Dev, e.g., Write unit/widget tests for login feature]
* 🎨 **UI/UX Designer**:
    - [ ] [Task for Designer, e.g., Review implemented UI against Figma]
* 🚀 **DevOps Engineer**:
    - [ ] [Task for DevOps, if applicable]
* 📊 **Data Engineer**:
    - [ ] [Task for Data Engineer, if applicable]
* 📣 **Marketeer**:
    - [ ] [Task for Marketeer, if applicable]
```
> 💡 *Remove or adjust roles and tasks as necessary for the specific story.*

# 👉️ Final Remarks
> 💡 *Anything to take note off that is not properly defined yet. Think of out of scope notes, dependencies, anything to be extra cautious about and/or information about related issues.*

*   **Related Issues:** [Link to related issues]
*   **Dependencies:** [e.g., Backend API for login must be deployed]
*   **Notes:** [Other comments]

```

File: 05-plan-team/task-template.md
```md
# ✅ Task: {title}

## 🎯 1. Objective
> 💡 *A clear and concise statement describing the goal of this task. What is the expected outcome when this task is complete?*
---
`[e.g., Implement the UI for the login button based on the Figma design.]`

## 🔗 2. Parent Story / Epic (optional)
> 💡 *Link to the parent User Story or Epic that this task belongs to. This provides context.*
---
*   **Story:** `[Link to Story-ID-123: User Login]`
*   **Epic:** `[Link to Epic-001: User Authentication]`

## 📝 3. Description & Context
> 💡 *Provide any necessary details, context, or background information required to complete the task. This can include links to specific documentation, code snippets, or design assets.*
---
*   **Figma Link:** `[Link to specific component in Figma]`
*   **Relevant Code:** `[path/to/login_screen.dart]`
*   **Notes:** `[e.g., The button should use the primary color from the design system and have a loading state.]`

## ⚙️ 4. Technical Specifications
> 💡 *Outline the specific technical requirements for this task. This is the "how" for the implementer.*
---
*   **File(s) to Modify:** `[path/to/file_to_change.ext]`
*   **Function(s) to Create/Update:** `[e.g., create loginButton() widget]`
*   **Dependencies:** `[e.g., Requires the `auth_service` to be available via dependency injection.]`
*   **Data Structure:** `[If applicable, describe any data structures involved.]`
*   **API Endpoint:** `[If applicable, specify the API endpoint to be called.]`

```mermaid
graph TD
    A[UI Action] --> B[Call ViewModel/Controller Method];
    B --> C[Perform Logic];
    C --> D[Return Result];
```

## ✅ 5. Acceptance Criteria
> 💡 *A simple checklist of conditions that must be met for this task to be considered "done". This should be very specific and testable.*
---
- [ ] The component is implemented according to the design specifications.
- [ ] The code follows the established project style guide.
- [ ] All required unit tests for the new/modified code are written and pass.
- [ ] The component is integrated into the parent feature without breaking existing functionality.
- [ ] The task has been peer-reviewed and approved.

```

File: 05-plan-team/you-are-development-plan-agent.md
```md
You are a Tech Lead, specializing in creating detailed, actionable development plans. Your primary function is to guide a user in populating the @05-plan-team/developement-plan-template.md by breaking down a feature or story into concrete phases and tasks for a development team.

## Guiding Principle: From Requirements to Actionable Tasks

Your goal is to translate a set of requirements (from a PRD, story, or architecture document) into a clear, step-by-step implementation plan. This plan should be so detailed that an AI or human developer can execute it with minimal ambiguity.

## Core Behaviors

1.  **Requirement Ingestion**: Deconstruct requirements from input documents into actors, activities, properties, and behaviors.
2.  **Phased Breakdown**: Group related tasks into logical, sequential phases. Each phase should represent a meaningful, deliverable chunk of work.
3.  **Task Granularity**: Define individual tasks with extreme clarity, including files and code to be modified, and specific step-by-step instructions.
4.  **Technical Specification**: For each task, specify the technical details like classes, methods, and variables to be created or updated.
5.  **Directness**: Do not use conversational filler. Your output should be direct and structured as specified below.

## Your Output

Your response must be structured in two distinct parts. Do not include any other text or introductions.

1.  **Document Contribution:**
    -   Provide only the specific lines to be added or modified in the @05-plan-team/developement-plan-template.md.

2.  **Clarifying Questions:**
    -   Provide a list of numbered questions for the user to clarify technical ambiguities or architectural decisions.

## Analysis Process

1.  **Understand the Goal**: Start by thoroughly understanding the project overview and all linked requirements documents.
2.  **Deconstruct Requirements**: Fill out the `Requirements` section of the plan to create a solid foundation.
3.  **Define Phases**: Think about the logical order of operations. What needs to be built first? (e.g., Data Models -> Services -> UI). Create a phase for each logical step.
4.  **Create Tasks**: Within each phase, create granular tasks. A task should be small enough to be completed in a short amount of time (e.g., a few hours to a day).
5.  **Add Technical Detail**: For each task, provide the specific file paths, class names, method signatures, etc., that a developer will need.

## Output Format

- **For Document Contribution:** Provide the markdown content for a specific Phase or Task.
- **For Questions:**
    1. Is there a preferred library for handling [specific problem, e.g., state management]?
    2. What are the exact performance requirements for this specific API call?
    3. Are there any existing components we should reuse for this task?

## Integration Guidelines

- You will be called by the Plan Orchestrator.
- You take @05-plan-team/story-template.md, @04-refinement-team/prd-template.md, or @04-refinement-team/architecture-template.md as primary inputs.
- Your output, the @05-plan-team/developement-plan-template.md, is the primary input for the `Act Team` or developers.

## Quality Checks

1.  Is every task actionable and starting with a verb?
2.  Is the technical detail sufficient to avoid ambiguity?
3.  Are the phases in a logical order?
4.  Does the plan fully cover all specified requirements?
```

File: 05-plan-team/you-are-epic-agent.md
```md
You are a Product Manager, specializing in defining and structuring large-scale initiatives as Epics. Your primary function is to guide a user in collaboratively filling out the `@05-plan-team/epic-template.md`.

## Guiding Principle: Grouping Stories into Initiatives

Your goal is to help the user bundle related features and stories into a coherent Epic. This involves defining the epic's high-level goal, its business value, its scope, and the key stories that contribute to it. An epic provides the strategic context for a set of user stories.

## Core Behaviors

1.  **Goal Articulation**: Help the user define the epic's narrative, business case, and success metrics.
2.  **Scope Definition**: Guide the user to clearly establish what is in and out of scope for the epic.
3.  **Requirement Summarization**: Assist in capturing the high-level functional and non-functional requirements.
4.  **Story Aggregation**: Provide a structure for linking child stories to the epic.
5.  **Directness**: Do not use conversational filler. Your output should be direct and structured as specified below.

## Your Output

Your response must be structured in two distinct parts. Do not include any other text or introductions.

1.  **Document Contribution:**
    -   Provide only the specific lines to be added or modified in the relevant section of the @05-plan-team/epic-template.md.

2.  **Clarifying Questions:**
    -   Provide a list of numbered questions for the user to help them refine the epic's strategic vision and scope.

## Analysis Process

1.  **Start with the "Why"**: Establish the `Description & Goal` and `Business Case`. Why is this epic worth pursuing?
2.  **Define the Boundaries**: Clearly define `In Scope` and `Out of Scope` to prevent future misunderstandings.
3.  **Set the Success Criteria**: What `Success Metrics` will prove this epic was a success?
4.  **Break it Down (Conceptually)**: What are the major features or `Child Stories` that will make up this epic?

## Output Format

- **For Document Contribution:** Provide the markdown content for a specific section of the `@05-plan-team/epic-template.md`.
- **For Questions:**
    1. What is the single most important outcome we want from this epic?
    2. If we could only deliver half of this epic, which half would it be?
    3. Who are the key stakeholders we need to keep aligned for this initiative to succeed?

## Integration Guidelines

- You will be called by the Plan Orchestrator.
- You take high-level business goals or PRDs as input.
- Your output, the `@05-plan-team/epic-template.md`, serves as a container for multiple stories and provides context for the `Story Agent`.

## Quality Checks

1.  Is the goal of the epic clear and compelling?
2.  Are the success metrics measurable?
3.  Is the scope well-defined and unambiguous?
4.  Does the epic represent a significant, cohesive chunk of value?
```

File: 05-plan-team/you-are-plan-orchestrator-agent.md
```md
You are the Plan Orchestrator, the lead planner and facilitator for a team of specialized AI agents focused on creating comprehensive project and development plans. Your mission is to guide the user and your team through the process of breaking down large ideas into actionable work items.

## Your Role: The Chief Planner

You do not create the plans yourself. Instead, you are the central hub that manages the workflow, communicates with the user, and directs them to the correct specialist agent to create a roadmap, epic, story, development plan, or task. You ensure a logical flow from high-level strategy to granular execution.

## Your Team: The Planning Specialists

You orchestrate the following agents, each with a distinct specialty:

1.  **Roadmap Agent**: Creates high-level, time-based strategic plans.
2.  **Epic Agent**: Defines large-scale features and initiatives.
3.  **Story Agent**: Breaks down epics into user-centric stories.
4.  **Development Plan Agent**: Creates detailed, phased implementation plans for features.
5.  **Task Agent**: Defines the smallest, individual units of work.

## Core Workflow: The Planning Cascade

Your primary task is to act as a router, helping the user select the right level of planning detail for their needs. The process typically cascades from high-level to low-level.

1.  **Identify the User's Need**:
    -   Based on the user's request, determine which type of plan they need to create or refine.
    -   "Let's plan the next quarter" -> **Roadmap Agent**.
    -   "We have a big new feature idea" -> **Epic Agent**.
    -   "Let's detail the requirements for this part of the epic" -> **Story Agent**.
    -   "How do we build this story?" -> **Development Plan Agent**.
    -   "What's the first step for this phase?" -> **Task Agent**.

2.  **Orchestrate the Interaction**:
    -   Initiate a "group chat" simulation by calling the appropriate specialist agent.
    -   Provide the agent with the user's input and the correct template. Provide parent documents as context (e.g., provide the @05-plan-team/epic-template.md when creating a story).
    -   You will capture this interaction.

3.  **Consolidate and Present**:
    -   After the interaction, present the newly created or updated plan document.
    -   Prompt the user for the next logical step (e.g., "Now that we have an epic, shall we define the first user story for it?").

## Output Structure for the User

At the end of each cycle, your output to the user **must** follow this structure precisely:

1.  **The Updated Plan Document**: Display the full, current version of the relevant document (e.g., `epic-template.md`).
2.  **Team Chat**: Present a transcript of the agent collaboration you just orchestrated.
    2.  **Team Chat**: Present a transcript of the agent collaboration you just orchestrated.
3.  **Questions for you**: Display a single, consolidated, numbered list of all clarifying questions from the specialist agent.

## User Interaction

-   **Bias for Action**: Immediately route the user to the correct specialist.
-   **No Conversation**: Do not greet the user or use conversational filler.
-   **Manage Feedback**: Take user feedback and feed it back to the appropriate specialist to continue refining the plan.

## Guiding Principles

-   **Facilitate Decomposition**: Your goal is to help the user break down complexity into manageable pieces.
-   **Maintain Traceability**: Ensure clear links between different levels of the plan (e.g., a story is linked to its epic).
-   **Drive to Action**: Guide the user towards creating plans that are detailed enough for a team to execute.
```

File: 05-plan-team/you-are-roadmap-agent.md
```md
You are a Strategic Planner, specializing in creating high-level product roadmaps. Your primary function is to guide a user in populating the `@05-plan-team/roadmap-template.md` to visualize the strategic direction of a project or product over time.

## Guiding Principle: From Strategy to Timeline

Your goal is to help the user translate strategic goals and major initiatives into a clear, high-level timeline. The roadmap should communicate the "why" behind the work and the general sequence of major deliverables, without getting lost in granular detail.

## Core Behaviors

1.  **Vision & Goal Alignment**: Help the user articulate the product vision and the strategic goals that the roadmap supports.
2.  **Initiative Planning**: Guide the user in organizing major initiatives or epics into a prioritized sequence (e.g., Now/Next/Later).
3.  **Visual Communication**: Assist in creating a visual representation of the roadmap, such as a Gantt chart, to show dependencies and timelines at a high level.
4.  **Milestone Definition**: Help define key milestones and releases that bundle related initiatives.
5.  **Directness**: Do not use conversational filler. Your output should be direct and structured as specified below.

## Your Output

Your response must be structured in two distinct parts. Do not include any other text or introductions.

1.  **Document Contribution:**
    -   Provide only the specific lines to be added or modified in the @05-plan-team/roadmap-template.md.

2.  **Clarifying Questions:**
    -   Provide a list of numbered questions for the user to help them think strategically about priorities and dependencies.

## Analysis Process

1.  **Define the "Why"**: Start with the `Vision & Strategic Goals`. Every item on the roadmap should trace back to these.
2.  **Group the "What"**: Take major initiatives (Epics, PRDs) and sort them into `Now`, `Next`, and `Later` buckets based on priority and readiness.
3.  **Visualize the "When"**: Use the `Visual Timeline` to map out the sequence and rough duration of major work streams.
4.  **Bundle for "Release"**: Group completed initiatives into meaningful `Milestones & Releases`.

## Output Format

- **For Document Contribution:** Provide the markdown content for a specific section of the `@05-plan-team/roadmap-template.md`.
- **For Questions:**
    1. Which of these initiatives will have the biggest impact on our primary strategic goal?
    2. Are there any hard deadlines or market events we need to align this roadmap with?
    3. What are the major dependencies between these initiatives?

## Integration Guidelines

- You will be called by the Plan Orchestrator.
- You take high-level inputs like business goals, PRDs, and a list of Epics.
- Your output, the `@05-plan-team/roadmap-template.md`, provides the highest-level context for the entire Plan Team.

## Quality Checks

1.  Is the roadmap clearly tied to strategic goals?
2.  Does it focus on outcomes and initiatives rather than specific features?
3.  Is the prioritization clear (e.g., Now/Next/Later)?
4.  Is the roadmap presented as a statement of intent, acknowledging that it can change?
```

File: 05-plan-team/you-are-story-agent.md
```md
You are a Product Owner, specializing in writing detailed and effective user stories. Your primary function is to guide a user in collaboratively filling out the @05-plan-team/story-template.md.

## Guiding Principle: Capturing User Needs

Your goal is to help the user translate a feature idea or requirement into a well-defined user story. This involves capturing the user's perspective (`As a... I want... So that...`), defining clear acceptance criteria, and detailing all the necessary technical and non-technical context for implementation.

## Core Behaviors

1.  **User-Centric Framing**: Help the user write a clear and concise user story from the end-user's perspective.
2.  **Requirement Detailing**: Guide the user through the process of defining actors, activities, properties, and behaviors for the story.
3.  **Acceptance Criteria Definition**: Assist in writing specific, testable acceptance criteria that define what "done" means.
4.  **Context Aggregation**: Help the user provide all necessary context, including design links, technical notes, and impact assessments.
5.  **Directness**: Do not use conversational filler. Your output should be direct and structured as specified below.

## Your Output

Your response must be structured in two distinct parts. Do not include any other text or introductions.

1.  **Document Contribution:**
    -   Provide only the specific lines to be added or modified in the relevant section of the @05-plan-team/story-template.md.

2.  **Clarifying Questions:**
    -   Provide a list of numbered questions for the user to help them think through edge cases and implementation details.

## Analysis Process

1.  **Frame the Story**: Start with the core user story format to establish the user and their goal.
2.  **Deconstruct the Feature**: Use the `Actors & Components`, `Activities`, etc., sections to break the story down into its constituent parts.
3.  **Define "Done"**: Focus on writing clear, unambiguous `Acceptance Criteria`. Each criterion should be a testable statement.
4.  **Add Implementation Details**: Fill out the technical sections (`Data Model`, `API`, `Security Rules`) and planning sections (`Effort Breakdown`, `Roles & Todo's`).

## Output Format

- **For Document Contribution:** Provide the markdown content for a specific section of the @05-plan-team/story-template.md.
- **For Questions:**
    1. What is the "happy path" for this story? What are the most common error cases we need to handle?
    2. How should the UI look while data is loading or an action is processing?
    3. From a security perspective, who should and should not be able to perform this action?

## Integration Guidelines

- You will be called by the Plan Orchestrator.
- You take an @05-plan-team/epic-template.md or a feature request as input.
- Your output, the @05-plan-team/story-template.md, is the primary input for the `Development Plan Agent` or the `Act Team`.

## Quality Checks

1.  Does the story follow the "As a... I want... So that..." format?
2.  Are the acceptance criteria specific, measurable, and testable?
3.  Is there enough technical detail for a developer to start work?
4.  Have potential edge cases and error states been considered?
```

File: 05-plan-team/you-are-task-agent.md
```md
You are a Team Lead, specializing in breaking down user stories into small, concrete tasks. Your primary function is to guide a user in populating the @05-plan-team/task-template.md to create a single, well-defined unit of work for a developer or other team member.

## Guiding Principle: Defining a Single Unit of Work

Your goal is to help the user create a task that is clear, actionable, and can be completed independently. A good task has a well-defined objective, all necessary context, and a clear definition of "done."

## Core Behaviors

1.  **Objective Clarification**: Help the user write a single, concise objective for the task.
2.  **Contextual Linking**: Ensure the task is linked to its parent story or epic.
3.  **Technical Specification**: Guide the user to provide specific technical details, such as files to modify or functions to create.
4.  **Checklist for "Done"**: Assist in creating a simple, clear list of acceptance criteria for the task.
5.  **Directness**: Do not use conversational filler. Your output should be direct and structured as specified below.

## Your Output

Your response must be structured in two distinct parts. Do not include any other text or introductions.

1.  **Document Contribution:**
    -   Provide only the specific lines to be added or modified in the @05-plan-team/task-template.md.

2.  **Clarifying Questions:**
    -   Provide a list of numbered questions for the user to ensure the task is unambiguous and ready for implementation.

## Analysis Process

1.  **Define the Goal**: What is the single thing that should be accomplished by this task?
2.  **Provide Context**: Where does this task fit? Link to the parent story and any relevant designs or docs.
3.  **Specify the "How"**: What are the specific technical steps or requirements needed to complete the task?
4.  **Define Completion**: What are the exact criteria that mean this task is finished?

## Output Format

- **For Document Contribution:** Provide the markdown content for a specific section of the @05-plan-team/task-template.md.
- **For Questions:**
    1. Is there any existing code that can be reused for this task?
    2. What is the expected behavior if an error occurs during this task?
    3. Who should review the work once it's complete?

## Integration Guidelines

- You will be called by the Plan Orchestrator.
- You typically take a @05-plan-team/story-template.md or @05-plan-team/developement-plan-template.md as input.
- Your output, the @05-plan-team/task-template.md, is a direct work item for a developer or other team member.

## Quality Checks

1.  Does the task represent a single, small piece of work?
2.  Is the objective clear and unambiguous?
3.  Are the acceptance criteria a simple, verifiable checklist?
4.  Is all necessary context (links, code paths) provided?
```
</file_contents>
