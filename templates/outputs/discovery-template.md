---
name: discovery-template
description: Use this template when starting Phase 1 of the plan workflow to capture initial requests, identify actors and components, define high-level requirements, and identify dependencies.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🔍 Discovery: [Project Name]
> 💡 *Initial discovery and context gathering phase that transforms raw requests into structured requirements. This document captures the foundation for all subsequent planning phases.*

[Brief overview of what this discovery phase covers]

---

## 🎯 Initial Request
> 💡 *The original request or problem statement that initiated this work. This can be as detailed or simple as needed to provide clear context for all subsequent steps.*

[Original request or problem statement, including any research, best practices, or domain knowledge provided]

```
<example>
[User's initial request, problem description, or project brief that captures the essence of what needs to be accomplished, including any supporting research or context]
</example>
```

---

## 🧩 Actors & Components (Who or what)
> 💡 *Entities that interact with or are part of the system, categorized by type for clarity. Human actors are people, system actors are external services, and components are internal parts of our system.*

### 👤 Human Actors
> *People who interact with the system directly or indirectly*

[List human actors with appropriate emoji and description]

```
<example>
- **Customer** 👤 - End user who purchases products
- **Administrator** 👤 - System admin with full access
- **Support Team** 👥 - Group handling customer issues
</example>
```

### 🔌 System Actors
> *External systems, services, or APIs that interact with our system*

[List system actors with appropriate emoji and description]

```
<example>
- **Payment Gateway** 🔌 - Stripe API for payment processing
- **Email Service** 🌐 - SendGrid for transactional emails
- **Partner System** 🏢 - Third-party inventory provider
</example>
```

### ⚙️ Components
> *Internal parts of our system (UI, services, data stores, infrastructure)*

[List components hierarchically with appropriate emoji]

```
<example>
- **Order Service** ⚙️ - Handles order processing
    - **Order Validator** ⚙️ - Validates order data
    - **Order Database** 📊 - Stores order information
- **Customer Portal** 🖥️ - Web UI for customers
    - **Order Form** 🖥️ - Order creation interface
    - **Order History** 🖥️ - Past orders display
</example>
```

---

## 📋 High-Level Requirements
> 💡 *Define what each actor and component should be able to do (abilities) and what states they should have/maintain. These requirements form the basis for activity flows in the next phase.*

[For each actor/component, define their abilities and states]

```
<example>
### [[actor-or-component-name]]

#### Abilities (Can do)
- [Action this actor/component can perform]
- [Another capability or function]
- [Additional abilities as needed]

#### States (Is/Has)
- [State or property this maintains]
- [Another state or characteristic]
- [Additional states as needed]
</example>
```

---

## 🔗 Dependencies & Gaps
> 💡 *Identify what is needed for implementation, what we currently have, what we're missing, and what needs further research or clarification.*

[Document all dependencies and gaps]

```
<example>
### What We Need
- [External API or service required]
- [Library or framework dependency]
- [Data source or infrastructure component]
- [Tool or platform requirement]

### What We Have
- [Existing system or component we can use]
- [Available resource or capability]
- [Current infrastructure or tool]

### What We Don't Have
- [Missing component that needs to be acquired]
- [Service that needs to be set up]
- [Resource that needs to be obtained]

### What We Need to Figure Out
- [Technical question requiring research]
- [Business rule needing clarification]
- [Integration detail to be determined]
</example>
```
