---
name: refinement-architecture-template
description: Use this template when documenting the detailed architecture for a system or project refinement, including technical components, integrations, and implementation decisions.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🏗️ Architecture Document: [Project/Initiative Name]

## 1. 📜 Introduction & Purpose

### 1.1. Document Purpose
> 💡 *Clearly state the purpose of this architecture document. What does it describe? What are its objectives? E.g., "This document outlines the proposed architecture for the [Project/Initiative Name], detailing its components, interactions, tools, and design decisions to guide implementation and ensure alignment with project goals."*

[Describe the purpose of this document]

### 1.2. Scope
> 💡 *Define the boundaries of the architecture described. What systems, processes, or features are covered? What is explicitly out of scope from an architectural perspective?*

*   **In Scope:** [e.g., Core processes for Initiative X, Client interaction patterns, Information storage for user profiles]
*   **Out of Scope:** [e.g., Detailed graphic design, Third-party vendor's internal processes, Specific script/formula implementation details]

### 1.3. Intended Audience
> 💡 *List the primary audience for this document (e.g., Project Team, Technical Leads, Process Owners, Product Managers, Security Team, Operations Team, other Architects).*

[List intended audience]

### 1.4. Related Documents
> 💡 *List links to other relevant documents like PRDs, process specifications, design mockups, policies, etc.*

*   Product Requirements Document (PRD): [[refinement-prd-template]]
*   Design Mockups / Blueprints: [Link to Designs]
*   Process Specifications: [Link to Process Docs]
*   [Other relevant documents]

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

## 📚 Relevant Project Files & Documents
> 💡 *List all project files, documents, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths and a brief note on their relevance. Use wikilinks format.*

*   [[current-architecture-overview]] - (Relevance: If evolving an existing system)
*   [[key-process-interface]] - (Relevance: Example of existing interface to adhere to)
*   [[requirements-template]] - (Relevance: Source requirements for this architecture)

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, standards documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*

*   [[refinement-prd-template]] - (Relevance: Business goals and Quality Attributes)
*   [Link to Organizational Best Practices/Approved Tools] - (Relevance: Constraints on tool choices)
*   [Link to Industry Standard Documentation (e.g., ISO 9001)] - (Relevance: Best practices)

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*

*   [Context point 1: e.g., The primary driver for this architectural change is to improve process scalability.]
*   [Context point 2: e.g., A key constraint is to minimize disruption to existing operations during rollout.]

## 2. 📄 Document Metadata

| Field                | Details                                      |
| :------------------- | :------------------------------------------- |
| Document Version     | [e.g., 1.0, 1.1, 2.0]                      |
| Status               | [e.g., Draft, In Review, Approved, Obsolete] |
| Date Created         | [YYYY-MM-DD]                               |
| Last Updated         | [YYYY-MM-DD]                               |
| Author(s)            | [Name(s) / @username(s) & Role(s)]         |
| Reviewer(s)          | [Name(s) / @username(s) & Role(s)]         |
| Key Stakeholders     | [List key stakeholder names or groups]     |
| Target Project/Release| [e.g., Project X v2.1, Q4 2024]            |

### 2.1. Version History
> 💡 *Maintain a log of significant changes to this document.*

| Version | Date       | Author(s)             | Summary of Changes                                     |
| :------ | :--------- | :-------------------- | :----------------------------------------------------- |
| [0.1]   | [YYYY-MM-DD] | [Name (Role)]       | Initial Draft                                          |
| [1.0]   | [YYYY-MM-DD] | [Name (Role)]       | Incorporated feedback from review; Approved for use    |
| [...]   | [...]      | [...]                 | [...]                                                  |

## 3. 🎯 Goals & Architectural Drivers

### 3.1. Business Goals
> 💡 *List the key business goals that this architecture must support. How does the architecture enable the achievement of these goals? Reference PRD goals if applicable.*

*   [Business Goal 1, e.g., Reduce time-to-market for new products by X%]
*   [Business Goal 2, e.g., Support Y concurrent users/operations during peak load]
*   [Business Goal 3, e.g., Decrease operational costs by Z%]

### 3.2. Structural Goals
> 💡 *List specific structural or systemic goals for the architecture (e.g., improve maintainability, adopt a specific methodology, enhance testability).*

*   [Structural Goal 1, e.g., Achieve high cohesion and low coupling between process modules]
*   [Structural Goal 2, e.g., Implement a fully automated quality assurance workflow]
*   [Structural Goal 3, e.g., Ensure 99.99% uptime for critical systems]

### 3.3. Architectural Principles
> 💡 *List the guiding principles that shaped this architecture (e.g., Build for resilience, Design for scalability, Security by design, Simplicity, Use open standards where possible).*

*   [Principle 1: e.g., Prefer standardized tools over custom-built solutions to reduce maintenance overhead.]
*   [Principle 2: e.g., All inter-department communication should be asynchronous where possible.]
*   [Principle 3: e.g., Information privacy is paramount; apply least privilege access.]

### 3.4. Key Constraints & Assumptions
> 💡 *List any constraints (budget, timeline, existing systems, mandated tools, regulatory requirements) and critical assumptions made during the architectural design.*

*   **Constraints:**
    *   [Constraint 1, e.g., Must integrate with legacy System X via its existing interface.]
    *   [Constraint 2, e.g., Project budget for Phase 1 is $Y.]
    *   [Constraint 3, e.g., Must use the organization's approved cloud provider.]
*   **Assumptions:**
    *   [Assumption 1, e.g., The anticipated growth rate of X% per year is accurate.]
    *   [Assumption 2, e.g., Third-party Partner Z will maintain its current Service Level Agreement.]

## 4. 🏛️ Current Architecture (As-Is) - Optional
> 💡 *If this architecture is an evolution of an existing system, describe the current state briefly. Focus on aspects relevant to the proposed changes. Skip if this is a greenfield project.*

### 4.1. Overview
> 💡 *Provide a high-level diagram and description of the current system or process architecture.*

[Description and/or diagram of the current architecture]

### 4.2. Pain Points / Limitations
> 💡 *Identify key issues, bottlenecks, or limitations in the current architecture that the new architecture aims to address.*

*   [Pain Point 1, e.g., Scalability issues with the current monolithic information database.]
*   [Pain Point 2, e.g., Tight coupling between departments makes process changes difficult and risky.]

## 5. 🏗️ Proposed Architecture (To-Be)
> 💡 *This section should describe the proposed architecture for a new system/process or a significant redesign.*

### 5.1. Overview & Guiding Principles
> 💡 *Provide a high-level narrative of the architecture. Reiterate any specific principles that guide this particular design.*

[High-level description of the architecture and its core concepts.]

### 5.2. Logical View / Conceptual Architecture
> 💡 *Describe the system at a high level of abstraction, focusing on major functional areas and their relationships. Use diagrams like C4 (adapted for general systems) or simple block diagrams.*

#### 5.2.1. System Context Diagram
> 💡 *Shows the system in its environment, interacting with users and external entities.*