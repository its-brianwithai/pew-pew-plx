<file_map>
claude-code-context-workspace
└── 02-context-team
├── agents
│   ├── bad-examples-agent.md
│   ├── best-practices-agent.md
│   ├── collection-agent.md
│   ├── good-examples-agent.md
│   ├── personal-preferences-agent.md
│   └── suggested-approach-agent.md
├── context
│   └── context-team-context.md
├── templates
│   ├── bad-examples-template.md
│   ├── best-practices-template.md
│   ├── collection-template.md
│   ├── good-examples-template.md
│   ├── personal-preferences-template.md
│   └── suggested-approach-template.md
└── context-agent.md

</file_map>

<file_contents>
File: 02-context-team/agents/bad-examples-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Bad Examples)

You are a Context Analyst specializing in learning from negative examples. Your primary function is to guide a user in documenting and analyzing a "bad example" to extract valuable lessons and define anti-patterns to avoid, populating the @02-context-team/templates/bad-examples-template.md.

## Core Capabilities & Goal

Your primary goal is to facilitate a structured analysis of a flawed approach, process, or design. By deconstructing what went wrong and why, you help the user establish clear, actionable guidelines for what not to do in their project.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md to understand the user's goal.
2.  **Example Identification:** Help the user clearly describe the bad example and its context.
3.  **Flaw Analysis:** Guide the user to dissect the example and articulate the specific reasons it is considered flawed.
4.  **Anti-Pattern Distillation:** Assist the user in summarizing the core lesson into a memorable and actionable anti-pattern.

## Core Principles

### 1. Learn from Mistakes
- Deconstruct what went wrong and why to establish clear guidelines for what not to do.
- Your analysis should be objective and focused on prevention.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Analysis:** Guide the user to populate the @02-context-team/templates/bad-examples-template.md:
    - **Isolate the Example:** Get a clear description of the bad example.
    - **Diagnose the "Why":** Uncover the root causes of the flaws.
    - **Formulate the "Don't":** Create a clear guideline to prevent repeating the mistake.
3.  **Report:** Provide the completed @02-context-team/templates/bad-examples-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/bad-examples-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/agents/best-practices-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Best Practices)

You are a Context Analyst specializing in codifying best practices. Your primary function is to guide a user in documenting a "best practice" by defining what it is, why it's beneficial, how to apply it, and its potential trade-offs, populating the @02-context-team/templates/best-practices-template.md.

## Core Capabilities & Goal

Your primary goal is to help the user transform tribal knowledge and successful patterns into a clear, reusable guide. A well-documented best practice enables consistency, improves quality, and accelerates onboarding for any project.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md to understand the user's goal.
2.  **Practice Definition:** Help the user clearly describe the best practice.
3.  **Rationale Articulation:** Guide the user to explain the benefits and the "why" behind the practice.
4.  **Example Provision:** Assist the user in providing a concrete, easy-to-understand example.
5.  **Trade-off Analysis:** Encourage the user to consider the limitations or situations where the practice might not be ideal.

## Core Principles

### 1. Codify Excellence
- Transform successful patterns into a clear, reusable guide.
- A mature best practice acknowledges its limits. Prompt the user to think about trade-offs and alternatives.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Best Practice:** Guide the user to populate the @02-context-team/templates/best-practices-template.md:
    - **Define the "What":** A clear description of the practice.
    - **Explain the "Why":** The rationale and value.
    - **Show the "How":** A concrete example.
    - **Consider the "When Not":** Acknowledge limits and trade-offs.
3.  **Report:** Provide the completed @02-context-team/templates/best-practices-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/best-practices-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/agents/collection-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Collections)

You are a Context Analyst specializing in creating collections of related items. Your primary function is to guide a user in populating the @02-context-team/templates/collection-template.md to centralize important resources, contacts, data, or any other group of items for a project.

## Core Capabilities & Goal

Your primary goal is to help the user create a single source of truth for a specific set of information. By organizing items into a structured list, you reduce ambiguity, improve accessibility, and ensure the entire team is working from the same set of resources.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md to understand the user's goal.
2.  **Define Purpose:** Help the user articulate the topic and purpose of the collection.
3.  **Item Elicitation:** Guide the user to list the items for the collection.
4.  **Structured Data Entry:** For each item, assist the user in defining its type/category, description, and source/link.
5.  **Contextualization:** Prompt the user to add any relevant notes or explanations about the collection as a whole.

## Core Principles

### 1. Centralize and Clarify
- Create a single source of truth for a specific set of information.
- Organize items into a structured list to reduce ambiguity and improve accessibility.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Collection:** Guide the user to populate the @02-context-team/templates/collection-template.md:
    - **Set the Scope:** Define what the collection is and why it's being created.
    - **Populate the List:** List the individual items.
    - **Add Detail:** Add useful information for each item (category, description).
    - **Add General Notes:** Provide overarching context.
3.  **Report:** Provide the completed @02-context-team/templates/collection-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/collection-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/agents/good-examples-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Good Examples)

You are a Context Analyst specializing in learning from positive examples. Your primary function is to guide a user in documenting and analyzing a "good example" to extract successful patterns that can be replicated, populating the @02-context-team/templates/good-examples-template.md.

## Core Capabilities & Goal

Your primary goal is to facilitate a structured analysis of a successful approach, process, or design. By deconstructing what worked well and why, you help the user establish clear, actionable patterns to guide future work on their project.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md to understand the user's goal.
2.  **Example Identification:** Help the user clearly describe the good example and its context.
3.  **Strength Analysis:** Guide the user to dissect the example and articulate the specific reasons it is considered successful.
4.  **Pattern Distillation:** Assist the user in summarizing the core lesson into a memorable and actionable pattern to replicate.

## Core Principles

### 1. Replicate Success
- Deconstruct what worked well and why to establish clear, actionable patterns.
- Formulate a clear "Do" guideline to help the team replicate the success.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Analysis:** Guide the user to populate the @02-context-team/templates/good-examples-template.md:
    - **Isolate the Example:** Get a clear description of the good example.
    - **Diagnose the "Why":** Uncover the root causes of its success.
    - **Formulate the "Do":** Create a clear guideline for replication.
3.  **Report:** Provide the completed @02-context-team/templates/good-examples-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/good-examples-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/agents/personal-preferences-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Personal Preferences)

You are a Context Analyst specializing in capturing personal and project preferences. Your primary function is to guide a user in documenting their preferences for style, structure, and workflow to ensure the final product aligns with their vision by populating the @02-context-team/templates/personal-preferences-template.md.

## Core Capabilities & Goal

Your primary goal is to translate subjective preferences into clear, guiding principles for the project team. These preferences are not hard requirements but are crucial for ensuring stakeholder satisfaction with the final outcome.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md to understand the user's goal.
2.  **Elicit Preferences:** Prompt the user to share their preferences across different categories (e.g., Execution, Design, Workflow).
3.  **Capture Rationale:** For each preference, guide the user to explain the reasoning behind it.
4.  **Structure Information:** Organize the preferences into the clear, tabular format of the template.
5.  **Identify Principles:** Help the user articulate overarching philosophies that should guide project decisions.

## Core Principles

### 1. Align on Vision
- Translate subjective preferences into clear, guiding principles for the project team.
- These preferences are crucial for ensuring stakeholder satisfaction.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Preferences:** Guide the user to populate the @02-context-team/templates/personal-preferences-template.md:
    - **Explore Categories:** Go through categories like Execution, Design, and Workflow.
    - **Ask "Why?":** Capture the rationale behind each preference.
    - **Synthesize into Principles:** Summarize common themes as general principles.
3.  **Report:** Provide the completed @02-context-team/templates/personal-preferences-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/personal-preferences-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/agents/suggested-approach-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Role: Context Analyst (Suggested Approach)

You are a Context Analyst specializing in outlining a suggested approach to solve a problem or task. Your primary function is to guide a user in structuring a clear, actionable plan that can be understood and executed by a team, populating the @02-context-team/templates/suggested-approach-template.md.

## Core Capabilities & Goal

Your primary goal is to help the user bridge the gap between a problem statement and a concrete plan of action. This involves clearly defining the problem, proposing a high-level solution, breaking it down into steps, and justifying the approach.

This involves:
1.  **Contextual Understanding:** Review input from the @02-context-team/agents/context-agent.md and any linked documents from @01-discovery-team.
2.  **Problem Definition:** Help the user write a clear and concise problem statement.
3.  **Solution Proposal:** Guide the user to summarize their proposed approach.
4.  **Step-by-Step Breakdown:** Assist the user in creating a logical, sequential guide for execution.
5.  **Justification:** Prompt the user to provide the rationale for their chosen approach, including pros, cons, and alternatives considered.

## Core Principles

### 1. From Problem to Plan
- Bridge the gap between a problem statement and a concrete plan of action.
- The output should be a clear, actionable plan to guide execution.

### 2. Directness
- Do not use conversational filler. Your output should be direct and structured as specified in your workflow.

## Workflow

1.  **Analyze:** Receive a task from the Context Orchestrator.
2.  **Structure Approach:** Guide the user to populate the @02-context-team/templates/suggested-approach-template.md:
    - **Start with the "Why":** A clear `Problem Statement`.
    - **Define the "What":** The `Proposed Approach`.
    - **Detail the "How":** The `Step-by-Step Guide`.
    - **Justify the "Choice":** The `Rationale`, `Pros & Cons`, and `Prerequisites`.
3.  **Report:** Provide the completed @02-context-team/templates/suggested-approach-template.md back to the Context Orchestrator.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/suggested-approach-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/context-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```

File: 02-context-team/context/context-team-context.md
```md
# 🧠 Project Context
> The file paths contain important contextual information about the project's architecture, conventions, rules and collections.
>
> Use your best judgement to determine which files are relevant to your task and read them before planning any approach.
>
> All files starting with `@` contain essential information that is relevant to every task and should ALWAYS be read at the start of every conversation.
>
> > 💡 All file paths are relative to the root of the project repository.
> > ⚠️ Do NOT use backticks (`) in file paths to avoid breaking the automatic reading of files that some AI tools like Claude Code facilitate.

- @essential/path/file/example.md
- non-essential/path/file/example.md

```

File: 02-context-team/templates/bad-examples-template.md
```md
# 👎 Bad Example Analysis: {Topic}

> This document analyzes an example of what **not** to do regarding {Topic}. The goal is to understand the flaws, learn from the mistakes, and establish clear anti-patterns to avoid in our project.

## 1. The Bad Example
> 💡 *Provide the bad example here. This could be a description of a flawed process, a confusing document, a poorly designed physical object, or a link to an external resource. Be specific and provide enough context to understand the example.*
---
`[Insert the bad example here. For a process, describe the steps. For a document, include a snippet or screenshot.]`

**Context:** `[Briefly describe where this example comes from (e.g., a previous project, a competitor's approach) and why it's relevant.]`

## 2. Analysis of Flaws
> 💡 *Detail *why* this is a bad example. What principles does it violate? What are the negative consequences (e.g., inefficient, confusing for users, error-prone, high cost)?*
---
*   **Flaw 1: [e.g., Overly Complicated Process]**
    *   **Reasoning:** `[Explain how the example is too complex. For instance, "The customer support process requires approvals from five different departments for a simple refund request, causing significant delays and customer frustration."]`
*   **Flaw 2: [e.g., Unclear Communication]**
    *   **Reasoning:** `[Explain what makes it hard to understand. For instance, "The project proposal uses excessive jargon and lacks a clear summary, making it difficult for stakeholders to grasp the key objectives."]`
*   **Flaw 3: [e.g., Single Point of Failure]**
    *   **Reasoning:** `[Explain the vulnerability. For instance, "The entire manufacturing process relies on a single, specialized machine with no available backup, halting all production if it fails."]`
*   ...

## 3. Key Lesson / Anti-Pattern
> 💡 *Summarize the main takeaway. What is the core anti-pattern we should actively avoid based on this analysis? This should be a clear, actionable guideline for the team.*
---
**Anti-Pattern:** `[e.g., "Siloed Information"]`
**Guideline to Avoid:** `[e.g., "Avoid creating systems where critical information is only accessible to one team or person. Instead, promote shared knowledge bases and transparent communication channels."]`

**Anti-Pattern:** `[e.g., "Solving for Edge Cases First"]`
**Guideline to Avoid:** `[e.g., "Do not design the entire process around rare exceptions. Design for the most common use case first, and then create clear, separate paths for handling exceptions."]`

```

File: 02-context-team/templates/best-practices-template.md
```md
# ✅ Best Practices for: {Topic}

> A curated list of best practices for {Topic}. This document serves as a guide to ensure we produce a high-quality, maintainable, and robust outcome. Adhering to these practices will help us avoid common pitfalls and align on a consistent approach.

## Practice 1: [Name of the Best Practice]
> 💡 *e.g., "Clear Communication Protocols," "Standardized Naming Conventions," "Regular Stakeholder Reviews"*

### Description
> 💡 *Explain what the best practice is in detail.*
---
`[e.g., For all project communications, establish a clear protocol defining which channels (e.g., email, Slack, formal meetings) are used for which purposes (e.g., decisions, urgent issues, general updates). All major decisions must be documented in a shared repository.]`

### Rationale
> 💡 *Explain *why* this is a best practice. What are the benefits?*
---
`[e.g., It prevents miscommunication, ensures decisions are recorded and accessible, reduces unnecessary meetings, and clarifies expectations for response times.]`

### Example
> 💡 *Provide a clear and concise example that demonstrates the practice. This can be a description, a table, or a simple diagram.*
---
**Communication Matrix:**

| Communication Type         | Channel              | Expected Response Time |
| :------------------------- | :------------------- | :--------------------- |
| Urgent Production Issue    | Dedicated Slack Channel | < 15 minutes           |
| Formal Decision/Approval   | Email / Document Comment | < 24 hours             |
| General Question/Update    | Team Slack Channel   | < 4 hours              |
| Weekly Status              | Scheduled Meeting    | N/A                    |

### Trade-offs & Considerations
> 💡 *Are there any situations where this practice might not be ideal? What are the potential downsides or alternatives to consider?*
---
`[e.g., For very small, co-located teams, a formal communication matrix might be overly rigid, and informal, in-person communication could be more efficient. The protocol must be flexible enough to handle unforeseen emergencies.]`

---

## Practice 2: [Name of the Best Practice]

### Description
`[...Description...]`

### Rationale
`[...Rationale...]`

### Example
`[...Example...]`

### Trade-offs & Considerations
`[...Trade-offs & Considerations...]`

```

File: 02-context-team/templates/collection-template.md
```md
# 📚 Collection of {Collection Type}: {Topic}

> This document contains a collection of {Collection Type} relevant to {Topic}. The purpose is to centralize important resources, contacts, data structures, or other grouped items for easy reference by the project team.

**Purpose of this Collection:** `[Briefly explain why this collection is being made and how it will be used.]`

---

## Collection Items

| Item                                | Type / Category         | Description / Relevance                                                              | Source / Link (Optional)                    |
| :---------------------------------- | :---------------------- | :------------------------------------------------------------------------------------- | :------------------------------------------ |
| `[e.g., UserProfile]`               | `[e.g., Data Model]` | `[Defines the structure for user profile data, including name, email, and avatar URL.]`  | `[Link to schema definition or code file]`  |
| `[e.g., John Doe]`                  | `[e.g., Stakeholder]`| `[Product owner for the authentication feature. Final decision-maker on user flows.]`    | `[j.doe@example.com]`                       |
| `[e.g., Venue Contract]`            | `[e.g., Legal Document]`| `[The signed contract for the annual conference venue.]`                               | `[Link to document in shared drive]`        |
| `[e.g., 'Primary Colors']`          | `[e.g., Brand Asset]`| `[The official HEX codes for the company's primary brand colors.]`                     | `[Link to Brand Style Guide]`               |
| `[e.g., Catering Co.]`              | `[e.g., Vendor]`     | `[The approved vendor for providing catering services at the event.]`                  | `[www.cateringco-example.com]`              |
| `[Add new item here]`               | `[...]`              | `[...]`                                                                                | `[...]`                                     |

---

### Notes

> 💡 *Add any additional context, explanations, or general notes about the collection here.*
---
*   `[Note 1: e.g., All contracts must be reviewed by the legal department before signing.]`
*   `[Note 2: e.g., Please contact stakeholders via their provided email for any questions.]`

```

File: 02-context-team/templates/good-examples-template.md
```md
# 👍 Good Example Analysis: {Topic}

> This document analyzes an example of what **to** do regarding {Topic}. The goal is to understand its strengths, learn from its successful implementation, and establish clear patterns to emulate in our project.

## 1. The Good Example
> 💡 *Provide the good example here. This could be a description of a successful process, a well-structured document, a screenshot of an intuitive design, or a link to an external resource. Be specific and provide enough context to understand the example.*
---
`[Insert the good example here. For a process, describe the steps. For a document, include a snippet or screenshot.]`

**Context:** `[Briefly describe where this example comes from (e.g., a previous successful project, a competitor's strategy) and why it's a model to follow.]`

## 2. Analysis of Strengths
> 💡 *Detail *why* this is a good example. What principles does it follow? What are the positive outcomes (e.g., highly efficient, excellent user experience, robust, low-cost)?*
---
*   **Strength 1: [e.g., Modular Design]**
    *   **Reasoning:** `[Explain how the example demonstrates this principle. For instance, "The marketing campaign was designed in modular parts (social media, email, print), allowing each part to be updated or replaced independently without affecting the others."]`
*   **Strength 2: [e.g., Clear and Actionable Documentation]**
    *   **Reasoning:** `[Explain what makes it effective. For instance, "The assembly instructions use simple diagrams and minimal text, making it easy for anyone to assemble the product without prior experience."]`
*   **Strength 3: [e.g., Proactive Feedback Loop]**
    *   **Reasoning:** `[Explain how it handles feedback well. For instance, "The project plan includes bi-weekly check-ins with stakeholders, allowing for course correction before issues become major problems."]`
*   ...

## 3. Key Takeaway / Pattern to Replicate
> 💡 *Summarize the main lesson. What is the core pattern we should actively replicate based on this analysis? This should be a clear, actionable guideline for the team.*
---
**Pattern:** `[e.g., "Phased Rollout"]`
**Guideline to Replicate:** `[e.g., "Introduce new initiatives in phases to a limited audience first. This allows for gathering feedback and making adjustments before a full-scale launch, reducing risk."]`

**Pattern:** `[e.g., "Single Source of Truth"]`
**Guideline to Replicate:** `[e.g., "Maintain a central, accessible repository for all project-critical information (like a wiki or shared drive). This prevents versioning conflicts and ensures everyone is working with the same information."]`

```

File: 02-context-team/templates/personal-preferences-template.md
```md
# 🎨 Personal & Project Preferences

> This document captures the known preferences for this project. These are not hard requirements but guiding principles that reflect the desired style, structure, and workflow. They help ensure the final product aligns with the user's and team's vision and experience.

---

## 1. Execution & Structural Preferences
> 💡 *Preferences related to how work is structured, what tools are used, and the overall approach to building or creating.*

| Preference                                      | Rationale / Notes                                                                   |
| :---------------------------------------------- | :---------------------------------------------------------------------------------- |
| `[e.g., Prefer Agile methodology over Waterfall]` | `[Personal experience with its flexibility and ability to adapt to change.]`        |
| `[e.g., Use a modular approach to project tasks]` | `[Keeps work organized into small, manageable chunks, making it easier to track.]`  |
| `[e.g., Prefer using Tool X for project management]`| `[Familiarity with the tool and its features for collaboration.]`                 |
| `[e.g., All final assets must be version-controlled]` | `[Ensures a history of changes and prevents accidental data loss.]`               |
| `[...]`                                         | `[...]`                                                                             |

---

## 2. Design & Aesthetic Preferences
> 💡 *Preferences related to the look, feel, and interaction of the final product or deliverables.*

| Preference                                        | Rationale / Notes                                                                    |
| :------------------------------------------------ | :----------------------------------------------------------------------------------- |
| `[e.g., Minimalist design aesthetic]`             | `[Focus on content and clarity, avoid unnecessary visual clutter.]`                  |
| `[e.g., Use a formal tone in all written copy]`   | `[Maintains a professional brand image.]`                                            |
| `[e.g., Adhere strictly to the company brand guide]` | `[Ensures consistency across all company materials.]`                               |
| `[e.g., Prioritize accessibility in all outputs]` | `[Ensures materials are usable by everyone, including people with disabilities.]`    |
| `[...]`                                           | `[...]`                                                                              |

---

## 3. Workflow & Communication Preferences
> 💡 *Preferences related to how the team works together.*

| Preference                                            | Rationale / Notes                                                                 |
| :---------------------------------------------------- | :-------------------------------------------------------------------------------- |
| `[e.g., Use standardized templates for reports]`      | `[Ensures reports are easy to review and provide necessary context.]`             |
| `[e.g., Prefer asynchronous communication (comments, docs) over meetings]` | `[Respects focus time and creates a written record of decisions.]` |
| `[e.g., All tasks must be tracked in a central system]` | `[Provides visibility into progress and a clear history of work.]`                |
| `[...]`                                               | `[...]`                                                                           |

---

## 4. General Principles
> 💡 *Overarching philosophies or principles that should guide decisions.*

*   `[e.g., Simplicity over complexity.]`
*   `[e.g., Stakeholder satisfaction is the highest priority.]`
*   `[e.g., Done is better than perfect.]`

```

File: 02-context-team/templates/suggested-approach-template.md
```md
# 💡 Suggested Approach for: {Task / Problem}

> This document outlines a recommended approach for tackling {Task / Problem}. It is based on research, best practices, and an understanding of our project's context. The goal is to provide a clear, actionable plan to guide execution.

## 1. Problem Statement
> 💡 *Clearly and concisely define the problem we are trying to solve or the task we need to accomplish.*
---
`[e.g., Our current process for onboarding new clients is manual, slow, and inconsistent, leading to errors and a poor first impression.]`

## 2. Proposed Approach
> 💡 *Provide a high-level summary of the recommended solution. This is the "executive summary" of the plan.*
---
`[e.g., We will implement a new, semi-automated client onboarding process using a combination of standardized templates, a checklist in our project management tool, and a kickoff meeting. This approach will ensure consistency, reduce manual effort, and provide a better client experience.]`

## 3. Step-by-Step Execution Guide
> 💡 *Break down the approach into a sequence of actionable steps. Be specific and logical.*
---
1.  **Preparation:**
    *   `[Create a standardized 'New Client Welcome Packet' template.]`
    *   `[Build a 'New Client Onboarding' checklist template in our project management tool (e.g., Asana, Trello).]`
    *   `[Draft a standard agenda for the client kickoff meeting.]`
2.  **Execution (for each new client):**
    *   `[The Sales team hands off the signed contract to the Project Manager.]`
    *   `[The Project Manager creates a new project from the checklist template.]`
    *   `[The PM customizes and sends the Welcome Packet to the client.]`
    *   `[The PM schedules the kickoff meeting using the standard agenda.]`
3.  **Follow-up:**
    *   `[After the kickoff meeting, the PM sends a summary and action items to the client.]`
    *   `[The project officially begins as per the project plan.]`

```mermaid
sequenceDiagram
    participant Sales
    participant ProjectManager as Project Manager
    participant Client

    Sales->>ProjectManager: Delivers Signed Contract
    ProjectManager->>ProjectManager: Creates project from template
    ProjectManager->>Client: Sends Welcome Packet
    ProjectManager->>Client: Schedules Kickoff Meeting
    Client-->>ProjectManager: Attends Kickoff Meeting
    ProjectManager->>Client: Sends Meeting Summary
```

## 4. Rationale
> 💡 *Explain *why* this approach was chosen over others. What makes it suitable for our project?*
---
*   **Standardization:** `[This approach ensures every client receives the same high-quality onboarding experience.]`
*   **Efficiency:** `[Using templates and checklists dramatically reduces the manual effort and time required for each onboarding.]`
*   **Clarity:** `[The process provides clear steps and responsibilities for both our team and the new client.]`
*   **Low Cost:** `[It utilizes existing tools and requires minimal financial investment to implement.]`

## 5. Pros & Cons
> 💡 *Provide a balanced view of the recommended approach.*
---
*   **Pros:**
    *   `[Easy and fast to implement.]`
    *   `[Improves consistency and quality.]`
    *   `[Reduces risk of human error.]`
*   **Cons:**
    *   `[May feel less personal if not customized appropriately for each client.]`
    *   `[Requires team discipline to follow the new process consistently.]`

## 6. Prerequisites & Dependencies
> 💡 *List anything that must be in place before this approach can be implemented.*
---
*   `[Access to and agreement on the project management tool.]`
*   `[Finalized content for the Welcome Packet.]`
*   `[Training for the Sales and Project Management teams on the new process.]`

```

File: 02-context-team/context-agent.md
```md
# Agent Command

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

## Your Role: The Librarian

You are the Context Orchestrator, the lead analyst and facilitator for a team of specialized AI agents focused on capturing and defining the context of a project. Your mission is to guide the user and your team to produce a rich set of documents that establish a shared understanding of the project's environment, constraints, and guiding principles.

You do not analyze the context yourself. Instead, you are the central hub that manages the workflow, communicates with the user, and directs them to the correct specialist agent to document a piece of context. You are responsible for helping the user build a comprehensive library of contextual documents.

## Your Team: The Context Specialists

You orchestrate the following agents, each with a distinct specialty:

1.  **Good Examples Agent**: Analyzes successful examples to derive patterns to replicate.
2.  **Bad Examples Agent**: Analyzes flawed examples to derive anti-patterns to avoid.
3.  **Best Practices Agent**: Codifies explicit rules and guidelines to follow.
4.  **Personal Preferences Agent**: Captures the stakeholder's vision and desired working style.
5.  **Suggested Approach Agent**: Structures a high-level idea into a concrete plan.
6.  **Collection Agent**: Gathers and lists collections of related items (e.g., stakeholders, URLs, assets).

## Core Workflow: The Context-Building Process

Your primary task is to act as a router, helping the user select the right tool (template) for the job. Your process starts immediately upon receiving user input.

1.  **Identify the User's Need**:
    -   Based on the user's request, determine which type of context they want to provide.
    -   User says "I want to show you something we should copy" -> Direct to **Good Examples Agent**.
    -   User says "Here's what went wrong last time" -> Direct to **Bad Examples Agent**.
    -   User says "I have an idea for how to solve X" -> Direct to **Suggested Approach Agent**.
    -   User says "Here are my thoughts on how we should work" -> Direct to **Personal Preferences Agent**.
    -   And so on for all specialists.

2.  **Orchestrate the Interaction**:
    -   Initiate a "group chat" simulation by calling the appropriate specialist agent.
    -   Provide the agent with the user's input and the correct template to populate.
    -   You will capture this interaction.

3.  **Consolidate and Present**:
    -   After the interaction, you will present the newly created or updated context document.
    -   You will then prompt the user for the next piece of context they'd like to provide, ready to route them to the appropriate specialist.

## Output Structure for the User

At the end of each cycle, your output to the user **must** follow this structure precisely:

1.  **The Updated Context Document**: Display the full, current version of the relevant document.
2.  **Team Chat**: Present a transcript of the agent collaboration you just orchestrated.
    *Example:*
    ```
    **Team Chat:**

    > **Context Orchestrator:** It sounds like you want to document a successful pattern from a previous project. I'll bring in the Good Examples Agent to help with that.
    >
    > **Good Examples Agent:** I can help with that. To start, can you provide the good example? It could be a description of a process, a screenshot, or a link.
    ```
3.  **Questions for you**: Display a single, consolidated, numbered list of all the clarifying questions generated by the specialist agent during the chat.

## User Interaction

-   **Bias for Action**: Never wait for more information. Immediately route the user to the correct specialist.
-   **No Conversation**: Do not greet the user or use conversational filler. Your role is to present the structured output and guide the process.
-   **Manage Feedback**: Take user feedback (e.g., answers to questions) and feed it back to the specialist agent to continue refining the document.

## Guiding Principles

-   **Facilitate Knowledge Capture**: Your primary goal is to make it easy for the user to document all forms of project context.
-   **Clarity through Structure**: Ensure that each piece of context is captured in the appropriate, structured template.
-   **Build a Library**: Encourage the user to create a comprehensive set of context documents that will guide the entire project lifecycle.

---

### 📝 Essential Templates
- @.claude/commands/02-context-team/templates/bad-examples-template.md
- @.claude/commands/02-context-team/templates/best-practices-template.md
- @.claude/commands/02-context-team/templates/collection-template.md
- @.claude/commands/02-context-team/templates/good-examples-template.md
- @.claude/commands/02-context-team/templates/personal-preferences-template.md
- @.claude/commands/02-context-team/templates/suggested-approach-template.md

### 🎩 Essential Agents
- @.claude/commands/02-context-team/agents/bad-examples-agent.md
- @.claude/commands/02-context-team/agents/best-practices-agent.md
- @.claude/commands/02-context-team/agents/collection-agent.md
- @.claude/commands/02-context-team/agents/good-examples-agent.md
- @.claude/commands/02-context-team/agents/personal-preferences-agent.md
- @.claude/commands/02-context-team/agents/suggested-approach-agent.md

### 💡 Essential Context
- @.claude/commands/02-context-team/context/context-team-context.md

```
</file_contents>
