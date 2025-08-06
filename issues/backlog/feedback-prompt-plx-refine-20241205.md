# 📝 Feedback: plx:refine Prompt
> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** plx:refine
**File Path:** `prompts/plx-refine.md`
**Version/Last Modified:** Current version in use

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Trying to use the refinement prompt as part of the broader issue workflow system. The user indicated that "the refine prompt should help a user refine a certain issue following a certain phase of the @workflows/issue-workflow.md with the @agents/plan/issue-workflow-orchestrator.md"

**Interaction Type:** Direct usage via slash command
**Related Components:** 
- [[issue-workflow]]
- [[issue-workflow-orchestrator]]
- [[refinement-agent]]
- Phase 3 of the 6-phase feature development workflow

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- The prompt correctly identifies the refinement agent to use
- It follows the standard prompt structure with role substitution
- It asks for project description when missing
- The refinement agent itself is well-designed for Phase 3 work

### Areas for Improvement
- **Issue:** The prompt operates in isolation without awareness of the issue workflow context
  - **Example:** When a user is in Phase 3 of the issue workflow, the prompt doesn't know to use existing Phase 1-2 outputs
  - **Impact:** Users must manually provide context that already exists in discovery and requirements documents

- **Issue:** No integration with the workflow orchestration system
  - **Example:** The prompt doesn't check for prerequisites or quality gates from previous phases
  - **Impact:** Risk of incomplete or inconsistent refinement without proper workflow context

- **Issue:** Missing workflow flexibility options
  - **Example:** No ability to specify update vs create mode, or to work with partial inputs
  - **Impact:** Users can't leverage the workflow's designed flexibility

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Workflow-Aware Refinement Prompt**
   - **Current State:** Standalone prompt that only takes project description
   - **Proposed Change:** Create a workflow-integrated version that:
     - Detects if user is in an active issue workflow
     - Automatically loads Phase 1-2 outputs if available
     - Offers create vs update mode selection
     - Checks prerequisites before proceeding
   - **Rationale:** Aligns with the issue workflow's design for flexibility and progressive refinement
   - **Implementation Notes:** Could check for existing discovery/requirements documents in the project

2. **Multiple Entry Points**
   - **Current State:** Single entry point requiring full project description
   - **Proposed Change:** Support multiple scenarios:
     - Fresh refinement (current behavior)
     - Workflow continuation (use existing phase outputs)
     - Update existing refinement
     - Partial refinement (specific components only)
   - **Rationale:** Matches the workflow's flexibility patterns
   - **Implementation Notes:** Use conditional logic based on available inputs

3. **Quality Gate Integration**
   - **Current State:** No validation of inputs or outputs
   - **Proposed Change:** Add workflow quality checks:
     - Verify Phase 1-2 completeness if in workflow mode
     - Validate refinement output meets Phase 3 standards
     - Provide clear next steps for Phase 4
   - **Rationale:** Ensures workflow integrity and prevents downstream issues
   - **Implementation Notes:** Reference quality gate criteria from issue-workflow.md

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
/plx:refine