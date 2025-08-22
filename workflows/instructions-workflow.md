---
name: instructions-workflow
description: "Systematically create, read, update, or delete instructions based on conversational context, ensuring proper categorization into the correct instruction type, context-aware processing of recent conversation or user feedback, adherence to project instruction structure and naming conventions, and intelligent detection of instruction needs from implicit or explicit requests."
---
title: CRUD Instructions Universal Instruction Management
end_goal: Successfully create, read, update, or delete instructions based on conversational context, ensuring proper categorization into the correct instruction type, context-aware processing of recent conversation or user feedback, adherence to project instruction structure and naming conventions, and intelligent detection of instruction needs from implicit or explicit requests
deliverables:
  - name: New instruction files or updates
    description: New instruction files or updates to existing ones properly placed in the correct instructions subdirectory
    acceptance_criteria:
      - Instruction type correctly identified from context
      - File follows naming convention topic-type.md
      - Placed in correct folder instructions/type-folder/
      - YAML frontmatter includes name and description
      - Content is actionable and follows WHEN/THEN patterns where appropriate
      - Any referenced conversation context is incorporated
steps:
  - name: Context Analysis
    instructions:
      - Examine recent conversation for user corrections or feedback
      - Examine recent conversation for discovered patterns or practices
      - Examine recent conversation for explicit instruction requests
      - Examine recent conversation for implicit needs from repeated issues
      - Determine CRUD operation needed Create Read Update or Delete
    deliverables:
      - name: Clear understanding of instruction action needed
        next_step_criteria:
          - Action type and instruction category identified
  - name: Instruction Type Classification
    instructions:
      - Map instruction to patterns conventions best-practices rules guidelines standards or references
      - Apply 4-step classification rule
      - Check if similar instruction exists to avoid duplication
      - Determine the type based on content nature
      - Generate filename using topic-type.md format
      - Identify target folder instructions/type-folder/
    deliverables:
      - name: Correct instruction category identified
        next_step_criteria:
          - Instruction mapped to appropriate type
  - name: Content Extraction
    instructions:
      - Extract the specific behavior or pattern to document
      - Extract when it applies context or trigger
      - Extract what should happen action or response
      - Extract why it matters rationale if provided
      - Transform conversational language to instruction format
      - Convert user feedback to actionable rules
      - Convert observed patterns to documented conventions
      - Convert corrections to updated best practices
    deliverables:
      - name: Instruction content extracted from context
        next_step_criteria:
          - Actionable content ready for formatting
  - name: Instruction Formatting
    instructions:
      - Structure with YAML frontmatter including name and description
      - Format content based on type
      - Use WHEN/ALWAYS/NEVER patterns for rules
      - Use clear patterns with examples for conventions
      - Use recommended approaches with rationale for best practices
      - Use flexible recommendations for guidelines
      - Use formal specifications for standards
      - Use architectural patterns with implementation details for patterns
      - Use links and citations to external resources for references
    deliverables:
      - name: Properly formatted instruction file
        next_step_criteria:
          - Follows project instruction structure
  - name: File Operations
    instructions:
      - Execute the appropriate operation Create Read Update or Delete
      - Write new file to instructions/type/ for Create operation
      - Display existing instruction content for Read operation
      - Modify existing file preserving structure for Update operation
      - Remove obsolete instruction with confirmation for Delete operation
      - Verify file placement and naming convention
    deliverables:
      - name: Instruction file created updated or deleted
        next_step_criteria:
          - File system reflects the change
  - name: Validation and Feedback
    instructions:
      - Validate the instruction is actionable and clear
      - Validate no duplication with existing instructions
      - Validate follows project conventions
      - Provide feedback on what was created updated or deleted
      - Provide feedback on where it was placed
      - Provide feedback on how it will be used
    deliverables:
      - name: Confirmation of successful operation
        next_step_criteria:
          - User informed of changes made
