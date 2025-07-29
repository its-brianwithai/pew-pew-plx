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

## 📋 Requirements
> 💡 *A summary of or link to the detailed requirements for the feature. This section can reuse content from a requirements document.*

[Link to [[requirements-template]] or summarize key requirements here.]

### 🧩 Actors & Components
> 💡 *List the primary actors and components involved in this plan.*

[List Actors and Components]

### 🎬 Activities
> 💡 *List the key activities that will be implemented.*

[List Activities]

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