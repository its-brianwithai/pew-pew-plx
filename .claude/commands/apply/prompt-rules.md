---
name: prompt-rules
description: "Strict rules for prompt creation and component inclusion that must be followed without exception."
---
# Instruction Command

When this command is used, acknowledge that you understand these instructions and will follow them throughout the conversation. Then await the user's request.

---


# 📏 Prompt Rules
> 💡 *Absolute requirements and prohibitions for creating prompts that follow the modular philosophy.*

## 👍 Always Rules

### WHEN creating any prompt
- ALWAYS start with defining the End Goal first
- ALWAYS include both End Goal and Request sections (minimum required)
- ALWAYS follow the exact structure from @templates/meta/prompt-template.md
- ALWAYS use verb-subject naming pattern for files
- ALWAYS include YAML frontmatter with name and description

### WHEN defining the End Goal
- ALWAYS make it specific and measurable
- ALWAYS write it as an outcome, not a process
- ALWAYS keep it concise but complete
- ALWAYS use it as the filter for all other sections
- ALWAYS ensure success can be clearly determined

### WHEN adding optional sections
- ALWAYS verify each section contributes to the End Goal
- ALWAYS document why the section is included (in comments if needed)
- ALWAYS test if the prompt would fail without the section
- ALWAYS exclude sections that don't pass the contribution test
- ALWAYS prefer exclusion when value is uncertain

### WHEN structuring the Request section
- ALWAYS start with a verb (Create, Update, Analyze, Transform, etc.)
- ALWAYS specify the complete scope of work
- ALWAYS include deliverables if specific outputs are required
- ALWAYS add acceptance criteria if success needs validation
- ALWAYS keep the main request concise and clear

### WHEN creating Workflow sections
- ALWAYS make steps atomic and testable
- ALWAYS include deliverables for each step
- ALWAYS specify acceptance criteria per step
- ALWAYS use descriptive step names
- ALWAYS number steps sequentially

### WHEN writing Instructions sections
- ALWAYS use the WHEN/THEN event pattern
- ALWAYS group by scenario or context
- ALWAYS include only rules that prevent failure
- ALWAYS make instructions actionable and specific
- ALWAYS avoid redundancy with other sections

### WHEN implementing WikiLinks
- ALWAYS verify the target file exists
- ALWAYS use exact file names without extensions
- ALWAYS place embedded wikilinks `![[name-wl-example]]` on their own line
- ALWAYS use standard wikilinks `[[name-wl-example]]` for references
- ALWAYS test wikilink resolution before committing

### WHEN extracting components
- ALWAYS wait until a pattern is used 3+ times
- ALWAYS extract to the appropriate directory
- ALWAYS generalize for maximum reusability
- ALWAYS update all prompts using the component
- ALWAYS maintain backward compatibility

### WHEN creating CMU variants
- ALWAYS share the same embedded workflow (if used)
- ALWAYS share the same embedded instructions
- ALWAYS share the same output format
- ALWAYS differentiate only the Request and End Goal
- ALWAYS maintain consistency across all three variants

### WHEN following conventions
- ALWAYS use kebab-case for file names
- ALWAYS place prompts in the root prompts/ directory
- ALWAYS follow established project patterns
- ALWAYS maintain consistent formatting
- ALWAYS validate before syncing

## 👎 Never Rules

### WHEN creating prompts
- NEVER skip the End Goal section
- NEVER skip the Request section
- NEVER include sections without clear value
- NEVER deviate from @templates/meta/prompt-template.md structure
- NEVER create prompts without YAML frontmatter

### WHEN evaluating components
- NEVER include a section just because it's in the template
- NEVER include components "just in case"
- NEVER include sections by convention alone
- NEVER keep components that don't contribute to End Goal
- NEVER prioritize completeness over effectiveness

### WHEN writing content
- NEVER use vague or ambiguous language
- NEVER write process-focused End Goals
- NEVER start Request with a noun
- NEVER create untestable workflow steps
- NEVER duplicate information across sections

### WHEN using WikiLinks
- NEVER wrap wikilinks in backticks
- NEVER place embedded wikilinks inline with text
- NEVER use wikilinks to non-existent files
- NEVER use relative paths in wikilinks
- NEVER forget to test wikilink resolution

### WHEN extracting components
- NEVER extract single-use components
- NEVER create circular dependencies
- NEVER extract without documenting
- NEVER break existing prompts during extraction
- NEVER extract unstable or untested components

### WHEN organizing files
- NEVER use spaces in file names
- NEVER use underscores in file names
- NEVER create subdirectories in prompts/
- NEVER mix non-prompt files in the directory
- NEVER use uppercase in file names

### WHEN implementing modularity
- NEVER sacrifice clarity for modularity
- NEVER over-extract into tiny components
- NEVER create components without clear boundaries
- NEVER ignore the evolution path (inline → extract → modularize)
- NEVER modularize prematurely

### WHEN handling complexity
- NEVER include more than 5 optional components
- NEVER create deeply nested structures
- NEVER write steps longer than 5 lines
- NEVER create workflows with more than 7 main phases
- NEVER add complexity without clear benefit

### WHEN maintaining prompts
- NEVER commit broken prompts
- NEVER skip validation before sync
- NEVER ignore failing quality checks
- NEVER remove components without updating dependents
- NEVER make breaking changes without documentation

### WHEN documenting
- NEVER skip the description in frontmatter
- NEVER use special characters in the name field
- NEVER write examples that violate @instructions/rules/template-rules.md
- NEVER create examples with actual content (use types only)
- NEVER forget to document major changes

## 🚨 Critical Rules

### MUST Follow Without Exception
- MUST have End Goal and Request sections (absolute minimum)
- MUST follow verb-subject naming pattern
- MUST place embedded wikilinks on separate lines
- MUST verify all wikilinks resolve
- MUST follow @templates/meta/prompt-template.md structure exactly

### MUST Never Do
- MUST NEVER include sections that don't contribute to End Goal
- MUST NEVER use inline embedded wikilinks
- MUST NEVER wrap wikilinks in backticks
- MUST NEVER skip YAML frontmatter
- MUST NEVER commit broken references

## ⚖️ Rule Precedence

When rules conflict, follow this precedence:
1. **End Goal Achievement** - The End Goal supersedes all other considerations
2. **Modularity Principle** - Include only what contributes
3. **Template Structure** - Follow established patterns
4. **Project Conventions** - Maintain consistency
5. **Optimization** - Enhance only after other rules are met

## 🔍 Validation Checklist

Before finalizing any prompt, verify:
- [ ] End Goal is specific and measurable
- [ ] Request starts with a verb
- [ ] Only contributing sections included
- [ ] All wikilinks resolve correctly
- [ ] Embedded wikilinks on separate lines
- [ ] YAML frontmatter is valid
- [ ] File name follows verb-subject pattern
- [ ] Template structure followed exactly
- [ ] No redundant information
- [ ] All rules from this document followed
