---
name: refinement-prd-template
description: Use this template when creating comprehensive Product Requirements Documents (PRDs) for projects or features, providing structure for goals, requirements, design specifications, and completion criteria.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---

# 📄 Product Requirements Document (PRD)

## 🎯 I. Introduction & Purpose

### A. Document Overview
> 💡 *This section provides a general overview of what a PRD is and its role. This text is generally static.*
---
This document provides a template for creating Product Requirements Documents (PRDs). A PRD serves as a central artifact defining the product, service, or feature to be built, outlining its purpose, features, functionalities, and behavior. It acts as a crucial communication bridge between the initial project concept and the detailed execution plan, ensuring alignment among stakeholders including product managers, designers, engineers, testers, and marketing teams.

This template is designed to be flexible, catering to both broad, project-scoped PRDs that define an entire new product or release, and more specific, feature-scoped PRDs that detail a single piece of functionality within a larger product. The goal is to provide "just enough" context and detail to guide development effectively within an agile environment, fostering collaboration and clarity without becoming overly burdensome or static.

### B. Purpose of *This Specific* PRD
> 💡 *Clearly state whether this PRD covers an entire project/release or a specific feature. Define the high-level objective of what is being documented.*
---
[Your specific purpose here]

### C. Intended Audience
> 💡 *This document is intended for all stakeholders involved in the planning, design, development, testing, and launch of the specified product or feature.*
---
This includes, but is not limited to:
*   Product Managers
*   UI/UX Designers
*   Engineers / Developers
*   Quality Assurance (QA) Engineers
*   Project Managers
*   Marketing & Sales Teams (as applicable)
*   Relevant Leadership/Executives

## 🏆 II. Goals & Objectives

### A. Product Vision & Strategic Fit
> 💡 *Briefly describe the overall vision for the product or how this specific feature fits into the larger product vision and company strategy. Answer "Why are we doing this?" This section sets the strategic context.*
---
[Your product vision and strategic fit here]

### B. Business Objectives & Success Metrics
> 💡 *List specific, measurable, achievable, relevant, and time-bound (SMART) goals for this project/feature. Define the Key Performance Indicators (KPIs) or metrics that will be used to measure success.*
---
[Your business objectives and success metrics here]

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*
---

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance. Use wikilinks format.*
---
*   [[refinement-architecture-template]] - (Relevance: Overall system architecture and technical decisions)
*   [path/to/existing/feature_module/] - (Relevance: If enhancing an existing feature, provide path to its code/process)

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
---
*   [Link to Company Strategic Goals Document] - (Relevance: For understanding strategic fit)
*   [[persona-docs]] - (Relevance: For understanding target users)
*   [Link to Figma/Sketch designs for this PRD's scope] - (Relevance: UI/UX specifications)

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
---
*   [Context point 1: e.g., This PRD supersedes the previous draft version 0.9.]
*   [Context point 2: e.g., The primary NFR to focus on is performance on low-end devices/slow connections.]

## 📑 III. Document Metadata
> 💡 *Fill in the administrative details for this specific PRD.*
---
| Field                  | Details                                      |
| :--------------------- | :------------------------------------------- |
| **Project/Feature Name** | `[Insert Project or Feature Name]`           |
| **Document Version**   | `[e.g., 1.0, 1.1, 2.0]`                      |
| **Status**             | `[e.g., Draft, In Review, Approved, Obsolete]` |
| **Date Created**       | `[YYYY-MM-DD]`                               |
| **Last Updated**       | `[YYYY-MM-DD]`                               |
| **Owner / Author**     | `[@username or Name]`                        |
| **Core Team**          | `[@username(s) or Team Name(s)]`             |
| **Stakeholders**       | `[List key stakeholder names or groups]`     |
| **Target Release/Date**| `[e.g., v2.1, Q4 2024]`                      |

### Version History
> 💡 *Maintain a log of significant changes to this document. Tracking changes ensures transparency and provides context for the evolution of requirements.*
---
| Version | Date       | Author                  | Summary of Changes                             | Reason for Change                |
|:--------|:-----------|:------------------------|:-----------------------------------------------|:---------------------------------|
| 0.1     | `YYYY-MM-DD` | `[Name (Role)]`         | Initial Draft                                  | N/A                              |
| 1.0     | `YYYY-MM-DD` | `[Name (Role)]`         | Incorporated feedback from Design & Eng review | Alignment on scope & feasibility |
| 1.1     | `YYYY-MM-DD` | `[Name (Role)]`         | Added specific NFRs for performance & security | Technical refinement             |

## 🧑‍🤝‍🧑 IV. User Personas
> 💡 *Define the primary and secondary target users for this product/feature. Link to more detailed persona documents if available. Understanding the target users is fundamental.*
---
*   **Primary Persona(s):**
    > 💡 *Describe the main user(s) this product/feature is designed for. Their needs should be the primary focus.*
    ---
    *   `[Primary Persona 1 Name/Type]: [Description]`
*   **Secondary Persona(s):**
    > 💡 *Describe other users who might interact with the product/feature, but whose needs are not the central focus.*
    ---
    *   `[Secondary Persona 1 Name/Type]: [Description]`

*   **(Link to detailed Persona documents/research if they exist):** [[persona-docs]]

## 🗺️ V. Scope Definition
> 💡 *Clearly define what is included in this release and, just as importantly, what is explicitly excluded. This is essential for managing expectations and preventing scope creep.*
---
### A. In Scope (Prioritized Features/User Stories)
> 💡 *List the specific features, user stories, or epics planned for this release. Use a prioritization method like MoSCoW (Must-have, Should-have, Could-have, Won't-have).*
---
| Feature/Story ID              | Description                                                                                                | Priority (MoSCoW) | Rationale/Notes                                           |
| :------------------------------|:-----------------------------------------------------------------------------------------------------------|:------------------|:----------------------------------------------------------|
| **Must-have**                 | *(Essential for the core purpose/viability of this release)*                                              |                   |                                                           |
| `[US-ID-001]`                 | `[User story description]`     | Must              | `[Rationale for must-have]` |
| **Should-have**               | *(Important, but not critical for launch; workarounds may exist)*                                         |                   |                                                           |
| `[US-ID-002]`                 | `[User story description]`      | Should            | `[Rationale for should-have]` |
| **Could-have**                | *(Desirable, but less important; included if time/resources permit)*                                      |                   |                                                           |
| `[FEAT-ID-003]`               | `[Feature description]`   | Could             | `[Rationale for could-have]`                      |
| **Won't-have (This Release)** | *(Explicitly excluded from this specific release)*                                                        |                   |                                                           |
| `[FEAT-ID-004]`               | `[Feature description]`                                                                | Won't             | `[Reason for exclusion]`                             |

### B. Out of Scope
> 💡 *Explicitly list features, functionalities, or user requests that are NOT included in this specific release. Note if they are deferred.*
---
*   `[Feature 1 that is out of scope]`
*   `[Feature 2 that is out of scope]`
*   `[Feature 3 that is deferred to future release]`

## ⚙️ VI. Requirements
> 💡 *This section forms the core of the PRD, detailing *what* the product or feature needs to do (functional requirements) and *how* it should perform (non-functional requirements).*
---
### A. User Stories / Use Cases
> 💡 *User stories are the preferred format in agile development for capturing requirements from the end-user's perspective. Each story should have clear acceptance criteria.*
>
> *(List the detailed user stories derived from the 'In Scope' features. Link stories to Epics if applicable.)*
---
**User Story Template:**
*   **ID:** `[US-XXX]`
*   **Epic Link:** [[epic-name]]
*   **User Story:** [As a [user type], I want to [action], so that [benefit/reason].]
*   **Acceptance Criteria:**
    *   **Given** [context/precondition]
    *   **When** [action/trigger]
    *   **And** [additional condition]
    *   **Then** [expected outcome]
    *   **And** [additional outcome]

`[List your user stories here]`

### B. Functional Requirements
> 💡 *Functional requirements define *what* the system must do. This section can explicitly list system-level functions or business rules not fully captured in user stories.*
---
*   **FR-01:** `[Functional requirement description]`
*   **FR-02:** `[Functional requirement description]`
*   **FR-03:** `[Functional requirement description]`

### C. Non-Functional Requirements (NFRs) / Quality Attributes
> 💡 *NFRs define *how* the system should perform, focusing on qualities like performance, security, usability, and reliability. These are critical and should be as specific and measurable as possible.*
---
*   **Performance:**
    *   **NFR-PERF-01:** `[Performance requirement with specific metrics]`
    *   **NFR-PERF-02:** `[Performance requirement with specific metrics]`
*   **Scalability:**
    *   **NFR-SCAL-01:** `[Scalability requirement]`
    *   **NFR-SCAL-02:** `[Scalability requirement]`
*   **Reliability:**
    *   **NFR-REL-01:** `[Reliability requirement]`
    *   **NFR-REL-02:** `[Reliability requirement]`
    *   **NFR-REL-03:** `[Reliability requirement]`
*   **Usability & Accessibility:**
    *   **NFR-USE-01:** `[Usability requirement]`
    *   **NFR-ACC-01:** `[Accessibility requirement]`
    *   **NFR-ACC-02:** `[Accessibility requirement]`
    *   **NFR-ACC-03:** `[Accessibility requirement]`
*   **Security:**
    *   **NFR-SEC-01:** `[Security requirement]`
    *   **NFR-SEC-02:** `[Security requirement]`
    *   **NFR-SEC-03:** `[Security requirement]`
    *   **NFR-SEC-04:** `[Security requirement]`
*   **Maintainability & Testability:**
    *   **NFR-MAIN-01:** `[Maintainability requirement]`
    *   **NFR-TEST-01:** `[Testability requirement]`
*   **Compatibility:**
    *   **NFR-COMP-01:** `[Compatibility requirement]`
    *   **NFR-COMP-02:** `[Compatibility requirement]`

## 🎨 VII. Design & User Experience (UX)
> 💡 *This section provides visual and interaction context. Link concrete design artifacts to reduce ambiguity.*
>
> *(Link to the latest versions of relevant design files and briefly describe key workflows or UI principles.)*
---
*   **Links to Design Artifacts:**
    *   **Wireframes:** [Link to Wireframes]
    *   **High-Fidelity Mockups:** [Link to detailed UI mockups - e.g., Figma, Sketch]
    *   **Interactive Prototypes:** [Link to clickable prototype]
    *   **Design System/Style Guide:** [[design-system]]
*   **Key Workflow Descriptions/Diagrams:**
    > 💡 *(Optional: If a complex flow isn't fully clear from user stories/prototypes, include a flowchart or step-by-step description here.)*
    ---
    *   **[Workflow Name]:** `[Description or diagram of key user workflow]`

## ⚙️ VIII. System & Data Specifications
> 💡 *This section details requirements related to the system's structure, data handling, and technical interactions.*
---
*   **Information / Data Model:**
    *   **Key Entities:** `[e.g., User, Project, Task, Comment]`
    *   **Entity Structure:** `[Outline typical structure for key entities, e.g., fields within a Task entity: taskId, projectId, title, description, status, assigneeId, dueDate. Specify data types.]`
    *   **Relationships:** `[Describe relationships, e.g., A Project can have many Tasks. A Task has one assignee (User).]`
*   **System Component Interactions:**
    *   `[Describe how major parts of the system interact. For example, "The Notification Service will be triggered by events from the Task Service to send emails to users."]`
*   **Data Flow:**
    *   `[Describe or diagram how data moves through the system. For example, "User submits a new task via the UI -> API Gateway -> Task Service -> Database. An event is then sent to the Notification Service."]`
*   **API / Integration Needs:**
    *   `[List any new or modified APIs required. Specify endpoints, request/response formats, etc.]`
    *   `[List any third-party services that need to be integrated (e.g., payment gateways, email services).]`

## ⚖️ IX. Assumptions, Constraints & Dependencies
> 💡 *Identifying assumptions, constraints, and dependencies early helps in risk management and realistic planning.*
---
*   **Assumptions:**
    *   `[Assumption 1]`
    *   `[Assumption 2]`
*   **Constraints:**
    *   **Budget:** `[Budget constraint]`
    *   **Timeline:** `[Timeline constraint]`
    *   **Resources:** `[Resource constraint]`
    *   **Technology:** `[Technology constraint]`
*   **Dependencies:**
    *   **Internal:** `[Internal dependency]`
    *   **External:** `[External dependency]`

## ✅ X. Completion Criteria
> 💡 *This section defines the specific, measurable conditions that must be met for the product or feature to be considered complete. These criteria serve as the final quality gate.*
---
*   **Functionality:**
    *   `[All 'Must-have' user stories/features defined in the Scope section are implemented and meet their respective Acceptance Criteria.]`
    *   `[Core user flows are functional without critical bugs.]`
*   **Quality & NFRs:**
    *   `[Key performance NFRs are met under simulated load testing.]`
    *   `[Critical security NFRs are verified. No known critical or high-severity security vulnerabilities exist.]`
    *   `[Key accessibility NFRs pass automated checks and manual testing.]`
*   **Testing:**
    *   `[Successful completion of automated testing suites (meeting coverage goals).]`
    *   `[Successful completion of End-to-End testing for critical user flows.]`
    *   `[Successful completion of User Acceptance Testing (UAT) with sign-off.]`
    *   `[No outstanding Blocker or Critical bugs related to the in-scope functionality.]`
*   **Documentation & Readiness:**
    *   `[End-user documentation (if applicable) is complete and accurate.]`
    *   `[Internal support documentation and runbooks are updated.]`
    *   `[Monitoring and alerting systems are configured and operational.]`

## ❓ XI. Open Questions & Future Considerations
> 💡 *This section serves as a living tracker for unresolved issues and a placeholder for potential future work. Acknowledging unknowns fosters transparency.*
---
### A. Open Questions Tracker
> 💡 *Maintain a list of unresolved questions. Update status and resolution as answers are found.*
---
| ID   | Question                                                                 | Raised By       | Date Raised | Assigned To     | Due Date   | Status   | Answer/Resolution (Link)         |
| :--- | :----------------------------------------------------------------------- | :-------------- | :---------- | :-------------- | :--------- | :------- | :------------------------------- |
| Q-01 | `[Question description]`    | `[Name]` | `YYYY-MM-DD`  | `[Assignee]` | `YYYY-MM-DD` | `[Status]` | [Link to answer/decision]      |
| Q-02 | `[Question description]`| `[Name]`   | `YYYY-MM-DD`  | `[Assignee]` | `YYYY-MM-DD` | `[Status]`   | `[Resolution notes]` |

### B. Potential Future Enhancements / Next Steps
> 💡 *List ideas, features, or iterations considered but deferred from this release. Link back to 'Out of Scope' items where relevant.*
---
*   `[Future enhancement 1]`
*   `[Future enhancement 2]`
*   `[Future enhancement 3]`

## 📚 XII. Appendix / Glossary
> 💡 *This section provides supplementary information and definitions to aid understanding.*
---
### A. Related Resources
> 💡 *Add links to relevant external documents.*
---
*   Market Requirements Document (MRD): [[market-requirements-document]]
*   Competitive Analysis: [[competitive-analysis]]
*   User Research Findings: [[user-research-findings]]
*   Detailed Technical Architecture Document: [[refinement-architecture-template]]
*   API Documentation: [Link to API Docs]
*   User Journey Maps: [Link to User Journey Maps]

### B. Glossary
> 💡 *Define key terms, acronyms, or project-specific jargon.*
---
*   **API:** Application Programming Interface
*   **KPI:** Key Performance Indicator
*   **MoSCoW:** Prioritization method (Must-have, Should-have, Could-have, Won't-have).
*   **MVP:** Minimum Viable Product
*   **NFR:** Non-Functional Requirement
*   **PRD:** Product Requirements Document
*   **UAT:** User Acceptance Testing
*   **UI/UX:** User Interface / User Experience
*   **WCAG:** Web Content Accessibility Guidelines

## ⭐ XIII. Conclusion and Recommendations
> 💡 *This section provides a general conclusion for PRDs of this type. This text is generally static.*
---
This PRD template provides a structured framework for defining requirements for a wide range of products, features, and services. Its core purpose is to foster clarity, alignment, and collaboration among all project stakeholders. By systematically addressing goals, scope, user needs, functional and non-functional requirements, design integration, and completion criteria, teams can mitigate risks associated with ambiguity and scope creep.

**Key Recommendations for Use:**
1.  **Adaptability:** Tailor this template to the specific needs of the project.
2.  **Collaboration:** Treat the PRD as a collaborative artifact.
3.  **Living Document:** Maintain the PRD throughout the development lifecycle.
4.  **Focus on the 'Why':** Consistently link features back to user personas and business goals.

By utilizing this template thoughtfully and collaboratively, teams can establish a shared understanding, make informed decisions, and ultimately build higher-quality products that effectively meet user needs and business objectives.