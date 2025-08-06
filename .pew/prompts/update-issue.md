---
name: update-issue
description: Update existing feature development documentation at any phase of the workflow
---
# Update Feature Development Plan

Act as [[issue-workflow-orchestrator]].

Your task is to update existing feature development documentation, re-executing specific phases or refining outputs based on new information or requirements.

<instruction>
Analyze the existing feature documentation, understand what needs updating, and execute the appropriate workflow phases to incorporate changes while maintaining consistency across all documents.
</instruction>

<context>
Updates can occur at any phase of the issue workflow:
1. Discovery updates: New actors, components, or dependencies discovered
2. Requirements updates: Changed user journeys or new deliverables
3. Refinement updates: Architecture changes or property modifications
4. Story updates: Acceptance criteria changes or story re-sizing
5. Roadmap updates: Milestone reorganization or estimate adjustments
6. Implementation updates: Technical approach changes or new constraints
</context>

<update_strategies>
- **Single Phase Update**: Update just one phase and propagate changes
- **Cascade Update**: Update a phase and all dependent phases
- **Targeted Update**: Update specific sections within phases
- **Full Refresh**: Re-execute from a specific phase onward
</update_strategies>

<process>
1. Identify which feature documentation exists
2. Analyze what needs updating and why
3. Determine impact on other phases
4. Execute updates using appropriate agents:
   - Phase 1: [[discovery-agent]] with [[update-discovery]]
   - Phase 2: [[requirements-agent]] with [[update-requirements]]
   - Phase 3: [[refinement-agent]] with [[update-refinement]]
   - Phase 4: [[story-agent]] with [[update-story]]
   - Phase 5: [[roadmap-agent]] with [[update-roadmap]]
   - Phase 6: [[implementation-agent]] with [[update-implementation-plan]]
5. Propagate changes to dependent phases
6. Re-validate quality gates for updated phases
7. Document all changes and rationale
</process>

<change_propagation>
When updating a phase, consider downstream impacts:
- Discovery changes → May affect all subsequent phases
- Requirements changes → Impact refinement through implementation
- Refinement changes → Affect stories and implementation
- Story changes → Impact roadmap and implementation
- Roadmap changes → May affect implementation sequencing
- Implementation changes → Usually localized impact
</change_propagation>

<output_format>
For each updated phase:
1. Summary of changes made
2. Rationale for updates
3. Impact on other phases
4. Updated document with change markers
5. Re-validated quality gates

Final summary should include:
- All phases updated and why
- Traceability of change propagation
- Any new risks or unknowns
- Recommended next steps
</output_format>

<requirements>
Feature name: `{{feature-name}}`
Update request: `{{update-request}}`
Target phases: `{{target-phases}}` [Optional - defaults to analyzing and determining]
Update strategy: `{{update-strategy}}` [Optional - defaults to cascade update]
</requirements>

Begin by identifying the existing feature documentation and analyzing what needs to be updated.

---
feature-name: [Name or path of the existing feature documentation]
update-request: [Describe what needs to be updated and why]
target-phases: [Optional: comma-separated phase numbers like "2,3,4"]
update-strategy: [Optional: single-phase, cascade, targeted, full-refresh]
