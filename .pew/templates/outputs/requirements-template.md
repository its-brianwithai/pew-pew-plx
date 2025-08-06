---
name: requirements-template
description: Use this template when in Phase 2 of the plan workflow to expand high-level requirements into detailed activity flows and identify all deliverables needed for implementation.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
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
1. [[actor]] opens [[component]]
2. [[component]] displays [what is shown]
3. [[actor]] selects [option/action]
4. [[system]] validates [what is validated]
5. [[component]] updates to show [new state]
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

#### Step 1: [[actor]] opens [[component]]
**Deliverables needed:**
- [[navigation-component]]: Link/button to access the component
  - Owner: [[frontend-team]]
  - Size: 1 story point
  - Dependencies: [[design-system]]

- [[route-handler]]: Backend endpoint for component data
  - Owner: [[backend-team]]
  - Size: 2 story points
  - Dependencies: [[api-gateway]]

#### Step 2: [[component]] displays [data]
**Deliverables needed:**
- [[display-component]]: UI component to show data
  - Owner: [[frontend-team]]
  - Size: 2 story points
  - Dependencies: [[data-model]]

### Sub-deliverables Breakdown
- [[parent-deliverable]]
  - [[sub-deliverable-1]]: [Description] (1 point)
  - [[sub-deliverable-2]]: [Description] (2 points)
  - [[sub-deliverable-3]]: [Description] (1 point)
</example>
```
