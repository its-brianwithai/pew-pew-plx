---
name: requirements-template
description: Use this template when in Phase 2 of the plan workflow to expand high-level requirements into detailed activity flows and identify all deliverables needed for implementation.
---
# 📋 Requirements: [Project Name]
> 💡 *Detailed requirements elaboration that expands high-level requirements into concrete activity flows and deliverables. This document bridges discovery and implementation planning.*

[Brief overview of the requirements being elaborated]

---

## 🔄 Activity Flows
> 💡 *Sequences of atomic actions that map out the steps to complete each high-level requirement. Each flow shows the happy path with clear actor/component interactions.*

[For each high-level requirement, define the activity flow]

```
<example>
### Requirement: [[requirement-name]]

#### Happy Flow
1. [[actor]] opens [[component-wl-example]]
2. [[component-wl-example]] displays [what is shown]
3. [[actor]] selects [option/action]
4. [[system]] validates [what is validated]
5. [[component-wl-example]] updates to show [new state]
6. [[system]] stores [what is persisted]

#### Error Flows
- If [error condition], then [error handling]
- If [another error], then [alternative flow]
</example>
```

---

## 📦 Deliverables
> 💡 *Concrete outputs that need to exist for each activity flow step. Each deliverable should be specific, assignable, and sized to fit within 3 story points.*

[For each activity flow, identify required deliverables]

```
<example>
### Flow: [[activity-flow-name]]

#### Step 1: [[actor]] opens [[component-wl-example]]
**Deliverables needed:**
- [[navigation-component]] Link/button to access the component
  - Owner: [[frontend-team]]
  - Size: 1 story point
  - Dependencies: [[design-system]]

- [[route-handler]] Backend endpoint for component data
  - Owner: [[backend-team]]
  - Size: 2 story points
  - Dependencies: [[api-gateway]]

#### Step 2: [[component-wl-example]] displays [data]
**Deliverables needed:**
- [[display-component]] UI component to show data
  - Owner: [[frontend-team]]
  - Size: 2 story points
  - Dependencies: [[data-model]]

### Sub-deliverables Breakdown
- [[parent-deliverable]]
  - [[sub-deliverable-1]] [Description] (1 point)
  - [[sub-deliverable-2]] [Description] (2 points)
  - [[sub-deliverable-3]] [Description] (1 point)
</example>
```
