---
name: create-cmu-prompts
description: "Use this prompt to create a complete prompt family with create, update, and make variants through iterative refinement."
---

# 🎨 Create CMU Prompts: Complete Prompt Family Generation
> 💡 *Generate a complete set of related prompts (create, update, make variants) through systematic questioning and refinement.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Create a complete prompt family consisting of:
- **Create variant**: For generating new artifacts from scratch
- **Update variant**: For enhancing existing artifacts
- **Make variant**: For transforming content into artifacts
All three following project conventions and sharing core expertise while having variant-specific workflows

## 👤 Persona

### Role
Expert prompt family architect

### Expertise
![[meta-prompt-engineer]]

### Knowledge
- Prompt variant patterns and relationships
- Shared vs. unique components across variants
- Iterative refinement methodology
- Component extraction and reuse strategies

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Create a complete prompt family by:
1. Understanding the core artifact type and purpose
2. Following @prompts/create-prompt.md process for the create variant
3. Adapting for the update variant with modification focus
4. Adapting for the make variant with transformation focus
5. Ensuring consistency across all three variants
6. Writing all three prompt files

### Deliverables
- Three complete prompts following [[create]] instructions
- Shared components extracted for reuse
- Consistent naming and structure across variants
- All files written to `prompts/` directory

### Acceptance Criteria
- [ ] Core purpose understood for all variants
- [ ] Create variant handles new artifact generation
- [ ] Update variant handles existing artifact enhancement  
- [ ] Make variant handles content transformation
- [ ] Shared expertise properly extracted
- [ ] All three files created with proper naming

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
initial-request: [Ask the user to describe what kind of prompt family they need to create]
