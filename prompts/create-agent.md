---
name: create-agent
description: "Systematically create a new agent through requirements analysis and structured design following all conventions."
---

# 🤖 Create Agent: Design Specialized Sub-Agent from Requirements
> 💡 *Transform requirements into a focused, single-purpose agent through systematic analysis and validation.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully create a production-ready agent that:
- Serves a single, well-defined purpose
- Follows all agent conventions and patterns
- Integrates seamlessly with Claude Code framework
- Maintains appropriate tool security
- Can operate autonomously within its scope
- Is immediately usable via `/act:` command

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Create a new agent based on user requirements through systematic analysis and iterative refinement.

### Deliverables
- Complete agent file with all required sections
- Proper YAML frontmatter configuration
- Validated tool access specification
- Clear delegation description
- Comprehensive system prompt

### Acceptance Criteria
- [ ] Single responsibility clearly defined
- [ ] All template sections present
- [ ] Follows naming conventions
- [ ] WikiLinks validated
- [ ] Security considerations addressed
- [ ] Output format specified

## 🔄 Workflow
> 💡 *Systematic methodology for agent creation.*

![[agent-workflow]]

### Iterative Refinement Process
If requirements are unclear:
1. Ask ONE focused question about purpose/expertise/tools
2. Provide A/B options for user selection
3. Refine understanding based on response
4. Repeat until requirements are clear
5. Generate complete agent

### Question Template
```markdown
## [Emoji] [Specific Question]?
    A. [First option with example]
    B. [Second option with example]
```

### Example Question
```markdown
## 🤖 What is the agent's primary expertise area?
    A. Technical implementation (coding, debugging, testing)
    B. Project management (planning, documentation, workflows)
```

## 📏 Instructions
> 💡 *Event-driven rules and conventions for agent creation.*

### WHEN creating a new agent

![[agent-conventions]]

![[agent-best-practices]]

![[agent-rules]]

### WHEN gathering requirements
**Best Practices:**
- Start with understanding the core purpose
- Identify specific expertise needed
- Determine tool requirements early
- Consider security implications
- Map to existing patterns

**Conventions:**
- Use iterative refinement for unclear requests
- Ask one question at a time
- Provide concrete options
- Build understanding progressively

**Rules:**
- ALWAYS research existing agents first
- ALWAYS verify single responsibility
- NEVER proceed with vague requirements
- NEVER combine multiple purposes

### WHEN researching existing patterns
**Requirements:**
- Read [[claude-code-sub-agent-docs]]
- Review agents in similar domains
- Study successful agent patterns
- Check for potential overlaps

**Process:**
1. Search agents/ directory for similar agents
2. Analyze their structure and patterns
3. Identify reusable components
4. Note domain-specific conventions
5. Apply learned patterns

## 📊 Output Format
> 💡 *Structure for the created agent.*

![[agent-template]]

### Creation Checklist
- [ ] Requirements fully understood
- [ ] Existing agents researched
- [ ] Single purpose defined
- [ ] Agent identity designed
- [ ] All sections completed
- [ ] Instructions numbered from 0
- [ ] Best practices documented
- [ ] Rules as ALWAYS/NEVER
- [ ] Context with references
- [ ] Quality standards table
- [ ] Tool access appropriate
- [ ] WikiLinks validated
- [ ] File created in correct location

---
role: [[meta-sub-agent-architect]]