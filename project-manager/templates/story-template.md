---
name: 📒 Story
about: User-focused feature with clear goals and outcomes
title: "📒"
labels: 📒 story
---
# 🔖 Description
> 💡 *A short and descriptive introduction of the problem we are going to solve.*
---

# 🗣 User Story
> 💡 ***As a*** *ROLE* ***I want*** *BEHAVIOUR* ***so that*** *REASON.*
---

# ⚙️ Requirements
> 💡 *What are the requirements for this story? What should be in scope and what should be out of scope?*
---

# ✅ Acceptance Criteria
> 💡 *Specific conditions that must be met for the story to be considered complete. Each criterion should be testable and unambiguous.*
---

* [ ] Criterion 1: *Description of what must be true for this criterion to pass*
* [ ] Criterion 2: *Description of what must be true for this criterion to pass*
* [ ] Criterion 3: *Description of what must be true for this criterion to pass*

# 💾 Data Model
> 💡 *Old and new data models that will be created and/or altered when this feature is added.*
---

# 🔒 Security Rules / Row Level Security
> 💡 *Old and new security rules with roles and access that should be created and/or altered. Include create, read, update and delete.*
---

# 🐒 API
> 💡 *Old and new API calls that should be created and/or altered.*
---

# 📊 Analytics
> 💡 *Old and new analytics that should be created and/or altered when this feature is added. Include a name, when it's fired and optional properties.*
---

# ☎️ Impact Communication
> 💡 *Who / which teams should we inform about the impact of releasing this ticket? Sales, marketing, data, CS, other?*
---

# 🧪 Tests
> 💡 *Components/flows/code that would benefit from tests and which scenario's should be tested.*
---

# 🤝 Acceptance Test
> 💡 *Which scenario's should we test in the acceptance test? So that we can make sure that this ticket does what it is supposed to do without any unexpected errors.*
---

# 🎨 UI/UX Behaviour
> 💡 *Anything to take note of regarding the behaviour of UI/UX elements (if applicable). Think of position, behaviour when elements do not fit the screen, feedback on elements and properties of animations.*
---

# ⏱️ Effort Breakdown & Estimates
> 💡 *Detailed breakdown of estimated effort required for each aspect of the user story implementation.*
---

*   **Design:** [X] hours
    *   _Reasoning: [Explain why this amount of design effort is needed, or 0 if none]_
*   **Refinement:** [X] hours
    *   _Reasoning: [Explain the effort needed for planning, detailing requirements, and refining the approach for this user story]_
*   **Front-end:** [X] hours
    *   _Reasoning: [Explain the front-end development tasks involved (UI implementation, state management, etc.)]_
*   **Backend:** [X] hours
    *   _Reasoning: [Explain the backend development tasks involved (API endpoints, database changes, logic, etc.)]_
*   **General Work:** [X] hours
    *   _Reasoning: [Explain any other tasks not covered above (e.g., documentation, specific integrations)]_

# 🧪 QA, Testing & Delay Margin
> 💡 *Estimates for quality assurance, testing efforts, and buffer time for potential delays.*
---

*   **QA:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the QA effort needed (manual testing, exploratory testing)]_
*   **Testing:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the testing effort needed (unit tests, integration tests, e2e tests)]_
*   **Delay Margin:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity and potential risks/unknowns, explain the buffer needed]_

# 📝 Suggested High Level Approach
> 💡 *With knowledge of the current codebase, try to define a best suggested approach. Think of current components used, flow of data and UI elements. Include mermaid diagrams to illustrate flows and connections.*
---


  ```mermaid
  graph TD
      Start[User at Home Screen] --> TapButton[User taps create item button];
      TapButton --> ShowFeedback[System shows create item feedback];
      ShowFeedback --> CreateItem[System creates database item];
      CreateItem --> NoNavigation[System does not navigate];
  ```


# 🎯 Roles & Todo's
> *Backend Dev · Front-end Dev · Ui/Ux Designer · DevOps Engineer*
---

```
<example>
* 📌 **Project Manager**:
    - [ ]
* 🔧 **Backend Developer**:
    - [ ]
* 🖥️ **Front-end Developer**:
    - [ ]
* 🎨 **UI/UX Designer**:
    - [ ]
* 🚀 **DevOps Engineer**:
    - [ ]
* 📊 **Data Engineer**:
    - [ ]
* 📣 **Marketeer**:
    - [ ]
</example>
```

# 👉️ Final Remarks
> 💡 *Anything to take note off that is not properly defined yet. Think of out of scope notes, dependencies, anything to be extra cautious about and/or information about related issues.*
