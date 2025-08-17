---
name: create-issue
description: "Universal issue creation prompt that analyzes requirements to determine issue type (tech, operations, marketing, sales, finance, or people) and routes to the appropriate specialized prompt."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 📋 Create Issue: Intelligent Routing for All Issue Types
> 💡 *Analyze the user's request to determine the appropriate issue type and create structured issues through the right specialized workflow.*

## 🎯 Purpose
Transform any user request into a well-structured issue by:
1. **Analyzing the domain** to determine issue type
2. **Routing to the appropriate specialized prompt**
3. **Following domain-specific refinement workflows**
4. **Creating actionable, structured deliverables**

## 🔄 Issue Type Determination

### Step 1: Analyze Request Domain
Examine the user's request for keywords and context to determine which type of issue to create:

#### Tech Issues
**Indicators**: Code, features, bugs, API, database, UI/UX, performance, security, architecture, implementation
**Execute workflow:**

# 🛠️ Create Tech Issue: Systematic Requirements Decomposition
> 💡 *Transform vague technical requests into comprehensive, actionable issues through systematic decomposition and low cognitive load questioning that reveals all requirements naturally.*

## 🎯 End Goal
> 💡 *The measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Create a comprehensive technical issue document that:
- Defines a single clear outcome the system/user must achieve
- Identifies all atomic requirements and components without assumptions
- Documents properties, behaviors, deliverables, and checkpoints
- Provides accurate effort estimates based on complete understanding
- Follows MVP mindset focusing only on must-haves
- Maintains context rot awareness by including only value-adding information

### Deliverables
- Complete tech issue document with all sections populated
- Clear end goal with measurable success criteria
- Atomic component breakdown with properties and behaviors
- Grouped deliverables as testable units
- Chronological checkpoints with acceptance criteria
- Realistic effort estimates with justification

### Acceptance Criteria
- [ ] End goal is specific and measurable
- [ ] All requirements traced back to explicit user confirmation
- [ ] Components broken down to atomic level
- [ ] Properties and behaviors fully documented
- [ ] Deliverables grouped for parallel work
- [ ] Checkpoints enable progress tracking
- [ ] Effort estimates based on complete scope

## 👤 Persona

### Role
Technical requirements analyst and systematic decomposer

### Expertise
Requirements engineering, systematic questioning, component decomposition, effort estimation

### Communication Style
Patient, methodical, uses low cognitive load questions, reveals information naturally

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Guide user through systematic tech issue creation by revealing all requirements through strategic questioning and iterative document updates.

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### ⚠️ CRITICAL: Dynamic Question Generation
**ALL questions shown in this workflow are ILLUSTRATIVE EXAMPLES ONLY.**

The agent must:
- **NEVER** use the example questions verbatim
- **ALWAYS** generate contextually relevant questions based on:
  - The current state of the document
  - Previous answers given
  - The specific technical domain
  - Gaps in current understanding
  - The unique end goal
- **DETERMINE** the next highest-value question dynamically
- **THINK** before each question: "What information would most advance our understanding?"
- **ADAPT** questioning style to the technical context

### Phase 1: End Goal & Initial Discovery
**Deliverable:** Clear end goal with initial requirements and components
**Acceptance Criteria:** User confirms goal captures their intent

**Process (generate your own questions):**
1. Understand the single outcome desired
2. Document the end goal clearly
3. Explore what the system/user needs to be able to do
4. Discover what components should exist
5. For each component, understand its purpose
6. Keep drilling down with contextual questions that reveal:
   - Interactions between components
   - Specific capabilities needed
   - Edge cases relevant to THIS system
7. Stop when components can't be split further without losing meaning

**Question generation guidance (NOT questions to use):**
- Start with outcome understanding
- Move to capability exploration
- Drill into component discovery
- Let each answer guide the next question

### Phase 2: Properties & Behaviors
**Deliverable:** Complete properties and behaviors documentation
**Acceptance Criteria:** User confirms all characteristics captured

After user satisfaction with Phase 1:

**Process (create context-specific questions):**
1. For each discovered component, explore:
   - What makes it uniquely identifiable in THIS system
   - What configuration THIS component needs
   - How THIS component changes over its lifecycle
2. For behaviors, discover:
   - Events relevant to THIS specific component
   - Default behavior for THIS use case
   - States that make sense for THIS implementation
3. Update document with each answer

**Remember:** Generic property questions miss domain-specific needs. Generate questions that fit the actual components discovered.

### Phase 3: Deliverables Grouping
**Deliverable:** Components grouped into unified testable units
**Acceptance Criteria:** User confirms grouping makes sense

After user satisfaction with Phase 2:

**Process (questions emerge from actual components):**
1. Present initial groupings based on discovered relationships
2. Explore optimal groupings through questions about:
   - Natural coupling between specific components
   - Testing boundaries for this architecture
   - Parallel work opportunities in this context
3. Refine based on answers

**Key:** The best grouping questions come from understanding the specific technical relationships discovered.

### Phase 4: Checkpoints Definition
**Deliverable:** Chronological milestones with acceptance criteria
**Acceptance Criteria:** User confirms checkpoints are achievable

After user satisfaction with Phase 3:

**Process (base on actual deliverables):**
1. Present checkpoint suggestions from deliverable analysis
2. Explore dependencies specific to this system
3. Identify parallelization based on technical constraints
4. Define verification appropriate to each checkpoint

**Critical:** Dependencies are domain-specific. Generate questions based on the actual technical relationships.

### Phase 5: Effort Estimation
**Deliverable:** Realistic effort breakdown with justification
**Acceptance Criteria:** User confirms estimates are reasonable

After user satisfaction with Phase 4:

**Process (tailor to discovered complexity):**
1. Present estimates based on complete understanding
2. Explore accuracy through questions about:
   - Specific complexities in THIS implementation
   - Risks unique to THIS technical approach
   - Buffer needs for THIS project's unknowns
3. Refine until estimates reflect reality

**Note:** Generic estimation questions miss project-specific challenges. Ask about the actual risks discovered.

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN generating questions dynamically
**Best Practices:**
- Analyze the current document state before EACH question
- Consider what information would be most valuable next
- Let the technical domain guide question style
- Build on previous answers to go deeper

**Critical Thinking Process:**
1. Review what's been discovered so far
2. Identify the biggest gap in understanding
3. Formulate a question that reveals that information
4. Ensure the question has low cognitive load
5. Make it specific to the actual context

**Rules:**
- MUST think about context before asking
- NEVER use example questions from this prompt
- ALWAYS base questions on actual gaps
- MUST let the conversation flow naturally
- NEVER follow a script or template

### WHEN starting the discovery process
**Best Practices:**
- Begin with understanding the core outcome
- Never assume - only document what's explicitly confirmed
- One question at a time to minimize cognitive load

**Rules:**
- ALWAYS wait for user confirmation before moving to next phase
- MUST update the document after every answer
- NEVER add features not explicitly mentioned

### WHEN asking clarifying questions
**Best Practices:**
- Frame questions to reveal components naturally
- Use exploratory patterns rather than direct queries
- Provide A/B options only when they reduce cognitive load

**Dynamic Question Creation:**
- Each question should be crafted for THIS specific issue
- Consider the technical domain (e.g., payment systems need different questions than chat systems)
- Let answers reveal the next natural question
- Think: "What would most advance our understanding right now?"

**Format Guide (structure only, NOT content):**
```markdown
## 🔍 [Your contextually relevant question based on current state]
    A. [Option revealing one technical path]
    B. [Option revealing another technical path]
```

**Rules:**
- ALWAYS use low cognitive load questions
- MUST reveal requirements through functionality exploration
- NEVER directly ask "what's the component?"
- ALWAYS generate fresh, contextual questions

### WHEN creating issue documents

**Most Valuable Project Management (MVPM)** is a flexible organizational system that:
- **Prioritizes work** by what delivers the most value first (MVM → MVS)
- **Enables parallel execution** through company concepts that can be worked on simultaneously
- **Scales naturally** from solo developers to enterprise teams
- **Integrates seamlessly** with existing tools (GitHub, Jira, Linear)
- **Provides context** for both humans and AI during development

The core principle: **Start with what's most valuable, structure only what enables parallel work.**

#### Core Organization Structure

Flexible structure based on parallel work:
```
{company-concept}/{most-valuable-milestone}/{most-valuable-step}.md
```
Company concepts can be inserted anywhere to enable parallel work.

##### Structure Flow Diagram

```mermaid
graph TD
    A["company-concept/"] --> B["000-backlog/"]
    A --> C["001-most-valuable-milestone/"]
    C --> D["000-backlog/"]
    C --> E["001-most-valuable-step/"]
    E --> F["000-backlog/"]
    E --> G["CONC-001-description-type.md"]
    E --> H["CONC-002-description-type.md"]
    E --> I["CONC-003-description-type.md"]
    
    style A fill:#37474f,color:#fff
    style B fill:#b71c1c,color:#fff
    style D fill:#b71c1c,color:#fff
    style F fill:#b71c1c,color:#fff
    style G fill:#1565c0,color:#fff
    style H fill:#1565c0,color:#fff
    style I fill:#1565c0,color:#fff
```

#### Naming Components

- `{company-concept}` - Any concept that can be worked on in parallel (can be inserted anywhere in hierarchy)
- `{most-valuable-milestone}` - MVM - Format: `{3-digit-number}-{description}` (e.g., 001-user-auth, 002-payment-system)
    - Chronologically ordered (earlier numbers must be considered first)
    - Zero-padded to 3 digits total
    - Each MVM folder may contain a `000-backlog` folder
- `{most-valuable-step}` - MVS - Format: `{CONCEPT}-{number}-{description}-{type}.md`
    - `{CONCEPT}` - Max 4 character identifier (e.g., ESS for essentials, AUTH for authentication)
    - `{number}` - **Flexible numbering options:**
        - **Local chronological:** 001, 002, 003 (per MVS folder)
        - **Milestone-wide:** Continue numbering across entire milestone
        - **External system ID:** Use GitHub (#123), Jira (PROJ-456), or Linear (ENG-789) issue numbers
        - **Your choice:** Create a system that works for your workflow
    - `{description}` - Kebab-case descriptive name
    - `{type}` - Document type (issue, story, plan, etc.)
    - Each MVS folder may contain a `000-backlog` folder

##### Important: Same Issue, Multiple Documents

**The same issue can and should have multiple document types with the SAME number:**

```
001-authentication/
├── AUTH-042-oauth-integration-story.md      # User story document
├── AUTH-042-oauth-integration-plan.md       # Technical plan document
├── AUTH-042-oauth-integration-bug.md        # Bug found during implementation
└── AUTH-042-oauth-integration-pr.md         # Pull request documentation
```

This approach:
- **Maintains traceability** - All documents for issue #042 are clearly linked
- **Shows evolution** - See how an issue progresses from story → plan → bug → PR
- **Enables parallel work** - Different team members can work on different document types
- **Preserves context** - All related work stays together with the same identifier

### WHEN determining requirements

Always embody The MVP (Minimum Viable Product) mindset, which critically assesses what should be considered as **must-haves** relevant to reaching our end goal.

### WHEN updating documents

#### Context Rot

Always beware of context rot which is the principle of including only value-adding, non-redundant information in documents to maintain a clean context for AI agents.

- Everything in a document must add value to the end goal
- Information must not be unnecessarily repeated
- If you explain a rule stating something must **always** happen, don't also say the opposite must **never** happen
- One clear statement is sufficient

This prevents agents from getting irrelevant information and avoids wasting tokens on redundant content.

#### Scope Integrity

Scope Integrity ensures that agents maintain absolute fidelity to the user's request without making assumptions, adding unrequested features, or applying "improvements" that weren't explicitly asked for. This prevents the common problem of AI over-engineering by enforcing disciplined adherence to the actual scope of work.

##### Core Requirements

**Deep Understanding First:** Before taking any action, agents must fully comprehend 100% of the request scope. This means analyzing what was explicitly asked for, what wasn't mentioned, and the boundaries of the work.

**Project Research:** Agents must thoroughly research existing project conventions, patterns, and examples similar to the request. This ensures implementation follows established approaches exactly as they exist in the project.

**Exact Replication:** When following existing patterns, agents must replicate them precisely. No "better" solutions, alternatives, or creative liberties unless the user explicitly requests improvements.

##### What This Prevents

- Adding features or information not explicitly requested
- Making assumptions about what the user "probably" wants
- Applying personal preferences or "best practices" not established in the project
- Over-engineering solutions beyond the stated requirements
- Reinterpreting requests to fit preconceived notions
- Including "helpful" additions that weren't asked for

##### Implementation Guidelines

1. **Parse the Request:** Identify exactly what action was requested and what deliverables are expected
2. **Define Boundaries:** Clearly understand what was NOT requested or mentioned
3. **Research Context:** Study how similar requests have been handled in this project
4. **Follow Patterns:** Use existing conventions and approaches without modification
5. **Stick to Scope:** Create only what was explicitly requested
6. **No Assumptions:** If something is unclear, ask for clarification rather than guessing

This principle ensures that users get exactly what they asked for, following the project's established way of doing things, without unwanted additions or interpretations.

### WHEN referencing project documents
- Always use wikilinks without backticks to reference other project documents: [[relevant-document-wl-example]]
- Always put only the filename inside brackets, never include the full path: [[filename-wl-example]]

### WHEN communicating with the user

- Update immediately after each answer, show the updated section to maintain transparency. If information emerges for other sections, update those too.
- NEVER move forward without user satisfaction
- MUST base new questions on the entire updated document
- ALWAYS keep focus on current section until completion

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

````````````
<template>
# [Fitting Emoji] Issue: [Descriptive Title]
> 💡 *[Descriptive subtitle]*

[Brief description of the problems we are going to solve, why we are going to solve them and how we plan to do it.]

---

## 🎯 End Goal
> 💡 *What do you want to achieve?*

[The single, clear, measurable outcome we want to achieve. Everything that follows must contribute to achieving this goal.]

---

## 📝 Initial Requirements
*What should the system/user be able to do or be?*

[Specific capabilities listed as simple English sentences starting with an actor and the verb first high level requirement]

- [Actor]
    - [Verb first high level requirement]
    - [More high level requirements if needed]
    - [...]

- [More actors if needed]

- [...]

---

## 🏗️ Components
> 💡 *What should exist and what does it do?*

[Hierarchical breakdown from initial requirement to high-level components to atomic parts and verb-first lists of what each component should be able to do or be]

- [Verb first high level requirement]
    - [Component]
        - [Sub-subcomponent]
            - [Verb capability or state]
            - [More verb capabilities or states if needed]
            - [...]
        - [More sub-subcomponents if needed]
        - [...]

- [More verb first high level requirements if needed]

- [...]

---

## 📝 Properties
> 💡 *What identifies a component? What can be configured? What can change?*

[The values and configurations that determine a components identity and possible states]

- [Component]
    - [Property]: [Description of the property]
    - [More properties if needed]
    - [...]
        - [Sub-component]
            - [Property]: [Description of the property]
            - [More properties if needed]
            - [...]

- [More components if needed]

- [...]

# 🛠️ Behaviours
> 💡 *Which states or events should the component act upon? How should it behave when nothing happens?*

[How a component should act when a state is, or an event happens]

- [Component]
    - [State or event]
        - Should [Behaviour]
        - [More behaviours if needed]
        - [...]
            - [Sub-component]
                - [State or event]
                    - Should [Behaviour]
                    - [More behaviours if needed]
                    - [...]

## 📦 Deliverables
> 💡 *Which components should be created together?*

[Components packaged together as unified testable units]

- [Deliverable]
    - [Component]
        - [Sub-subcomponent]
        - [More sub-subcomponents if needed]
        - [...]
    - [More components if needed]
    - [...]

- [More deliverables if needed]

- [...]

---

## 🚀 Checkpoints
> 💡 *Which deliverables should be released together? How do we determine their successful completion?*

[Chronological breaking points with deliverables and their acceptance criteria that can be worked on in parallel, tested, and potentially released.]

- [Checkpoint]
    - [Deliverable]
        - [Acceptance criteria]
        - [More acceptance criteria if needed]
        - [...]
    - [More deliverables if needed]
    - [...]

- [More checkpoints if needed]

- [...]

---

## ⏱️ Effort Breakdown & Estimates
> 💡 *How long will it take?*

[The ideal and most likely outcome for design, refinement, front-end, back-end and operational work, where QA is calculated as 25% of core work, testing as 15% and and contingency buffer defaults to 10% of total work, but should be increased if there is a high risk of unforeseen problems along the way.]

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
</template>
````````````

#### Operations Issues  
**Indicators**: Process, workflow, efficiency, procedures, quality, automation, systems, bottlenecks
**Execute workflow:**

# 📋 Create Operations Issue: Process and Workflow Improvement
> 💡 *Transform operational challenges into actionable improvement issues through systematic analysis and refinement.*

## 📋 Request
> 💡 *Core workflow for operations issue creation*

Transform user's operational request into a well-structured issue by:
1. **Creating minimal base** with the operational problem stated
2. **Researching context** for existing processes and bottlenecks
3. **Building iteratively** through targeted operational questions
4. **Saving to file** when user confirms completion

### Deliverables
- Initial operations issue capturing the problem
- Process analysis and current state assessment
- Iteratively refined improvement plan
- **ACTUAL FILE CREATED**: Issue saved to `issues/operations/`

### Acceptance Criteria
- [ ] Operational problem clearly defined
- [ ] Current process documented
- [ ] Improvement opportunities identified
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the problem, understand the process, build the solution incrementally.*

**Fundamental Principles:**
1. **Problem First**: Start with the operational pain point
2. **Process Understanding**: Map current state before proposing changes
3. **Incremental Improvement**: Build solutions through phases
4. **Measurable Impact**: Focus on quantifiable improvements

## 🔄 Workflow
> 💡 *Systematic approach to operations issue creation*

### Step 1: Create Minimal Base
**Template for Operations Issue:**
```markdown
# 🔧 Operations Issue: [Process/System Name]

[Brief description of operational challenge]

## 📝 Initial Requirement

### Requirements
1. [Process/workflow that needs improvement]
```

### Step 2: Interactive Refinement Questions

#### Process Flow Questions
1. **Current State**: "What's the current process step-by-step?"
2. **Pain Points**: "Where are the bottlenecks or inefficiencies?"
3. **Volume**: "How often does this process run? How many items?"
4. **Time**: "How long does each step currently take?"
5. **Resources**: "Who's involved and what tools are used?"

#### Improvement Questions
1. **Desired State**: "What would the ideal process look like?"
2. **Constraints**: "What can't be changed (budget, systems, regulations)?"
3. **Priority**: "What's the most critical improvement needed?"
4. **Timeline**: "When does this need to be implemented?"
5. **Success**: "How will we measure improvement?"

#### Implementation Questions
1. **Quick Wins**: "What can be improved immediately?"
2. **Dependencies**: "What needs to happen first?"
3. **Risks**: "What could go wrong during transition?"
4. **Training**: "Who needs to learn new processes?"
5. **Rollback**: "How do we revert if needed?"

### Step 3: File Creation
Save to: `issues/operations/[process-name]-improvement/operations-issue.md`

## 📏 Instructions
> 💡 *Rules for operations issue creation*

### WHEN starting an operations issue
- ALWAYS identify the specific process or workflow
- FOCUS on measurable inefficiencies
- DOCUMENT current state before proposing changes
- QUANTIFY impact where possible

### WHEN asking questions
- PRIORITIZE understanding current pain points
- FOCUS on practical, implementable solutions
- CONSIDER change management implications
- VALIDATE feasibility with user

### WHEN documenting improvements
- USE before/after comparisons
- INCLUDE time and cost savings estimates
- SPECIFY required resources
- PLAN phased implementation

## 📊 Output Format
> 💡 *Operations issue structure*

### Format Type
Markdown following @templates/business/operations-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Current State → Desired State mapping
2. Process flow documentation
3. Resource requirements
4. Success metrics
5. Implementation phases

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Focus on operational efficiency
- Document process improvements
- Quantify expected benefits
- Create phased implementation plan
- Save actual file to disk

### What This Prompt MUST NOT Do
- Assume technical solutions without validation
- Ignore change management needs
- Skip current state analysis
- Create overly complex solutions

#### Marketing Issues
**Indicators**: Campaign, brand, audience, content, channels, messaging, positioning, awareness
**Execute workflow:**

# 📋 Create Marketing Issue: Campaign and Initiative Planning
> 💡 *Transform marketing ideas into actionable campaign issues through strategic refinement.*

## 📋 Request
> 💡 *Core workflow for marketing issue creation*

Transform user's marketing request into a well-structured issue by:
1. **Creating minimal base** with the marketing goal
2. **Researching context** for audience and market position
3. **Building iteratively** through strategic marketing questions
4. **Saving to file** when campaign plan is complete

### Deliverables
- Initial marketing issue with objectives
- Audience and channel analysis
- Campaign flow and assets needed
- **ACTUAL FILE CREATED**: Issue saved to `issues/marketing/`

### Acceptance Criteria
- [ ] Marketing objectives clearly defined
- [ ] Target audience identified
- [ ] Campaign strategy documented
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the goal, understand the audience, build the campaign incrementally.*

**Fundamental Principles:**
1. **Goal First**: Start with the marketing objective
2. **Audience Understanding**: Know who we're reaching
3. **Channel Strategy**: Right message, right place
4. **Measurable Impact**: Track what matters

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Marketing Issue:**
```markdown
# 📣 Marketing Issue: [Campaign/Initiative Name]

[Brief description of marketing goal]

## 📝 Initial Requirement

### Marketing Objectives
1. [What marketing outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Strategy Questions
1. **Objective**: "What's the primary goal - awareness, leads, or conversion?"
2. **Audience**: "Who's the target audience specifically?"
3. **Message**: "What's the key value proposition?"
4. **Differentiation**: "What makes this unique?"
5. **Timeline**: "When does this need to launch?"

#### Campaign Questions
1. **Channels**: "Which channels - social, email, paid ads, content?"
2. **Budget**: "What's the budget range?"
3. **Content**: "What content assets are needed?"
4. **Frequency**: "How often will we communicate?"
5. **Duration**: "How long will the campaign run?"

#### Measurement Questions
1. **KPIs**: "What are the key performance indicators?"
2. **Targets**: "What specific numbers define success?"
3. **Tracking**: "How will we track results?"
4. **Testing**: "What will we A/B test?"
5. **Reporting**: "How often do we review performance?"

### Step 3: File Creation
Save to: `issues/marketing/[campaign-name]/marketing-issue.md`

## 📏 Instructions

### WHEN starting a marketing issue
- ALWAYS define clear objectives first
- IDENTIFY target audience precisely
- CONSIDER competitive landscape
- ESTABLISH measurable goals

### WHEN asking questions
- FOCUS on audience insights
- PRIORITIZE channel effectiveness
- CONSIDER budget constraints
- VALIDATE creative approach

### WHEN documenting campaigns
- MAP customer journey stages
- SPECIFY content requirements
- PLAN distribution timeline
- DEFINE success metrics

## 📊 Output Format

### Format Type
Markdown following @templates/business/marketing-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Marketing objectives
2. Target audience profile
3. Campaign flow and timeline
4. Content and asset requirements
5. Success metrics and KPIs

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear marketing objectives
- Identify specific target audience
- Create actionable campaign plan
- Establish measurable KPIs
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create vague, unmeasurable goals
- Ignore budget constraints
- Skip audience research
- Forget tracking setup

#### Sales Issues
**Indicators**: Pipeline, leads, conversions, revenue, deals, prospects, quotas, enablement
**Execute workflow:**

# 📋 Create Sales Issue: Revenue and Pipeline Development
> 💡 *Transform sales challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for sales issue creation*

Transform user's sales request into a well-structured issue by:
1. **Creating minimal base** with the sales goal
2. **Researching context** for current pipeline and performance
3. **Building iteratively** through strategic sales questions
4. **Saving to file** when sales plan is complete

### Deliverables
- Initial sales issue with objectives
- Pipeline and process analysis
- Sales enablement needs identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/sales/`

### Acceptance Criteria
- [ ] Sales objectives clearly defined
- [ ] Pipeline stages documented
- [ ] Improvement opportunities identified
- [ ] Revenue targets established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the revenue goal, understand the pipeline, build the solution incrementally.*

**Fundamental Principles:**
1. **Revenue First**: Start with the financial objective
2. **Pipeline Understanding**: Know where deals get stuck
3. **Process Optimization**: Remove friction points
4. **Measurable Growth**: Track what drives revenue

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Sales Issue:**
```markdown
# 💰 Sales Issue: [Sales Initiative/Problem]

[Brief description of sales goal or challenge]

## 📝 Initial Requirement

### Sales Objectives
1. [What sales outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Revenue Questions
1. **Target**: "What's the revenue target?"
2. **Timeline**: "By when do we need to hit this?"
3. **Current State**: "What's current performance?"
4. **Gap**: "What's blocking us from the target?"
5. **Resources**: "What budget/headcount is available?"

#### Pipeline Questions
1. **Stages**: "What are the current pipeline stages?"
2. **Conversion**: "Where do we lose most deals?"
3. **Velocity**: "How long is the sales cycle?"
4. **Volume**: "How many leads enter the pipeline?"
5. **Quality**: "What's the lead quality like?"

#### Enablement Questions
1. **Tools**: "What sales tools are needed?"
2. **Training**: "What skills gaps exist?"
3. **Content**: "What collateral is missing?"
4. **Process**: "What processes need improvement?"
5. **Competition**: "How do we lose to competitors?"

### Step 3: File Creation
Save to: `issues/sales/[initiative-name]/sales-issue.md`

## 📏 Instructions

### WHEN starting a sales issue
- ALWAYS quantify revenue impact
- IDENTIFY pipeline bottlenecks
- CONSIDER sales team capacity
- ESTABLISH clear targets

### WHEN asking questions
- FOCUS on conversion rates
- PRIORITIZE deal velocity
- CONSIDER competitive positioning
- VALIDATE with data

### WHEN documenting improvements
- MAP sales process stages
- SPECIFY enablement needs
- PLAN territory/account strategy
- DEFINE commission structure

## 📊 Output Format

### Format Type
Markdown following @templates/business/sales-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Sales objectives and targets
2. Pipeline analysis
3. Sales process improvements
4. Enablement requirements
5. Revenue metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear revenue targets
- Identify pipeline improvements
- Create actionable sales plan
- Establish tracking metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create unrealistic targets
- Ignore sales capacity
- Skip competitive analysis
- Forget enablement needs

#### Finance Issues
**Indicators**: Budget, costs, cash flow, expenses, revenue, profitability, forecasting, investment
**Execute workflow:**

# 📋 Create Finance Issue: Financial Planning and Optimization
> 💡 *Transform financial challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for finance issue creation*

Transform user's financial request into a well-structured issue by:
1. **Creating minimal base** with the financial goal
2. **Researching context** for current financial position
3. **Building iteratively** through strategic finance questions
4. **Saving to file** when financial plan is complete

### Deliverables
- Initial finance issue with objectives
- Financial analysis and cash flow assessment
- Cost optimization opportunities identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/finance/`

### Acceptance Criteria
- [ ] Financial objectives clearly defined
- [ ] Current position documented
- [ ] Improvement opportunities identified
- [ ] Financial targets established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the financial goal, understand the numbers, build the solution incrementally.*

**Fundamental Principles:**
1. **Numbers First**: Start with current financial position
2. **Cash Flow Focus**: Understand money movement
3. **Cost Optimization**: Find efficiency opportunities
4. **Measurable Impact**: Track financial improvements

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Finance Issue:**
```markdown
# 💵 Finance Issue: [Financial Initiative/Problem]

[Brief description of financial goal or challenge]

## 📝 Initial Requirement

### Financial Objectives
1. [What financial outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Financial Position Questions
1. **Current State**: "What's the current cash position?"
2. **Burn Rate**: "What's the monthly burn?"
3. **Revenue**: "What's current MRR/ARR?"
4. **Runway**: "How many months of runway?"
5. **Profitability**: "Are we profitable? If not, when?"

#### Cost Questions
1. **Fixed Costs**: "What are monthly fixed costs?"
2. **Variable Costs**: "What varies with volume?"
3. **Biggest Expenses**: "Top 3 cost categories?"
4. **Optimization**: "Where can we cut costs?"
5. **ROI**: "What spending has best ROI?"

#### Planning Questions
1. **Budget**: "What's the budget target?"
2. **Forecast**: "What's the revenue forecast?"
3. **Investment**: "What investments are needed?"
4. **Funding**: "Any funding requirements?"
5. **Metrics**: "What KPIs to track?"

### Step 3: File Creation
Save to: `issues/finance/[initiative-name]/finance-issue.md`

## 📏 Instructions

### WHEN starting a finance issue
- ALWAYS start with current numbers
- IDENTIFY cash flow patterns
- CONSIDER seasonal variations
- ESTABLISH clear targets

### WHEN asking questions
- FOCUS on cash impact
- PRIORITIZE profitability path
- CONSIDER funding needs
- VALIDATE with data

### WHEN documenting improvements
- MAP money flows
- SPECIFY cost savings
- PLAN investment priorities
- DEFINE financial controls

## 📊 Output Format

### Format Type
Markdown following @templates/business/finance-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Financial objectives
2. Current position analysis
3. Money flow documentation
4. Cost optimization plan
5. Financial metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear financial targets
- Document current position
- Identify savings opportunities
- Create tracking metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create unrealistic projections
- Ignore cash flow constraints
- Skip risk assessment
- Forget compliance needs

#### People Issues
**Indicators**: Hiring, team, skills, training, culture, performance, onboarding, retention
**Execute workflow:**

# 📋 Create People Issue: Team and Talent Development
> 💡 *Transform people challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for people issue creation*

Transform user's people request into a well-structured issue by:
1. **Creating minimal base** with the people goal
2. **Researching context** for current team situation
3. **Building iteratively** through strategic people questions
4. **Saving to file** when people plan is complete

### Deliverables
- Initial people issue with objectives
- Team analysis and capability assessment
- Development opportunities identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/people/`

### Acceptance Criteria
- [ ] People objectives clearly defined
- [ ] Current team state documented
- [ ] Growth opportunities identified
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the team need, understand the gaps, build the solution incrementally.*

**Fundamental Principles:**
1. **People First**: Start with human needs
2. **Capability Understanding**: Know current skills
3. **Growth Focus**: Develop talent continuously
4. **Cultural Impact**: Consider team dynamics

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for People Issue:**
```markdown
# 👥 People Issue: [Team/People Initiative]

[Brief description of people goal or challenge]

## 📝 Initial Requirement

### People Objectives
1. [What people outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Team Questions
1. **Current Size**: "How many people on the team?"
2. **Gaps**: "What roles or skills are missing?"
3. **Performance**: "How is the team performing?"
4. **Culture**: "What's the team dynamic like?"
5. **Retention**: "Any turnover concerns?"

#### Hiring Questions
1. **Needs**: "What positions need filling?"
2. **Timeline**: "When do they need to start?"
3. **Budget**: "What's the salary range?"
4. **Source**: "Where will we find candidates?"
5. **Process**: "What's the interview process?"

#### Development Questions
1. **Skills**: "What skills need development?"
2. **Training**: "What training is needed?"
3. **Career**: "What growth paths exist?"
4. **Mentoring**: "Any mentorship needs?"
5. **Performance**: "How do we measure improvement?"

### Step 3: File Creation
Save to: `issues/people/[initiative-name]/people-issue.md`

## 📏 Instructions

### WHEN starting a people issue
- ALWAYS consider team impact
- IDENTIFY skill gaps clearly
- CONSIDER culture fit
- ESTABLISH growth paths

### WHEN asking questions
- FOCUS on team needs
- PRIORITIZE critical roles
- CONSIDER development opportunities
- VALIDATE cultural alignment

### WHEN documenting improvements
- MAP organizational structure
- SPECIFY role requirements
- PLAN onboarding process
- DEFINE success measures

## 📊 Output Format

### Format Type
Markdown following @templates/business/people-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. People objectives
2. Team analysis
3. Hiring/development plan
4. Cultural considerations
5. Success metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear people goals
- Document team needs
- Create actionable hiring/development plan
- Establish team metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Ignore cultural impact
- Skip skill assessment
- Forget onboarding needs
- Overlook retention factors

### Step 2: Confirm Issue Type
If the domain is unclear:
1. Look for secondary indicators in the request
2. Consider the business context and goals
3. Ask the user to clarify if truly ambiguous
4. Default to the most likely type based on context

### Step 3: Execute Specialized Workflow
Once the issue type is determined:
1. Follow the complete workflow from the specialized prompt
2. Use the domain-specific questions for that issue type
3. Apply the appropriate template structure
4. Save to the correct directory path

## 📏 Decision Rules

### WHEN request mentions technical implementation
- Keywords: develop, code, fix, integrate, deploy
- **Route to**: @prompts/create-tech-issue.md

### WHEN request mentions business processes
- Keywords: improve, optimize, streamline, standardize
- **Route to**: @prompts/create-operations-issue.md

### WHEN request mentions customer engagement
- Keywords: promote, advertise, communicate, brand
- **Route to**: @prompts/create-marketing-issue.md

### WHEN request mentions revenue generation
- Keywords: sell, close, convert, prospect
- **Route to**: @prompts/create-sales-issue.md

### WHEN request mentions financial management
- Keywords: budget, spend, save, invest
- **Route to**: @prompts/create-finance-issue.md

### WHEN request mentions team management
- Keywords: hire, train, develop, retain
- **Route to**: @prompts/create-people-issue.md

## 🎯 Workflow Execution

### After Routing Decision
1. **Announce the issue type**: "Creating a [type] issue for your request..."
2. **Execute the specialized prompt**: Follow the complete workflow
3. **Apply domain expertise**: Use the specific questions and structure
4. **Maintain consistency**: Follow the exact template for that type

### File Locations
Files are saved following @instructions/conventions/mvpm-issue-conventions.md
- Location determined by project structure (MVMs and MVSs)
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Same format for ALL issue types (tech, operations, marketing, sales, finance, people)
- Files organized within milestone and step hierarchy as defined by project

## ✅ Success Criteria
- Correct issue type identified from request
- Appropriate specialized workflow executed
- Domain-specific questions asked
- Correct template structure applied
- File saved to appropriate location
