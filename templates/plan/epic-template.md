---
name: epic-template
description: Use this template to document a large-scale initiative or feature as an Epic, bundling related stories.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🚀 Epic: [Title]

## 📋 Description & Goal
> 💡 *A high-level summary of the epic, its strategic importance, and the primary user or business goal it addresses.*
---
**Goal:** [e.g., To streamline the user onboarding process to improve activation rates.]

## 📖 Narrative / User Story
> 💡 *A high-level user story that captures the essence of the epic.*
---
**As a** [High-level User Role, e.g., New User]
**I want** [A major capability, e.g., a seamless and guided onboarding experience]
**So that** [The core benefit, e.g., I can understand the product's value and start using it effectively right away.]

## 🎯 Scope & Boundaries
### ✅ In Scope
> 💡 *List the major features or capabilities that are part of this epic.*
---
*   [Feature 1: e.g., Guided product tour]
*   [Feature 2: e.g., Profile setup wizard]
*   [Feature 3: e.g., Welcome email sequence]

### ❌ Out of Scope
> 💡 *List related features that are explicitly not part of this epic to avoid scope creep.*
---
*   [e.g., Advanced profile customization]
*   [e.g., Integration with third-party social logins]

## 📊 Business Case & Success Metrics
> 💡 *Why is this epic important? What are the key metrics that will define its success?*
---
*   **Business Justification:** [e.g., Reduces early user churn, increases long-term engagement.]
*   **Success Metrics (KPIs):**
    *   [Metric 1: e.g., Increase user activation rate by 15% within 3 months of launch.]
    *   [Metric 2: e.g., Reduce support tickets related to onboarding by 30%.]

## ⚙️ High-Level Requirements & Constraints
> 💡 *List key functional and non-functional requirements that apply to the entire epic. Also note any major technical or business constraints.*
---
*   **Requirements:**
    *   [Requirement 1: e.g., Must be mobile-responsive.]
    *   [Requirement 2: e.g., Must comply with GDPR data handling policies.]
*   **Constraints:**
    *   [Constraint 1: e.g., Must use the existing authentication service.]
    *   [Constraint 2: e.g., The project has a budget of X.]

## 📝 Child Stories
> 💡 *List of user stories that are part of this epic. This section will be populated as stories are defined.*
---
*   [[story-id-001]]
*   [[story-id-002]]
*   ...

## 🔗 Dependencies
> 💡 *List any dependencies on other teams, projects, or epics.*
---
*   [Dependency 1: e.g., Requires completion of the new Design System (epic-123).]
*   [Dependency 2: e.g., Marketing team needs to provide copy for emails.]

## 👥 Stakeholders
> 💡 *List the key people involved in this epic.*
---
*   **Product Owner:** [@username]
*   **Tech Lead:** [@username]
*   **Designer:** [@username]
*   **Key Stakeholders:** [e.g., Head of Product, Marketing Lead]

## ❓ Open Questions
> 💡 *Track any open questions or issues that need to be resolved for this epic.*
---
*   [Question 1: e.g., Do we need to support localization for the initial release? - Assigned to @productowner]
