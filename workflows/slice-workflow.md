---
name: slice-workflow
description: "Break down complex tasks into smaller, manageable slices through iterative questioning, ensuring each slice is well-defined, actionable, and aligned with overall project goals."
---
workflow:
  id: "slice-issue-workflow"
  name: "Slice Issue Workflow"
  description: "Break down large issues into developable slices of max 3 story points that can be completed in one commit with complete project conventions and documentation"
  title: "Slice Large Issue into Developable Parts"
  end_goal: "Create a fully documented, convention-compliant issue slice that can be developed in one commit by a fresh agent with complete context and examples"
  deliverables:
    - name: "Sliced Issue Document"
      description: "New issue document containing developable slice with complete documentation and examples"
      acceptance_criteria:
        - "Issue can be developed in one commit maximum"
        - "Work is scoped to max 3 story points"
        - "Follows all project conventions"
        - "Contains links to documentation and examples"
        - "Includes exact implementation references"
    - name: "Updated Parent Issue"
      description: "Original issue updated with references to sliced work and current status"
      acceptance_criteria:
        - "Contains reference to child issue if work remains"
        - "Shows what work was moved to slice"
        - "Parent issue status is up to date"
        - "Clear separation of remaining vs sliced work"
    - name: "Starting Prompt Document"
      description: "Complete starting prompt in issue folder for fresh agent development"
      acceptance_criteria:
        - "Agent can start development immediately"
        - "All context and examples provided"
        - "Project conventions clearly referenced"
        - "Implementation approach is documented"
  steps:
    - name: "Determine Issue to Slice"
      instructions:
        - "Analyze the current issue scope and complexity"
        - "Identify parts that can be developed independently"
        - "Find logical boundaries for slicing the work"
        - "Ensure slice maintains functional coherence"
      constraints:
        - "Slice must be developable in one commit"
        - "Maximum 3 story points of work"
        - "Must maintain functional boundaries"
        - "Cannot break existing functionality"
      deliverables:
        - name: "Issue Slice Definition"
          next_step_criteria:
            - "Slice is clearly defined and scoped"
            - "Work can be completed in one commit"
            - "Scope is maximum 3 story points"
    - name: "Create or Update Issue Document"
      instructions:
        - "Create new issue document if parent issue has remaining work"
        - "Use current issue document if all work fits in slice"
        - "Follow MVPM naming conventions for new documents"
        - "Update parent issue with reference to child issue"
        - "Ensure clear separation of work between parent and child"
      constraints:
        - "Follow project conventions exactly"
        - "Use MVPM naming conventions"
        - "Maintain traceability between parent and child"
        - "Update parent issue status accurately"
      deliverables:
        - name: "Issue Documents"
          next_step_criteria:
            - "New issue document created if needed"
            - "Parent issue updated with references"
            - "Work separation is clear"
            - "MVPM conventions followed"
    - name: "Research Project Conventions"
      instructions:
        - "Perform deep research of instructions/docs folders"
        - "Search for conventions throughout the project"
        - "Identify all relevant conventions for the slice"
        - "Document specific conventions that apply"
        - "Find examples of similar implementations"
      constraints:
        - "Research must be comprehensive and thorough"
        - "Cover all relevant project areas"
        - "Document exact conventions to follow"
        - "Find concrete examples not just rules"
      deliverables:
        - name: "Convention Research Results"
          next_step_criteria:
            - "All relevant conventions identified"
            - "Specific examples found"
            - "Implementation patterns documented"
            - "Research is comprehensive"
    - name: "Add Documentation and Examples"
      instructions:
        - "Add links to relevant documentation"
        - "Include examples of exact implementations"
        - "Reference specific code patterns to follow"
        - "Apply monkey-see-monkey-do approach"
        - "Ensure agent knows exactly what to copy"
      constraints:
        - "Examples must be exact and specific"
        - "Links must be complete and accurate"
        - "Follow monkey-see-monkey-do principles"
        - "Agent should have zero ambiguity"
      deliverables:
        - name: "Documented Implementation Guide"
          next_step_criteria:
            - "All documentation links added"
            - "Exact examples provided"
            - "Implementation approach is clear"
            - "Zero ambiguity for developer"
    - name: "Handle Missing Documentation"
      instructions:
        - "Identify gaps in documentation or approaches"
        - "Ask user to provide missing documentation"
        - "Request specific approaches for undocumented areas"
        - "Prompt for research toward missing approaches"
        - "Process user feedback until complete"
      constraints:
        - "Must identify all documentation gaps"
        - "User requests must be specific"
        - "Continue until no gaps remain"
        - "All approaches must be documented"
      deliverables:
        - name: "Complete Documentation"
          next_step_criteria:
            - "No documentation gaps remain"
            - "All approaches are documented"
            - "User feedback incorporated"
            - "Implementation is fully specified"
    - name: "Confirm Plan and Create Starting Prompt"
      instructions:
        - "Present complete plan to user for confirmation"
        - "Process any final feedback or changes"
        - "Create starting prompt document in issue folder"
        - "Include all context needed for fresh agent"
        - "Ensure agent can start development immediately"
      constraints:
        - "Plan must be confirmed by user"
        - "Starting prompt must be complete"
        - "Fresh agent needs no additional context"
        - "All conventions and examples included"
      deliverables:
        - name: "Confirmed Development Plan"
          next_step_criteria:
            - "User has confirmed the plan"
            - "Starting prompt created in issue folder"
            - "Fresh agent can begin development"
            - "Nothing can go wrong with implementation"
