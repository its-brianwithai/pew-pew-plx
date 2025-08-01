---
name: dev-plan-template
description: Use this template to create a comprehensive development plan, breaking down work into manageable milestones, phases, and tasks.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📋 Development Plan: [Title]
> 💡 *A comprehensive project planning document for a feature or project, breaking down work into manageable phases and tasks. It defines actors, components, activities, and technical specifications to ensure clear communication and executable delivery plans.*

## 🎯 Project Overview
> 💡 *A brief summary of the project, including its main objectives, key features, and the end goals.*

[Brief summary of the project and its goals]

## 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

### 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance. Use the [[filename]] format.*
*   [[feature_description]] - (Relevance: High-level overview of the feature)
*   [[path/to/existing/module_if_related]] - (Relevance: Code for related existing functionality)
*   [[data_models]] - (Relevance: Definitions of existing data structures)

### 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
*   [[story-or-epic-name]] - (Relevance: User-centric view of the requirements)
*   [Link to UI Mockups/Prototypes (Figma, etc.)] - (Relevance: Visual and interaction design)
*   [Link to WCAG 2.1 specs] - (Relevance: Accessibility guidelines if applicable)

### 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
*   [Context point 1: e.g., These requirements are for the MVP (Minimum Viable Product) release.]
*   [Context point 2: e.g., The system must integrate with the existing authentication service.]
*   [Example: Performance is a key consideration; avoid solutions known to be resource-intensive.]

## 📋 Requirements
> 💡 *A summary of or link to the detailed requirements for the feature. This section can reuse content from a requirements document.*

### 🧩 Actors & Components (Who or what)
> 💡 *Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).*

*   [Actor/Component 1]
*   [Actor/Component 2]
    *   [Child Actor/Component 2.1]
*   ...

### 🎬 Activities (Who or what does what?)
> 💡 *Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).*

*   [Actor/Component Name]
    *   [Activity 1 for this Actor/Component]
    *   [Activity 2 for this Actor/Component]
*   ...

#### 🌊 Activity Flows & Scenarios (What in which order?)
> 💡 *Sequences of Atomic Actions (like "Tap button") that map out the steps to complete an Activity.*

*   [Activity Name]
    *   **Happy Flow:**
        *   GIVEN [precondition]
        *   WHEN [action]
        *   THEN [expected outcome]
    *   **Error Flow (e.g., Invalid Input):**
        *   GIVEN [precondition]
        *   WHEN [action with invalid input]
        *   THEN [error message is shown]
    *   **(Optional) Mermaid Diagram:**
        ```mermaid
        graph TD
            Start --> Step1;
            Step1 --> Step2;
        ```
*   ...

### 📝 Properties (Which values?)
> 💡 *Describes a value or configuration that belongs to an object (examples include width, color, id, name).*

*   [Actor/Component/Activity Name]
    *   [property_name : data_type (e.g., user_id : string, is_enabled : boolean)]
    *   [another_property : data_type]
*   ...

### 🛠️ Behaviours (How does it act when.. in terms of.. ?)
> 💡 *Defines how something looks, works and performs. Examples include ui/ux, rules & limits, data & analytics, security, performance and scalability.*

*   [Actor/Component/Activity/Property Name]
    *   [Behaviour 1: e.g., Button should display a loading spinner when tapped and an API call is in progress.]
    *   [Behaviour 2: e.g., Input field for 'email' must validate format against standard email regex.]
*   ...

## 🛣️ Phases and Tasks
> 💡 *The project broken down into logical phases. Each phase should be independently executable and represent a manageable amount of work. Each phase contains individual, numbered tasks with clear instructions.*

### Phase 1: [Phase Name]
> 💡 *[Description of the phase, its goals, and how it links back to the requirements.]*

<example>
#### Task 1.1: [Task Title]
- **Description:** [A clear, actionable description of the task, starting with a verb.]
- **Files to Change:**
    - Create: `path/to/new_file.ext`
    - Update: `path/to/existing_file.ext`
- **Objects/Classes to Change:**
    - Create: `public class NewClassName`
    - Update: `internal sealed class ExistingClassName`
- **Methods to Change:**
    - Create: `public async Task<ResultType> NewMethod(InputType input)`
- **Instructions:**
    1. [Step-by-step instructions for any complex processes.]
    2. [Another step.]
- **Diagram:**
    ```mermaid
    sequenceDiagram
        participant A as ComponentA
        participant B as ComponentB
        A->>B: MethodCall(data)
        B-->>A: Response(result)
    ```
</example>

### Phase 2: [Phase Name]
> 💡 *[Description of the next phase.]*

<example>
#### Task 2.1: [Task Title]
- **Description:** [Description of the task.]
- **Files to Change:** ...
</example>