# 📜 Rules for: {Project Name}

> This document lists specific rules that must be followed during the development and operation of `{Project Name}`. These rules can stem from client requirements, technical decisions, legal compliance, or other sources. Unlike restrictions (which are boundaries), rules define *how* things must be done within those boundaries.

## 1. 🎯 Purpose
> 💡 *The purpose of this document is to ensure that all project activities conform to a set of predefined rules, ensuring consistency, compliance, and alignment with stakeholder expectations.*
---

## 2. 📋 Table of Rules

| ID | Rule | Category | Source | Description & Enforcement |
|:---|:---|:---|:---|:---|
| `RULE-01` | All user registrations must require acceptance of the Terms of Service. | **Compliance** | Legal Department | A non-pre-checked checkbox and a link to the ToS page must be present on the registration form. The backend must not create an account if this is not checked. |
| `RULE-02` | All external API calls must have a timeout of `[e.g., 10 seconds]`. | **Technical** | Architecture Team | To prevent cascading failures from unresponsive third-party services. This must be configured in the HTTP client and verified in code review. |
| `RULE-03` | All user-facing copy must be approved by the Marketing team. | **Client/Stakeholder** | Marketing Lead | Create a task for Marketing review in the project plan for any story involving new user-facing text. Do not merge to production without their approval. |
| `RULE-04` | The system must not collect or store any Personally Identifiable Information (PII) other than email address. | **Compliance** | GDPR / Privacy Policy | Any new feature or data model must be reviewed against this rule. Regular data audits should be performed to ensure no other PII is being stored. |
| `RULE-05` | All commit messages must follow the `[e.g., Conventional Commits]` specification. | **Technical** | Development Team Lead | A git hook or CI check should be implemented to enforce this format to enable automated changelog generation. |
| ... | ... | ... | ... | ... |
