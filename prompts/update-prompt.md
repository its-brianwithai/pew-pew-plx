---
name: update-prompt
description: "Use this prompt to iteratively update an existing prompt through a question-driven refinement process."
---

# 🔄 Update Prompt: Iterative Prompt Enhancement
> 💡 *Transform existing prompts into improved versions through systematic questioning and refinement.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Update an existing prompt to:
- Address identified weaknesses or gaps
- Improve clarity and effectiveness
- Maintain backward compatibility where needed
- Follow current template conventions
- Enhance performance and results

## 👤 Persona

![[meta-prompt-engineer]]

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Update an existing prompt through iterative refinement by:
1. Reading and analyzing the current prompt
2. Identifying improvement opportunities
3. Asking focused clarifying questions
4. Updating the prompt after each answer
5. Continuing until user confirms completion

### Deliverables
- Updated prompt following @templates/meta/prompt-template.md
- Clear documentation of changes made
- Preserved functionality with enhancements
- Updated file in `prompts/` directory

### Acceptance Criteria
- [ ] Existing prompt thoroughly analyzed
- [ ] Update requirements fully understood
- [ ] All improvements properly integrated
- [ ] User confirms updates are complete
- [ ] File updated with version notes

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
prompt-name: [Ask the user which prompt to update]
update-request: [Ask the user what needs to be changed or improved]