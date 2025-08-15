---
name: give-feedback
description: "Capture and process feedback about PLX framework components to help improve the framework through systematic documentation and routing to appropriate meta agents."
---

# 📝 Give Feedback: Framework Component Improvement
> 💡 *Transform user feedback about PLX framework components into actionable improvement documentation routed to the appropriate meta agent for processing.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Capture comprehensive feedback about PLX framework components (agents, templates, workflows, prompts) and:
- Document feedback in a structured, actionable format
- Route to the appropriate meta agent for processing
- Ensure continuous framework improvement through systematic feedback collection
- Maintain traceability from feedback to implementation

## 👤 Persona

![[ultra-meta-agent]]

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Capture and process user feedback about a PLX framework component by:
1. Gathering comprehensive feedback context
2. Creating a structured feedback document
3. Determining the appropriate meta agent for processing
4. Continuing the conversation with applied learnings

### Deliverables
- Feedback document using [[feedback-template]]
- Proper routing to specialized meta agent
- Confirmation of feedback capture
- Applied improvements in current interaction

### Acceptance Criteria
- [ ] Component type and name identified
- [ ] User's intent and context captured
- [ ] Strengths and improvements documented
- [ ] Specific suggestions recorded
- [ ] Appropriate meta agent identified
- [ ] Feedback document created following conventions

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Gather Feedback Context
**Deliverable:** Complete understanding of feedback scope
**Acceptance Criteria:** All feedback dimensions captured
- Identify which component (name and type)
- Understand what user was trying to accomplish
- Document what worked well
- Capture what could be improved
- Record specific suggestions

### Step 2: Create Feedback Document
**Deliverable:** Structured feedback document
**Acceptance Criteria:** Document follows all conventions
- Use [[feedback-template]] structure
- Follow [[mvpm-issue-conventions]]
- Save in appropriate location:
  - Existing issue folder if related
  - Subject's backlog folder otherwise
- Use naming pattern: `feedback-[component-type]-[component-name]-[YYYYMMDD].md`

### Step 3: Route to Meta Agent
**Deliverable:** Feedback routed to correct processor
**Acceptance Criteria:** Appropriate expert identified
- Determine component type and route accordingly:
  - Agents → [[meta-sub-agent-architect]]
  - Templates → [[meta-template-expert]]
  - Workflows → [[meta-workflow-specialist]]
  - Prompts → [[meta-prompt-engineer]]

### Step 4: Apply and Continue
**Deliverable:** Improved interaction
**Acceptance Criteria:** Feedback integrated into current work
- Adjust current approach based on feedback
- Continue conversation normally
- Apply immediate learnings

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN capturing feedback
**Best Practices:**
- Be thorough in capturing all details
- Focus on constructive suggestions
- Include specific examples where possible

**Requirements:**
- Document must be actionable for meta agent
- All feedback dimensions must be captured
- Routing must match component type

### WHEN processing feedback
**Conventions:**
- Follow [[mvpm-issue-conventions]] for documentation
- Use established file naming patterns
- Maintain proper folder structure

**Rules:**
- ALWAYS create a feedback document before proceeding
- ALWAYS identify the correct meta agent
- NEVER skip feedback capture steps
- MUST ensure feedback is actionable

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Structured feedback document in Markdown with systematic organization

### Delivery Instructions
1. Create feedback document using [[feedback-template]]
2. Save following [[mvpm-issue-conventions]]
3. Confirm capture with brief summary
4. Continue conversation with applied learnings

### Success Confirmation Template
```markdown
## Feedback Captured Successfully

**Component:** [Type] - [Name]
**Routed to:** [[appropriate-meta-agent]]
**Location:** [File path]

**Summary:** [Brief overview of key feedback points]

Continuing with your task, applying the feedback insights...
```