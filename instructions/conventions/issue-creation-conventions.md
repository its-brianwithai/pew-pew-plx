---
name: issue-creation-conventions
description: "Standard instructions for creating and organizing issues in the project. Defines folder structure, naming conventions, and document organization for all issue types."
---
# 📋 Issue Creation Instructions

> 💡 *Standard guidelines for creating and organizing issues across all workflows*

## 📁 Issue Organization

Flexible structure based on parallel work:
```
{company-concept}/{most-valuable-milestone}/{most-valuable-step}.md
```
Company concepts can be inserted anywhere to enable parallel work.

### Structure Flow Diagram

```mermaid
graph TD
    A[company-concept/] --> B[000-backlog/]
    A --> C[001-most-valuable-milestone/]
    C --> D[000-backlog/]
    C --> E[001-most-valuable-step/]
    E --> F[000-backlog/]
    E --> G[CONC-001-description-type.md]
    E --> H[CONC-002-description-type.md]
    E --> I[CONC-003-description-type.md]
    
    style A fill:#37474f,color:#fff
    style B fill:#b71c1c,color:#fff
    style D fill:#b71c1c,color:#fff
    style F fill:#b71c1c,color:#fff
    style G fill:#1565c0,color:#fff
    style H fill:#1565c0,color:#fff
    style I fill:#1565c0,color:#fff
```

## 📝 Naming Components

- `{company-concept}` - Any concept that can be worked on in parallel (can be inserted anywhere in hierarchy)
- `{most-valuable-milestone}` - MVM - Format: `{3-digit-number}-{description}` (e.g., 001-user-auth, 002-payment-system)
    - Chronologically ordered (earlier numbers must be considered first)
    - Zero-padded to 3 digits total
    - Each MVM folder may contain a `000-backlog` folder
- `{most-valuable-step}` - MVS - Format: `{CONCEPT}-{3-digit-number}-{description}-{type}.md`
    - `{CONCEPT}` - Max 4 character identifier (e.g., ESS for essentials, AUTH for authentication)
    - `{3-digit-number}` - Chronologically ordered by importance
    - `{description}` - Kebab-case descriptive name  
    - `{type}` - Document type (issue, story, plan, etc.)
    - Each MVS folder may contain a `000-backlog` folder

## 🎯 Most Valuable Project Management (MVPM)

We determine directories by their ability to be worked on in parallel - this enables both humans and AI agents to work simultaneously on different parts of the project without conflicts. Each directory represents an independent work stream that can progress without blocking others.

### Directory Structure Philosophy
App essentials - usually a department should be at top level. Given departments usually work in parallel as a given. Team folders are optional and should only be created when multiple teams need to work on clearly separated tickets within the same MVS. If tickets can be worked on by any team member or don't require strict team separation, avoid team folders to reduce overhead.

### Parallel Work Visualization

```mermaid
graph LR
    A[Company] --> B[Engineering Dept]
    A --> C[Marketing Dept]
    A --> D[Sales Dept]
    
    B --> B1[Infrastructure Concept]
    B --> B2[Authentication Concept]
    C --> C1[Campaigns Concept]
    D --> D1[Leads Concept]
    D --> D2[Infrastructure Concept]
    
    B1 --> B3[001-cloud-migration MVM]
    B2 --> B4[001-user-auth MVM]
    C1 --> C2[001-summer-launch MVM]
    D1 --> D3[001-q4-targets MVM]
    D2 --> D4[001-cloud-migration MVM]
    
    style B fill:#1e3a5f,color:#fff
    style C fill:#4a148c,color:#fff
    style D fill:#1b5e20,color:#fff
    
    style B3 fill:#0d47a1,color:#fff
    style B4 fill:#0d47a1,color:#fff
    style C2 fill:#6a1b9a,color:#fff
    style D3 fill:#2e7d32,color:#fff
    style D4 fill:#2e7d32,color:#fff
```

Note: Departments can work on the same milestone (e.g., Engineering and Sales both working on cloud-migration) or completely different milestones based on their priorities.

### When Overwhelmed: Start with MVS
If it feels overwhelming to define the whole structure, start with the next MVS (Most Valuable Step) to reduce cognitive overload.

### Example Workflow:
1. **What needs to be done?** → set-up-flutter-app
2. **What subject/concept?** → Parent folder → essentials/set-up-flutter-app
3. **Which department?** → Add above or below → tech/essentials/set-up-flutter-app OR essentials/tech/set-up-flutter-app
4. **Build the hierarchy** → Work backwards to establish MVM and company concept
5. **Any teams needed?** → Inside the closest categorizer combo (essentials & tech) → team-app/team-backend
6. **What should they do?** → Create issue folders
7. **Create documents** → Add evolving documents within issue folders

### Workflow Decision Tree

```mermaid
flowchart TD
    A[What needs to be done?] --> B[Define MVS: set-up-flutter-app]
    B --> C{What concept?}
    C --> D[essentials]
    D --> E{Which department?}
    E --> F[tech department]
    F --> G{Build hierarchy}
    G --> H[tech/essentials/001-initial-setup/001-set-up-flutter-app]
    H --> I{Teams needed?}
    I -->|Yes| J[Create team folders]
    I -->|No| K[Create issue folders directly]
    J --> L[team-app/<br/>team-backend]
    L --> K
    K --> M[Create MVS files]
    M --> N[ESS-001-flutter-setup-story.md<br/>ESS-002-configure-db-plan.md<br/>ESS-003-deploy-pipeline-issue.md]
    
    style A fill:#263238,color:#fff
    style B fill:#2e7d32,color:#fff
    style N fill:#1565c0,color:#fff
```

### Hierarchy Pattern:
```
{company-concept} / {most-valuable-milestone} / {most-valuable-step}
```
Note: Company concepts can be nested or arranged in any order that enables parallel work.

**Tree representation:**
```
{company-concept}/
├── 000-backlog/                    # Backlog for future milestones
└── {001-most-valuable-milestone}/
    ├── 000-backlog/                # Backlog for future steps in this milestone
    └── {001-most-valuable-step}/
        ├── 000-backlog/            # Backlog for future MVS files
        ├── CONC-001-description-type.md
        ├── CONC-002-description-type.md
        └── CONC-003-description-type.md
```

Examples:

### Issue Evolution Timeline

```mermaid
timeline
    title MVS Evolution Over Time
    
    Day 1 : AUTH-001-create-jwt-story.md
          : Initial story created
    
    Day 3 : AUTH-002-token-validation-issue.md
          : Validation issue identified
    
    Day 5 : AUTH-003-refresh-logic-plan.md
          : Refresh mechanism planned
```

**Full hierarchy tree:**
```
issues/
└── engineering/
    └── authentication/                   # Company concept
        ├── 000-backlog/                  # Future milestones
        └── 001-user-auth/                # MVM (highest priority)
            ├── 000-backlog/              # Future steps
            └── 001-jwt-implementation/   # MVS (highest priority)
                ├── 000-backlog/          # Future issues
                ├── AUTH-001-create-jwt-service-story.md
                ├── AUTH-002-token-validation-issue.md
                └── AUTH-003-refresh-logic-plan.md
```

**Department-level parallelization tree:**
```
issues/
├── engineering/
│   └── infrastructure/                   # Company concept
│       └── 001-cloud-migration/          # MVM
│           ├── 000-backlog/
│           └── 001-aws-setup/            # MVS (engineering working on AWS)
│               ├── INF-001-vpc-configuration-story.md
│               └── INF-002-security-groups-plan.md
├── finance/
│   └── infrastructure/                   # Company concept
│       └── 001-cloud-migration/          # MVM
│           ├── 000-backlog/
│           └── 001-cost-analysis/        # MVS (finance working on costs)
│               └── FIN-001-budget-forecast-story.md
└── security/
    └── infrastructure/                   # Company concept
        └── 001-cloud-migration/          # MVM
            ├── 000-backlog/
            └── 001-compliance-check/     # MVS (security working on compliance)
                └── SEC-001-gdpr-audit-plan.md
```

**Team-level parallelization tree:**
```
issues/
└── engineering/
    └── payments/                         # Company concept
        ├── 000-backlog/
        └── 001-checkout-flow/            # MVM
            ├── 000-backlog/
            └── 001-payment-processing/   # MVS
                ├── 000-backlog/
                ├── PAY-001-cart-component-story.md
                ├── PAY-002-payment-form-issue.md
                ├── PAY-003-stripe-integration-story.md
                ├── PAY-004-webhook-handler-bug.md
                ├── PAY-005-e2e-tests-chore.md
                └── PAY-006-load-testing-enhancement.md
```
