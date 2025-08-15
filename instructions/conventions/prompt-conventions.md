---
name: prompt-conventions
description: "Conventions for creating and organizing prompts following the modular philosophy."
---

# 📝 Prompt Conventions
> 💡 *Established patterns and standards for creating modular, reusable prompts that follow the framework philosophy.*

## Naming Conventions

### File Naming Pattern
All prompt files follow the **verb-subject** pattern with kebab-case:
- `create-feature.md` - For creating features
- `update-story.md` - For updating stories  
- `analyze-performance.md` - For analyzing performance
- `transform-data.md` - For transforming data

### Special Naming Patterns
- **CMU Variants**: `create-[subject].md`, `update-[subject].md`, `make-[subject].md`
- **Meta Prompts**: `create-prompt.md`, `update-template.md`, `make-workflow.md`
- **Generic Utility Prompts**: `help.md`, `clarify.md`, `simplify.md`

### WHEN naming prompt files
- ALWAYS start with a verb (create, update, make, analyze, transform, etc.)
- ALWAYS use kebab-case for multi-word names
- ALWAYS keep names concise but descriptive
- NEVER use underscores or spaces
- NEVER start with nouns

## Directory Organization

### Standard Structure
```
prompts/
├── create-*.md          # Creation prompts
├── update-*.md          # Update/enhancement prompts
├── make-*.md            # Transformation prompts
├── analyze-*.md         # Analysis prompts
├── generate-*.md        # Generation prompts
├── validate-*.md        # Validation prompts
└── [verb]-*.md          # Other action prompts
```

### WHEN organizing prompts
- ALWAYS place in the root `prompts/` directory
- ALWAYS group by verb prefix when listing
- NEVER create subdirectories for categories
- NEVER mix non-prompt files in the directory

## Component Extraction Conventions

### Evolution Path
Follow the standard progression:
1. **Inline**: Define all components within the prompt
2. **Extract**: Move reusable parts to separate files
3. **Reference**: Use `[[wikilinks-wl-example]]` for references
4. **Embed**: Use `![[wikilinks-wl-example]]` for content inclusion

### Extraction Criteria
Extract a component when:
- It's used in 3+ prompts
- It represents specialized expertise (→ persona)
- It's a complex multi-step process (→ workflow)
- It defines reusable rules (→ instructions)
- It specifies output structure (→ output format)

### WHEN extracting components
- ALWAYS extract to the appropriate directory
- ALWAYS use descriptive names for extracted files
- ALWAYS update all prompts using the component
- NEVER extract single-use components
- NEVER create circular dependencies

![[wikilink-rules]]

## YAML Frontmatter Standards

### Required Fields
```yaml
---
name: verb-subject
description: "Clear description of what this prompt achieves."
---
```

### WHEN adding frontmatter
- ALWAYS include name and description
- ALWAYS wrap description in quotes
- ALWAYS use kebab-case for name
- NEVER skip frontmatter in prompts
- NEVER use special characters in name field

## Modular Philosophy Implementation

### Component Inclusion Criteria
Only include a component if it:
1. Directly contributes to the End Goal
2. Improves outcome quality measurably
3. Prevents common failures
4. Cannot be achieved without it

### Section Priority
1. **End Goal** - Always required, defines everything
2. **Request** - Always required, the core action
3. **Persona** - Optional, only if expertise matters
4. **Workflow** - Optional, only if multi-step
5. **Instructions** - Optional, only if rules prevent failure
6. **Output Format** - Optional, only if structure matters

### WHEN implementing modularity
- ALWAYS start with End Goal
- ALWAYS evaluate each section against End Goal
- ALWAYS document why sections are included
- NEVER include sections by default
- NEVER add sections just because template has them
