---
name: bug-workflow
description: "A systematic workflow for reporting, triaging, planning, and verifying software bugs to ensure efficient and effective resolution."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path."
---
# 🌊 Bug Workflow: From Report to Resolution
> 💡 *A systematic 4-phase workflow for managing the entire lifecycle of a software bug, from initial discovery to verified fix.*

This workflow provides a structured process for handling bugs, ensuring that they are documented thoroughly, analyzed correctly, fixed efficiently, and verified completely.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
To transform bug reports from simple problem statements into a complete package of information that enables fast, accurate, and lasting fixes, thereby improving product quality and user trust.

### Guiding Principles
1.  **Clarity over Brevity**: A detailed bug report is better than a quick one.
2.  **Reproducibility is Key**: A bug that can be reproduced can be fixed.
3.  **Analyze Before Fixing**: Understand the root cause to prevent recurrence.
4.  **Verify, Then Close**: Ensure the fix is effective before considering the job done.

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Phase Architecture
```
Phase 1: Bug Reporting
├── Step 1.1: Initial Bug Description
├── Step 1.2: Guided Information Gathering
└── Quality Gate: Report Completeness Check

Phase 2: Triage & Analysis
├── Step 2.1: Severity & Priority Assessment
├── Step 2.2: Root Cause Analysis
└── Quality Gate: Triage Confirmation

Phase 3: Fix Implementation Plan
├── Step 3.1: Technical Solution Design
├── Step 3.2: Detailed Action Planning
└── Quality Gate: Plan Review

Phase 4: Verification & Closure
├── Step 4.1: Verification Test Planning
├── Step 4.2: Fix Confirmation
└── Quality Gate: Closure Approval
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Orchestrator
- [[bug-workflow-orchestrator]]

### Phase 1: Bug Reporting
> *Capture all necessary details to create a comprehensive and actionable bug report.*

- **Prompt**: [[create-bug-report]] or [[update-bug-report]]
- **Agent**: [[bug-reporter-agent]]
- **Output**: A new issue file in `issues/backlog/` using the [[bug-report-template]].

### Phase 2: Triage & Analysis
> *Assess the bug's impact, prioritize it, and determine the root cause.*

- **Prompt**: [[triage-bug-report]]
- **Agent**: [[bug-triage-agent]]
- **Output**: The original bug report updated with a "Triage Notes" section.

### Phase 3: Fix Implementation Plan
> *Create a detailed, step-by-step technical plan to resolve the bug.*

- **Prompt**: [[plan-bug-fix]]
- **Agent**: [[bug-fix-planner-agent]]
- **Output**: A new implementation plan document, linked to the bug report, using [[implementation-plan-template]].

### Phase 4: Verification & Closure
> *Confirm that the fix resolves the reported issue and doesn't introduce regressions.*

- **Prompt**: [[verify-bug-fix]]
- **Agent**: [[bug-verifier-agent]]
- **Output**: A verification report, and the issue is marked as closed.
