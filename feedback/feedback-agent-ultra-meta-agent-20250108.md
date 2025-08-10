# 📝 Feedback: Ultra-Meta-Agent
> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Agent
**Component Name:** ultra-meta-agent
**File Path:** `agents/meta/ultra-meta-agent.md`
**Version/Last Modified:** January 2025

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Creating issue management artifacts (blocks, template, workflow, prompts) following the 5-step issue process
**Interaction Type:** Direct usage via /act:ultra-meta-agent command
**Related Components:** issue-template, issue-workflow, create-issue, update-issue, make-issue prompts

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Successfully created all requested artifacts
- Followed the specified 5-step process structure
- Created appropriate blocks for each step
- Understood the hierarchical relationship between components

### Areas for Improvement
- **Issue:** Lack of understanding about embedded wikilinks syntax and processing
  - **Example:** Initially tried to use `[[issue-template]]` inline instead of `![[issue-template]]` on its own line
  - **Impact:** Generated templates wouldn't work correctly when synced as embedded content wouldn't be processed
- **Issue:** Didn't understand the difference between regular and embedded wikilinks
  - **Example:** Didn't know embedded wikilinks must be on their own line for replacement
  - **Impact:** Templates would have broken syntax after sync processing

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Add Wikilink Processing Knowledge**
   - **Current State:** Agent doesn't understand wikilink processing rules
   - **Proposed Change:** Add explicit knowledge about:
     - Regular wikilinks `[[filename]]` → converted to `@full/path` references
     - Embedded wikilinks `![[filename]]` → entire line replaced with file content
     - Embedded wikilinks MUST be on their own line
   - **Rationale:** Critical for creating functional templates and prompts
   - **Implementation Notes:** Add to Best Practices or Rules sections

2. **Include Sync Script Behavior Documentation**
   - **Current State:** No awareness of how sync scripts process content
   - **Proposed Change:** Document that:
     - `sync-claude-code-wikilinks.sh` converts `[[name]]` to `@path` references
     - `sync-claude-code-embedded-wikilinks.sh` replaces `![[name]]` lines with full content
     - Processing happens during `plx sync claude`
   - **Rationale:** Understanding the sync process helps create correct artifacts
   - **Implementation Notes:** Add to Relevant Context section

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```markdown
# Correct embedded wikilink usage
Some text here.

![[template-name]]

More text here.
```

### Reference Implementation
- Component: All existing prompts in `prompts/`
- Relevant Pattern: They correctly use embedded wikilinks on separate lines

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Multiple components (affects all meta agents creating templates/prompts)
**User Impact:** Critical - incorrect wikilink usage breaks template functionality
**Implementation Effort:** Quick fix - documentation update only

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- This affects all meta agents that create templates or prompts
- Related to template creation and prompt engineering workflows

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-sub-agent-architect]]
**Reasoning:** This agent is responsible for sub-agent architecture and should update the ultra-meta-agent

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The wikilink processing is a fundamental concept in the PLX framework that all meta agents should understand. This knowledge gap likely exists in other meta agents as well, so the fix should be propagated to:
- [[meta-prompt-engineer]]
- [[meta-template-expert]]
- [[meta-workflow-specialist]]
- All other agents that create markdown artifacts with wikilinks
