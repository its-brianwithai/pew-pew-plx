---
name: agent-conventions
description: "Naming patterns and structural conventions for creating agents that maintain consistency across the framework."
---

# 📝 Agent Conventions
> 💡 *Established patterns and standards for creating consistent, discoverable agents.*

## Naming Conventions

### WHEN naming agent files
**Patterns:**
- Use kebab-case exclusively: `flutter-developer.md`, `code-reviewer.md`
- Be descriptive and specific: `meta-prompt-engineer.md` not `prompt-helper.md`
- Include domain prefix when appropriate: `meta-`, `flutter-`, `maestro-`
- Match the purpose clearly: name should indicate what the agent does

**Rules:**
- ALWAYS use lowercase letters and hyphens only
- ALWAYS make names self-documenting
- NEVER use underscores, spaces, or special characters
- NEVER use generic names like `helper.md` or `assistant.md`

## Frontmatter Structure

### WHEN creating agent frontmatter
**Required Fields:**
```yaml
---
name: agent-name-here
description: "Expert description. Use when specific conditions."
color: ColorName
---
```

**Conventions:**
- ALWAYS include all three fields: name, description, color
- ALWAYS wrap description in double quotes
- ALWAYS use action-oriented descriptions starting with expertise
- ALWAYS include "Use when..." pattern in description
- NEVER omit any required field
- NEVER use single quotes for description

**Color Selection Guidelines:**
- Choose colors that haven't been used by related agents
- Consider the domain: Blue for meta, Green for dev, Purple for review
- Maintain visual distinction in Claude Code interface

## Directory Organization

### WHEN organizing agents in the filesystem
**Structure Pattern:**
```
agents/
├── meta/         # Meta-level agents for framework tasks
├── dev/          # Development and coding agents
├── plan/         # Planning and organization agents
├── review/       # Review and quality agents
├── claude/       # Claude Code specific agents
└── [domain]/     # Domain-specific directories as needed
```

**Placement Rules:**
- ALWAYS place agents in appropriate subdirectory based on function
- ALWAYS create new subdirectory if domain doesn't fit existing ones
- NEVER place agents directly in root agents/ directory
- NEVER mix domains within subdirectories

## Agent Description Patterns

### WHEN writing agent descriptions
**Format Template:**
```
"[Expertise statement]. Use when [specific trigger conditions or scenarios]."
```

**Examples:**
- "Expert Flutter developer specializing in widget creation. Use when building or debugging Flutter applications."
- "Expert prompt engineer for Claude Code. Use when creating or optimizing prompts for AI systems."
- "Expert code reviewer. Use when conducting comprehensive code reviews."

**Requirements:**
- Start with expertise declaration
- Include specific "Use when" triggers
- Keep under 160 characters when possible
- Make delegation automatic through clarity

## Section Organization

### WHEN structuring agent content
**Required Sections Order:**
1. # 🎯 Purpose & Role
2. ## 🚶 Instructions
3. ## ⭐ Best Practices
4. ## 📏 Rules
5. ## 🔍 Relevant Context
6. ## 📊 Quality Standards
7. ## 📤 Report / Response

**Section Conventions:**
- ALWAYS include all sections even if minimal
- ALWAYS use exact emoji and headers shown
- ALWAYS start Instructions with instruction 0 (scope analysis)
- NEVER skip sections or change order
- NEVER modify section headers or emojis

## WikiLink Conventions

### WHEN referencing other documents in agents
**Reference Patterns:**
- Use `[[document-name-wl-example]]` for references (no path needed)
- Use `![[document-name-wl-example]]` for embedding content (must be on own line)
- End example wikilinks with `-wl-example`

**Common References:**
- `[[agent-template]]` - Reference to agent template
- `[[workflow-name]]` - Reference to workflows
- `[[instruction-name-wl-example]]` - Reference to instructions
- `![[agent-workflow]]` - Embed entire workflow

**Rules:**
- ALWAYS verify wikilinks resolve to actual files
- ALWAYS place embedded wikilinks on their own line
- NEVER wrap wikilinks in backticks
- NEVER use paths in wikilinks

## Tool Specification Conventions

### WHEN defining agent tools
**Inheritance Pattern:**
```yaml
# For broad tool access (inherits all):
# (omit tools field entirely)

# For restricted access:
tools: "Read, Write, Edit"
```

**Security Considerations:**
- Omit tools field for maximum flexibility (includes MCP tools)
- List specific tools for security-sensitive agents
- Consider principle of least privilege
- Document tool requirements in Purpose section

## Instruction Numbering

### WHEN writing the Instructions section
**Standard Pattern:**
```markdown
## 🚶 Instructions

**0. Deep Understanding & Scope Analysis:** [Standard scope instruction]

1. **ACTION - Description:** [First action]
2. **ACTION - Description:** [Second action]
3. **ACTION - Description:** [Third action]
```

**Requirements:**
- ALWAYS start with instruction 0 for scope analysis
- ALWAYS use bold formatting for action names
- ALWAYS number sequentially
- ALWAYS make instructions actionable
- NEVER skip instruction 0
- NEVER use letters or roman numerals

## Quality Standards Format

### WHEN creating the Quality Standards section
**Table Template:**
```markdown
| Category | Standard | How to Verify |
|:---------|:---------|:--------------|
| [Category] | [Specific measurable standard] | [Verification method] |
```

**Requirements:**
- Use markdown table format
- Include at least 3-5 quality categories
- Make standards measurable
- Provide clear verification methods
- Align columns with colons
