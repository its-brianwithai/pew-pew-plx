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
