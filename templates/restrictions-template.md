---
name: restrictions-template
description: Use this template to document the hard boundaries and constraints for a project. These are non-negotiable limits that the project must operate within.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---

# 🚧 Restrictions for: [Project Name]
> 💡 *This document lists the known restrictions and constraints for the project. These are hard limits or boundaries that the project must operate within. They are non-negotiable unless explicitly changed and approved by stakeholders.*

[Brief description of the project and its context]

## 🎯 Purpose
> 💡 *The purpose of this document is to provide a single source of truth for all project restrictions to ensure that all planning, design, and implementation work adheres to these boundaries.*

[Explanation of why documenting restrictions is important for this specific project]

## 📋 Table of Restrictions

| ID | Restriction | Category | Rationale / Source | Implications |
|:---|:---|:---|:---|:---|
| `RESTR-001` | [The total project budget cannot exceed $X] | **Budget** | [Approved project funding from the Finance department] | [All decisions on tools, resources, and scope must consider this limit] |
| `RESTR-002` | [The system must be hosted on specific platform] | **Technology** | [Existing enterprise agreement with the cloud provider] | [Solutions must be compatible with specified services. Cannot use other providers] |
| `RESTR-003` | [The initial release must be launched by specific date] | **Timeline** | [Tied to marketing campaign and annual company event] | [The scope must be manageable within this timeframe. Features may need to be deferred] |
| `RESTR-004` | [The project cannot use software with specific license] | **Legal** | [To avoid licensing conflicts with the project's proprietary codebase] | [All third-party libraries and dependencies must be checked for license compatibility] |
| `RESTR-005` | [The project must use existing authentication service] | **Technical** | [To maintain single sign-on experience across all company products] | [Cannot build new authentication system. Must integrate with existing service API] |
| [Additional restrictions as needed] | [Description of restriction] | **[Category]** | [Source or rationale] | [Impact on project decisions] |
