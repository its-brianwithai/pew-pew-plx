---
name: crud-issue
description: "Systematically decompose technical requirements through iterative questioning to create comprehensive tech issues with clear goals, components, properties, behaviors, deliverables, checkpoints, and effort estimates."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

````````````yaml
request: Create, update or transform the source into an issue based on the user's request, iteratively refining it through questioning to ensure all requirements are captured without assumptions.
workflow:
title: Create Issue Systematic Requirements Decomposition
end_goal: Create a comprehensive technical issue document that defines a single clear outcome the system/user must achieve, identifies all atomic requirements and components without assumptions, documents properties behaviors deliverables and checkpoints, provides accurate effort estimates based on complete understanding, follows MVP mindset focusing only on must-haves, and maintains context rot awareness by including only value-adding information
deliverables:
  - name: Complete tech issue document
    description: Fully populated technical issue document with all required sections
    acceptance_criteria:
      - All sections populated with relevant content
      - Document follows established format
      - Content is comprehensive and actionable
  - name: Clear end goal with success criteria
    description: Single measurable objective with specific success criteria
    acceptance_criteria:
      - End goal is specific and measurable
      - Success criteria are verifiable
      - Objective drives all other requirements
  - name: Atomic component breakdown
    description: Complete breakdown of components with properties and behaviors
    acceptance_criteria:
      - Components broken down to atomic level
      - Properties and behaviors fully documented
      - No assumptions made about components
  - name: Grouped deliverables
    description: Components organized into testable units for parallel work
    acceptance_criteria:
      - Deliverables grouped for parallel work
      - Groups represent testable units
      - Dependencies clearly identified
  - name: Chronological checkpoints
    description: Milestones with acceptance criteria for progress tracking
    acceptance_criteria:
      - Checkpoints enable progress tracking
      - Each checkpoint has clear acceptance criteria
      - Timeline is realistic and achievable
  - name: Realistic effort estimates
    description: Accurate time estimates with justification
    acceptance_criteria:
      - Effort estimates based on complete scope
      - Justification provided for each estimate
      - Risks and buffers accounted for
steps:
  - name: End Goal and Initial Discovery
    instructions:
      - Understand the single outcome desired
      - Document the end goal clearly
      - Explore what the system/user needs to be able to do
      - Discover what components should exist
      - For each component understand its purpose
      - Keep drilling down with contextual questions that reveal interactions between components specific capabilities needed and edge cases
      - Stop when components cannot be split further without losing meaning
    constraints:
      - Never use example questions verbatim
      - Always generate contextually relevant questions based on current state
      - Determine next highest-value question dynamically
      - Adapt questioning style to technical context
    deliverables:
      - name: Clear end goal with initial requirements
        next_step_criteria:
          - User confirms goal captures their intent
          - Initial components identified
          - Basic requirements documented
  - name: Properties and Behaviors
    instructions:
      - For each discovered component explore what makes it uniquely identifiable
      - Determine what configuration each component needs
      - Document how each component changes over its lifecycle
      - For behaviors discover events relevant to each component
      - Identify default behavior for each use case
      - Define states that make sense for the implementation
      - Update document with each answer
    deliverables:
      - name: Complete properties and behaviors documentation
        next_step_criteria:
          - User confirms all characteristics captured
          - Properties fully documented
          - Behaviors completely defined
  - name: Deliverables Grouping
    instructions:
      - Present initial groupings based on discovered relationships
      - Explore optimal groupings through questions about natural coupling
      - Consider testing boundaries for the architecture
      - Identify parallel work opportunities in context
      - Refine groupings based on answers
    deliverables:
      - name: Components grouped into testable units
        next_step_criteria:
          - User confirms grouping makes sense
          - Dependencies clearly identified
          - Parallel work opportunities maximized
  - name: Checkpoints Definition
    instructions:
      - Present checkpoint suggestions from deliverable analysis
      - Explore dependencies specific to the system
      - Identify parallelization based on technical constraints
      - Define verification appropriate to each checkpoint
    deliverables:
      - name: Chronological milestones with acceptance criteria
        next_step_criteria:
          - User confirms checkpoints are achievable
          - Dependencies properly sequenced
          - Verification criteria defined
  - name: Effort Estimation
    instructions:
      - Present estimates based on complete understanding
      - Explore accuracy through questions about specific complexities
      - Identify risks unique to the technical approach
      - Calculate buffer needs for unknowns
      - Refine until estimates reflect reality
    deliverables:
      - name: Realistic effort breakdown with justification
        next_step_criteria:
          - User confirms estimates are reasonable
          - All risks accounted for
          - Justification provided for each estimate
template: |
  ```markdown
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

---

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
  ```
````````````
