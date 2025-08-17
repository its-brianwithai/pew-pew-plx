---
name: template-rules
description: "Rules for creating templates, placeholders, variables, and examples in documentation."
---
# Instruction Command

When this command is used, acknowledge that you understand these instructions and will follow them throughout the conversation. Then await the user's request.

---

## 📏 Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN placing instruction placeholders ALWAYS use single square brackets for placeholder instructions.
  - Example: [Replace this with actual content]
- WHEN creating template variables ALWAYS use double curly brackets WITH backticks to indicate template variables.
    - Example: `{{variable-name}}`
- WHEN referencing parts of the document ALWAYS use template variables.
  - Example: Follow instruction in `{{variable-name}}` when [some condition].
- WHEN demonstrating examples ALWAYS put them inside an example tag inside a codeblock.
    - Example: See `{{example}}`
- WHEN creating examples ALWAYS describe the example types instead of actual examples.
    - Example: See `{{example}}`
- WHEN creating examples that need multiple items ALWAYS describe ALL types on ONE line (e.g., "architectural decisions, limitations, dependencies, performance considerations").
    - Example: See `{{multiple-items-example}}`
- WHEN examples require specific structure (like steps with substeps) ALWAYS show the exact structure with inline [placeholder] instructions while keeping type descriptions on single lines.
    - Example: See `{{structured-example}}`
- WHEN creating examples for structured content (like nested lists, hierarchies, or multi-level content) NEVER show the structure - ONLY describe what types go there in a single line.
- WHEN an example has complex formatting IGNORE the formatting and ONLY list the content types.

### 👎 Never

- WHEN creating examples NEVER use actual content, only describe the types of examples.
- WHEN creating examples NEVER use multiple lines for the example types.

### 🚫 Example Structure Rule
NEVER recreate the structure of what you're documenting in the example. The example should ONLY contain:
1. First line: [Description of all the types that go in this section]
2. Second line: [Additional items if needed]  
3. Third line: [...]

Even if the actual content has bullets, sub-bullets, multiple levels, categories, etc - IGNORE ALL OF THAT in the example.

### ✅ Good Examples

#### Basic Example
`{{example}}`:
```
<example>
- [Describe the example types]
- [More examples if needed]
- [...]
</example>
```

#### Multiple Items Example
`{{multiple-items-example}}`:
```
<example>
- [Architectural decision types, limitation types, dependency types, performance consideration types, and any other relevant context types]
- [Additional collections of related types if needed]
- [...]
</example>
```

#### Structured Example
`{{structured-example}}`:
```
<example>
1. [First action type]: [Description of what this action does]
   - [Sub-step type if the structure requires it]
   - [Another sub-step type]
2. [Second action type]: [Description of this action]
3. [More action types as needed]
[...]
</example>
```

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
