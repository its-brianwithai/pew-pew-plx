---
name: tech-issue-template
description: "Template for breaking down technical requirements into clear, actionable work items. Use when planning software features, system improvements, automation, or technical debt."
---
# Template Command

When this command is used, use the following template. Acknowledge your understanding and then await the user's request.

---

````````````
# [Fitting Emoji] Issue: [Descriptive Title]
> 💡 *[Descriptive subtitle]*

[Brief description of the problems we are going to solve, why we are going to solve them and how we plan to do it.]

---

## 🎯 End Goal
> 💡 *What do you want to achieve?*

[The single, clear, measurable outcome we want to achieve. Everything that follows must contribute to achieving this goal.]

---

## 📝 Initial Requirements
*What should the system/user be able to do or be?*

[Specific capabilities listed as simple English sentences starting with an actor and the verb first high level requirement]

- [Actor]
    - [Verb first high level requirement]
    - [More high level requirements if needed]
    - [...]

- [More actors if needed]

- [...]

---

## 🏗️ Components
> 💡 *What should exist and what does it do?*

[Hierarchical breakdown from initial requirement to high-level components to atomic parts and verb-first lists of what each component should be able to do or be]

- [Verb first high level requirement]
    - [Component]
        - [Sub-subcomponent]
            - [Verb capability or state]
            - [More verb capabilities or states if needed]
            - [...]
        - [More sub-subcomponents if needed]
        - [...]

- [More verb first high level requirements if needed]

- [...]

---

## 📝 Properties
> 💡 *What identifies a component? What can be configured? What can change?*

[The values and configurations that determine a components identity and possible states]

- [Component]
    - [Property]: [Description of the property]
    - [More properties if needed]
    - [...]
        - [Sub-component]
            - [Property]: [Description of the property]
            - [More properties if needed]
            - [...]

- [More components if needed]

- [...]

# 🛠️ Behaviours
> 💡 *Which states or events should the component act upon? How should it behave when nothing happens?*

[How a component should act when a state is, or an event happens]

- [Component]
    - [State or event]
        - Should [Behaviour]
        - [More behaviours if needed]
        - [...]
            - [Sub-component]
                - [State or event]
                    - Should [Behaviour]
                    - [More behaviours if needed]
                    - [...]

## 📦 Deliverables
> 💡 *Which components should be created together?*

[Components packaged together as unified testable units]

- [Deliverable]
    - [Component]
        - [Sub-subcomponent]
        - [More sub-subcomponents if needed]
        - [...]
    - [More components if needed]
    - [...]

- [More deliverables if needed]

- [...]

---

## 🚀 Checkpoints
> 💡 *Which deliverables should be released together? How do we determine their successful completion?*

[Chronological breaking points with deliverables and their acceptance criteria that can be worked on in parallel, tested, and potentially released.]

- [Checkpoint]
    - [Deliverable]
        - [Acceptance criteria]
        - [More acceptance criteria if needed]
        - [...]
    - [More deliverables if needed]
    - [...]

- [More checkpoints if needed]

- [...]

---

## ⏱️ Effort Breakdown & Estimates
> 💡 *How long will it take?*

[The ideal and most likely outcome for design, refinement, front-end, back-end and operational work, where QA is calculated as 25% of core work, testing as 15% and and contingency buffer defaults to 10% of total work, but should be increased if there is a high risk of unforeseen problems along the way.]

### Core Work Estimates

| Work Type      | Hours       | Reasoning                                                                         |
|:---------------|:------------|:----------------------------------------------------------------------------------|
| **Design**     | [ X ]       | [ Explanation of design effort needed, or 0 if none ]                             |
| **Refinement** | [ X ]       | [ Effort needed for planning, detailing requirements, and refining the approach ] |
| **Front-end**  | [ X ]       | [ Front-end development tasks (UI implementation, state management, etc.) ]       |
| **Backend**    | [ X ]       | [ Backend development tasks (API endpoints, database changes, logic, etc.) ]      |
| **Operations** | [ X ]       | [ DevOps, deployment, configuration tasks ]                                       |
| **Core Total** | **[ Sum ]** |                                                                                   |

### QA, Testing & Delay Margin

| Work Type        | Hours | Percentage | Reasoning                                                  |
|:-----------------|:------|:-----------|:-----------------------------------------------------------|
| **QA**           | [ X ] | **25%**    | [ 25% of core work total for quality assurance ]           |
| **Testing**      | [ X ] | **15%**    | [ 15% of core work total for testing effort ]              |
| **Delay Margin** | [ X ] | **10%+**   | [ 10% minimum, increase for high-risk/unknown complexity ] |


### Total Estimate
**Total Hours:** [ Grand Total ]
````````````
