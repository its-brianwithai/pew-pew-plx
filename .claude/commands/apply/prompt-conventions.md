---
name: prompt-conventions
description: "Conventions for creating and organizing prompts following the modular philosophy."
---
# Instruction Command

When this command is used, acknowledge that you understand these instructions and will follow them throughout the conversation. Then await the user's request.

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
- ALWAYS place in the root @prompts/` directory
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

## 📏 Wikilink Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document-wl-example]]
- WHEN creating example wikilinks that don't reference real files ALWAYS end them with "-wl-example".
  - Example: [[filename-wl-example]]
  - Example: ![[embedded-content-wl-example]]
- WHEN using embedded wikilinks ALWAYS place `![[filename-wl-example]]` on its own line.
  - The entire line gets replaced with file content during sync
- WHEN creating templates/prompts ALWAYS remember embedded wikilinks replace the entire line.

### 👎 Never

- WHEN creating wikilinks NEVER use backticks around wikilinks.
  - Wrong: `[[document-wl-example]]`
  - Right: [[document-wl-example]]
- WHEN using embedded wikilinks NEVER place them inline with other text.
  - Wrong: Some text ![[embedded-content-wl-example]] more text
  - Right: 
    ```
    Some text
    ![[embedded-content-wl-example]]
    More text
    ```
- WHEN creating artifacts NEVER forget embedded wikilinks must be on separate lines.

### 🔄 WikiLink Processing Details

**Regular wikilinks** `[[filename-wl-example]]`:
- Converted to `@full/path` references during sync
- Used for referencing other documents
- Processed by `sync-claude-code-wikilinks.sh`

**Embedded wikilinks** `![[filename-wl-example]]`:
- Entire line replaced with file content during sync
- Used for including content from another file
- Processed by `sync-claude-code-embedded-wikilinks.sh`
- MUST be on their own line - the entire line gets replaced

### ✅ Good WikiLink Examples

#### Regular WikiLink Reference
```markdown
For more details, see [[agent-template-wl-example]] for the standard structure.
The [[template-rules-wl-example]] define formatting standards.
```

#### Embedded WikiLink (Content Inclusion)
```markdown
## Instructions

Follow these core instructions:

![[standard-instructions-wl-example]]

Additional project-specific steps:
1. [First step]
2. [Second step]
```

### ❌ Bad WikiLink Examples

#### Never Wrap in Backticks
```markdown
# Wrong
See `[[agent-template-wl-example]]` for details.

# Right
See [[agent-template-wl-example]] for details.
```

#### Never Use Embedded WikiLinks Inline
```markdown
# Wrong
The instructions are: ![[standard-instructions-wl-example]] and then continue.

# Right
The instructions are:

![[standard-instructions-wl-example]]

And then continue.
```

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
