---
name: promptorial-template
description: Use this template when creating promptorials - tutorials that teach through a structured series of prompts following the modular prompt philosophy. Each prompt builds from inline to extracted to composed patterns.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🎯 `{{title}}`: Master [Outcome] in `{{prompt-count}}` Prompts
> 💡 *Transform [initial capability] into [mastery level] through `{{prompt-count}}` carefully crafted prompts that evolve from monolithic to modular, teaching the core prompt components and reusability patterns.*

[One paragraph that frames the transformation - from writing repetitive, inconsistent prompts to building a reusable prompt library that scales across projects]

---

## 🎯 The End Goal
> 💡 *The measurable objective that determines success - your north star for this promptorial.*

### What You'll Achieve
[Clear statement of the specific capability or system you'll have built by the end]

### Success Metrics
[How you'll know you've succeeded - specific, measurable outcomes]

```
<example>
- [Time saved metric type, quality improvement type, consistency measure type]
- [Reusability percentage type, prompt library size type, automation level type]
- [Team adoption rate type, error reduction type, output standardization type]
</example>
```

---

## 📚 Core Concepts: The Modular Prompt Philosophy
> 💡 *Understanding the building blocks that make prompts powerful and reusable.*

### The Prompt Component Model
Every effective prompt consists of modular components, each included only when it contributes to the end goal:

| Component | Symbol | Purpose | When to Include |
|:----------|:-------|:--------|:----------------|
| **End Goal** | 🎯 | Measurable objective | Always - defines success |
| **Persona** | 👤 | Expertise attributes | When specialized knowledge helps |
| **Request** | 📋 | Verb-first activity | Always - the core action |
| **Workflow** | 🔄 | Multi-step process | When sequential steps needed |
| **Instructions** | 📏 | Rules and constraints | When guidance improves quality |
| **Output Format** | 📊 | Structure specification | When format matters |

### The Evolution Pattern
[Explain the natural progression from inline to modular]

```
<example>
1. [Inline phase type]: [Description of starting with everything in one prompt]
2. [Extraction phase type]: [Description of identifying patterns and extracting to files]
3. [Reference phase type]: [Description of using wikilinks for components]
4. [Composition phase type]: [Description of building agents from components]
</example>
```

---

## 📋 Prerequisites & Setup
> 💡 *Minimal requirements to start your prompt evolution journey.*

### Required
- [Tool or platform needed]
- [Time commitment]
- [Baseline understanding]

### You'll Build
- [Number] reusable prompt components
- [Number] composed agents
- [Type] of prompt library

---

## 🚀 Phase 1: Monolithic Foundation
> 💡 *Start with complete, working prompts - optimization comes after functionality.*

### Prompt 1: The Complete Inline Prompt
```
# Everything defined directly in the prompt

End Goal: [Specific measurable outcome]

Persona: [Complete expertise definition inline]

Request: [Verb-first activity with all details]

Workflow:
1. [Step with complete description]
2. [Step with complete description]
3. [Step with complete description]

Instructions:
- When [scenario], then [action]
- When [scenario], then [action]

Output Format:
[Complete format specification inline]
```

**What You Learned:** 
[Principle about starting with complete solutions]

**Try This:**
[Specific task using the complete prompt]

**Key Insight:**
[Why monolithic prompts are the right starting point]

---

## 🔧 Phase 2: Pattern Recognition
> 💡 *Identify what repeats across prompts - these become your reusable components.*

### Prompt 2: Identifying Reusable Personas
```
# Notice the repeated persona pattern

End Goal: [Different goal than Prompt 1]

Persona: [Same expertise as Prompt 1 - candidate for extraction]

Request: [New request]

[Rest of prompt]
```

**Pattern Spotted:** 
[Explanation of the repeated persona]

**Extraction Candidate:**
- File: `personas/{{persona-name}}.md`
- Content: [What would go in the extracted file]

### Prompt 3: Common Workflows Emerge
```
# Workflow patterns become visible

End Goal: [Another different goal]

Workflow: [Similar steps to previous prompts - extraction candidate]
1. [Repeated step type]
2. [Repeated step type]
3. [Unique step]

[Rest of prompt]
```

**Pattern Library Growing:**
- Personas: `{{count}}` identified
- Workflows: `{{count}}` identified
- Instructions: `{{count}}` identified

---

## 🔄 Phase 3: Extraction & Modularization
> 💡 *Transform inline components into reusable files with wikilink references.*

### Prompt 4: First WikiLink Reference
```
# Replace inline with references

End Goal: [Specific goal]

Persona: [[expert-persona-name]]

Request: [Activity]

Workflow: [[standard-workflow-name]]

Instructions: [[project-conventions]]

Output Format: [[standard-template]]
```

**What Changed:**
- Inline → External files
- Duplication → Single source of truth
- Static → Dynamically loaded

**File Structure Created:**
```
<example>
personas/
  └── [persona filename type].md
workflows/
  └── [workflow filename type].md
instructions/
  └── [instruction filename type].md
templates/
  └── [template filename type].md
</example>
```

### Prompt 5: Embedded Content Strategy
```
# Embedding for immediate inclusion

End Goal: [Goal requiring full content]

![[complete-persona-definition-example-wiki-link]]

Request: [Specific activity]

![[complex-workflow-steps-example-wiki-link]]

Output: [[template-reference]]
```

**Reference vs Embed:**
- `[[component]]` → Loaded when accessed
- `![[component-example-wiki-link]]` → Content inserted at sync

---

## 🤖 Phase 4: Agent Composition
> 💡 *When components naturally align, compose them into reusable agents.*

### Prompt 6: Natural Agent Emergence
```
# Components that work together become agents

![[agent-name-example-wiki-link]]
# Contains: persona + workflow + instructions + output format

Request: [Only the specific request remains]
```

**Agent Composition:**
```
<example>
agents/`{{category}}`/`{{agent-name}}`.md:
- [Persona section type]
- [Workflow section type]
- [Instructions section type]
- [Output format section type]
</example>
```

### Prompt 7: Agent Reusability
```
# Same agent, different request

![[agent-name-example-wiki-link]]

Request: [Different specific task for same agent]
```

**Reusability Achieved:**
- One agent → Many use cases
- Consistent behavior → Predictable results
- Central updates → Global improvements

---

## 🎯 Phase 5: Universal Patterns
> 💡 *Meta-prompts that create or transform other prompts.*

### Prompt 8: The Prompt Generator
```
# Meta-prompt for creating new prompts

End Goal: Generate a new prompt for [capability]

Persona: [[prompt-architect]]

Request: Create a prompt that [specific requirement]

Workflow: [[prompt-creation-workflow]]
1. Analyze end goal
2. Identify required components
3. Check for existing patterns
4. Compose or create components
5. Validate completeness

Instructions: [[prompt-best-practices]]

Output Format: [[standard-prompt-template]]
```

**Meta-Level Mastery:**
[How this prompt creates other prompts]

---

## 📊 Your Modular Prompt System
> 💡 *The complete component library you've built.*

### Component Inventory
| Type | Count | Reusability | Location |
|:-----|:------|:------------|:---------|
| Personas | `{{count}}` | [Usage frequency] | `personas/` |
| Workflows | `{{count}}` | [Usage frequency] | `workflows/` |
| Instructions | `{{count}}` | [Usage frequency] | `instructions/` |
| Templates | `{{count}}` | [Usage frequency] | `templates/` |
| Agents | `{{count}}` | [Usage frequency] | `agents/` |

### Evolution Metrics
- **Before:** [Inline prompt count] unique prompts
- **After:** [Component count] reusable components
- **Reuse Rate:** [Percentage] of prompts use shared components
- **Maintenance:** [Reduction percentage] in update effort

---

## 🔗 WikiLink Mastery
> 💡 *Advanced techniques for component referencing and composition.*

### Reference Patterns
```
<example>
- [Standard reference type]: [[component-name]]
- [Embedded reference type]: ![[component-name-example-wiki-link]]
- [Partial reference type]: [[component#section]]
- [Aliased reference type]: [[component|display-name]]
</example>
```

### Sync Transformation
```
# Development time
[[component]] → @path/to/component.md
![[component-example-wiki-link]] → [actual content inserted]

# After plx sync claude
Dynamic loading and content embedding
```

---

## 💡 Principles Mastered
> 💡 *Core concepts you can apply to any prompt engineering challenge.*

1. **Start Monolithic:** [Principle about complete solutions first]
2. **Extract Patterns:** [Principle about identifying repetition]
3. **Modularize Components:** [Principle about single responsibility]
4. **Compose Agents:** [Principle about natural alignment]
5. **Enable Reusability:** [Principle about scaling through references]

---

## 🚀 Implementation Checklist
> 💡 *Systematic steps to build your own modular prompt system.*

### Immediate Actions
- [ ] Audit existing prompts for patterns
- [ ] Create first extracted persona
- [ ] Convert one workflow to external file
- [ ] Test first wikilink reference

### System Building
- [ ] Establish component directories
- [ ] Document naming conventions
- [ ] Create component templates
- [ ] Set up sync process

### Scale Strategy
- [ ] Train team on modular approach
- [ ] Build shared component library
- [ ] Implement versioning strategy
- [ ] Measure reuse metrics

---

## 📚 Component Templates
> 💡 *Starter templates for each component type.*

### Persona Template
```
# [[persona-name]]
[Expertise and characteristics definition]
```

### Workflow Template
```
# [[workflow-name]]
1. [Step with deliverable]
2. [Step with acceptance criteria]
3. [Step with validation]
```

### Instructions Template
```
# [[instruction-set-name]]
- When [condition], then [action]
- When [condition], then [action]
```

---

## ❓ Common Questions
> 💡 *Troubleshooting the modular prompt journey.*

**Q: When should I extract a component?**
A: [Answer about repetition threshold and value]

**Q: How do I handle component versions?**
A: [Answer about versioning strategy]

**Q: What if components need customization?**
A: [Answer about parameters and overrides]