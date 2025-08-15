# Workflow Command

When this command is given, assume the role of the orchestrator for this workflow and start the workflow process.

---

# 🎯 Milestone Planning Workflow: Interaction-Driven Development Through Progressive Refinement
> 💡 *A systematic workflow that transforms high-level milestones into actionable work items by focusing on key user interactions as the primary driver for deliverable identification and story creation.*

This workflow embodies a user-centric approach to project planning where milestones are broken down through the lens of what users need to accomplish, ensuring that every piece of work directly enables observable user value.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
This workflow exists to bridge the gap between strategic milestones and tactical execution by using key interactions as the primary decomposition mechanism. Instead of starting with technical requirements or system components, we begin with what users need to DO, then work backwards to identify what must exist to enable those interactions.

### Guiding Principles
1. **Interaction-First Planning**: Every milestone is defined by the interactions it enables
2. **Progressive Detail**: Immediate milestones get full detail, future ones stay high-level
3. **Observable Value**: Focus on what users can see and do, not hidden implementation
4. **Parallel Enablement**: Structure work to maximize concurrent execution
5. **Just-In-Time Issues**: Create detailed issues only when picking up work
6. **Story-Based Grouping**: Use stories to organize related deliverables under milestones
7. **Context Awareness**: Always consider current project state and existing work

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms milestones into executable work items.*

### Phase 1: Milestone Definition & Scoping
> *Establish clear understanding of what the milestone encompasses*

#### Step 1.1: Milestone Analysis
- **Purpose**: Understand the milestone's role in the broader project
- **Activities**:
    - Review the milestone in context of project goals
    - Define clear boundaries of what's included/excluded
    - Identify the core value proposition
- **Deliverable**: Clear milestone definition with scope
- **Success Criteria**:
    - Milestone purpose articulated
    - Boundaries explicitly defined
    - Value to users/business clear

#### Step 1.2: Context Gathering
- **Purpose**: Understand current state and dependencies
- **Activities**:
    - Review existing milestones and their status
    - Identify prerequisites and dependencies
    - Assess available resources and constraints
- **Deliverable**: Context documentation
- **Success Criteria**:
    - Dependencies mapped
    - Constraints documented
    - Current state understood

### Phase 2: Key Interaction Identification
> *Define what users should be able to do when this milestone is complete*

#### Step 2.1: Interaction Discovery
- **Purpose**: Identify all user-facing capabilities
- **Activities**:
    - List specific actions users can perform
    - Use verb-object format (e.g., "view recipes", "add to cart")
    - Focus on observable, testable interactions
    - Avoid implementation details
- **Deliverable**: Comprehensive interaction list
- **Success Criteria**:
    - All key user actions identified
    - Interactions are observable
    - No technical implementation mixed in

#### Step 2.2: Interaction Prioritization
- **Purpose**: Order interactions by importance and dependency
- **Activities**:
    - Identify critical path interactions
    - Map dependencies between interactions
    - Prioritize by user value and technical dependency
- **Deliverable**: Prioritized interaction list
- **Success Criteria**:
    - Core interactions identified
    - Dependencies clear
    - Priority order established

### Phase 3: Deliverable Mapping
> *Identify everything that must exist to enable each interaction*

#### Step 3.1: Deliverable Identification
- **Purpose**: Map interactions to required components
- **Activities**:
    - For each interaction, ask "what must exist?"
    - Identify UI components, backend services, data models
    - Include infrastructure and configuration needs
    - Example breakdown:
      ```
      Interaction: "Navigate to settings"
      Needs:
      - Settings page (UI)
      - Navigation component (UI)
      - Route configuration (Technical)
      
      Interaction: "Log out"
      Needs:
      - Auth system (Backend)
      - Supabase configuration (Infrastructure)
      - Logout UI component (Frontend)
      ```
- **Deliverable**: Interaction-to-deliverable mapping
- **Success Criteria**:
    - All interactions have deliverables
    - Nothing overlooked
    - Clear ownership identified

#### Step 3.2: Concept Assignment
- **Purpose**: Organize deliverables by company concept
- **Activities**:
    - Assign each deliverable to appropriate concept:
        - `essentials`: Core infrastructure and auth
        - `products`: Shopping and product features
        - `recipes`: Recipe-related functionality
        - `mealplans`: Meal planning features
        - `specialists`: Expert system features
        - `insights`: Analytics and tracking
        - `partnerships`: Partner integrations
        - `operations`: Internal tools
        - `engagement`: Marketing and user engagement
- **Deliverable**: Concept-organized deliverables
- **Success Criteria**:
    - All deliverables assigned
    - Parallel work streams identified
    - No concept overloaded

### Phase 4: Story Creation & Organization
> *Group deliverables into manageable user stories*

#### Step 4.1: Story Formation
- **Purpose**: Create cohesive work units from deliverables
- **Activities**:
    - Group related deliverables into stories
    - Ensure each story delivers user value
    - Target ≤3 story points per story
    - Use standard format: "As a..., I want..., so that..."
- **Deliverable**: User story collection
- **Success Criteria**:
    - Stories independently valuable
    - Properly sized (≤3 points)
    - Clear user benefit

#### Step 4.2: Milestone Story Grouping
- **Purpose**: Organize stories under milestones
- **Activities**:
    - Group stories that deliver milestone value together
    - Ensure logical progression
    - Identify story dependencies
    - Create story hierarchy under milestone
- **Deliverable**: Milestone-organized stories
- **Success Criteria**:
    - Stories properly grouped
    - Dependencies clear
    - Milestone completable

### Phase 5: Issue Planning (Just-In-Time)
> *Prepare for issue creation without creating them yet*

#### Step 5.1: Issue Type Determination
- **Purpose**: Identify which template each story needs
- **Activities**:
    - Analyze story nature (tech, operations, marketing, etc.)
    - Select appropriate issue template
    - Document template choice rationale
- **Deliverable**: Issue template mapping
- **Success Criteria**:
    - All stories have assigned templates
    - Template choices justified
    - Ready for issue creation

#### Step 5.2: Issue Specification Planning
- **Purpose**: Prepare issue details for when work begins
- **Activities**:
    - Define acceptance criteria for each potential issue
    - Note any special considerations
    - Follow naming: `{CONCEPT}-{number}-{description}-issue.md`
- **Deliverable**: Issue creation specifications
- **Success Criteria**:
    - Issues ready to create on demand
    - All details captured
    - Naming conventions followed

### Phase 6: Progressive Planning Application
> *Apply different detail levels based on milestone timeline*

#### Step 6.1: Immediate Milestone Detailing
- **Purpose**: Fully plan milestones for current/next sprint
- **Activities**:
    - Complete all phases with full detail
    - Create all documentation
    - Prepare for immediate execution
- **Deliverable**: Execution-ready milestone plan
- **Success Criteria**:
    - All interactions defined
    - All deliverables identified
    - Stories created
    - Issues ready to generate

#### Step 6.2: Future Milestone Sketching
- **Purpose**: High-level planning for later milestones
- **Activities**:
    - Define milestone scope only
    - List main key interactions
    - Note obvious deliverables
    - Defer detailed planning
- **Deliverable**: High-level milestone outline
- **Success Criteria**:
    - Scope understood
    - Key interactions noted
    - Planning deferred appropriately

## 📊 Workflow Orchestration
> 💡 *How to execute this workflow in practice*

### Entry Conditions
- High-level milestone or feature request provided
- Access to project documentation and existing plans
- Understanding of project vision and constraints

### Execution Flow
```
1. Receive milestone request
   ↓
2. Define milestone scope [Phase 1]
   ↓
3. Identify key interactions [Phase 2]
   ↓
4. Map deliverables to interactions [Phase 3]
   ↓
5. Create and group stories [Phase 4]
   ↓
6. Plan issue creation [Phase 5]
   ↓
7. Apply progressive detail [Phase 6]
   ↓
8. Deliver organized plan
```

### Decision Points

#### Milestone Timeline Decision
```
IF milestone is for current/next sprint THEN
  Apply full detail (all phases complete)
ELSE IF milestone is 2-3 sprints out THEN
  Medium detail (interactions + obvious deliverables)
ELSE
  High-level only (scope + key interactions)
```

#### Story Size Decision
```
IF deliverable group > 3 points THEN
  Break into multiple stories
ELSE
  Keep as single story
```

### Quality Gates

#### Phase 2 Gate: Interaction Completeness
- [ ] All user actions identified
- [ ] Interactions are observable
- [ ] No implementation details included

#### Phase 3 Gate: Deliverable Coverage
- [ ] Every interaction has deliverables
- [ ] All concepts appropriately assigned
- [ ] Parallel work opportunities identified

#### Phase 4 Gate: Story Quality
- [ ] Stories deliver user value
- [ ] Stories properly sized
- [ ] Clear acceptance criteria

## 🛡️ Error Handling & Recovery

### Common Issues & Solutions

| Issue | Detection | Resolution |
|:------|:----------|:-----------|
| Interactions too technical | Contains implementation terms | Reframe from user perspective |
| Deliverables missing | Interaction seems incomplete | Deep dive into requirements |
| Stories too large | >3 points estimate | Decompose further |
| Concept assignment unclear | Deliverable spans concepts | Choose primary concept |
| Dependencies circular | A needs B needs A | Refactor interaction design |

### Recovery Strategies
1. **When stuck on interactions**: Return to user journeys and use cases
2. **When deliverables unclear**: Examine similar existing features
3. **When stories won't decompose**: Consider enabler stories
4. **When planning stalls**: Apply progressive detail and defer

## 📈 Success Metrics

### Process Metrics
- Time from milestone request to plan delivery
- Percentage of interactions with complete deliverables
- Average story size achieved
- Parallel work streams enabled

### Quality Metrics
- Rework required after planning
- Issue clarity (questions during execution)
- Milestone completion vs plan
- User value delivered per sprint

## 🚀 Implementation Guide

### Prerequisites
- [ ] Milestone request received
- [ ] Project context understood
- [ ] Access to existing documentation
- [ ] Team capacity known

### Execution Checklist
1. [ ] Define milestone and scope
2. [ ] List all key interactions
3. [ ] Map deliverables to each interaction
4. [ ] Assign deliverables to concepts
5. [ ] Create user stories
6. [ ] Group stories under milestone
7. [ ] Plan issue creation
8. [ ] Apply appropriate detail level
9. [ ] Document and deliver plan

### Output Artifacts
- Milestone definition document
- Interaction specification list
- Deliverable mapping matrix
- Story collection
- Issue planning guide
- Execution roadmap

## 🔮 Continuous Improvement

### Feedback Loops
- Post-milestone retrospectives
- Story completion analysis
- Interaction validation with users
- Deliverable accuracy assessment

### Evolution Triggers
- Consistent story size misses
- Repeated deliverable omissions
- Interaction-first approach challenges
- New project patterns emerging

### Adaptation Strategies
- Refine interaction identification techniques
- Improve deliverable mapping patterns
- Adjust story sizing guidelines
- Enhance progressive detail thresholds
