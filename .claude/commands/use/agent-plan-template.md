---
name: agent-plan-template
description: "Template for creating step-by-step implementation plans with convention compliance and gap identification"
---
# Template Command

When this command is used, use the following template. Acknowledge your understanding and then await the user's request.

---

````````````
# 🤖 Implementation Agent: [ticket-title]
> 💡 *Specialized agent instructions for implementing this specific ticket following all project conventions*

## 🎯 Main Goal
> 💡 *The behavioral objective for this implementation agent*

[Clear, measurable behavioral objective: Successfully implement [ticket description] following all documented project conventions with verified examples for every step]

### Deliverables
[What this agent must produce]

- [Complete implementation of specified features]
- [All files created/updated according to plan]
- [More deliverables if needed]
- [...]

### Acceptance Criteria
[How to verify this agent has achieved its goal]

- [ ] [All implementation steps completed]
- [ ] [Conventions followed throughout]
- [ ] [More criteria if needed]
- [ ] [...]

## 👤 Persona

### Role
Implementation specialist for [specific domain/technology]

### Expertise
[Specific technical expertise required for this implementation]

### Knowledge
- Project conventions from @[relative/path/from/project/root/to/file/without/backticks]
- Architecture patterns from @[relative/path/from/project/root/to/file/without/backticks]
- [More knowledge areas if needed]
- [...]

## 📋 Request

Implement [ticket] by following the step-by-step plan below, ensuring every operation has a working example and follows documented conventions.

## 📏 Instructions

### Best Practices
[Implementation-specific best practices]

- Follow conventions from @[relative/path/from/project/root/to/file/without/backticks]
- Use patterns from @[relative/path/from/project/root/to/file/without/backticks]
- [More best practices if needed]
- [...]

### Rules

#### Always
- WHEN implementing ANY step ALWAYS follow the exact convention documented
- WHEN creating files ALWAYS use the exact structure from examples
- [More ALWAYS rules if needed]
- [...]

#### Never
- WHEN implementing NEVER deviate from documented conventions
- WHEN uncertain NEVER guess - refer to documentation
- [More NEVER rules if needed]
- [...]

### References
[Essential documentation for this implementation]

- @[relative/path/from/project/root/to/file/without/backticks] - (Relevance: [Why this is important])
- @[relative/path/from/project/root/to/file/without/backticks] - (Relevance: [Description])
- [More references if needed]
- [...]

---

# 📋 Implementation Plan: [ticket-title]
> 💡 *Step-by-step plan for implementing [brief description] following project conventions*

[Brief description of what we are implementing, why we are implementing it, and how we plan to approach it following project conventions.]

---

## 📊 Ticket Analysis
> 💡 *What are we implementing?*

**Source:** [Issue #X | Milestone | User Request]
**Scope:** [What needs to be implemented]

**Key Requirements:**

[Specific capabilities that need to be implemented]

- [Requirement]
- [More requirements if needed]
- [...]

---

## 🏗️ Architecture Overview
> 💡 *How will components be structured?*

[Describe the overall architecture approach based on project conventions]

### Component Structure

[Visual or textual representation of how components relate]

```
[Visual representation of components if helpful]
```

### Key Design Decisions

[Convention-based architectural choices]

- [Decision with convention rationale]
- [More decisions if needed]
- [...]

---

## 📝 Implementation Steps
> 💡 *What files need to be created, read, updated, or deleted?*

[Chronological breakdown of all CRUD operations with examples and conventions]

### Phase: [Phase Name]
> [Brief description of what this phase accomplishes]

#### Step: [CRUD Operation] @[relative/path/from/project/root/to/file/without/backticks]

[Why this step is needed and what it accomplishes]

**Convention:** [Convention name] from @[relative/path/from/project/root/to/file/without/backticks]
**Purpose:** [Why this step is needed]

**Example:**
```[language]
[Code example from project or verified research]
```

**Instructions:** See @[relative/path/from/project/root/to/file/without/backticks]

#### Step: [CRUD Operation] @[relative/path/from/project/root/to/file/without/backticks]

[More steps if needed]

- [Sub-step if needed]
- [More sub-steps if needed]
- [...]

### Phase: [Phase Name]

[More phases if needed]

- [...]

---

## 🔍 Convention Gaps & Resolutions
> 💡 *What conventions are missing or conflicting?*

[Documentation gaps identified during planning and their resolutions]

### Gap: [Gap Description]

[Why this gap exists and why it matters for the implementation]

**Type:** [Missing | Conflicting | Unclear]
**Context:** [Why this matters for implementation]

**Resolution Approach:**

[Options presented to the user and their selection]

- [ ] Option: [Approach with rationale]
- [ ] Option: [Alternative with trade-offs]
- [x] **Selected:** [User's choice]

**Research Prompt:** [If external research was needed]
```
[Detailed prompt used for external research]
```

**Research Result:**
```[language]
[Integrated solution from research]
```

**Documentation Created:** @[relative/path/from/project/root/to/file/without/backticks]

### Gap: [Gap Description]

[More gaps if needed]

- [...]
````````````
