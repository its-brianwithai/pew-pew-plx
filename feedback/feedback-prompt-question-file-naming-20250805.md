# 📝 Feedback: Question Mode File Naming Convention
> 💡 *Constructive feedback for improving question mode and confirmation mode to enforce single file naming convention matching project patterns.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** Question Mode and Confirmation Mode prompts
**File Path:** `prompts/activate-question-mode.md`, `prompts/activate-confirmation-mode.md`
**Version/Last Modified:** Current as of 2025-08-05

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Using question mode to gather requirements and organize questions in a structured document
**Interaction Type:** Direct usage through slash commands
**Related Components:** All prompts that create question documents, confirmation workflows

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Question mode creates structured documents for gathering information
- The concept of a single evolving questions document is good
- Naming pattern exists but needs strengthening

### Areas for Improvement
- **Issue:** Inconsistent enforcement of single file naming convention
  - **Example:** The current implementation mentions `[context]-questions.md` but doesn't enforce the pattern strongly enough
  - **Impact:** Could lead to multiple question files in the same directory, breaking the convention
  
- **Issue:** Lack of clarity about folder-based naming
  - **Example:** When in `issues/active/`, the file should always be `active-questions.md`
  - **Impact:** Users might create incorrectly named files that don't follow project conventions

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Enforce Single File Rule**
   - **Current State:** Mentions single file but doesn't strongly enforce it
   - **Proposed Change:** Add explicit logic:
     - ALWAYS check if a questions file already exists in the current directory
     - If exists, UPDATE it (never create a second one)
     - If not exists, CREATE with proper naming
   - **Rationale:** Prevents proliferation of question files and maintains organization
   - **Implementation Notes:** Add file existence check before creation

2. **Implement Folder-Based Naming Convention**
   - **Current State:** Uses `[context]-questions.md` pattern
   - **Proposed Change:** Explicitly use the parent folder name:
     - In `issues/active/` → `active-questions.md`
     - In `issues/backlog/` → `backlog-questions.md`
     - In root → `project-questions.md`
   - **Rationale:** Aligns with existing PLX conventions for discovery, requirements, refinement docs
   - **Implementation Notes:** Extract folder name programmatically and use it

3. **Add Convention Documentation**
   - **Current State:** Convention is implicit
   - **Proposed Change:** Add clear documentation section:
     ```markdown
     ## File Naming Convention
     - ALWAYS use: `[folder-name]-questions.md`
     - NEVER create multiple question files in same directory
     - UPDATE existing file if it exists
     ```
   - **Rationale:** Makes the convention explicit and enforceable
   - **Implementation Notes:** Add to both prompt headers

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```markdown
## Question File Management

When activating question mode:
1. Determine current directory (e.g., `/issues/active/`)
2. Extract folder name (e.g., `active`)
3. Check for existing `active-questions.md`
4. If exists: UPDATE with new iteration
5. If not exists: CREATE `active-questions.md`

File structure follows project convention:
- `discovery-[context].md`
- `requirements-[context].md`
- `refinement-[context].md`
- `[folder]-questions.md` ← Questions follow same pattern
```

### Reference Implementation
- Component: [[discovery-agent]], [[requirements-agent]], [[refinement-agent]]
- Relevant Pattern: All use single file per directory with folder-based naming

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Multiple components
**User Impact:** Ensures consistent file organization and prevents confusion from multiple question files
**Implementation Effort:** Quick fix

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Related to overall project file organization standards
- Connected to PLX naming conventions

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-prompt-engineer]]
**Reasoning:** This is a prompt structure and convention issue that needs to be enforced through prompt engineering

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

This convention is critical because:
1. **Consistency:** Matches how all other PLX documents are named (discovery, requirements, refinement, etc.)
2. **Discoverability:** Users can predict where question files will be
3. **Organization:** Prevents clutter from multiple question files
4. **Automation:** Scripts and tools can reliably find question documents

The implementation should:
- Be enforced automatically (not rely on user compliance)
- Work across all directory levels
- Handle edge cases (root directory, nested folders)
- Provide clear error messages if conventions are violated

This aligns with the PLX principle of "convention over configuration" - the system should guide users to the right behavior automatically.