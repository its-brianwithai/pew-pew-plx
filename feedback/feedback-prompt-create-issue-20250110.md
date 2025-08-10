# 📝 Feedback: Create Issue Command

> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** create-issue (plx:create:issue command)
**File Path:** `prompts/create-issue.md`
**Version/Last Modified:** Unknown

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Creating an issue for emulator default email configuration - provided minimal initial information
**Interaction Type:** Direct usage via slash command
**Related Components:** Issue template, question-mode framework

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- The structured approach to issue creation is valuable
- The template sections provide good organization
- The workflow concept is sound

### Areas for Improvement
- **Issue:** Agent added many requirements that were never mentioned by the user
  - **Example:** When user said "default email when using emulators", agent added 6 requirements including fallback defaults, debug display, etc.
  - **Impact:** Creates confusion and work to remove unwanted requirements rather than building up from minimal base
  
- **Issue:** Doesn't follow instruction 0 pattern properly
  - **Example:** Should research project thoroughly to understand context before generating anything
  - **Impact:** Missing project-specific context that would inform better initial requirements

- **Issue:** Creates full complex issue upfront instead of iterative refinement
  - **Example:** Generates complete issue with all sections filled instead of starting minimal
  - **Impact:** User has to edit/remove content rather than building up what they need

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Start with Minimal Base**
   - **Current State:** Agent generates full complex issue with many assumed requirements
   - **Proposed Change:** Create simplest possible version with ONLY what user mentioned
   - **Rationale:** Easier to build up than tear down; respects user's actual request
   - **Implementation Notes:** Initial issue should contain only user's exact requirements, nothing more

2. **Apply Instruction 0 Pattern**
   - **Current State:** Agent jumps to creating issue without deep research
   - **Proposed Change:** First deeply understand request, then research project for similar patterns and context
   - **Rationale:** Project context informs better requirements without assumptions
   - **Implementation Notes:** Add explicit research phase using the instruction 0 pattern from agents

3. **Interactive Section-by-Section Refinement**
   - **Current State:** All sections generated at once
   - **Proposed Change:** After minimal base, ask ONE question at a time per section
   - **Rationale:** Builds exactly what user needs through targeted questions
   - **Implementation Notes:** 
     - Each question should be the best possible question for maximum value
     - After each answer, integrate and ask next question
     - After each section, ask if user wants to continue or add more

4. **Value-Driven Question Selection**
   - **Current State:** No interactive questioning
   - **Proposed Change:** Each question should be carefully selected for maximum value gain
   - **Rationale:** Efficient refinement that respects user's time
   - **Implementation Notes:** Questions should fill biggest gaps or clarify most important ambiguities

5. **Section Transition Control**
   - **Current State:** All sections completed automatically
   - **Proposed Change:** After each section, ask "Move to next section or anything else to add?"
   - **Rationale:** User maintains control over depth and completeness
   - **Implementation Notes:** Explicit checkpoints between sections for user feedback

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
User: "Problem: wrong default name when using emulators"

Agent: 
1. Research project for emulator configuration patterns
2. Create minimal issue with ONLY: "System should use correct default name when using emulators"
3. Ask: "What specific default name is currently wrong?" 
4. User answers
5. Ask: "What should the correct default name be?"
6. User answers
7. Ask: "When does this problem occur - during login, registration, or elsewhere?"
8. User answers
9. "Initial requirements captured. Would you like to move to the Actor Flow section or add more requirements?"
```

### Reference Implementation
- The instruction 0 pattern from all agents shows proper research approach
- Interactive refinement similar to how question-mode works but one question at a time

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Single component but frequently used
**User Impact:** Significant - affects quality and efficiency of issue creation
**Implementation Effort:** Major refactor to make interactive

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Similar principle to simplify command feedback - respect user's actual request, don't add assumptions
- Question-mode framework could be leveraged for the interactive approach

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-prompt-engineer]]
**Reasoning:** This requires redesigning the prompt to be more interactive, research-focused, and user-driven rather than assumption-heavy

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The core principle here is: Start minimal based on exactly what was said, research thoroughly for context, then build up through intelligent questioning. This respects the user's actual request while systematically improving it through interaction. The instruction 0 pattern is critical - deep understanding and project research should inform everything, not assumptions about what the user might want.