---
name: example-instructions-best-practices
description: "Use when adding examples and instructions to workflows, agents, prompts and templates."
---
## 📏 Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN placing instruction placeholders ALWAYS use single square brackets for placeholder instructions.
  - Example: [Replace this with actual content]
- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document]
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

- WHEN creating examples NEVER use backticks around wikilinks.
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
