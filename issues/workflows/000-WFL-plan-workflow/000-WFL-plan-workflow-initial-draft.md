# Plan Workflow Development Plan

## Overview
This workflow transforms initial user requests into actionable development plans through a systematic 5-phase process. Each phase builds upon the previous one, progressively refining abstract requirements into concrete implementation steps.

### Phase Templates
1. **Phase 1** → `discovery-template.md`
2. **Phase 2** → `requirements-template.md`
3. **Phase 3** → `refinement-template.md`
4. **Phase 4** → `roadmap-template.md`
5. **Phase 5** → `implementation-plan-template.md`

## Phase 1: Discovery & Context Gathering
**Goal**: Transform initial request into structured discovery documentation

### Input
- User's initial request (features, problems, goals)
- Research, best practices, domain knowledge
- Any existing documentation or context

### Process
1. **Capture Initial Request**
   - Document the raw user request verbatim
   - Add relevant research and best practices
   - Include any domain-specific context
   - Include any project context
   - Output: Filled [[initial-request-block]]

2. **Identify Actors & Components**
   - Extract all mentioned actors (users, systems, roles)
   - Identify implied/indirect actors
   - List all system components needed
   - Map relationships between actors and components
   - Output: Filled [[actors-components-block]]

3. **Define High-Level Requirements**
   - For each actor/component, define:
     - What they should be able to do (abilities)
     - What states they should have/maintain
   - Iterate between requirements and actors/components
   - Output: Filled [[high-level-requirements-block]]

4. **Identify Dependencies & Gaps**
   - What is needed for implementation:
     - External systems/APIs
     - Libraries/frameworks
     - Data sources
     - Infrastructure
   - What we currently have available
   - What we don't have and need to acquire
   - What we need to research/figure out
   - Output: Filled [[dependencies-gaps-block]]

### Deliverable
- Output: `discovery-template.md` containing:
  - [[initial-request-block]]
  - [[actors-components-block]]
  - [[high-level-requirements-block]]
  - [[dependencies-block]]

---

## Phase 2: Requirements Elaboration
**Goal**: Expand requirements into activity flows and deliverables

### Input
- Completed discovery template from Phase 1

### Process
1. **Design Activity Flows**
   - For each high-level requirement:
     - Map the happy path flow
     - Structure as: [Actor/Component] [verb] [object]
     - Include all steps from start to completion
   - Validate flows prove acceptance criteria
   - Output: Filled [[activity-flows-block]]

2. **Identify Deliverables**
   - For each activity flow step:
     - What needs to exist/be created?
     - Who is responsible for creating it?
     - What are the dependencies?
   - Break down into sub-deliverables (≤3 story points each)
   - Output: Filled [[deliverables-block]]

### Deliverable
- Output: `requirements-template.md` containing:
  - [[activity-flows-block]]
  - [[deliverables-block]]

---

## Phase 3: Refinement & Architecture
**Goal**: Define exact properties, behaviors, and architecture of all components

### Input
- Activity flows and deliverables from Phase 2

### Process
1. **Define Properties & Behaviors**
   - Define exact properties and behaviors of all things to be created/updated
   - Follow refinement workflow from @drafts/refinement-workflow.draft.md
   - Output: Filled [[refinement-block]]

2. **Create Architecture Overview**
   - Architecture overview diagram
   - Component relationships
   - Data flow diagrams
   - Output: Filled [[architecture-diagram-block]]

### Deliverable
- Output: `refinement-template.md` containing:
  - [[refinement-block]]
  - [[architecture-diagram-block]]

---

## Phase 4: Milestone Planning
**Goal**: Organize deliverables into milestones and user stories

### Input
- Refined specifications from Phase 3

### Process
1. **Create Milestones**
   - Group related deliverables into testable units
   - Each milestone should be:
     - Independently releasable
     - Provide user value
     - Testable end-to-end
   - Define acceptance criteria per milestone
   - Output: Filled [[milestone-block]] (to be created)

2. **Write User Stories**
   - For each deliverable/sub-deliverable:
     - Create user story (max 3 story points)
     - Link to parent milestone
     - Define acceptance criteria
     - Include technical constraints
   - Output: Multiple [[user-story-block]] instances

### Deliverable
- Output: `roadmap-template.md` containing:
  - [[milestone-block]]
  - [[user-story-block]]
  - [[effort-breakdown-block]]

---

## Phase 5: Implementation Planning
**Goal**: Create detailed implementation plans for each user story

### Input
- User stories from Phase 4

### Process

1**Define Acceptance Criteria Per Deliverable**
- For each implementation plan:
- Output: Filled [[acceptance-criteria-block]]

2**High-Level CRUD Planning**
   - For each user story:
     - Identify Create operations needed
     - Identify Read/Retrieve operations
     - Identify Update operations
     - Identify Delete operations
   - Map operations to deliverables
   - Output: Filled [[high-level-crud-block]]

3. **Detailed Action Planning**
   - For each CRUD operation:
     - Specify exact implementation steps
     - Identify specific files to modify/create
     - Define content/code changes needed
     - Include testing approach
   - Follow refinement workflow patterns
   - Output: Filled [[detailed-action-plan-block]]

### Deliverable
- Output: `implementation-plan-template.md` containing:
  - [[acceptance-criteria-block]]
  - [[high-level-crud-block]]
  - [[detailed-action-plan-block]]

---

## Workflow Characteristics

### Progressive Refinement
- Each phase adds specificity
- Abstract → Concrete transformation
- Maintains traceability throughout

### Iterative Nature
- Phases can loop back when gaps found
- Continuous validation against previous phases
- Refinement based on new insights

### Output Chain
1. Discovery Template → 
2. Requirements Template → 
3. Refinement & Architecture → 
4. Milestones & Stories → 
5. Implementation Plans

### Quality Gates
- Phase 1: All actors/components identified?
- Phase 2: All requirements have flows?
- Phase 3: All components refined with architecture?
- Phase 4: All deliverables have stories?
- Phase 5: All stories have clear implementation?

---

## Next Steps
1. Create missing block templates:
   - [[milestone-block]]
   - [[high-level-crud-block]]
   - [[detailed-action-plan-block]]

2. Develop workflow orchestrator agent

3. Create phase-specific sub-agents:
   - Discovery agent
   - Requirements agent
   - Refinement agent
   - Milestone planning agent
   - Implementation planning agent

4. Build validation rules for phase transitions

5. Create example run-through with sample project
