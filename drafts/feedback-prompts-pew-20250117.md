# 📝 Feedback: Pew Prompt [PROCESSED]

> 💡 *Constructive feedback for improving the pew prompt's approach to understanding user needs and assembling components.*

## 🎯 Component Details
> 💡 *Identify the specific component and its location within the PLX framework.*

**Component Type:** Prompt
**Component Name:** pew
**File Path:** `prompts/pew.md` (activated via `/pew` command)
**Version/Last Modified:** Current version as of 2025-01-17

## 📊 Context & Usage
> 💡 *Describe how you were using this component when you identified areas for improvement.*

**Use Case:** User wanted to create a prompt for automatically installing Claude Code hooks with iterative user guidance
**Interaction Type:** Direct usage via `/pew` command
**Related Components:** Uses framework discovery, component selection, and prompt assembly

## 🔍 Observations
> 💡 *Document specific behaviours, outputs, or characteristics that prompted this feedback.*

### What Worked Well
- Comprehensive project exploration and understanding
- Strong grasp of PLX framework components
- Methodical approach to component discovery
- Good understanding of modular prompt philosophy

### Areas for Improvement
- **Issue:** Jumped straight into research before understanding user's specific needs
  - **Example:** Started exploring project structure and reading files before asking what type of hook, what notifications, etc.
  - **Impact:** Wasted time researching potentially irrelevant components, frustrated user
- **Issue:** Asked multiple open-ended questions instead of low-cognitive load yes/no questions
  - **Example:** Asked "What type of notifications?" with 5 options instead of binary choices
  - **Impact:** Higher cognitive load on user, slower convergence to requirements

## 💡 Suggestions
> 💡 *Provide specific, actionable suggestions for improving this component.*

1. **Start with User Understanding First**
   - **Current State:** Phase 1 includes deep project research before understanding user's goal
   - **Proposed Change:** Split Phase 1 into two: First understand user's exact need, THEN research relevant components
   - **Rationale:** Can't effectively research if you don't know what you're looking for
   - **Implementation Notes:** Move research activities to Phase 2 after goal is crystal clear

2. **Use Low-Cognitive Load Questions**
   - **Current State:** Asks multi-choice questions like "A) Option 1, B) Option 2, C) Option 3..."
   - **Proposed Change:** Use yes/no questions that progressively narrow down requirements
   - **Rationale:** Binary questions reduce cognitive load and surface the most valuable information each time
   - **Implementation Notes:** Follow the pattern from tech-issue-template where questions build understanding systematically

3. **Progressive Information Gathering**
   - **Current State:** Tries to gather all information at once
   - **Proposed Change:** Ask ONE focused yes/no question at a time, adjusting based on answers
   - **Rationale:** Each answer reveals what the next most valuable question should be
   - **Implementation Notes:** Questions should dynamically adapt based on previous answers

## 🎨 Examples & Comparisons
> 💡 *If helpful, provide examples of desired behavior or reference similar components that handle things well.*

### Desired Behaviour Example
```
User: I want to create a prompt for hook installation

Pew: I'll help you create the perfect prompt for that. Let me understand your specific need first.

Is this hook for monitoring/notifications (vs execution/automation)?
- [ ] A. Yes (monitoring/notifications)
- [ ] B. No (execution/automation)

User: A

Pew: Got it - monitoring/notifications. 

Will this hook respond to Git events (commits, pushes)?
- [ ] A. Yes 
- [ ] B. No (other events)

[Continue until requirements are clear, THEN research relevant components]
```

### Reference Implementation
- Component: [[tech-issue-template]]
- Relevant Pattern: Uses progressive discovery with low-cognitive questions to surface requirements

## 🚀 Priority & Impact Assessment
> 💡 *Help prioritize this feedback by assessing its importance and impact.*

**Priority Level:** High
**Scope of Impact:** Single component (pew prompt)
**User Impact:** Significantly improves user experience by reducing frustration and cognitive load
**Implementation Effort:** Moderate update - reorganize workflow phases and change questioning approach

## 🔗 Related Feedback
> 💡 *Link to any related feedback documents or issues.*

- Similar pattern could benefit other discovery prompts
- Related to general principle of "understand before acting"

## 📋 Meta Agent Assignment
> 💡 *Indicate which meta agent should process this feedback.*

**Recommended Meta Agent:** [[meta-prompt-engineer]]
**Reasoning:** This is specifically about improving a prompt's structure and approach

## 📝 Additional Notes
> 💡 *Any other context, considerations, or information that might be helpful.*

The core issue is sequencing: The prompt should FIRST understand what the user wants (through low-cognitive yes/no questions), THEN research relevant components. This matches the principle of "you can't effectively search if you don't know what you're looking for."

The tech-issue-template provides a good model for progressive discovery through focused questions that build understanding systematically.