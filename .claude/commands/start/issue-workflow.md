---
name: issue-workflow
description: "Systematically decompose technical requirements through iterative questioning to create comprehensive tech issues with clear goals, components, properties, behaviors, deliverables, checkpoints, and effort estimates."
---
# Workflow Command

When this command is given, assume the role of the orchestrator for this workflow and start the workflow process.

---

title: Create Issue Systematic Requirements Decomposition
end_goal: Create a comprehensive technical issue document that defines a single clear outcome the system/user must achieve, identifies all atomic requirements and components without assumptions, documents properties behaviors deliverables and checkpoints, provides accurate effort estimates based on complete understanding, follows MVP mindset focusing only on must-haves, and maintains context rot awareness by including only value-adding information
deliverables:
  - name: Complete tech issue document
    description: Fully populated technical issue document with all required sections
    acceptance_criteria:
      - All sections populated with relevant content
      - Document follows established format
      - Content is comprehensive and actionable
  - name: Clear end goal with success criteria
    description: Single measurable objective with specific success criteria
    acceptance_criteria:
      - End goal is specific and measurable
      - Success criteria are verifiable
      - Objective drives all other requirements
  - name: Atomic component breakdown
    description: Complete breakdown of components with properties and behaviors
    acceptance_criteria:
      - Components broken down to atomic level
      - Properties and behaviors fully documented
      - No assumptions made about components
  - name: Grouped deliverables
    description: Components organized into testable units for parallel work
    acceptance_criteria:
      - Deliverables grouped for parallel work
      - Groups represent testable units
      - Dependencies clearly identified
  - name: Chronological checkpoints
    description: Milestones with acceptance criteria for progress tracking
    acceptance_criteria:
      - Checkpoints enable progress tracking
      - Each checkpoint has clear acceptance criteria
      - Timeline is realistic and achievable
  - name: Realistic effort estimates
    description: Accurate time estimates with justification
    acceptance_criteria:
      - Effort estimates based on complete scope
      - Justification provided for each estimate
      - Risks and buffers accounted for
steps:
  - name: End Goal and Initial Discovery
    instructions:
      - Understand the single outcome desired
      - Document the end goal clearly
      - Explore what the system/user needs to be able to do
      - Discover what components should exist
      - For each component understand its purpose
      - Keep drilling down with contextual questions that reveal interactions between components specific capabilities needed and edge cases
      - Stop when components cannot be split further without losing meaning
    constraints:
      - Never use example questions verbatim
      - Always generate contextually relevant questions based on current state
      - Determine next highest-value question dynamically
      - Adapt questioning style to technical context
    deliverables:
      - name: Clear end goal with initial requirements
        next_step_criteria:
          - User confirms goal captures their intent
          - Initial components identified
          - Basic requirements documented
  - name: Properties and Behaviors
    instructions:
      - For each discovered component explore what makes it uniquely identifiable
      - Determine what configuration each component needs
      - Document how each component changes over its lifecycle
      - For behaviors discover events relevant to each component
      - Identify default behavior for each use case
      - Define states that make sense for the implementation
      - Update document with each answer
    deliverables:
      - name: Complete properties and behaviors documentation
        next_step_criteria:
          - User confirms all characteristics captured
          - Properties fully documented
          - Behaviors completely defined
  - name: Deliverables Grouping
    instructions:
      - Present initial groupings based on discovered relationships
      - Explore optimal groupings through questions about natural coupling
      - Consider testing boundaries for the architecture
      - Identify parallel work opportunities in context
      - Refine groupings based on answers
    deliverables:
      - name: Components grouped into testable units
        next_step_criteria:
          - User confirms grouping makes sense
          - Dependencies clearly identified
          - Parallel work opportunities maximized
  - name: Checkpoints Definition
    instructions:
      - Present checkpoint suggestions from deliverable analysis
      - Explore dependencies specific to the system
      - Identify parallelization based on technical constraints
      - Define verification appropriate to each checkpoint
    deliverables:
      - name: Chronological milestones with acceptance criteria
        next_step_criteria:
          - User confirms checkpoints are achievable
          - Dependencies properly sequenced
          - Verification criteria defined
  - name: Effort Estimation
    instructions:
      - Present estimates based on complete understanding
      - Explore accuracy through questions about specific complexities
      - Identify risks unique to the technical approach
      - Calculate buffer needs for unknowns
      - Refine until estimates reflect reality
    deliverables:
      - name: Realistic effort breakdown with justification
        next_step_criteria:
          - User confirms estimates are reasonable
          - All risks accounted for
          - Justification provided for each estimate
