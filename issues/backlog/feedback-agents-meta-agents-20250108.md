# 📝 Feedback: Meta Agents Example Instructions Update

> 💡 *Constructive feedback for improving meta agents to follow example-instructions-best-practices and enhance meta-prompt-engineer with role detection capabilities.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Agent
**Component Name:** All meta agents (ultra-meta-agent, meta-sub-agent-architect, meta-template-expert, meta-workflow-specialist, meta-prompt-engineer)
**File Path:** `agents/meta/*.md`
**Version/Last Modified:** Current version as of January 2025

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Creating prompts with proper role assignments and ensuring all meta agents follow the established example-instructions-best-practices
**Interaction Type:** Direct usage via /act commands
**Related Components:** [[example-instructions-best-practices]], prompts that need role assignments

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Meta agents have comprehensive instruction sets
- Clear structure and purpose definitions
- Good use of wikilinks for referencing documentation

### Areas for Improvement
- **Issue:** Meta agents don't follow [[example-instructions-best-practices]] for their examples
  - **Example:** Examples contain actual content instead of type descriptions
  - **Impact:** Inconsistency with project standards, confusion about how to create examples
- **Issue:** Meta-prompt-engineer doesn't check for or assign roles when creating prompts
  - **Example:** Creating help.md without role assignment logic
  - **Impact:** Prompts may not use appropriate agents when they should

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Update All Meta Agent Examples**
   - **Current State:** Examples show actual content (e.g., "Use wikilinks [[document-name]]")
   - **Proposed Change:** Replace with type descriptions in example blocks
   - **Rationale:** Maintains consistency with [[example-instructions-best-practices]]
   - **Implementation Notes:** Update all <example> blocks to use [type descriptions]

2. **Enhance Meta-Prompt-Engineer Role Detection**
   - **Current State:** No role assignment logic in prompt creation
   - **Proposed Change:** Add step to search for applicable agents and include role assignment
   - **Rationale:** Ensures prompts leverage appropriate agent expertise
   - **Implementation Notes:** Add role search logic after step 3, check prompt format requirements

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
<example>
- [Domain-specific best practice type with wikilink reference]
- [Project convention type with documentation reference]
- [Quality practice type with standards reference]
</example>
```

### Reference Implementation
- Component: [[example-instructions-best-practices]]
- Relevant Pattern: All examples use type descriptions, not actual content

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Multiple components
**User Impact:** Ensures consistency across all meta agents and improves prompt quality
**Implementation Effort:** Moderate update

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- [[example-instructions-best-practices]] - The standard to follow

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[ultra-meta-agent]]
**Reasoning:** This affects multiple meta agents and requires coordination across agent updates

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The user specifically wants:
1. All meta agents updated to follow example-instructions-best-practices
2. Meta-prompt-engineer to search for applicable roles when creating/updating prompts
3. Role assignment should check if the prompt needs a specific agent based on its purpose