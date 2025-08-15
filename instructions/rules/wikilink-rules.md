---
name: wikilink-rules
description: "Rules for using wikilinks and embedded wikilinks in documentation."
---
## 📏 Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document]]
- WHEN creating example wikilinks that don't reference real files ALWAYS end them with "-wikilink-example".
  - Example: [[filename-wikilink-example]]
  - Example: ![[embedded-content-wikilink-example]]
- WHEN using embedded wikilinks ALWAYS place `![[filename-wikilink-example]]` on its own line.
  - The entire line gets replaced with file content during sync
- WHEN creating templates/prompts ALWAYS remember embedded wikilinks replace the entire line.

### 👎 Never

- WHEN creating wikilinks NEVER use backticks around wikilinks.
  - Wrong: `[[document-wikilink-example]]`
  - Right: [[document-wikilink-example]]
- WHEN using embedded wikilinks NEVER place them inline with other text.
  - Wrong: Some text ![[embedded-content-wikilink-example]] more text
  - Right: 
    ```
    Some text
    ![[embedded-content-wikilink-example]]
    More text
    ```
- WHEN creating artifacts NEVER forget embedded wikilinks must be on separate lines.

### 🔄 WikiLink Processing Details

**Regular wikilinks** `[[filename-wikilink-example]]`:
- Converted to `@full/path` references during sync
- Used for referencing other documents
- Processed by `sync-claude-code-wikilinks.sh`

**Embedded wikilinks** `![[filename-wikilink-example]]`:
- Entire line replaced with file content during sync
- Used for including content from another file
- Processed by `sync-claude-code-embedded-wikilinks.sh`
- MUST be on their own line - the entire line gets replaced

### ✅ Good WikiLink Examples

#### Regular WikiLink Reference
```markdown
For more details, see [[agent-template]] for the standard structure.
The [[template-rules]] define formatting standards.
```

#### Embedded WikiLink (Content Inclusion)
```markdown
## Instructions

Follow these core instructions:

![[standard-instructions-wikilink-example]]

Additional project-specific steps:
1. [First step]
2. [Second step]
```

### ❌ Bad WikiLink Examples

#### Never Wrap in Backticks
```markdown
# Wrong
See `[[agent-template]]` for details.

# Right
See [[agent-template]] for details.
```

#### Never Use Embedded WikiLinks Inline
```markdown
# Wrong
The instructions are: ![[standard-instructions-wikilink-example]] and then continue.

# Right
The instructions are:

![[standard-instructions-wikilink-example]]

And then continue.
```
