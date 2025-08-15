---
name: update-agent
description: "Enhance and update existing agents while maintaining structure and compatibility with the framework."
---

# 🔧 Update Agent: Enhance Existing Sub-Agent Capabilities
> 💡 *Refine and improve existing agents while preserving their core purpose and framework integration.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully update an existing agent to:
- Enhance its capabilities within its defined scope
- Maintain backward compatibility and structure
- Improve clarity and effectiveness of instructions
- Update tool access if requirements changed
- Preserve all framework conventions
- Keep the agent immediately usable

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Enhance and update an existing agent based on specific improvement requirements while maintaining its core purpose and structure.

### Deliverables
- Updated agent file with improvements
- Preserved YAML frontmatter structure
- Enhanced sections as requested
- Maintained wikilink integrity
- Updated documentation if needed

### Acceptance Criteria
- [ ] Core purpose unchanged (unless explicitly requested)
- [ ] All template sections remain present
- [ ] Conventions maintained throughout
- [ ] WikiLinks still valid
- [ ] Improvements clearly implemented
- [ ] Agent remains functional

## 🔄 Workflow
> 💡 *Systematic methodology for agent updates.*

![[agent-workflow]]

### Update Process Modification
When updating rather than creating:
1. Read current agent definition first
2. Identify sections needing updates
3. Preserve unchanged sections exactly
4. Apply improvements incrementally
5. Validate changes maintain compatibility

### Iterative Clarification
If update requirements are unclear:
1. Ask which specific aspect needs updating
2. Provide focused options
3. Clarify scope of changes
4. Confirm core purpose remains
5. Execute targeted updates

### Question Template
```markdown
## [Emoji] [Update Question]?
    A. [First aspect with examples]
    B. [Second aspect with examples]
```

### Example Question
```markdown
## 🔧 What aspect of the agent needs updating?
    A. Core functionality (instructions, workflow, error handling)
    B. Configuration (tools, description, best practices)
```

## 📏 Instructions
> 💡 *Event-driven rules and conventions for agent updates.*

### WHEN updating an existing agent

![[agent-conventions]]

![[agent-best-practices]]

![[agent-rules]]

### WHEN analyzing update requirements
**Best Practices:**
- Read the entire current agent first
- Identify all sections affected by changes
- Consider ripple effects of updates
- Preserve working functionality
- Document significant changes

**Conventions:**
- Maintain existing structure exactly
- Keep section order unchanged
- Preserve formatting patterns
- Update version notes if present

**Rules:**
- ALWAYS read current agent before updating
- ALWAYS preserve core purpose unless explicitly changed
- NEVER remove required sections
- NEVER break existing functionality

### WHEN implementing updates
**Requirements:**
- Maintain [[agent-template]] structure
- Preserve all section headers
- Keep instruction numbering
- Update wikilinks if needed
- Verify tool access still appropriate

**Update Categories:**
1. **Instruction Enhancement**: Clarify or expand steps
2. **Tool Adjustment**: Add or remove tool access
3. **Best Practice Addition**: Include new learnings
4. **Rule Refinement**: Tighten or clarify rules
5. **Context Update**: Add new references or resources

### WHEN validating updates
**Checklist:**
- Core purpose unchanged or approved
- All sections still present
- Instructions remain clear
- WikiLinks still resolve
- Tool access appropriate
- Quality standards updated if needed

## 📊 Output Format
> 💡 *Structure for the updated agent.*

![[agent-template]]

### Update Checklist
- [ ] Current agent analyzed
- [ ] Update requirements clear
- [ ] Changes scoped appropriately
- [ ] Structure preserved
- [ ] Sections updated as needed
- [ ] WikiLinks validated
- [ ] Tool access reviewed
- [ ] Compatibility maintained
- [ ] Improvements documented
- [ ] Agent tested if possible

---
role: [[meta-sub-agent-architect]]