---
name: refinement-template
description: Use this template when in Phase 3 of the plan workflow to define exact properties, behaviours, and architecture of all components that need to be created or updated.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🔧 Refinement & Architecture: [Project Name]
> 💡 *Detailed refinement phase that defines exact properties, behaviours, and system architecture. This document provides the technical blueprint for implementation.*

[Brief overview of what's being refined and architected]

---

## 🔄 Refinement
> 💡 *Define exact properties and behaviours of all components to be created or updated. Follow the 5-layer approach: Actors & Components, Activities, Activity Flows, Properties, and Behaviours. Each layer builds upon the previous one.*

[Define properties and behaviours for each component following the refinement workflow]

```
<example>
### [[component-name]]

#### Properties
**Identity Properties**
- id: [Type and format of unique identifier]
- name: [Naming rules and constraints]
- [Other identity properties]

**Configuration Properties**
- settings: [What can be configured]
- preferences: [User-adjustable options]
- [Other configuration properties]

**State Properties**
- status: [Possible states and transitions]
- currentValue: [Runtime data tracked]
- [Other state properties]

#### Behaviours
**UI/UX**
- Visual: [How it looks - colors, layout, spacing]
- Interaction: [How users interact with it]
- Feedback: [How it responds to actions]

**Rules & Limits**
- Validation: [Input validation rules]
- Constraints: [Boundaries and limitations]
- Business Rules: [Domain-specific rules]

**Data & Analytics**
- Tracking: [What events are tracked]
- Metrics: [What is measured]
- Reporting: [What data is exposed]

**Security**
- Access Control: [Who can access what]
- Permissions: [Required permissions]
- Data Protection: [How sensitive data is handled]

**Performance**
- Speed: [Response time requirements]
- Optimization: [Caching, lazy loading needs]
- Scalability: [How it handles increased load]
</example>
```

---

## 🏗️ Architecture Overview
> 💡 *Visual representation of system architecture showing components, their relationships, and data flow. Use ASCII diagrams or describe the architecture in a structured format that can be easily visualized.*

[Architecture diagram or structured description]

```
<example>
┌─────────────────┐     ┌─────────────────┐
│ [[frontend-app]]│────▶│  [[api-gateway]] │
└─────────────────┘     └─────────────────┘
                               │
                               ▼
                        ┌─────────────────┐
                        │ [[auth-service]] │
                        └─────────────────┘
                               │
                    ┌──────────┴──────────┐
                    ▼                     ▼
            ┌─────────────────┐   ┌─────────────────┐
            │  [[database]]   │   │ [[cache-layer]]  │
            └─────────────────┘   └─────────────────┘

### Component Relationships
- [[frontend-app]] → [[api-gateway]]: REST API calls
- [[api-gateway]] → [[auth-service]]: Authentication verification
- [[auth-service]] → [[database]]: User data queries
- [[auth-service]] → [[cache-layer]]: Session caching

### Data Flow
1. User request from [[frontend-app]]
2. [[api-gateway]] validates and routes request
3. [[auth-service]] verifies credentials
4. Data retrieved from [[database]] or [[cache-layer]]
5. Response sent back through the chain
</example>
```
