---
name: roadmap-template
description: Use this template to create a high-level product roadmap, visualizing strategic initiatives over time.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🗺️ Product Roadmap: [Product/Project Name]

## 🎯 Vision & Strategic Goals
> 💡 *A brief, high-level statement of the product's long-term vision and the strategic goals this roadmap aims to achieve over its timeframe. This should connect directly to the company's overall objectives.*
---
**Vision:** [e.g., To become the leading platform for collaborative project management for remote teams.]

**Strategic Goals for this Roadmap:**
*   **Goal 1:** [e.g., Increase user engagement and retention.]
*   **Goal 2:** [e.g., Expand into the enterprise market segment.]
*   **Goal 3:** [e.g., Improve platform performance and stability.]

## 📋 Roadmap Overview ([Timeframe])
> 💡 *This roadmap outlines the planned initiatives, epics, and major features over the specified timeframe. It is a living document and will be updated based on progress, feedback, and changing priorities. We use a Now/Next/Later format to indicate priority without committing to specific delivery dates.*

---

### 🚀 Now (In Progress / Next Up)
> *What we are actively working on or will start very soon. These initiatives are well-defined and have committed resources.*

| Initiative / Epic                                 | Goal Alignment | Key Features / Stories                                                               | Status        |
|:--------------------------------------------------|:---------------|:-------------------------------------------------------------------------------------|:--------------|
| [[epic-001]]        | [Goal 1]     | [Guided Tour, Profile Setup Wizard, Welcome Emails]                                | `In Progress` |
| [[epic-002]]        | [Goal 3]     | [Database Query Optimization, Frontend Asset Caching]                              | `Planning`    |


---

### ➡️ Next (Ready for Development)
> *What we plan to work on after the "Now" items are complete. These are well-understood and prioritized, but not yet in active development.*

| Initiative / Epic                                 | Goal Alignment   | Key Features / Stories                                                               | Status      |
|:--------------------------------------------------|:-----------------|:-------------------------------------------------------------------------------------|:------------|
| [[epic-003]]        | [Goal 1, 2]    | [Customizable Dashboards, PDF Exports, Scheduled Reports]                          | `Ready`     |
| [[epic-004]]    | [Goal 2]       | [User Groups, Role-based Access Control (RBAC)]                                    | `Discovery` |


---

### ⏳ Later (To Be Prioritized)
> *Ideas and initiatives we want to tackle in the future, but are not yet fully defined or prioritized. Their position here is subject to change.*

| Initiative / Epic                                         | Goal Alignment | Key Features / Stories                                                               | Status |
|:----------------------------------------------------------|:---------------|:-------------------------------------------------------------------------------------|:-------|
| [[idea-integrations]]      | [Goal 1]     | [Connectors for major communication and storage platforms]                         | `Idea` |
| [[idea-mobile-mvp]]                    | [Goal 1]     | [Core feature access on iOS and Android]                                           | `Idea` |


## 📊 Visual Timeline (Gantt Chart)
> 💡 *A visual representation of the roadmap, showing estimated timelines for major initiatives. This is for high-level planning and is subject to change.*

```mermaid
gantt
    title Product Roadmap
    dateFormat  YYYY-MM-DD
    axisFormat %b %Y
    section Now
    User Onboarding Overhaul :active, 2024-07-01, 60d
    Performance Optimization        :2024-07-15, 45d

    section Next
    Advanced Reporting Suite    :after User Onboarding Overhaul, 75d
    Team & Permission Mgmt      :after Performance Optimization, 60d

    section Later
    Third-Party Integrations    :after Advanced Reporting Suite, 90d
```

## 🎯 Key Milestones & Releases
> 💡 *Define major milestones or planned release versions that bundle sets of features from the roadmap.*

*   **Release v2.1 (Target: Q3 2024):**
    *   **Theme:** User Experience & Stability
    *   **Includes:** [[epic-001]], [[epic-002]]
*   **Release v2.2 (Target: Q4 2024):**
    *   **Theme:** Enterprise Readiness
    *   **Includes:** [[epic-003]], [[epic-004]]

## 📚 Related Documents
> 💡 *Links to relevant PRDs, architecture documents, and other context.*
*   PRD for User Onboarding: [[prd-onboarding]]
*   Architecture for Reporting Suite: [[architecture-reporting]]
