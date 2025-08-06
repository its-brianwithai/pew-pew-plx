---
name: feedback-template
description: "Use this template when documenting feedback for improving the PLX framework components (agents, templates, workflows, prompts). This captures improvement suggestions, issues, and enhancement ideas that need to be processed by the appropriate meta agent."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path."
---
# 📝 Feedback: [Component Name]
> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** [Agent / Template / Workflow / Prompt]
**Component Name:** [Full name of the component]
**File Path:** `[Path to the component file, e.g., agents/dev/flutter-developer.md]`
**Version/Last Modified:** [If known, include version or last modification date]

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** [Describe what you were trying to accomplish]
**Interaction Type:** [Direct usage / Part of workflow / Agent delegation / etc.]
**Related Components:** [List any other components involved in the interaction]

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
[List positive aspects that should be preserved or emphasized]
- [Specific strength or effective feature]
- [Another positive observation]

### Areas for Improvement
[Document specific issues, gaps, or enhancement opportunities]
- **Issue:** [Describe the problem or limitation]
  - **Example:** [Provide a specific example if applicable]
  - **Impact:** [How this affects usage or outcomes]
- [Additional improvement areas as needed]

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **[Suggestion Title]**
   - **Current State:** [What happens now]
   - **Proposed Change:** [What should happen instead]
   - **Rationale:** [Why this change would be beneficial]
   - **Implementation Notes:** [Any technical considerations or dependencies]

2. **[Additional Suggestion]**
   - [Follow same structure]

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
[Provide example of how the component should work]
```

### Reference Implementation
[If another component handles something well, reference it here]
- Component: [[component-name]]
- Relevant Pattern: [Describe what works well there]

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** [Critical / High / Medium / Low]
**Scope of Impact:** [Single component / Multiple components / Framework-wide]
**User Impact:** [Describe how this affects users of the framework]
**Implementation Effort:** [Quick fix / Moderate update / Major refactor]

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- [[related-feedback-document]]
- [Link to related GitHub issue if applicable]

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-agent-name]]
**Reasoning:** [Why this meta agent is best suited to handle this feedback]

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

[Include any additional thoughts, edge cases, or contextual information that doesn't fit in the sections above]
