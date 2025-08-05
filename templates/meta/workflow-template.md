---
name: workflow-template
description: "Use this template when creating sophisticated multi-agent orchestrations that require hierarchical thinking, decision points, quality gates, and comprehensive error handling."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path."
---
# 🌊 [Workflow Name]: [Sophisticated Process Title]
> 💡 *[One-line description that captures the workflow's transformative purpose and intellectual foundation]*

[Opening paragraph that establishes the workflow's significance, its place in the larger system architecture, and the fundamental problem it solves. This should inspire understanding of why this orchestration matters.]

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
[Define the fundamental reason this workflow exists - what transformation does it enable? What value does it create? How does it advance the system's goals?]

### Guiding Principles
1. **[Principle Name]**: [Description of how this principle shapes the workflow]
2. **[Principle Name]**: [Description of how this principle influences decisions]
3. **[Principle Name]**: [Description of how this principle ensures quality]
   [Add more principles as needed to capture the workflow's philosophical framework]

### Success Criteria
- [Measurable outcome that defines workflow success]
- [Quality metric that must be achieved]
- [Performance indicator that validates the approach]
- [Business or technical goal that justifies the workflow]

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **[Concept Name]**: [Definition and role in the workflow]
- **[Concept Name]**: [Definition and relationship to other concepts]
- **[Concept Name]**: [Definition and importance to the system]

### Workflow Patterns
- **[Pattern Type]**: [How this pattern is applied in the workflow]
- **[Pattern Type]**: [Where this pattern provides value]
- **[Pattern Type]**: [Why this pattern was chosen]

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
[Describe the high-level methodology - how does this workflow systematically achieve its goals? What makes it reliable and repeatable?]

### Phase Architecture
```
<example>
Phase 1: [Foundation Phase Name]
├── Step 1.1: [Preparation Step]
├── Step 1.2: [Analysis Step]
└── Quality Gate: [Validation Criteria]

Phase 2: [Construction Phase Name]
├── Parallel Block A:
│   ├── Step 2.1a: [Parallel Task]
│   └── Step 2.2a: [Parallel Task]
├── Parallel Block B:
│   ├── Step 2.1b: [Parallel Task]
│   └── Step 2.2b: [Parallel Task]
└── Synchronization Point: [Merge Criteria]

Phase 3: [Refinement Phase Name]
├── Decision Point: [Branching Logic]
├── Branch A: [Condition Met Path]
│   └── Step 3.1a: [Specialized Step]
├── Branch B: [Alternative Path]
│   └── Step 3.1b: [Alternative Step]
└── Quality Gate: [Final Validation]
</example>
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: [Foundation Phase Name]
> *[Phase purpose and why it must come first]*

#### Prerequisites
- [What must be true before this phase can begin]
- [Required inputs or conditions]
- [Dependencies that must be satisfied]

#### Step 1.1: [Descriptive Step Name]
- **Purpose**: [Why this step is necessary]
- **Instructions**: [Specific actions or [[prompt-name]] to execute]
- **Agent**: [[specialized-agent-name]] - [Why this agent is chosen]
- **Inputs**: [What information or artifacts are needed]
- **Outputs**: [Expected deliverables or [[template-name]]]
- **Success Criteria**: [How to verify step completion]
- **Error Handling**:
    - **Likely Failures**: [Common failure modes]
    - **Recovery Strategy**: [How to recover or retry]
    - **Escalation Path**: [When to seek intervention]
- **Timing**: [Expected duration or constraints]

#### Step 1.2: [Next Step Name]
[Repeat the detailed structure for each step]

#### Quality Gate: [Phase Validation Name]
- **Validation Criteria**:
    - [ ] [Specific check that must pass]
    - [ ] [Another validation requirement]
    - [ ] [Quality metric that must be met]
- **Pass Actions**: [What happens on success]
- **Fail Actions**: [Recovery or rollback procedures]

### Phase 2: [Construction Phase Name]
> *[Phase purpose and its relationship to previous phase]*

#### Parallel Execution Block
> *[Why these steps can and should run in parallel]*

##### Branch A: [Parallel Path Name]
###### Step 2.1a: [Parallel Step Name]
[Full step details as above]

##### Branch B: [Parallel Path Name]
###### Step 2.1b: [Parallel Step Name]
[Full step details as above]

#### Synchronization Point: [Merge Name]
- **Merge Conditions**: [When parallel paths can rejoin]
- **Conflict Resolution**: [How to handle conflicting outputs]
- **Combined Output**: [What the merged result looks like]

### Phase 3: [Decision Phase Name]
> *[Phase purpose and critical decisions made here]*

#### Decision Point: [Decision Name]
- **Decision Criteria Matrix**:
  ```
  <example>
  | Condition A | Condition B | Condition C | Route To    |
  |:----------- |:----------- |:----------- |:----------- |
  | True        | True        | Any         | Branch Alpha |
  | True        | False       | True        | Branch Beta  |
  | False       | Any         | False       | Branch Gamma |
  | Any         | Any         | Any         | Fallback     |
  </example>
  ```
- **Evaluation Logic**: [How conditions are assessed]
- **Default Path**: [What happens if no conditions match]

#### Branch Routes
[Define each possible branch with full step details]

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:---------- |:-------- |:---------------- |:----------------- |
| [Error Category] | [Critical/High/Medium/Low] | [How to detect] | [How to recover] |
| [Error Category] | [Severity Level] | [Detection approach] | [Recovery method] |


### Circuit Breaker Patterns
- **[Pattern Name]**: [When to halt execution to prevent cascade]
- **[Pattern Name]**: [Conditions for automatic recovery]

### Rollback Procedures
1. **Phase-Level Rollback**: [How to undo completed phases]
2. **Step-Level Rollback**: [How to reverse individual steps]
3. **Data Rollback**: [How to restore data consistency]

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **[Metric Name]**: [What it measures and target values]
- **[Metric Name]**: [How to calculate and interpret]
- **[Metric Name]**: [Threshold values and alerts]

### Optimization Opportunities
- **[Optimization Area]**: [How to improve performance]
- **[Optimization Area]**: [Potential efficiency gains]

### Learning Loops
- **[Feedback Type]**: [How to incorporate learnings]
- **[Improvement Process]**: [How to evolve the workflow]

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] [Specific precondition that must be met]
- [ ] [Resource that must be available]
- [ ] [Permission or approval needed]

### Resource Requirements
- **Agents**: [List of required agents and their roles]
- **Tools**: [Technical tools or services needed]
- **Time**: [Expected duration for full execution]
- **Skills**: [Human expertise required for oversight]

### Execution Checklist
1. [ ] [First preparation step]
2. [ ] [Second preparation step]
3. [ ] [Begin Phase 1]
   [Continue with execution steps]

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| [Problem description] | [Root cause] | [Fix steps] |
| [Problem description] | [Root cause] | [Fix steps] |


## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: [Initial version scope and limitations]
- **vNext**: [Planned improvements and extensions]

### Modification Triggers
- [Condition that requires workflow update]
- [Metric threshold that triggers optimization]
- [External change that necessitates revision]

### Deprecation Strategy
- [How to phase out obsolete paths]
- [Migration plan for active executions]
- [Backward compatibility considerations]
