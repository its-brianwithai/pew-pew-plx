---
name: make-agent
description: "Transform existing content into a properly structured agent following all conventions and patterns."
---

# 🔄 Make Agent: Transform Content into Specialized Sub-Agent
> 💡 *Convert existing documentation, prompts, or instructions into a production-ready agent that integrates seamlessly with Claude Code.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully transform existing content into a production-ready agent that:
- Maintains single, focused responsibility
- Follows all agent conventions and patterns
- Integrates seamlessly with the Claude Code framework
- Includes proper tool security configuration
- Contains all required sections from [[agent-template]]
- Can be activated immediately via `/act:` command

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Transform the provided content (prompt, documentation, or instructions) into a properly structured agent file that follows all framework conventions.

### Deliverables
- Complete agent file with YAML frontmatter
- Properly structured system prompt with all sections
- Validated wikilinks to existing components
- Appropriate tool configuration
- Clear output format specification

### Acceptance Criteria
- [ ] Agent serves single, clear purpose
- [ ] All required sections present and populated
- [ ] Follows naming and structural conventions
- [ ] WikiLinks validated and functional
- [ ] Tool access appropriate and secure
- [ ] Can be activated immediately

## 🔄 Workflow
> 💡 *Systematic process for transforming content into an agent.*

![[agent-workflow]]

## 📏 Instructions
> 💡 *Event-driven rules and conventions for agent transformation.*

### WHEN transforming content into an agent

![[agent-conventions]]

![[agent-best-practices]]

![[agent-rules]]

### WHEN extracting purpose from existing content
**Best Practices:**
- Identify the core function being performed
- Look for repeated patterns or workflows
- Extract expertise requirements
- Note tool usage patterns

**Conventions:**
- Map existing structure to agent sections
- Preserve important domain knowledge
- Maintain existing wikilink references
- Convert inline content to references where appropriate

**Rules:**
- ALWAYS maintain single responsibility
- ALWAYS preserve critical instructions
- NEVER combine multiple purposes
- NEVER lose security constraints

### WHEN mapping content to agent sections
**Requirements:**
- Map purpose statements to Purpose & Role
- Convert steps to numbered Instructions
- Extract patterns as Best Practices
- Identify constraints as Rules
- Gather references for Relevant Context
- Define success metrics as Quality Standards
- Specify output format in Report/Response

**Constraints:**
- Must include all required sections
- Must maintain section order
- Must use proper headers and emojis
- Must start instructions with 0

### WHEN determining tool requirements
**Analysis Process:**
1. Scan content for tool usage
2. Identify minimum necessary tools
3. Consider security implications
4. Document tool justification
5. Choose inheritance vs explicit

**Security Considerations:**
- Apply principle of least privilege
- Document sensitive operations
- Review MCP tool access
- Consider trust boundaries

## 📊 Output Format
> 💡 *Structure for the transformed agent.*

![[agent-template]]

### Transformation Checklist
- [ ] Content analyzed for core purpose
- [ ] Single responsibility identified
- [ ] Agent identity designed (name, description, color)
- [ ] Content mapped to all required sections
- [ ] Instructions numbered starting with 0
- [ ] Best practices extracted and documented
- [ ] Rules defined as ALWAYS/NEVER
- [ ] Context organized with references
- [ ] Quality standards defined with metrics
- [ ] Output format specified clearly
- [ ] Tool requirements determined
- [ ] WikiLinks validated
- [ ] File written to correct location