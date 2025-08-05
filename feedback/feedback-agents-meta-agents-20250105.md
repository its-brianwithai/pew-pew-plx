# 📝 Feedback: All Meta Agents
> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Agent
**Component Name:** All Meta Agents (meta-prompt-engineer, meta-sub-agent-architect, meta-template-expert, meta-workflow-specialist, meta-context-expert, meta-instructions-expert, ultra-meta-agent)
**File Path:** `agents/meta/*.md`
**Version/Last Modified:** Current versions

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** Creating an advisory prompt that requires thorough understanding of the PLX framework
**Interaction Type:** Direct usage through ultra-meta-agent
**Related Components:** All meta agents share this issue of insufficient research depth

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Meta agents have specialized expertise in their domains
- They follow project conventions correctly
- They create well-structured outputs

### Areas for Improvement
- **Issue:** Meta agents tend to skim documentation rather than comprehensively research
  - **Example:** When asked to create an advise.md prompt, the agent initially only read 5-6 files instead of the dozens of relevant PLX files
  - **Impact:** This leads to incomplete understanding and potentially missing critical patterns, conventions, or capabilities

- **Issue:** Insufficient emphasis on gaining complete clarity before proceeding
  - **Example:** Agents sometimes make assumptions instead of asking clarifying questions
  - **Impact:** Results in outputs that don't fully address user needs

- **Issue:** No systematic approach to file discovery and prioritization
  - **Example:** Agents don't use file tree exploration to identify all relevant files
  - **Impact:** Important documentation or patterns may be missed

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Add Mandatory Comprehensive Research Phase**
   - **Current State:** Agents read a few files and proceed with partial understanding
   - **Proposed Change:** Add explicit instructions in all meta agents to:
     - Use file tree exploration (Glob) to identify ALL relevant files
     - Create a research checklist before proceeding
     - Read EVERY identified file, not just a sample
     - Document what was researched for transparency
   - **Rationale:** Ensures complete understanding and prevents missing critical information
   - **Implementation Notes:** Add to instruction 0 or create a new mandatory research instruction

2. **Implement Questions Document Process for Clarity**
   - **Current State:** Agents sometimes proceed with assumptions
   - **Proposed Change:** Require meta agents to:
     - Create questions documents when requirements are unclear
     - Use the PLX question-driven refinement process
     - Wait for user confirmation before proceeding
   - **Rationale:** Guarantees 1000% clarity as requested by user
   - **Implementation Notes:** Reference [[activate-question-mode]] and [[create-questions-document]]

3. **Add File Prioritization Strategy**
   - **Current State:** No systematic approach to determining which files to read
   - **Proposed Change:** Include instructions to:
     - Use Glob to map file structure
     - Prioritize based on relevance to task
     - Create a reading list before starting
     - Check off files as they're read
   - **Rationale:** Ensures systematic coverage while focusing on most relevant content
   - **Implementation Notes:** Could use TodoWrite tool to track research progress

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
When asked to create a new artifact:
1. "Let me first map out all relevant files for this task..."
   [Uses Glob to identify 30+ relevant files]
2. "I'll read through ALL of these to ensure complete understanding..."
   [Systematically reads every file]
3. "Before proceeding, let me create a questions document to ensure I understand your needs perfectly..."
   [Creates comprehensive questions document]
4. [Only then proceeds with creation]
```

### Reference Implementation
- Component: The newly created [[advise]] prompt
- Relevant Pattern: Explicitly requires reading ALL files and using questions documents

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Framework-wide (affects all meta agent outputs)
**User Impact:** Significantly improves quality and completeness of all meta agent work
**Implementation Effort:** Moderate update (updating instructions in all meta agent files)

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- This feedback stems from the creation of [[advise]] prompt where the issue was identified

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[ultra-meta-agent]]
**Reasoning:** This affects all meta agents, so the ultra-meta-agent with its comprehensive understanding should coordinate updates across all meta agent files

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The user's exact words were: "EVERY meta agent @agents/meta/ should work like this - NEVER skim, always go for full comprehension reading all files necessary and ask all questions necessary to gain 1000% clarity - use the filetree to estimate which files to search for and focus on the important ones"

This is a fundamental improvement to how meta agents operate, ensuring they leverage their full potential by thoroughly understanding the project before creating or modifying artifacts.