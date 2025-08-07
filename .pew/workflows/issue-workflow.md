# 🌊 Issue Workflow: From Vision to Scoped Implementation
> 💡 *A systematic methodology for breaking down high-level requirements into precisely scoped, developer-ready work items through progressive refinement and visual modeling.*

This workflow transforms abstract requirements into concrete, small-scoped work items that a single developer can complete in half a day or less. Through systematic decomposition, event modeling, data flow analysis, and component identification, it ensures requirements are actionable, testable, and properly sized.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
To prevent scope creep and ensure developer success by systematically decomposing requirements into atomic, clearly-defined work items that maintain traceability from high-level vision to implementation details while respecting the cognitive limits of single-developer tasks.

### Guiding Principles
1. **Atomic Scope**: Every requirement must be completable by one developer in half a day (max 3 story points)
2. **Actor-Centric Thinking**: All requirements start with "who does what" - system or user as actor
3. **Progressive Visualization**: Abstract concepts become concrete through diagrams at each level
4. **Fail Fast on Scope**: Check and decompose early rather than discovering complexity late
5. **Data-Driven Design**: Understanding data flow prevents architectural surprises
6. **Component Clarity**: Know exactly what needs to be built before starting

### Success Criteria
- Requirements are unambiguous and testable
- Each work item is ≤3 story points
- Event flows are complete and sequential
- Data flows follow project conventions
- Components are identified and scoped
- Developer can start work without clarification

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Initial Requirement**: Actor-based capability statement (user/system can do/be X)
- **Event Flow**: Sequential list of actor-verb-subject interactions
- **Scope Gate**: Mandatory decomposition checkpoint at 3 story points
- **Data Flow**: Transformation and movement of data through the system
- **Component Map**: UI/Frontend/Backend elements needed for implementation

### Workflow Patterns
- **Recursive Decomposition**: Break down until scope fits
- **Visual Progression**: Text → Events → Data → Components
- **Scope Validation**: Check at each phase, decompose if needed
- **Convention Adherence**: Apply project patterns throughout

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow implements a 5-phase decomposition methodology that progressively refines requirements from high-level capabilities to implementation-ready specifications. The critical innovation is the scope gate that triggers recursive decomposition whenever complexity exceeds the half-day threshold.

### Phase Architecture
```
Phase 1: Initial Requirement Definition
├── Step 1.1: Actor Identification
├── Step 1.2: Capability Statement
├── Step 1.3: Pre-emptive Decomposition
└── Output: List of actor-capability statements

Phase 2: Event Flow Diagramming
├── Step 2.1: Event Sequence Mapping
├── Step 2.2: Actor-Verb-Subject Formation
├── Step 2.3: Flow Validation
└── Output: Event flow diagram

Phase 3: Scope Gate & Decomposition
├── Decision Point: Complexity Assessment
├── Branch A: Proceed (≤3 points)
│   └── Continue to Phase 4
├── Branch B: Decompose (>3 points)
│   ├── Step 3.1: Identify Split Points
│   ├── Step 3.2: Create Sub-requirements
│   └── Loop: Return to Phase 1 for each
└── Quality Gate: All requirements ≤3 points

Phase 4: Data Flow Analysis
├── Step 4.1: Data Source Identification
├── Step 4.2: Transformation Mapping
├── Step 4.3: Destination Specification
├── Step 4.4: Convention Application
├── Checkpoint: Scope Revalidation
└── Output: Data flow diagram

Phase 5: Component Identification
├── Step 5.1: UI Component Mapping
├── Step 5.2: Frontend Logic Identification
├── Step 5.3: Backend Service Definition
├── Step 5.4: Integration Points
└── Output: Component diagram

Phase 6: Component Breakdown & Approach
├── Step 6.1: Behavior Documentation
├── Step 6.2: Critical Path Identification
├── Step 6.3: Suggested Approach Development
└── Output: Component breakdown and implementation approach

Phase 7: Refinement Offering
├── Step 7.1: Identify Gaps
├── Step 7.2: Offer Refinement Options
├── Step 7.3: Execute Selected Refinement
└── Output: Refined issue or continuation
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Initial Requirement Definition
> *Transform user needs into clear, actor-based capability statements*

#### Prerequisites
- Understanding of the feature or problem to solve
- Knowledge of system actors (users, systems, services)
- Awareness of project scope constraints

#### Step 1.1: Actor Identification
- **Purpose**: Determine who or what performs actions
- **Instructions**: List all actors involved (human users, system processes, external services)
- **Agent**: Requirements analyst or product owner
- **Inputs**: Feature request, user story, or problem statement
- **Outputs**: List of identified actors with roles
- **Success Criteria**: Every actor has a clear identity and purpose
- **Error Handling**:
  - **Likely Failures**: Missing indirect actors (e.g., scheduler, cache)
  - **Recovery Strategy**: Review system architecture for hidden actors
  - **Escalation Path**: Consult with system architect

#### Step 1.2: Capability Statement
- **Purpose**: Define what each actor should be able to do or be
- **Instructions**: Write simple English sentences: "[Actor] should be able to [action]" or "[Actor] should be [state]"
- **Examples**: 
  - "User should be able to login"
  - "System updates every document each day at 10"
  - "Admin should be able to view all user sessions"
- **Outputs**: List of capability statements
- **Success Criteria**: Each statement is atomic and testable
- **Error Handling**:
  - **Likely Failures**: Compound requirements hiding complexity
  - **Recovery Strategy**: Split compound statements into individual capabilities
  - **Escalation Path**: Break down further in Step 1.3

#### Step 1.3: Pre-emptive Decomposition
- **Purpose**: Proactively split obviously large requirements
- **Instructions**: If a capability clearly involves multiple workflows, split immediately
- **Examples**:
  - "User login" splits to: "User sees login screen", "User logs in with email", "User logs in with Google", "User logs in with Apple"
- **Outputs**: Decomposed requirement list
- **Success Criteria**: No obviously compound requirements remain
- **Timing**: Immediate, before proceeding to Phase 2

#### Quality Gate: Initial Requirements Complete
- **Validation Criteria**:
  - [ ] All actors identified and documented
  - [ ] Each requirement has actor + capability
  - [ ] No compound requirements remain
  - [ ] Statements are in simple English
- **Pass Actions**: Proceed to Phase 2
- **Fail Actions**: Refine requirements further

### Phase 2: Event Flow Diagramming
> *Map the sequence of interactions that fulfill each requirement*

#### Prerequisites
- Completed initial requirements from Phase 1
- Understanding of system interactions
- Knowledge of user journeys

#### Step 2.1: Event Sequence Mapping
- **Purpose**: Define the step-by-step flow of events
- **Instructions**: For each requirement, list what happens in sequence
- **Format**: Actor → Verb → Subject
- **Examples**:
  ```
  1. User → clicks → login button
  2. System → displays → login form
  3. User → enters → credentials
  4. System → validates → credentials
  5. System → creates → session
  6. System → redirects → to dashboard
  ```
- **Outputs**: Sequential event list
- **Success Criteria**: Complete path from start to finish
- **Error Handling**:
  - **Likely Failures**: Missing error paths
  - **Recovery Strategy**: Add error handling events
  - **Escalation Path**: Define separate error flow requirements

#### Step 2.2: Actor-Verb-Subject Formation
- **Purpose**: Ensure each event is properly structured
- **Instructions**: Validate every event has actor, verb, and subject
- **Outputs**: Properly formatted event list
- **Success Criteria**: No passive voice, clear ownership

#### Step 2.3: Flow Validation
- **Purpose**: Ensure the flow achieves the requirement
- **Instructions**: Trace through the flow to verify requirement satisfaction
- **Outputs**: Validated event flow diagram
- **Success Criteria**: Following the flow achieves the stated capability

### Phase 3: Scope Gate & Decomposition
> *Critical checkpoint to ensure requirement fits within scope constraints*

#### Decision Point: Complexity Assessment
- **Decision Criteria Matrix**:
  ```
  | Event Count | Actors | Data Entities | Integrations | Points | Action    |
  |:----------- |:------ |:------------- |:------------ |:------ |:--------- |
  | ≤5          | 1      | 1-2           | 0            | 1      | Proceed   |
  | 6-10        | 1-2    | 2-3           | 0-1          | 2      | Proceed   |
  | 11-15       | 2-3    | 3-4           | 1            | 3      | Proceed   |
  | >15         | Any    | Any           | Any          | >3     | Decompose |
  | Any         | >3     | >4            | >1           | >3     | Decompose |
  ```
- **Evaluation Logic**: Count events, actors, data touchpoints
- **Default Path**: When in doubt, decompose

#### Branch A: Proceed (≤3 points)
- **Action**: Continue to Phase 4
- **Documentation**: Mark requirement as properly scoped

#### Branch B: Decompose (>3 points)
##### Step 3.1: Identify Split Points
- **Purpose**: Find natural boundaries for decomposition
- **Instructions**: Look for:
  - Authentication vs. core functionality
  - Different user paths (e.g., OAuth vs. email login)
  - Separate workflows (create vs. edit vs. delete)
  - Infrastructure vs. feature work
- **Outputs**: List of decomposition boundaries

##### Step 3.2: Create Sub-requirements
- **Purpose**: Generate new, smaller requirements
- **Instructions**: Each sub-requirement gets its own:
  - Initial requirement statement
  - Event flow
  - Scope assessment
- **Outputs**: Multiple sub-requirements
- **Loop**: Return each to Phase 1

#### Quality Gate: Scope Validation
- **Validation Criteria**:
  - [ ] All requirements assessed for complexity
  - [ ] No requirement exceeds 3 story points
  - [ ] Decomposed requirements maintain coherence
  - [ ] Dependencies documented
- **Pass Actions**: Proceed to Phase 4
- **Fail Actions**: Further decomposition required

### Phase 4: Data Flow Analysis
> *Map how data moves and transforms through the system*

#### Prerequisites
- Scoped requirements (≤3 points)
- Completed event flows
- Understanding of data models

#### Step 4.1: Data Source Identification
- **Purpose**: Identify where data originates
- **Instructions**: For each event, identify data sources:
  - User input
  - Database queries
  - External APIs
  - Cache/Session
  - System generation
- **Outputs**: Data source map
- **Success Criteria**: All data origins identified

#### Step 4.2: Transformation Mapping
- **Purpose**: Document how data changes
- **Instructions**: Track data mutations:
  - Validation
  - Formatting
  - Calculation
  - Aggregation
  - Filtering
- **Outputs**: Transformation list
- **Success Criteria**: All mutations documented

#### Step 4.3: Destination Specification
- **Purpose**: Define where data goes
- **Instructions**: Identify data endpoints:
  - Database writes
  - API responses
  - UI updates
  - Cache updates
  - Event emissions
- **Outputs**: Destination map
- **Success Criteria**: All data endpoints identified

#### Step 4.4: Convention Application
- **Purpose**: Apply project data patterns
- **Instructions**: Ensure data flow follows:
  - Naming conventions
  - Validation patterns
  - Error handling standards
  - Security requirements
- **Outputs**: Convention-compliant data flow
- **Success Criteria**: Meets all project standards

#### Checkpoint: Scope Revalidation
- **Purpose**: Ensure data complexity doesn't exceed scope
- **Trigger**: If data flow reveals hidden complexity
- **Action**: Return to Phase 3 if needed

### Phase 5: Component Identification
> *Define all technical components needed for implementation*

#### Prerequisites
- Completed data flow analysis
- Understanding of system architecture
- Knowledge of existing components

#### Step 5.1: UI Component Mapping
- **Purpose**: Identify user interface elements
- **Instructions**: List all UI components:
  - Screens/Pages
  - Forms
  - Buttons
  - Displays
  - Modals/Dialogs
- **Outputs**: UI component list
- **Success Criteria**: Complete UI coverage

#### Step 5.2: Frontend Logic Identification
- **Purpose**: Define client-side logic needs
- **Instructions**: Identify:
  - State management
  - Validation logic
  - Event handlers
  - Data formatting
  - API calls
- **Outputs**: Frontend logic requirements
- **Success Criteria**: All client logic captured

#### Step 5.3: Backend Service Definition
- **Purpose**: Specify server-side components
- **Instructions**: Define:
  - API endpoints
  - Business logic services
  - Data access layers
  - Integration services
  - Background jobs
- **Outputs**: Backend service map
- **Success Criteria**: Complete backend coverage

#### Step 5.4: Integration Points
- **Purpose**: Identify component connections
- **Instructions**: Map:
  - API contracts
  - Event buses
  - Database schemas
  - External services
  - Authentication/Authorization
- **Outputs**: Integration map
- **Success Criteria**: All connections documented

#### Quality Gate: Implementation Readiness
- **Validation Criteria**:
  - [ ] All components identified
  - [ ] No missing technical pieces
  - [ ] Dependencies clear
  - [ ] Scope still ≤3 points
- **Pass Actions**: Requirement ready for development
- **Fail Actions**: Revisit scope or clarify components

### Phase 6: Component Breakdown & Approach
> *Document behaviors and implementation approach based on explicit requirements*

#### Step 6.1: Behavior Documentation
- **Purpose**: Define how component operates
- **Instructions**: Document only behaviors user specified
- **Warning**: Never invent or assume behaviors
- **Outputs**: Behavior specifications
- **Success Criteria**: Accurate reflection of requirements

#### Step 6.2: Critical Path Identification
- **Purpose**: Define what must work and what could fail
- **Instructions**: Identify critical operations and failure points
- **Outputs**: Critical path analysis
- **Success Criteria**: Test considerations clear

#### Step 6.3: Suggested Approach Development
- **Purpose**: Outline implementation approach
- **Instructions**: Based on project conventions and patterns
- **Outputs**: High-level implementation guide
- **Success Criteria**: Clear path forward

### Phase 7: Refinement Offering
> *Ensure issue completeness through structured refinement*

#### Step 7.1: Identify Gaps
- **Purpose**: Find missing details or unclear requirements
- **Instructions**: Review issue for completeness
- **Outputs**: List of potential refinements

#### Step 7.2: Offer Refinement Options
- **Purpose**: Give user choice in refinement approach
- **Instructions**: Present three options:
  1. **Quick refinement** - Ask important questions one at a time in chat
  2. **Structured refinement** - Create questions document using:
     
     ![[question-mode]]
     
  3. **Continue as-is** - Issue appears complete
- **Outputs**: User selection

#### Step 7.3: Execute Selected Refinement
- **Purpose**: Gather missing information
- **Instructions**: Based on user choice:
  - Quick: Ask focused yes/no questions sequentially
  - Structured: Generate comprehensive questions document
  - Continue: Proceed to next task
- **Outputs**: Refined issue or continuation

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:---------- |:-------- |:---------------- |:----------------- |
| Scope Creep | Critical | Event count >15 | Immediate decomposition |
| Missing Actors | High | Flow gaps | Actor discovery session |
| Data Complexity | High | Multiple transforms | Simplify or split requirement |
| Unclear Requirements | Medium | Ambiguous statements | Clarification with stakeholder |
| Missing Edge Cases | Medium | Flow review | Add error event flows |
| Convention Violations | Low | Pattern check | Apply project standards |

### Circuit Breaker Patterns
- **Complexity Explosion**: Stop if decomposition creates >5 sub-requirements
- **Circular Dependencies**: Halt if requirements depend on each other
- **Data Overload**: Pause if >10 data entities involved
- **Integration Hell**: Stop if >3 external systems required

### Rollback Procedures
1. **Scope Rollback**: Return to previous decomposition level
2. **Flow Rollback**: Revert to simpler event sequence
3. **Data Rollback**: Simplify data flow to essentials

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Decomposition Rate**: How often requirements need splitting
- **Average Story Points**: Target ≤2 points per requirement
- **Rework Frequency**: How often requirements change during development
- **Clarity Score**: Developer questions per requirement
- **Completion Time**: Actual vs. estimated (should be ≤4 hours)

### Optimization Opportunities
- **Pattern Library**: Build reusable requirement patterns
- **Decomposition Templates**: Standard splits for common features
- **Component Catalog**: Reusable component definitions
- **Data Flow Patterns**: Common data transformation templates

### Learning Loops
- **Retrospective Analysis**: Review actual vs. estimated complexity
- **Pattern Recognition**: Identify commonly oversized requirements
- **Template Evolution**: Update based on successful decompositions

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Initial feature request or user need
- [ ] Understanding of system actors
- [ ] Access to project conventions
- [ ] Knowledge of 3-point threshold

### Resource Requirements
- **Tools**: Diagramming tool for flows
- **Time**: 30-60 minutes per requirement
- **Skills**: Requirements analysis, system thinking
- **Knowledge**: Project architecture and conventions

### Execution Checklist
1. [ ] Gather initial requirement
2. [ ] Identify all actors
3. [ ] Write capability statements
4. [ ] Check for obvious decomposition needs
5. [ ] Create event flow diagram
6. [ ] Perform scope assessment
7. [ ] Decompose if >3 points
8. [ ] Map data flow
9. [ ] Check scope again
10. [ ] Identify all components
11. [ ] Validate implementation readiness
12. [ ] Document dependencies

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| Can't break down further | Atomic requirement reached | Accept as-is if ≤3 points |
| Too many sub-requirements | Over-decomposition | Group related items |
| Unclear event flow | Missing actor perspective | Add actor context |
| Complex data flow | Too many transformations | Simplify or split |
| Missing components | Incomplete analysis | Review each event |
| Scope keeps growing | Discovering hidden complexity | Strict decomposition |

## 📤 Output Format
> 💡 *The structured template for documenting decomposed issues through all workflow phases.*

### Issue Creation Conventions

![[issue-creation-conventions]]

### Template
Use the following template to document issues as they progress through this workflow:

![[issue-template]]

### Usage Notes
- Fill out each phase section as you complete it in the workflow
- Use the scope assessment checkpoint to decide on decomposition
- Include all diagrams to provide visual clarity
- Complete Component Breakdown based only on explicit user requirements
- Develop Suggested Approach based on project conventions
- Mark checklist items as issues are validated
- The template ensures consistency across all decomposed issues
