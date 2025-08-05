# 📝 Feedback: Question Mode Prompt

> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** Question Mode (activate-question-mode)
**File Path:** `prompts/activate-question-mode.md`
**Version/Last Modified:** Current version as of 2025-08-05

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Using question mode to iteratively refine requirements for a payment tracking feature through structured questions
**Interaction Type:** Direct usage via slash command
**Related Components:** 
- [[prompts/activate-confirmation-mode.md]]
- [[prompts/process-answers.md]]
- [[instructions/issue-creation-instructions.md]]

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Structured approach to gathering requirements through iterations
- Clear organization with question types (Improve, Add, Remove, Exclude)
- Good archiving of answered questions
- Markdown checkbox format is intuitive

### Areas for Improvement
- **Issue:** Question mode lacks confirmation questions that validate understanding
  - **Example:** Missing questions like "Is my understanding correct that..." or "Should we proceed with..."
  - **Impact:** May lead to assumptions or misaligned understanding between user and assistant
- **Issue:** No explicit confirmation phase between iterations
  - **Example:** Assistant proceeds without confirming interpretation of answers
  - **Impact:** Potential for compounding misunderstandings across iterations

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Add Confirmation Question Type**
   - **Current State:** Only has Improvement, Addition, Removal, and Exclusion questions
   - **Proposed Change:** Add a new "✅ Confirmation Questions" section type
   - **Rationale:** Allows explicit validation of understanding before proceeding
   - **Implementation Notes:** 
     - Use format: "✅ **Confirmation:** Based on previous answers, is it correct that..."
     - Include at start of each iteration to confirm understanding from previous round

2. **Include Understanding Validation Pattern**
   - **Current State:** Assistant analyzes answers and proceeds directly to updates
   - **Proposed Change:** Add explicit understanding confirmation step after analysis
   - **Rationale:** Ensures alignment before making changes
   - **Implementation Notes:**
     - After analyzing answers, present summary as confirmation questions
     - Wait for user confirmation before updating documents

3. **Merge Best Practices from Confirmation Mode**
   - **Current State:** Question mode and confirmation mode are separate
   - **Proposed Change:** Incorporate confirmation mode's validation patterns into question mode
   - **Rationale:** Creates a more robust iterative refinement process
   - **Implementation Notes:**
     - Study [[prompts/activate-confirmation-mode.md]] for patterns
     - Add confirmation checkpoints at critical decision points

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```markdown
### ✅ Confirmation Questions

#### 1. Based on your answers, I understand that:
- Settlements are handled via counter-payments, not marking
- Cloud Functions will maintain debt summaries
- Only outstanding payments load initially

[ ] **Correct** - This understanding is accurate
[ ] **Needs clarification** - Some points need adjustment

#### 2. Should I proceed with updating the requirements document?

[ ] **Yes** - Go ahead with the updates
[ ] **No** - Let me review first
```

### Reference Implementation
- Component: [[prompts/activate-confirmation-mode.md]]
- Relevant Pattern: Uses explicit confirmation before proceeding with actions

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** Medium
**Scope of Impact:** Single component with potential framework-wide benefits
**User Impact:** Improves accuracy and reduces rework by catching misunderstandings early
**Implementation Effort:** Moderate update - adding new question type and validation pattern

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Could relate to overall refinement workflow improvements
- Similar to iterative improvement patterns in [[agents/plan/refinement-agent.md]]

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[agents/meta/meta-prompt-engineer.md]]
**Reasoning:** This feedback relates to prompt structure and engineering, which is the specialty of the meta-prompt-engineer

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

This enhancement would make question mode more robust and reduce the risk of misaligned understanding during iterative refinement processes. The confirmation pattern could also be useful for other iterative prompts in the framework.