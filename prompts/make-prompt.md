---
name: make-prompt
description: "Use this prompt to transform any input material into a well-structured prompt following the project's prompt template."
---

# 🔮 Make Prompt: Transform Content into Structured Prompts
> 💡 *Transform any input material into production-ready prompts by extracting intent, mapping to components, and following the prompt template structure.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Transform input material into a prompt that:
- Captures the essential intent from source material
- Structures it according to @templates/meta/prompt-template.md
- Includes only components that contribute to the goal
- Follows all project conventions for prompts
- Creates an immediately usable artifact
- Maximizes reusability through proper componentization

## 👤 Persona

![[meta-prompt-engineer]]

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Transform the user's input material into a structured prompt by:
1. Analyzing the source material's content and intent
2. Extracting prompt components from the source
3. Mapping content to prompt template structure
4. Synthesizing the new prompt
5. Identifying reusable components
6. Creating the final prompt file

### Deliverables
- Complete prompt following template structure
- Mapping of source elements to prompt components
- Extracted reusable components (personas, workflows, etc.)
- Written to `prompts/` directory with proper naming

### Acceptance Criteria
- [ ] Core intent captured and expressed
- [ ] Template structure followed exactly
- [ ] Only necessary sections included
- [ ] All valuable information preserved
- [ ] Components properly modularized
- [ ] Output immediately usable

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