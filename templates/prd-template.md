---
name: prd-template
description: Use this template to create a Product Requirements Document (PRD) defining the purpose, features, and behavior of a product or feature to be built.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📄 Product Requirements Document: [Product/Feature Name]

## 🎯 Introduction & Purpose
> 💡 *State whether this PRD covers an entire project/release or a specific feature. Define the high-level objective of what is being documented.*

<example>
**Project Scope:** "This PRD outlines the requirements for the initial release (MVP) of 'ConnectSphere', a professional networking platform."

**Feature Scope:** "This PRD details the requirements for implementing the 'Real-time Collaboration' feature within the existing 'TaskMaster' platform."
</example>

[Your specific purpose here]

## 🏆 Goals & Objectives
> 💡 *Define the strategic context and measurable success metrics for this project.*

### 🔭 Product Vision & Strategic Fit
> 💡 *Briefly describe the overall vision for the product or how this feature fits into the larger product vision and company strategy. Answer "Why are we doing this?"*

[Your product vision and strategic fit here]

### 📈 Business Objectives & Success Metrics
> 💡 *List specific, measurable, achievable, relevant, and time-bound (SMART) goals. Define the Key Performance Indicators (KPIs) that will measure success.*

<example>
- **Goal:** Increase user sign-up conversion rate.
  - **Metric:** Achieve a 15% increase in the sign-up completion rate within 3 months post-launch.
- **Goal:** Improve user engagement with the new feature.
  - **Metric:** Achieve an average of 5 interactions per active user per week with the new feature within the first month.
</example>

[Your business objectives and success metrics here]

## 📄 Document Metadata
> 💡 *Fill in the administrative details for this specific PRD.*

| Field                  | Details                                      |
| :--------------------- | :------------------------------------------- |
| **Project/Feature Name** | [Insert Project or Feature Name]             |
| **Document Version**   | [e.g., 1.0]                                  |
| **Status**             | [e.g., Draft, In Review, Approved]           |
| **Last Updated**       | [YYYY-MM-DD]                                 |
| **Owner / Author**     | [Name or @username]                          |

## 🧑‍🤝‍🧑 User Personas
> 💡 *Define the primary and secondary target users for this product/feature. Link to more detailed persona documents if they exist.*

- **Primary Persona:** [Name/Type and short description of the main user this is designed for.]
- **Secondary Persona:** [Name/Type and short description of other users who might interact with the feature.]
- **Link to detailed personas:** [[persona-document-name]]

## 🗺️ Scope Definition
> 💡 *Clearly define what is included in this release and, just as importantly, what is explicitly excluded to prevent scope creep.*

### ✅ In Scope (Prioritized Features/User Stories)
> 💡 *List the specific features or user stories planned for this release, prioritized using a method like MoSCoW (Must-have, Should-have, Could-have, Won't-have).*

| Feature/Story ID | Description                                                               | Priority (MoSCoW) |
| :--------------- | :------------------------------------------------------------------------ | :---------------- |
| **Must-have**    | *(Essential for the core purpose of this release)*                        |                   |
| [US-001]         | [As a user, I want to create an account, so that I can log in.]           | Must              |
| **Should-have**  | *(Important, but not critical for launch)*                                |                   |
| [US-002]         | [As a user, I want to reset my password, so that I can regain access.]    | Should            |
| **Could-have**   | *(Desirable, but included only if time permits)*                          |                   |
| [US-003]         | [As a user, I want to react to messages with emojis.]                     | Could             |

### ❌ Out of Scope
> 💡 *Explicitly list features or functionalities that are NOT included in this specific release.*

- [Integration with third-party tools.]
- [Advanced user permission roles.]

## ⚙️ Requirements
> 💡 *Detail *what* the product needs to do (functional) and *how* it should perform (non-functional).*

### 📖 User Stories / Use Cases
> 💡 *Capture requirements from the end-user's perspective. Each story must have clear, testable acceptance criteria.*

<example>
- **ID:** US-001
- **User Story:** As a new user, I want to create an account using my email and password, so that I can access the application.
- **Acceptance Criteria:**
    - GIVEN I am on the Sign-Up page
    - WHEN I enter a valid email and a password meeting complexity requirements
    - AND I click "Sign Up"
    - THEN my account is created
    - AND I am logged in and redirected to the dashboard.
</example>

[List your user stories here]

### ⭐ Non-Functional Requirements (NFRs)
> 💡 *Define *how* the system should perform. Be specific and measurable.*

- **Performance:** [Key interactions must complete in under X seconds.]
- **Scalability:** [The system must support Y concurrent users.]
- **Reliability:** [Core services must maintain X% uptime.]
- **Usability & Accessibility:** [UI must meet WCAG AA guidelines and be keyboard-navigable.]
- **Security:** [All data in transit must be encrypted. Sensitive data must be encrypted at rest.]

## 🎨 Design & User Experience (UX)
> 💡 *Provide visual and interaction context by linking to concrete design artifacts.*

- **High-Fidelity Mockups:** [Link to Figma, Sketch, etc.]
- **Interactive Prototypes:** [Link to clickable prototype]
- **Design System/Style Guide:** [[design-system-document]]

## ❓ Open Questions
> 💡 *Track unresolved issues to foster transparency.*

| ID   | Question                                                 | Assigned To | Status |
| :--- | :------------------------------------------------------- | :---------- | :----- |
| Q-01 | [What is the specific password complexity requirement?]    | [Security Team] | [Open] |
| Q-02 | [How should simultaneous edit conflicts be handled?]       | [Eng & Design] | [Open] |

## 📚 Appendix / Glossary
> 💡 *Provide supplementary information and definitions.*

- **Related Resources:** [[market-requirements-doc]], [[competitive-analysis]]
- **Glossary:**
    - **API:** Application Programming Interface
    - **NFR:** Non-Functional Requirement
    - **PRD:** Product Requirements Document