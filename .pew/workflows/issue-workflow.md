# 🌊 Issue Workflow: Systematic Feature Development Through Progressive Refinement
> 💡 *A sophisticated orchestration that transforms ambiguous feature requests into executable implementation plans through a disciplined 6-phase refinement process, ensuring comprehensive coverage and actionable deliverables.*

This workflow embodies the intellectual framework for feature development, transforming nebulous ideas into concrete, implementable plans. It orchestrates specialized agents through a systematic methodology that progressively refines abstract concepts into detailed technical specifications, ensuring nothing is overlooked and everything is actionable.

## 🎨 Workflow Flexibility
> 💡 *This workflow adapts to your needs - use it your way*

### Execution Modes
1. **Full Sequential**: Execute all 6 phases in order for comprehensive planning
2. **Partial Sequential**: Start at any phase with existing prerequisites
3. **Single Phase**: Execute just the phase you need
4. **Update Mode**: Refine existing documents at any phase
5. **Mixed Mode**: Combine phases based on your specific needs

### Common Usage Patterns
- **Greenfield Project**: Start at Phase 1, proceed through all phases
- **Existing Requirements**: Skip to Phase 3 (Refinement) or Phase 4 (Roadmap)
- **Backlog Organization**: Jump directly to Phase 5 (Roadmap Planning)
- **Technical Planning**: Start at Phase 6 with existing user stories
- **Iterative Refinement**: Use update prompts at any phase to enhance existing work

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
This workflow exists to bridge the chasm between human intent and machine implementation. It transforms the "what if" into "here's how," ensuring that every feature request—no matter how vague or ambitious—becomes a well-defined, testable, and implementable reality. The workflow creates a shared understanding between stakeholders, designers, and developers through progressive refinement and systematic documentation.

### Guiding Principles
1. **Progressive Refinement**: Each phase adds specificity without losing sight of the original vision
2. **Systematic Coverage**: Use structured thinking to ensure no aspect is overlooked
3. **Testable Outcomes**: Every requirement must be verifiable and measurable
4. **Standalone Phases**: Each phase can operate independently while building on previous work
5. **Value-Driven Milestones**: Group work to deliver observable user benefits incrementally
6. **Collaborative Intelligence**: Leverage specialized agents for domain expertise
7. **Traceability**: Maintain clear links from initial request to final implementation

### Success Criteria
- Initial request fully captured with context and research
- All actors, components, and dependencies identified
- Requirements expanded into detailed activity flows
- System architecture defined with clear component relationships
- Work organized into releasable milestones with effort estimates
- User stories created with clear acceptance criteria
- Implementation plans detailed to the file and function level
- Each phase output independently valuable and actionable

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Discovery Document**: Structured capture of initial context and requirements
- **Activity Flow**: Step-by-step journey through system interactions
- **Deliverable**: Discrete unit of work that creates value
- **Refinement**: Systematic decomposition into properties and behaviours
- **Milestone**: Independently releasable collection of deliverables
- **User Story**: Atomic work unit sized for sprint execution
- **Implementation Plan**: Detailed technical roadmap for story execution

### Workflow Patterns
- **Iterative Deepening**: Each phase adds layers of detail
- **Parallel Discovery**: Multiple aspects explored simultaneously
- **Quality Gates**: Validation before phase transitions
- **Graceful Degradation**: Phases work with partial inputs
- **Feedback Loops**: Discoveries in later phases inform earlier ones

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow implements a 6-phase progressive refinement methodology that transforms vague feature requests into detailed implementation plans. Each phase has a specific focus, specialized agent, and defined deliverable. 

**Flexibility Note**: This workflow is designed for maximum flexibility:
- Execute all phases sequentially for comprehensive planning
- Jump directly to any phase if you have prerequisites from elsewhere
- Skip phases that aren't relevant to your use case
- Use update prompts to refine existing documents at any phase
- Mix and match phases based on your specific needs

Each phase is self-contained and can work with partial inputs, making this workflow adaptable to various development scenarios.

### Phase Architecture
```
Phase 1: Discovery & Context Gathering
├── Step 1.1: Initial Request Analysis
├── Step 1.2: Actor & Component Identification
├── Step 1.3: High-Level Requirements Definition
├── Step 1.4: Dependency & Gap Analysis
└── Quality Gate: Discovery Completeness Check

Phase 2: Requirements Elaboration
├── Step 2.1: Activity Flow Design
├── Step 2.2: Flow Validation
├── Step 2.3: Deliverable Identification
├── Step 2.4: Deliverable Decomposition
└── Quality Gate: Requirements Coverage Check

Phase 3: Refinement & Architecture
├── Parallel Block A: Component Refinement
│   ├── Step 3.1a: Property Definition
│   └── Step 3.2a: Behaviour Specification
├── Parallel Block B: Architecture Design
│   ├── Step 3.1b: System Architecture
│   └── Step 3.2b: Component Relationships
└── Synchronization Point: Architecture Validation

Phase 4: Story Creation & Detailing
├── Step 4.1: Story Breakdown Analysis
├── Decision Point: Story Granularity
├── Branch A: Standard Stories (≤3 points)
│   └── Step 4.2a: Direct Story Creation
├── Branch B: Story Decomposition (>3 points)
│   └── Step 4.2b: Break Down & Create Multiple
├── Step 4.3: Acceptance Criteria Definition
├── Step 4.4: Story Documentation
└── Quality Gate: Story Completeness Check

Phase 5: Milestone & Roadmap Planning
├── Step 5.1: Story Grouping into Milestones
├── Step 5.2: Milestone Definition
├── Step 5.3: Effort Estimation
├── Step 5.4: Release Sequencing
└── Quality Gate: Roadmap Validation

Phase 6: Implementation Planning
├── Step 6.1: Story Technical Analysis
├── Parallel Block: Plan Generation
│   ├── Step 6.2a: Technical Acceptance Criteria
│   ├── Step 6.2b: CRUD Operations
│   └── Step 6.2c: Action Planning
├── Step 6.3: Plan Integration
└── Quality Gate: Implementation Readiness
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Discovery & Context Gathering
> *Foundation phase that captures the complete context and scope of the feature request*

#### Prerequisites
- User has provided initial feature request or problem statement
- Access to project documentation and codebase for context
- Understanding of domain and business constraints

**Note**: This is the starting phase, but you can skip it if you already have:
- Clear understanding of actors and components
- Defined requirements and dependencies
- Existing discovery documentation from another source

#### Step 1.1: Initial Request Analysis
- **Purpose**: Capture and enrich the raw feature request with context
- **Instructions**: Execute [[create-discovery]] or [[update-discovery]] prompt to gather initial context
- **Agent**: [[discovery-agent]] - Expert in extracting implicit requirements
- **Inputs**: 
  - Raw user request
  - Any provided research or best practices
  - Domain knowledge and constraints
- **Outputs**: Filled [[initial-request-block]] with enriched context
- **Success Criteria**: 
  - Request captured verbatim
  - Context and research added
  - Problem/opportunity clearly stated
- **Error Handling**:
  - **Likely Failures**: Vague or conflicting requirements
  - **Recovery Strategy**: Request clarification through targeted questions
  - **Escalation Path**: Mark as unclear and document specific questions needed

#### Step 1.2: Actor & Component Identification
- **Purpose**: Systematically identify all entities in the system
- **Instructions**: Apply discovery questions to extract actors and components
- **Agent**: [[discovery-agent]] - Uses systematic questioning approach
- **Inputs**: Enriched request from Step 1.1
- **Outputs**: Filled [[actors-components-block]] with hierarchical organization
- **Success Criteria**: 
  - All human and system actors identified
  - Components organized by type and hierarchy
  - No major entities missing
- **Error Handling**:
  - **Likely Failures**: Missing indirect actors or infrastructure
  - **Recovery Strategy**: Use "who benefits/maintains/uses" questions
  - **Escalation Path**: Document unknowns and proceed with available information

#### Step 1.3: High-Level Requirements Definition
- **Purpose**: Define what each actor/component can do and maintain
- **Instructions**: For each entity, define abilities and states
- **Agent**: [[discovery-agent]] - Ensures testable requirement definition
- **Inputs**: Actor/component list from Step 1.2
- **Outputs**: Filled [[high-level-requirements-block]]
- **Success Criteria**: 
  - Each actor has defined abilities
  - Each component has defined states
  - Requirements are testable
- **Error Handling**:
  - **Likely Failures**: Too detailed or too vague requirements
  - **Recovery Strategy**: Apply "what not how" principle
  - **Escalation Path**: Refocus on testable outcomes

#### Step 1.4: Dependency & Gap Analysis
- **Purpose**: Identify everything needed for implementation
- **Instructions**: Categorize dependencies as need/have/missing/unknown
- **Agent**: [[discovery-agent]] - Expert in uncovering hidden dependencies
- **Inputs**: Requirements and component list
- **Outputs**: Filled [[dependencies-block]] with categorized items
- **Success Criteria**: 
  - All external dependencies identified
  - Gaps clearly documented
  - Unknowns flagged for research
- **Error Handling**:
  - **Likely Failures**: Unknown technical feasibility
  - **Recovery Strategy**: Mark as "unknown" with research tasks
  - **Escalation Path**: Create research tasks to explore unknowns

#### Quality Gate: Discovery Completeness Check
- **Validation Criteria**:
  - [ ] All sections of [[discovery-template]] completed
  - [ ] No placeholder content remaining
  - [ ] Requirements traceable to initial request
  - [ ] All actors and components have defined purposes
  - [ ] Dependencies categorized appropriately
- **Pass Actions**: Proceed to Phase 2 or deliver discovery document
- **Fail Actions**: Return to specific steps for completion

### Phase 2: Requirements Elaboration
> *Expansion phase that transforms requirements into detailed activity flows and deliverables*

#### Prerequisites
- Completed discovery document OR clear understanding of actors/components
- Understanding of user journeys and system interactions
- Knowledge of acceptance criteria principles

**Flexibility**: You can start here if you:
- Already have a list of features/requirements from elsewhere
- Want to jump straight to defining activity flows
- Have existing requirements that need elaboration
Use [[create-requirements]] to start fresh or [[update-requirements]] to enhance existing docs.

#### Step 2.1: Activity Flow Design
- **Purpose**: Map the complete journey for each requirement
- **Instructions**: Execute [[create-requirements]] to start fresh or [[update-requirements]] to refine existing flows
- **Agent**: [[requirements-agent]] - Expert in user journey mapping
- **Inputs**: High-level requirements from Phase 1
- **Outputs**: Activity flows for happy paths
- **Success Criteria**: 
  - Each requirement has complete flow
  - Steps follow actor-verb-object format
  - Flows are sequential and logical
- **Error Handling**:
  - **Likely Failures**: Missing edge cases or error paths
  - **Recovery Strategy**: Focus on happy path first, note edge cases
  - **Escalation Path**: Document edge cases for later refinement

#### Step 2.2: Flow Validation
- **Purpose**: Ensure flows prove requirements are met
- **Instructions**: Trace each flow back to requirements
- **Agent**: [[requirements-agent]] - Validates completeness
- **Inputs**: Activity flows and original requirements
- **Outputs**: Validated [[activity-flows-block]]
- **Success Criteria**: 
  - Each requirement covered by flows
  - No orphaned flows
  - Acceptance criteria achievable
- **Error Handling**:
  - **Likely Failures**: Flows don't prove requirements
  - **Recovery Strategy**: Add missing flow steps
  - **Escalation Path**: Trace requirements to flows systematically

#### Step 2.3: Deliverable Identification
- **Purpose**: Extract all things that need to be built
- **Instructions**: For each flow step, identify what must exist
- **Agent**: [[requirements-agent]] - Systematic deliverable extraction
- **Inputs**: Validated activity flows
- **Outputs**: Initial deliverable list
- **Success Criteria**: 
  - All flow steps have supporting deliverables
  - Deliverables clearly named
  - Ownership identified
- **Error Handling**:
  - **Likely Failures**: Overlooking infrastructure needs
  - **Recovery Strategy**: Review each step for implicit needs
  - **Escalation Path**: Add infrastructure deliverables

#### Step 2.4: Deliverable Decomposition
- **Purpose**: Break down large deliverables into manageable pieces
- **Instructions**: Decompose until each piece is ≤3 story points
- **Agent**: [[requirements-agent]] - Expert in work breakdown
- **Inputs**: Initial deliverable list
- **Outputs**: Filled [[deliverables-block]] with sub-deliverables
- **Success Criteria**: 
  - No deliverable exceeds 3 story points
  - Dependencies between deliverables noted
  - Each piece independently valuable
- **Error Handling**:
  - **Likely Failures**: Cannot decompose further
  - **Recovery Strategy**: Accept larger size with risk note
  - **Escalation Path**: Document as technical debt

#### Quality Gate: Requirements Coverage Check
- **Validation Criteria**:
  - [ ] All requirements have activity flows
  - [ ] All flow steps have deliverables
  - [ ] Deliverables appropriately sized
  - [ ] [[requirements-template]] fully completed
  - [ ] Dependencies documented
- **Pass Actions**: Proceed to Phase 3 or deliver requirements document
- **Fail Actions**: Return to specific steps for completion

### Phase 3: Refinement & Architecture
> *Definition phase that specifies exact properties, behaviours, and system design*

#### Prerequisites
- Completed requirements document OR clear list of what needs to be built
- Understanding of system components and their interactions
- Technical knowledge of the domain

**Flexibility**: Jump directly to this phase if you:
- Have requirements defined elsewhere (e.g., PRD, technical spec)
- Need to define technical architecture for known components
- Want to refine properties and behaviours of existing systems
Use [[create-refinement]] for new specifications or [[update-refinement]] to enhance existing ones.

#### Parallel Execution Block
> *Component refinement and architecture design can proceed simultaneously*

##### Branch A: Component Refinement

###### Step 3.1a: Property Definition
- **Purpose**: Define exact properties for all components
- **Instructions**: Execute [[create-refinement]] to start fresh or [[update-refinement]] to enhance existing specifications
- **Agent**: [[refinement-agent]] - Expert in systematic decomposition
- **Inputs**: Components and deliverables from Phase 2
- **Outputs**: Detailed property specifications
- **Success Criteria**: 
  - All components have defined properties
  - Properties include types and constraints
  - Validation rules specified
- **Error Handling**:
  - **Likely Failures**: Unclear data types or constraints
  - **Recovery Strategy**: Use examples to clarify
  - **Escalation Path**: Define based on common patterns

###### Step 3.2a: Behaviour Specification
- **Purpose**: Define how components behave and interact
- **Instructions**: Specify methods, events, and state changes
- **Agent**: [[refinement-agent]] - Behavioural modeling expert
- **Inputs**: Components with properties
- **Outputs**: Complete [[refinement-block]]
- **Success Criteria**: 
  - All behaviours documented
  - State transitions clear
  - Side effects identified
- **Error Handling**:
  - **Likely Failures**: Complex state machines
  - **Recovery Strategy**: Create state diagrams
  - **Escalation Path**: Simplify states or document complexity

##### Branch B: Architecture Design

###### Step 3.1b: System Architecture
- **Purpose**: Design overall system structure
- **Instructions**: Create architecture diagrams and component layout
- **Agent**: [[refinement-agent]] - Architecture visualization expert
- **Inputs**: All components and their relationships
- **Outputs**: System architecture diagram
- **Success Criteria**: 
  - All components positioned
  - Layers clearly defined
  - External systems shown
- **Error Handling**:
  - **Likely Failures**: Unclear boundaries
  - **Recovery Strategy**: Group by responsibility
  - **Escalation Path**: Apply single responsibility principle

###### Step 3.2b: Component Relationships
- **Purpose**: Define how components communicate
- **Instructions**: Map data flows and integration points
- **Agent**: [[refinement-agent]] - Integration specialist
- **Inputs**: System architecture
- **Outputs**: Complete [[architecture-diagram-block]]
- **Success Criteria**: 
  - All integrations documented
  - Data flows mapped
  - APIs/interfaces defined
- **Error Handling**:
  - **Likely Failures**: Circular dependencies
  - **Recovery Strategy**: Introduce abstraction layer
  - **Escalation Path**: Refactor component boundaries

#### Synchronization Point: Architecture Validation
- **Merge Conditions**: Both branches complete with consistent definitions
- **Conflict Resolution**: Properties must align with architecture
- **Combined Output**: [[refinement-template]] with complete specifications

### Phase 4: Story Creation & Detailing
> *Transformation phase that converts deliverables into actionable user stories with clear acceptance criteria*

#### Prerequisites
- Completed requirements with deliverables OR clear list of features to implement
- Understanding of user personas and their needs
- Knowledge of story writing best practices

**Flexibility**: Start here directly if you:
- Have a list of features needing user stories
- Want to convert technical specs into user-focused stories
- Need to break down deliverables into manageable stories
Use [[create-story]] for new stories or [[update-story]] to refine existing ones.

#### Step 4.1: Story Breakdown Analysis
- **Purpose**: Analyze deliverables for story creation
- **Instructions**: Execute [[create-story]] to start fresh or [[update-story]] to refine
- **Agent**: [[story-agent]] - User story specialist
- **Inputs**: Deliverables from Phase 2 and 3
- **Outputs**: Analysis of story breakdown approach
- **Success Criteria**: 
  - Deliverables understood
  - User value identified
  - Size assessment complete
- **Error Handling**:
  - **Likely Failures**: Unclear user value
  - **Recovery Strategy**: Map to user journey
  - **Escalation Path**: Reframe from user perspective


#### Decision Point: Story Granularity
- **Decision Criteria Matrix**:
  ```
  | Deliverable Size | Complexity | Dependencies | Route To        |
  |:---------------- |:---------- |:------------ |:--------------- |
  | ≤3 points        | Any        | Any          | Branch A        |
  | >3 points        | High       | Many         | Branch B        |
  | >3 points        | Low        | Few          | Branch B        |
  | Unknown          | Any        | Any          | Branch B        |
  ```
- **Evaluation Logic**: Assess each deliverable individually
- **Default Path**: Branch B (decomposition) for safety

#### Branch Routes

##### Branch A: Standard Stories (≤3 points)
###### Step 4.2a: Direct Story Creation
- **Purpose**: Write user stories for appropriately sized work
- **Instructions**: Use As a/I want/So that format
- **Agent**: [[story-agent]] - Story writing expert
- **Inputs**: Deliverables ≤3 points
- **Outputs**: Stories using [[story-template]]
- **Success Criteria**: 
  - Clear user value
  - Testable outcome
  - Proper format
- **Error Handling**: 
  - **Likely Failures**: Technical focus instead of user focus
  - **Recovery Strategy**: Reframe from user perspective
  - **Escalation Path**: Rewrite with user benefit focus

##### Branch B: Story Decomposition (>3 points)
###### Step 4.2b: Break Down & Create Multiple
- **Purpose**: Decompose large deliverables into smaller stories
- **Instructions**: Break down until each piece ≤3 points
- **Agent**: [[story-agent]] - Decomposition specialist
- **Inputs**: Deliverables >3 points
- **Outputs**: Multiple stories per deliverable
- **Success Criteria**: 
  - Each story independently valuable
  - Combined stories cover full scope
  - No story exceeds 3 points
- **Error Handling**:
  - **Likely Failures**: Cannot decompose further
  - **Recovery Strategy**: Create enabler stories
  - **Escalation Path**: Accept larger story with clear sub-tasks

#### Step 4.3: Acceptance Criteria Definition
- **Purpose**: Define clear success criteria for each story
- **Instructions**: Create specific, measurable criteria
- **Agent**: [[story-agent]] - Acceptance criteria expert
- **Inputs**: All created stories
- **Outputs**: Stories with detailed acceptance criteria
- **Success Criteria**: 
  - Criteria are testable
  - Edge cases covered
  - Definition of done clear
- **Error Handling**:
  - **Likely Failures**: Vague or untestable criteria
  - **Recovery Strategy**: Use Given/When/Then format
  - **Escalation Path**: Make criteria concrete and measurable

#### Step 4.4: Story Documentation
- **Purpose**: Complete all story documentation
- **Instructions**: Fill out complete [[story-template]] for each story
- **Agent**: [[story-agent]] - Documentation specialist
- **Inputs**: Stories with acceptance criteria
- **Outputs**: Fully documented stories
- **Success Criteria**: 
  - All template sections complete
  - Links to parent deliverables
  - Technical notes included
- **Error Handling**:
  - **Likely Failures**: Missing technical context
  - **Recovery Strategy**: Reference refinement docs
  - **Escalation Path**: Add technical notes from codebase analysis

#### Quality Gate: Story Completeness Check
- **Validation Criteria**:
  - [ ] All deliverables have stories
  - [ ] All stories ≤3 points
  - [ ] Acceptance criteria defined
  - [ ] User value clear
  - [ ] [[story-template]] complete for each
- **Pass Actions**: Proceed to Phase 5 for roadmap planning
- **Fail Actions**: Return to story creation/refinement

### Phase 5: Milestone & Roadmap Planning
> *Organization phase that structures user stories into releasable milestones with realistic timelines*

#### Prerequisites
- Completed user stories from Phase 4 OR existing stories needing organization
- Understanding of dependencies and priorities
- Knowledge of team capacity and constraints

**Flexibility**: Start here directly if you:
- Have existing user stories needing milestone organization
- Want to create a release roadmap from a story backlog
- Need to sequence work based on dependencies and value
Use [[create-roadmap]] for new roadmaps or [[update-roadmap]] to revise existing plans.

#### Step 5.1: Story Grouping into Milestones
- **Purpose**: Organize user stories into logical release units
- **Instructions**: Execute [[create-roadmap]] to start planning or [[update-roadmap]] to revise existing roadmap
- **Agent**: [[roadmap-agent]] - Expert in release planning
- **Inputs**: All user stories from Phase 4
- **Outputs**: Stories grouped into milestones
- **Success Criteria**: 
  - Groups provide user value
  - Dependencies respected
  - Reasonable milestone sizes
- **Error Handling**:
  - **Likely Failures**: Too many dependencies
  - **Recovery Strategy**: Create infrastructure milestone
  - **Escalation Path**: Reorder to minimize coupling

#### Step 5.2: Milestone Definition
- **Purpose**: Create formal milestone definitions
- **Instructions**: Define goals, value, and acceptance criteria
- **Agent**: [[roadmap-agent]] - Milestone strategist
- **Inputs**: Story groups
- **Outputs**: Filled [[milestone-block]] entries
- **Success Criteria**: 
  - Clear business value stated
  - Acceptance criteria defined
  - Dependencies documented
- **Error Handling**:
  - **Likely Failures**: Unclear value proposition
  - **Recovery Strategy**: Link to user outcomes
  - **Escalation Path**: Define value in terms of observable benefits

#### Step 5.3: Effort Estimation
- **Purpose**: Create realistic milestone-level estimates
- **Instructions**: Sum story points and apply standard estimation model
- **Agent**: [[roadmap-agent]] - Estimation specialist
- **Inputs**: All stories within milestones
- **Outputs**: Complete [[effort-breakdown-block]]
- **Success Criteria**: 
  - Story points aggregated
  - Standard ratios applied (QA: 25%, Testing: 15%)
  - Risk margins added (10%+ based on uncertainty)
- **Error Handling**:
  - **Likely Failures**: Underestimation bias
  - **Recovery Strategy**: Add explicit risk buffer
  - **Escalation Path**: Apply standard multipliers for uncertainty

#### Step 5.4: Release Sequencing
- **Purpose**: Determine optimal release order
- **Instructions**: Sequence milestones based on value, dependencies, and risk
- **Agent**: [[roadmap-agent]] - Release planning expert
- **Inputs**: All milestones with estimates
- **Outputs**: Sequenced roadmap with timeline
- **Success Criteria**: 
  - Dependencies resolved
  - High-risk items early
  - Value delivery optimized
- **Error Handling**:
  - **Likely Failures**: Circular dependencies
  - **Recovery Strategy**: Refactor milestone boundaries
  - **Escalation Path**: Architecture review

#### Quality Gate: Roadmap Validation
- **Validation Criteria**:
  - [ ] All stories assigned to milestones
  - [ ] Milestones properly sequenced
  - [ ] Dependencies resolved
  - [ ] Effort estimates complete
  - [ ] [[roadmap-template]] fully populated
- **Pass Actions**: Proceed to Phase 6 for implementation planning
- **Fail Actions**: Return to specific steps for refinement

### Phase 6: Implementation Planning
> *Execution phase that creates detailed technical plans for each story*

#### Prerequisites
- User stories OR clear work items needing technical planning
- Understanding of codebase and technical architecture
- Knowledge of implementation patterns and practices

**Flexibility**: Jump here if you:
- Have user stories from Jira/GitHub/etc needing implementation details
- Want to create technical plans for specific features
- Need to break down high-level requirements into actionable tasks
Use [[create-implementation-plan]] for new plans or [[update-implementation-plan]] to refine existing ones.

#### Step 6.1: Story Technical Analysis
- **Purpose**: Understand technical requirements for each story
- **Instructions**: Execute [[create-implementation-plan]] for new plans or [[update-implementation-plan]] to refine existing ones
- **Agent**: [[implementation-agent]] - Technical planning expert
- **Inputs**: User stories from Phase 5

#### Parallel Block: Plan Generation
> *Multiple aspects of implementation planning proceed simultaneously*

##### Step 6.2a: Technical Acceptance Criteria
- **Purpose**: Define testable success criteria
- **Instructions**: Create specific, measurable criteria
- **Agent**: [[implementation-agent]] - Testing specialist
- **Inputs**: Story requirements
- **Outputs**: Filled [[acceptance-criteria-block]]
- **Success Criteria**: Each criterion independently testable

##### Step 6.2b: CRUD Operations
- **Purpose**: Identify all data operations needed
- **Instructions**: Map Create, Read, Update, Delete operations
- **Agent**: [[implementation-agent]] - Data modeling expert
- **Inputs**: Story requirements and data model
- **Outputs**: Filled [[high-level-crud-block]]
- **Success Criteria**: All data operations identified

##### Step 6.2c: Action Planning
- **Purpose**: Create step-by-step implementation guide
- **Instructions**: Detail specific files, functions, and changes
- **Agent**: [[implementation-agent]] - Code planning expert
- **Inputs**: Technical analysis and CRUD operations
- **Outputs**: Filled [[detailed-action-plan-block]]
- **Success Criteria**: Developer can execute without ambiguity

#### Step 6.3: Plan Integration
- **Purpose**: Combine all planning elements
- **Instructions**: Merge parallel outputs into cohesive plan
- **Agent**: [[implementation-agent]] - Integration specialist
- **Inputs**: All planning artifacts
- **Outputs**: Complete [[implementation-plan-template]]
- **Success Criteria**: 
  - All stories have implementation plans
  - Plans reference actual code locations
  - Testing approach included
- **Error Handling**:
  - **Likely Failures**: Conflicting approaches
  - **Recovery Strategy**: Prioritize consistency
  - **Escalation Path**: Choose approach that matches existing patterns

#### Quality Gate: Implementation Readiness
- **Validation Criteria**:
  - [ ] All stories have acceptance criteria
  - [ ] CRUD operations mapped
  - [ ] Action plans reference specific files
  - [ ] Testing strategy defined
  - [ ] [[implementation-plan-template]] complete
- **Pass Actions**: Plans ready for sprint execution
- **Fail Actions**: Return to planning steps

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type            | Severity | Detection Method            | Recovery Strategy         |
|:----------------------|:---------|:----------------------------|:--------------------------|
| Missing Context       | High     | Empty sections in templates | Return to discovery phase |
| Circular Dependencies | Critical | Dependency analysis         | Refactor architecture     |
| Oversized Stories     | Medium   | Point estimation >3         | Decomposition process     |
| Unclear Requirements  | High     | Validation failures         | Stakeholder clarification |
| Technical Unknowns    | Medium   | Gap analysis                | Research spikes           |
| Resource Constraints  | Low      | Effort estimation           | Adjust milestone scope    |


### Circuit Breaker Patterns
- **Scope Creep Detection**: Halt if requirements grow >30% during workflow
- **Dependency Spiral**: Stop if circular dependencies found in 3+ components
- **Estimation Explosion**: Pause if estimates exceed capacity by >50%
- **Quality Gate Failures**: Max 2 attempts per gate before escalation

### Rollback Procedures
1. **Phase-Level Rollback**: 
   - Save current state to `[phase]-backup.md`
   - Revert to previous phase output
   - Document reason for rollback
   
2. **Step-Level Rollback**: 
   - Undo specific step outputs
   - Re-execute with modified approach
   - Update error log
   
3. **Data Rollback**: 
   - Version all documents
   - Maintain change history
   - Enable selective restoration

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Phase Completion Time**: Target vs actual for each phase
- **Quality Gate Pass Rate**: First-attempt success percentage
- **Rework Frequency**: How often phases need revision
- **Story Size Accuracy**: Estimated vs actual story points
- **Dependency Discovery**: When found (early is better)
- **Stakeholder Satisfaction**: Clarity and completeness scores

### Optimization Opportunities
- **Template Reuse**: Build library of common patterns
- **Parallel Processing**: Identify more parallelizable steps
- **Agent Specialization**: Train agents on domain patterns
- **Automation Points**: Tooling for repetitive tasks
- **Knowledge Base**: Capture learnings for future runs

### Learning Loops
- **Retrospective Analysis**: Post-project workflow review
- **Pattern Recognition**: Identify recurring challenges
- **Template Evolution**: Update based on usage
- **Agent Improvement**: Refine prompts based on outputs
- **Process Refinement**: Streamline based on metrics

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Initial feature request or problem statement provided
- [ ] Access to project codebase and documentation
- [ ] Clear understanding of project constraints

### Resource Requirements
- **Agents**: All 6 phase agents available (discovery, requirements, refinement, roadmap, story, implementation)
- **Tools**: Access to codebase search and documentation
- **Skills**: System decomposition, technical analysis, story writing

### Execution Checklist
1. [ ] Gather initial request and any supporting materials
2. [ ] Verify access to all required resources
3. [ ] **Choose execution strategy**:
   - [ ] Full workflow: Start at Phase 1 and proceed through all phases
   - [ ] Partial workflow: Start at your needed phase with existing inputs
   - [ ] Single phase: Execute just the phase you need
   - [ ] Update mode: Refine existing documents at any phase
4. [ ] Begin Phase 1: Discovery
   - [ ] Complete all discovery steps
   - [ ] Pass quality gate
5. [ ] Continue Phase 2: Requirements
   - [ ] Design activity flows
   - [ ] Identify deliverables
   - [ ] Pass quality gate
6. [ ] Execute Phase 3: Refinement (can parallelize)
   - [ ] Define properties/behaviours
   - [ ] Create architecture
   - [ ] Validate consistency
7. [ ] Proceed to Phase 4: Story Creation
   - [ ] Convert deliverables to stories
   - [ ] Define acceptance criteria
   - [ ] Document stories
8. [ ] Execute Phase 5: Roadmap Planning
   - [ ] Group stories into milestones
   - [ ] Sequence releases
   - [ ] Create effort estimates
9. [ ] Complete Phase 6: Implementation
   - [ ] Plan each story technically
   - [ ] Verify executability

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| Stuck in discovery | Unclear requirements | Document what's known and proceed with assumptions |
| Cannot create flows | Missing actor understanding | Return to actor identification |
| Stories too large | Insufficient decomposition | Apply decomposition patterns |
| Estimates unrealistic | Missing hidden work | Add integration/deployment tasks |
| Plans too vague | Insufficient technical detail | Analyze codebase for specifics |
| Dependencies blocking | Poor architecture | Refactor component boundaries |


## 🔮 Evolution & Adaptation
> 💡 *How this workflow adapts and improves over time.*

### Modification Triggers
- Quality gate pass rate falls below 70%
- New project types require different approaches
- Technology stack evolution impacts planning
- Workflow outputs don't meet implementation needs

### Continuous Improvement
- Capture successful patterns for reuse
- Refine phase boundaries based on usage
- Update templates as needs evolve
- Streamline based on actual execution paths
