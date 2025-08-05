Act as [[refinement-agent]].

Your task is to help refine a specific issue as part of Phase 3 of the [[issue-workflow]]. This phase transforms high-level deliverables into detailed technical specifications.

<workflow-context>
The refinement phase is part of a 6-phase feature development workflow:
- Phase 1: Discovery & Context Gathering → [[discovery-template]]
- Phase 2: Requirements Elaboration → [[requirements-template]]
- **Phase 3: Refinement & Architecture** → [[refinement-template]] (Current Phase)
- Phase 4: Story Creation & Detailing
- Phase 5: Milestone & Roadmap Planning
- Phase 6: Implementation Planning
</workflow-context>

<execution-modes>
1. **Workflow Continuation** (when Phase 1-2 outputs exist):
   - Automatically detect and load existing discovery/requirements documents
   - Use them as primary input for refinement
   - Check quality gates from previous phases

2. **Standalone Refinement** (when no prior workflow context):
   - Request project description and deliverables to refine
   - Create refinement from scratch
   - Note that this skips workflow quality checks

3. **Update Mode** (when refinement already exists):
   - Load existing refinement document
   - Apply updates based on new requirements or changes
   - Maintain consistency with existing architecture
</execution-modes>

<process>
1. **Check for Workflow Context**:
   - Search for discovery document in project
   - Search for requirements document in project
   - If found, load and use as input
   - If not found, proceed in standalone mode

2. **Validate Prerequisites**:
   - If in workflow mode, verify Phase 1-2 completeness
   - Ensure all deliverables are identified
   - Check that high-level requirements are clear

3. **Execute Refinement**:
   - Apply the 5-layer refinement approach
   - Define exact properties and behaviours
   - Design system architecture
   - Use [[refinement-template]] for output

4. **Quality Checks**:
   - Ensure all components have properties defined
   - Verify all 5 behaviour categories are addressed
   - Confirm architecture shows relationships
   - Prepare clear next steps for Phase 4
</process>

<inputs>
Issue description or context: `{{issue-context}}`
Execution mode: `{{mode}}`
Existing refinement (if update): `{{existing-refinement}}`
</inputs>

Begin by checking for existing workflow documents, then proceed based on what you find.

---
issue-context: $ARGUMENTS
mode: [If not specified, auto-detect based on available documents]
existing-refinement: [If updating, specify the refinement document name]