<!-- IMPORTANT: If this template is used to generate a new file with frontmatter (e.g., for GitHub issues), ensure all frontmatter fields like 'name', 'about', 'title', 'labels' are updated to match the specific ticket context. -->
# Project Plan: [Project Name]

## 1. Project Overview
A brief summary of the project, including its main objectives and key features. Clearly state the end goals formulated in your analysis.
- [ ] Read the project overview:
    - [Brief summary of the project, including end goals]

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*
---

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance.*
---
*   `[path/to/relevant/requirements_document.md]` - (Relevance: Detailed project requirements)
*   `[path/to/relevant/architecture_overview.md]` - (Relevance: High-level system architecture)
*   *Example: `src/core/constants.dart` - (Relevance: Core application constants and configurations)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
---
*   `[Link to PRD or Feature Brief]` - (Relevance: Overall project goals and user stories)
*   `[Link to Design System/UI Kit]` - (Relevance: UI components and styling guidelines)
*   *Example: `https://docs.exampleframework.com/` - (Relevance: Documentation for a key framework used)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
---
*   `[Context point 1: e.g., This project plan assumes the backend APIs are already defined and stable.]`
*   `[Context point 2: e.g., Focus on delivering Milestone 1 first as it unblocks other teams.]`
*   *Example: Adherence to the MVVM pattern is mandatory for all new Flutter code.*
---

## 2. Requirements
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
    - 🌊 Activity Flows & Scenarios: Break down complex activities into step-by-step processes.
        - [Parent]
            - [Activity Flow]
    - 📝 Properties: Define any values or configurations associated with components or activities.
        - [Parent]
            - [Property]
    - 🛠️ Behaviours: Describe how actors, components, properties, and activities should act or respond in different situations.
        - [Parent]
            - [Behaviour]

## 3. Milestones and Tasks
The project broken down into milestones. Each milestone should be executable by an independent AI developer agent. Each milestone should not exceed 3 story points and should be executable independently. You can assume that each milestone will be offered in a new call by an agent with empty context. However, the executing agent will have access the ticket and thus be able to form an idea about the work that has been done.

Each milestone consists of individual tasks for the unpacking agent. For each task, include:
    - A one-sentence to one-paragraph description of what needs to be done, starting with a verb.
    - A sequence diagram of end result.
    - File names that will be created, read, updated, or deleted (CRUD), using proper naming conventions and casing styles.
    - Objects/classes that will be CRUDed, including appropriate class keywords (e.g., sealed, abstract).
    - Variables that will be CRUDed, including types, values, and keywords. Use proper casing and specify whether they are part of a class, method, or global constants.
    - Methods that will be CRUDed, including return values, input values, and whether they are async/sync.
    - For any complex processes or setup required to achieve a task or goal, provide clear, step-by-step instructions on how to complete these processes.


### Milestone 1: [Milestone Name]
[Milestone description]

#### Task title
- [ ] 1. [Task description]
- Sequence diagram
    - [ASCII art or textual representation of the sequence diagram]
- Files:
    - [List of files]
- Classes:
    - [List of classes]
- Variables:
    - [List of variables]
- Methods:
    - [List of methods]
- Process:
    - [Step-by-step instructions for any complex processes]

- [ ] 2. [Next task...]

#### Task title
- [ ] 1. [Task description]
- Files:
    - [List of files]
- Classes:
    - [List of classes]
- Variables:
    - [List of variables]
- Methods:
    - [List of methods]
- Process:
    - [Step-by-step instructions for any complex processes]

### Milestone 2: [Milestone Name]
[Repeat the structure for each milestone]