---
name: [Fitting Title Case Name]
description: [Brief description of the purpose and scope of this document]
doc_id: [Fitting id in regards to doc type]
doc_status: draft|ready|in-progress|in-review|done|released
doc_type: [Doc type if any]
created_at: {date}
---
# [Fitting Emoji] [Doc Type]: [Descriptive Title]
> 💡 *[Descriptive subtitle]*

[Brief description of the problems we are going to solve, why we are going to solve them and how we plan to do it.]

## 🎯 End Goal
> 💡 *What do you want to achieve?*

[The single, clear, measurable outcome we want to achieve. Everything that follows must contribute to achieving this goal.]

## 📝 Initial Requirements
*What should the system/user be able to do or be?*

[Specific capabilities listed as simple English sentences starting with an actor and the verb first high level requirement]

- [Actor]
    - [Verb first high level requirement]
    - [More high level requirements if needed]
    - [...]

- [More actors if needed]

- [...]

## ➡️ Requirements Flows
> 💡 *How does a requirement unfold from start to finish?*

[The sequence of actions and events that occur for a user or system to fulfill a specific requirement.]

- [Verb first high level requirement]
    - [Human or System Actor] [verb] [object or target]
    - [More actions or events as needed]
    - [...]

- [More verb first high level requirements as needed]

- [...]

## 📊 Analytics
> 💡 *What user actions and system events should be tracked for analysis?*

[A list of analytics events, detailing what triggers them, what data they include, and which analytics services they should be sent to.]

- [Parent Item]
    - [Event]
        - Id: [event_id]
        - Trigger: [What causes this event to be fired, e.g., "User lands on the pricing page"].
        - Properties:
            - [Property Name]: [Data Type] - [Description of the property]
            - [More properties as needed]
            - [...]
    - [More events as needed]
    - [...]

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

## 🚦 States
> 💡 *What are the possible conditions or data a component can hold at any given time?*

[A breakdown of a component's various states, categorized by where that state is stored or how it manifests.]

- [Component]
    - [State category e.g. UI, Memory, Local Device, Remote]
        - [State]
        - [More states as needed]
        - [...]
    - [More state categories as needed]
    - [...]

- [More components as needed]
- [...]

## ⚡️ Interactions
> 💡 *What triggers changes in a component, and how does data flow as a result?*

[A mapping of interactions from actors, events, or parent components that affect a component, detailing the action, the resulting data flow, and any state changes it triggers.]

- [Component]
    - Interaction from [Actor: User | Event: System Notification | Parent: ContainerView]
        - When [a specific action occurs, e.g., "user taps the save button"]
            - Data Flow: [Description of what data is sent where, e.g., "Form data is sent to the API client"]
            - Triggers State Change: [Description of the resulting state, e.g., "Component's UI state becomes 'saving'"]
        - [More actions from this source]
        - [...]
    - [More interaction sources for this component]
    - [...]

- [More components]
- [...]

# 🛠️ Behaviours
> 💡 *Which states or events should the component act upon? How should it behave when nothing happens?*

[How a component should act when a state is, or an event happens]

- [Component]
    - [State or event]
        - Should [Behaviour]
        - [More behaviours if needed]
        - [...]
    - [More states or events if needed]
    - [...]
        - [Sub-component]
            - [More states or events if needed]
            - [...]
        - [More sub-components if needed]
        - [...]

- [More components if needed]
- [...]

## 🛡️ Essential Conditions
> 💡 *What should always go right? What can never go wrong? What should always be? What should never be?*

[A set of fundamental measurable conditions that must always be met. These serve as direct input for unit and end-to-end tests.]

- [Parent Item]
    - [Essential condition]
    - [More essential conditions if needed]
    - [...]

- [More items if needed]
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
