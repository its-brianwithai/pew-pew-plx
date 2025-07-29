---
name: suggested-approach-template
description: Use this template to outline a recommended approach for tackling a specific task or problem.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 💡 Suggested Approach: [Task / Problem]
> 💡 *This document outlines a recommended approach for tackling a specific task or problem. It is based on research, best practices, and an understanding of our project's context. The goal is to provide a clear, actionable plan to guide execution.*

[Brief introduction to the approach]

## 🎯 Problem Statement
> 💡 *Clearly and concisely define the problem we are trying to solve or the task we need to accomplish.*

[Describe the problem here. e.g., Our current process for onboarding new clients is manual, slow, and inconsistent, leading to errors and a poor first impression.]

##  proposte Proposed Approach
> 💡 *Provide a high-level summary of the recommended solution. This is the "executive summary" of the plan.*

[Summarize the proposed approach. e.g., We will implement a new, semi-automated client onboarding process using a combination of standardized templates, a checklist in our project management tool, and a kickoff meeting.]

## 👣 Step-by-Step Execution Guide
> 💡 *Break down the approach into a sequence of actionable steps. Be specific and logical.*

<example>
1.  **Preparation:**
    *   [Create a standardized 'New Client Welcome Packet' template.]
    *   [Build a 'New Client Onboarding' checklist template in our project management tool.]
    *   [Draft a standard agenda for the client kickoff meeting.]
2.  **Execution (for each new client):**
    *   [The Sales team hands off the signed contract to the Project Manager.]
    *   [The Project Manager creates a new project from the checklist template.]
    *   [The PM customizes and sends the Welcome Packet to the client.]
    *   [The PM schedules the kickoff meeting using the standard agenda.]
3.  **Follow-up:**
    *   [After the kickoff meeting, the PM sends a summary and action items to the client.]
    *   [The project officially begins as per the project plan.]
</example>

<example>
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
</example>

## 🤔 Rationale
> 💡 *Explain *why* this approach was chosen over others. What makes it suitable for our project?*

- **Standardization:** [This approach ensures every client receives the same high-quality onboarding experience.]
- **Efficiency:** [Using templates and checklists dramatically reduces the manual effort and time required for each onboarding.]
- **Clarity:** [The process provides clear steps and responsibilities for both our team and the new client.]
- **Low Cost:** [It utilizes existing tools and requires minimal financial investment to implement.]

## 👍 Pros & Cons
> 💡 *Provide a balanced view of the recommended approach.*

- **Pros:**
    - [Easy and fast to implement.]
    - [Improves consistency and quality.]
    - [Reduces risk of human error.]
- **Cons:**
    - [May feel less personal if not customized appropriately for each client.]
    - [Requires team discipline to follow the new process consistently.]

## ✅ Prerequisites & Dependencies
> 💡 *List anything that must be in place before this approach can be implemented.*

- [Access to and agreement on the project management tool.]
- [Finalized content for the Welcome Packet.]
- [Training for the Sales and Project Management teams on the new process.]