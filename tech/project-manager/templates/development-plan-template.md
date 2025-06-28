# 📋 Development Plan: {title}

> Comprehensive project planning document for {project_name} breaking down work into manageable milestones and tasks. Defines actors, components, activities, and technical specifications to ensure clear communication and executable delivery plans.

## 🎯 1. Project Overview
A brief summary of the project, including its main objectives and key features. Clearly state the end goals formulated in your analysis.
- [ ] Read the project overview:
    - [Brief summary of the project, including end goals]

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance.*
*   `[path/to/relevant/requirements_document.md]` - (Relevance: Detailed project requirements)
*   `[path/to/relevant/architecture_overview.md]` - (Relevance: High-level system architecture)
*   *Example: `src/core/constants.dart` - (Relevance: Core application constants and configurations)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
*   `[Link to PRD or Feature Brief]` - (Relevance: Overall project goals and user stories)
*   `[Link to Design System/UI Kit]` - (Relevance: UI components and styling guidelines)
*   *Example: `https://docs.exampleframework.com/` - (Relevance: Documentation for a key framework used)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
*   `[Context point 1: e.g., This project plan assumes the backend APIs are already defined and stable.]`
*   `[Context point 2: e.g., Focus on delivering Milestone 1 first as it unblocks other teams.]`
*   *Example: Adherence to the MVVM pattern is mandatory for all new Flutter code.*

## 📋 2. Requirements
Overview of all requirements.
- [ ] Read the requirements:
    - 👤 Actors & 🧩 Components:
        - [Actors]
        - [Components]
    - 🎬 Activities: Specify what actions need to be performed.
        - [Actor]
            - [Activity]
        - [Component]
            - [Activity]
    - 🌊 Activity Flows & Scenarios: Complex activities broken down into step-by-step processes.
        - [Parent]
            - [Activity Flow]
    - 📝 Properties: Define any values or configurations associated with components or activities.
        - [Parent]
            - [Property]
    - 🛠️ Behaviours: Describe how actors, components, properties, and activities should act or respond in different situations.
        - [Parent]
            - [Behaviour]

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
