# 🚧 Restrictions for: {Project Name}

> This document lists the known restrictions and constraints for `{Project Name}`. These are hard limits or boundaries that the project must operate within. They are non-negotiable unless explicitly changed and approved by stakeholders.

## 1. 🎯 Purpose
> 💡 *The purpose of this document is to provide a single source of truth for all project restrictions to ensure that all planning, design, and implementation work adheres to these boundaries.*
---

## 2. 📋 Table of Restrictions

| ID | Restriction | Category | Rationale / Source | Implications |
|:---|:---|:---|:---|:---|
| `RESTR-001` | The total project budget cannot exceed `$50,000`. | **Budget** | Approved project funding from the Finance department. | All decisions on tools, resources, and scope must consider this limit. |
| `RESTR-002` | The system must be hosted on `[e.g., Amazon Web Services (AWS)]`. | **Technology** | Existing enterprise agreement with the cloud provider. | Solutions must be compatible with AWS services. Cannot use other cloud providers like GCP or Azure. |
| `RESTR-003` | The initial release (MVP) must be launched by `[YYYY-MM-DD]`. | **Timeline** | Tied to a marketing campaign and annual company event. | The scope must be manageable within this timeframe. Features may need to be deferred. |
| `RESTR-004` | The project cannot use software with a `[e.g., GPLv3]` license. | **Legal** | To avoid licensing conflicts with the project's proprietary codebase. | All third-party libraries and dependencies must be checked for license compatibility. |
| `RESTR-005` | The project must use the existing central Authentication Service. | **Technical** | To maintain a single sign-on (SSO) experience across all company products. | Cannot build a new authentication system. Must integrate with the existing service's API. |
| ... | ... | ... | ... | ... |
