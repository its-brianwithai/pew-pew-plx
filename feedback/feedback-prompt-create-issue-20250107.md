# 📝 Feedback: create-issue Prompt
> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** create-issue
**File Path:** `prompts/create-issue.md`
**Version/Last Modified:** Current version as of 2025-01-07

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Creating an issue for implementing a configuration system (`config.yaml`)
**Interaction Type:** Direct usage via `/plx:create:issue` command
**Related Components:** Issue workflow template, issue creation instructions

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- The 5-phase workflow structure is comprehensive and well-thought-out
- Event flow diagrams provide good visualization
- Scope check ensures issues are properly sized
- The systematic methodology is thorough

### Areas for Improvement
- **Issue:** Incorrect file naming convention used
  - **Example:** Created `001-PPP-config-yaml-implementation/issue.md` instead of `001-PPP-config-yaml-implementation-issue.md`
  - **Impact:** Inconsistent with project conventions
- **Issue:** Missing Component Breakdown section in template
  - **Example:** No structured breakdown of properties and behaviors
  - **Impact:** Less clarity for developers on what exactly needs to be built
- **Issue:** No refinement option after issue creation
  - **Example:** User can't easily refine missing details
  - **Impact:** May result in incomplete requirements

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Fix Issue Naming Convention**
   - **Current State:** Creates issues in `issues/{concept}/{number}-{code}-{name}/issue.md`
   - **Proposed Change:** Should create `issues/{core-concept}/{next-chronological-issue-nr}-{caps-concept-code}-{descriptive-name}-issue.md`
   - **Rationale:** Maintains consistency with project conventions
   - **Implementation Notes:** Update the template output format section

2. **Add Component Breakdown Section**
   - **Current State:** Template has component diagram but no detailed breakdown
   - **Proposed Change:** Add a new section after Data Flow Diagram with:
     ```markdown
     ## 🧩 Component Breakdown
     > 💡 *High-level breakdown of component properties and behaviors*
     
     ### Properties
     - **Identity Properties:** [unique identifiers, names]
     - **Configuration Properties:** [settings, options, preferences]  
     - **State Properties:** [status, current values, runtime data]
     
     ### Behaviours
     - **UI/UX:** [How it looks and feels]
     - **Rules & Limits:** [Validation rules, constraints, boundaries]
     - **Data & Analytics:** [What data is tracked, measured]
     - **Security:** [Access control, permissions]
     - **Performance:** [Speed requirements, optimization needs]
     - **Error Handling:** [What could go wrong, what should always work]
     
     ## 💡 Suggested Approach
     > 💡 *High-level implementation approach based on project conventions*
     
     [CRUD plan and implementation approach following project patterns]
     ```
   - **Rationale:** Provides clearer guidance for developers without being prescriptive about implementation details
   - **Implementation Notes:** Should NEVER make up behaviors not specified by user

3. **Add Refinement Option**
   - **Current State:** Issue is created and workflow ends
   - **Proposed Change:** After creating issue, offer refinement:
     ```markdown
     ## Would you like to refine this issue?
     
     I can help you add any missing details or clarify requirements. You can:
     1. **Quick refinement** - I'll ask the most important questions one at a time in chat
     2. **Structured refinement** - I'll create a questions document you can review and answer
     3. **Continue as-is** - The issue looks complete
     
     Which would you prefer?
     ```
   - **Rationale:** Ensures issues are complete before development starts
   - **Implementation Notes:** Integrate with `question-mode.md` concept

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
After issue creation:
"I've created the issue `001-PPP-config-yaml-implementation-issue.md`. 

Would you like to refine any aspects of this issue? I noticed we could add more detail about:
- Specific validation rules for the config
- Error handling strategies
- Migration approach from current system

Reply with 'refine' to improve the issue, or we can continue with your next task."
```

### Reference Implementation
- Component: `question-mode.md`
- Relevant Pattern: The structured question approach for gathering missing details

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Single component
**User Impact:** Improves issue quality and reduces back-and-forth during development
**Implementation Effort:** Moderate update

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Related to issue workflow refinement concepts
- Connects with question-mode activation pattern

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** `meta-prompt-engineer.md`
**Reasoning:** This is a prompt optimization task requiring structured prompt improvements and integration with existing patterns

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The component breakdown should remain high-level and generic, letting the implementing developer worry about specific technical details while following project conventions. The key is to never make up or optimize behaviors the user didn't specify - only refine what's missing through the refinement process.
