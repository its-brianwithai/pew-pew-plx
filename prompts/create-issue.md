---
name: create-issue
description: Start a comprehensive feature development workflow from initial request through implementation plans
---
# Create Feature Development Plan

Act as [[issue-workflow-orchestrator]].

Your task is to execute the comprehensive 6-phase feature development workflow, transforming the initial feature request into actionable implementation plans.

<instruction>
Execute the issue workflow using the strategy that best fits the user's needs. Default to full sequential execution unless the user indicates otherwise.
</instruction>

<context>
The issue workflow consists of 6 phases:
1. Discovery & Context Gathering
2. Requirements Elaboration  
3. Refinement & Architecture
4. Story Creation & Detailing
5. Milestone & Roadmap Planning
6. Implementation Planning

Each phase builds on the previous, but the workflow supports flexible execution modes.
</context>

<execution_modes>
- **Full Sequential**: Execute all 6 phases in order (default)
- **Partial Sequential**: Start at a specific phase if prerequisites exist
- **Single Phase**: Execute just one phase
- **Update Mode**: Refine existing documents
- **Mixed Mode**: Custom combination based on needs
</execution_modes>

<process>
1. Analyze the feature request to understand scope and complexity
2. Determine the optimal execution strategy
3. Execute each required phase by delegating to specialized agents:
   - Phase 1: [[discovery-agent]] with [[create-discovery]]
   - Phase 2: [[requirements-agent]] with [[create-requirements]]
   - Phase 3: [[refinement-agent]] with [[create-refinement]]
   - Phase 4: [[story-agent]] with [[create-story]]
   - Phase 5: [[roadmap-agent]] with [[create-roadmap]]
   - Phase 6: [[implementation-agent]] with [[create-implementation-plan]]
4. Enforce quality gates between phases
5. Handle errors with documented recovery strategies
6. Produce comprehensive planning documentation
</process>

<quality_gates>
Each phase must pass validation before proceeding:
- Completeness of deliverables
- Traceability to previous phases
- No placeholder content
- Clear actionable outputs
</quality_gates>

<output_format>
For each executed phase, produce:
1. Phase-specific document following project templates
2. Quality gate validation results
3. Links to previous phase outputs
4. Any issues or unknowns documented

Final summary should include:
- Execution strategy used and rationale
- All created documents and their locations
- Traceability from request to implementation
- Next steps for development
</output_format>

<requirements>
Feature request: `{{feature-request}}`
Execution mode: `{{execution-mode}}` [Optional - defaults to "full sequential"]
Starting phase: `{{starting-phase}}` [Optional - for partial execution]
</requirements>

Begin by analyzing the feature request and determining the optimal execution strategy.

---
feature-request: [Describe the feature you want to develop]
execution-mode: [Optional: full-sequential, partial-sequential, single-phase, update-mode, mixed-mode] 
starting-phase: [Optional: 1-6, only needed for partial execution]
