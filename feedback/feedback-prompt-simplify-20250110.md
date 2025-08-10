# 📝 Feedback: Simplify Command Prompt

> 💡 *Constructive feedback for improving a specific PLX framework component. This feedback will be processed by the appropriate meta agent to enhance the framework.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** simplify (plx:simplify command)
**File Path:** `prompts/simplify.md`
**Version/Last Modified:** Unknown

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** User invoked the simplify command to simplify the requirements of an issue about emulator login prefill configuration
**Interaction Type:** Direct usage via slash command
**Related Components:** Question mode framework, issue template

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- The YES/NO question format is effective for reducing cognitive load
- The batch question approach allows for efficient processing
- The goal establishment phase is helpful for clarity

### Areas for Improvement
- **Issue:** The simplify command asked questions about the document structure instead of the content
  - **Example:** "Can we eliminate the entire 'Actor Flow' section?" instead of "Can we skip password prefill?"
  - **Impact:** User frustration, wasted time, incorrect focus that defeats the purpose of the command
- **Issue:** Lack of context awareness about what "simplify" means in different scenarios
  - **Example:** When working on an issue, simplification should focus on the feature/requirements, not the documentation format
  - **Impact:** Misaligned output that doesn't help the user achieve their actual goal

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Context-Aware Simplification**
   - **Current State:** Simplify command doesn't distinguish between content and structure
   - **Proposed Change:** Detect the context (issue content, code, documentation) and focus simplification questions accordingly
   - **Rationale:** Users invoke simplify to reduce complexity in the actual subject matter, not the format
   - **Implementation Notes:** Add context detection logic that identifies whether working on requirements, code, or documentation

2. **Default to Content Over Structure**
   - **Current State:** No clear preference between simplifying content vs structure
   - **Proposed Change:** Always default to simplifying the actual content/requirements unless explicitly asked about structure
   - **Rationale:** Structure simplification is a meta-concern that's rarely the user's intent
   - **Implementation Notes:** Add explicit instruction that content takes precedence over format

3. **Add Context Clarification Step**
   - **Current State:** Jumps directly to questions without confirming simplification target
   - **Proposed Change:** Add initial step: "I'll help simplify [the feature requirements/the code logic/etc]. Is this correct?"
   - **Rationale:** Ensures alignment before generating questions
   - **Implementation Notes:** Quick confirmation step prevents misdirected effort

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
When user invokes simplify on an issue about login prefill:

GOOD Questions:
- Can we skip the password prefill and only prefill email?
- Should we hardcode test credentials instead of making them configurable?
- Can we remove validation and just trust the dart-define values?

BAD Questions:
- Can we remove the Actor Flow section?
- Should we combine the acceptance criteria sections?
- Can we eliminate the diagrams?
```

### Reference Implementation
- Component: [[clarify]] command
- Relevant Pattern: Focuses on clarifying the actual content/requirements, not the document structure

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Single component
**User Impact:** Significant frustration and wasted time when simplify focuses on wrong aspect
**Implementation Effort:** Moderate update

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Similar issues might exist in other question-mode commands (clarify, improve, expand, reduce)

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-prompt-engineer]]
**Reasoning:** This is a prompt engineering issue where the prompt needs better context awareness and clearer instructions about focusing on content over structure

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The user's strong reaction indicates this is a critical usability issue. The simplify command should be intelligent enough to understand that when working on an issue or feature, the simplification questions should target the actual requirements and implementation details, not the documentation format. This is especially important since the PLX framework has established documentation structures that shouldn't be arbitrarily simplified.