---
name: agent-rules
description: "Strict ALWAYS and NEVER rules that must be followed without exception when creating agents."
---

# 📏 Agent Rules
> 💡 *Non-negotiable rules that ensure agent quality, security, and consistency.*

## 👍 Always

### WHEN creating new agents
- ALWAYS include all required sections from [[agent-template]]
- ALWAYS start with single, focused purpose
- ALWAYS include YAML frontmatter with name, description, and color
- ALWAYS verify all wikilinks resolve to actual files
- ALWAYS follow kebab-case naming convention
- ALWAYS place agents in appropriate subdirectory

### WHEN writing agent descriptions
- ALWAYS include expertise statement first
- ALWAYS use "Use when..." pattern for delegation
- ALWAYS wrap description in double quotes
- ALWAYS keep descriptions action-oriented
- ALWAYS make delegation triggers specific

### WHEN structuring agent content
- ALWAYS include instruction 0 for scope analysis
- ALWAYS use exact section headers and emojis from template
- ALWAYS maintain section order from template
- ALWAYS provide clear output format specification
- ALWAYS include quality standards table

### WHEN defining tool access
- ALWAYS consider security implications
- ALWAYS document tool requirements in Purpose section
- ALWAYS apply principle of least privilege
- ALWAYS justify any broad tool access
- ALWAYS review MCP tool implications

### WHEN using wikilinks
- ALWAYS verify referenced files exist
- ALWAYS place embedded wikilinks on separate lines
- ALWAYS use standard wikilink format without backticks
- ALWAYS end example wikilinks with "-wikilink-example"
- ALWAYS check for circular dependencies

### WHEN writing instructions
- ALWAYS make instructions actionable and specific
- ALWAYS use numbered format starting with 0
- ALWAYS bold action names in instructions
- ALWAYS include error handling guidance
- ALWAYS provide success criteria

### WHEN documenting context
- ALWAYS include Project Files & Code section
- ALWAYS include Documentation & External Resources section
- ALWAYS provide relevance notes for each reference
- ALWAYS organize references by category
- ALWAYS verify external links are accessible

### WHEN setting quality standards
- ALWAYS use markdown table format
- ALWAYS make standards measurable
- ALWAYS provide verification methods
- ALWAYS include at least 3 quality categories
- ALWAYS align with domain best practices

## 👎 Never

### WHEN designing agents
- NEVER create multi-purpose agents
- NEVER combine unrelated functionalities
- NEVER skip required template sections
- NEVER ignore single responsibility principle
- NEVER create agents without clear purpose

### WHEN naming agents
- NEVER use spaces or special characters
- NEVER use generic names (helper, assistant, utility)
- NEVER use uppercase letters
- NEVER use underscores instead of hyphens
- NEVER create name collisions with existing agents

### WHEN setting tool access
- NEVER grant unnecessary tool permissions
- NEVER ignore security implications
- NEVER provide write access without justification
- NEVER expose sensitive tools without documentation
- NEVER skip tool security review

### WHEN writing content
- NEVER skip instruction 0 (scope analysis)
- NEVER change section order from template
- NEVER modify section headers or emojis
- NEVER omit required frontmatter fields
- NEVER use single quotes for description field

### WHEN handling errors
- NEVER ignore error scenarios
- NEVER skip validation steps
- NEVER assume infallible operation
- NEVER omit error recovery strategies
- NEVER hide failures from users

### WHEN using wikilinks
- NEVER wrap wikilinks in backticks
- NEVER use embedded wikilinks inline with text
- NEVER reference non-existent files
- NEVER create circular references
- NEVER use absolute paths in wikilinks

### WHEN documenting
- NEVER leave placeholder text in final agent
- NEVER skip relevance notes for references
- NEVER include untested instructions
- NEVER use vague quality standards
- NEVER omit verification methods

### WHEN organizing files
- NEVER place agents in root agents/ directory
- NEVER mix domains within subdirectories
- NEVER create deeply nested subdirectories
- NEVER use inconsistent directory structure
- NEVER ignore established organization patterns

## 🚫 Critical Security Rules

### WHEN handling sensitive operations
- NEVER log sensitive information
- NEVER expose credentials or secrets
- NEVER bypass security validations
- NEVER grant elevated permissions without review
- NEVER ignore security warnings

### WHEN accessing external resources
- NEVER trust unvalidated input
- NEVER skip authentication checks
- NEVER expose internal paths or structure
- NEVER allow arbitrary code execution
- NEVER bypass rate limits or quotas

## ⚠️ Quality Enforcement Rules

### WHEN validating agents
- ALWAYS run validation before deployment
- ALWAYS test with example inputs
- ALWAYS verify wikilink resolution
- ALWAYS check tool permission appropriateness
- ALWAYS ensure output format clarity

### WHEN reviewing agents
- ALWAYS check for single responsibility
- ALWAYS verify section completeness
- ALWAYS validate instruction clarity
- ALWAYS confirm error handling presence
- ALWAYS ensure security compliance

## 🔒 Immutable Rules

These rules must NEVER be overridden:

1. **Single Purpose Rule**: Every agent serves exactly one purpose
2. **Template Compliance Rule**: All sections from template must be present
3. **Security First Rule**: Security considerations override functionality
4. **WikiLink Validation Rule**: All wikilinks must resolve
5. **Instruction Zero Rule**: Scope analysis instruction is mandatory

## 📝 Exception Documentation

### WHEN exceptions are necessary
If any rule must be violated:
- Document the specific rule being excepted
- Provide detailed justification
- Get explicit approval from project lead
- Add exception note in agent's Purpose section
- Create issue for future resolution

**Format for exceptions:**
```markdown
> ⚠️ **Exception**: [Rule being excepted]
> **Justification**: [Detailed reason]
> **Approved by**: [Approver]
> **Issue**: [Link to tracking issue]
```
