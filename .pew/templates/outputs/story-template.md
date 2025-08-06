---
name: story-template
description: Use this template to document a user story, addressing a user's need with clear acceptance criteria, technical details, and implementation path.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📒 Story: [Title]
> 💡 *A user story for a feature or capability, addressing a specific user's need to accomplish a goal. It structures requirements from the user's perspective with clear acceptance criteria and technical details.*

# 🔖 Description
> 💡 *A short and descriptive introduction of the problem we are going to solve.*

[Introduction to the problem]

## 🗣️ User Story
> 💡 *As a ROLE I want BEHAVIOUR so that REASON.*

```
<example>
**As a** [ User Role e.g., Registered User ]
**I want** [ Action/Behaviour e.g., to log in with my email and password ]
**So that** [ Benefit/Reason e.g., I can access my personalized dashboard ]
</example>
```

## ✅ Acceptance Criteria
> 💡 *Specific, testable conditions that must be met for this to be considered complete and successful.*

[List acceptance criteria using checkboxes]

```
<example>
- [ ] Description of what must be true for this criterion to pass
- [ ] Another specific, testable condition
- [ ] Third acceptance criterion
- [ ] Fourth criterion to be met
</example>
```

## 📦 Deliverables
> 💡 *Concrete outputs and assets that will exist when this is completed, organized by who or what is responsible for creating them.*

[List deliverables categorized by parent entity such as team, role, or other organizing principle]

```
<example>
- [[parent-entity-1]] (e.g., team, role, phase, or category)
    - [[deliverable-name]] - Description of what will be created
    - [[another-deliverable]] - Description of another output
- [[parent-entity-2]]
    - [[deliverable-name]] - Description of deliverable
    - [[deliverable-name]] - Description of deliverable
- [[parent-entity-3]]
    - [[deliverable-name]] - Description of what will be created
</example>
```

## 📊 Analytics
> 💡 *What user actions and behaviours should be tracked to understand how this feature is used.*

[List the key user actions and behaviours to track, or state "No analytics tracking needed" if none]

### 📈 Events to Track

- 1. [User action or behavior, e.g., "When users save their settings"]
    - Metrics: [e.g., "Number of settings saved, time spent on settings page"]
    - Reasoning: [Business reason, e.g., "To understand feature adoption"]

```
<example>
- 1. When users share content with their team
  - Metrics: Number of shares, recipient count, content type shared, sharing frequency
  - Reasoning: To measure collaboration feature usage and identify popular content types

- 2. When users complete onboarding
  - Metrics: Time to complete, steps skipped, features explored, help accessed
  - Reasoning: To optimize the onboarding flow and reduce drop-off rates
</example>
```

# 🧪 Test Focus
> 💡 *What we want to guarantee with the tests written for this story.*

When 100% of the tests pass, we should be able to guarantee that:

```
<example>
- [ ] [Example: something we want to guarantee with the tests written for this story e.g. user can log in with valid credentials]
- [ ] [Add more guarantees as needed]
- [ ] [...]
</example>
```

## ☎️ Impact Communication
> 💡 *Teams and stakeholders who need to be informed about the impact of this work.*

[List teams and individuals to inform about the impact of this work]

```
<example>
- [[team-name]] or role - Reason they need to be informed
- [[sales-team]] - Impact on sales processes or customer communications
- [[marketing-team]] - Changes affecting user-facing features or messaging
- [[data-team]] - New analytics or data model changes
- [[customer-success]] - Changes affecting user experience or support
- [[operations-team]] - Infrastructure or operational impacts
</example>
```

[If no specific impact communication needed, state "No specific impact communication needed"]

## ⏱️ Effort Breakdown & Estimates
> 💡 *We estimate the ideal and most likely outcome for design, refinement, front-end, back-end and operational work. QA is calculated as 25% of core work, while testing is calculated as 15% of core work. On top of that we add a margin for possible delay, which defaults to 10% of total work, but is increased if we think there is a high risk of unknown problems along the way.*

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

## 👉 Final Remarks
> 💡 *Important notes, dependencies, warnings, and related information that doesn't fit elsewhere.*

[Include relevant final notes using wikilinks where applicable]

```
<example>
- **Related Issues:** [[issue-123]], [[issue-456]] that should be considered
- **Dependencies:** [[backend-api]] must be deployed before this can go live
- **Out of Scope:** [[feature-name]] will be addressed in a future iteration
- **Caution:** Changes to [[component-name]] may affect [[dependent-system]]
- **Notes:** [Any additional context, warnings, or information]
- **Follow-up:** After deployment, monitor [[metric-name]] for performance impact
- **Known Limitations:** [Document any known issues or constraints]
</example>
```
