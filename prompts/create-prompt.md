---
name: create-prompt
description: "Use this prompt to iteratively create an optimized prompt through a question-driven refinement process."
---

# 🎨 Create Prompt: Iterative Prompt Engineering
> 💡 *Transform initial requirements into production-ready prompts through systematic questioning and refinement.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Create an optimized, structured prompt that:
- Captures the exact intent and requirements
- Follows project prompt template conventions
- Maximizes clarity and effectiveness
- Includes only necessary components
- Is immediately usable without modification

## 👤 Persona

![[meta-prompt-engineer]]

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Create a new prompt through iterative refinement by:
1. Analyzing initial requirements
2. Asking focused clarifying questions
3. Updating the prompt after each answer
4. Continuing until user confirms readiness

### Deliverables
- Complete prompt following @templates/meta/prompt-template.md
- Only included sections that contribute to end goal
- Clear structure with appropriate components
- Written to `prompts/` directory

### Acceptance Criteria
- [ ] Initial requirements fully understood
- [ ] All ambiguities clarified through questions
- [ ] Prompt follows template structure exactly
- [ ] User confirms prompt meets needs
- [ ] File created with proper naming convention

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

![[prompt-workflow]]

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

![[prompt-conventions]]

![[prompt-best-practices]]

![[prompt-rules]]

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

![[prompt-template]]

---
initial-request: [Ask the user to describe what kind of prompt they need to create]