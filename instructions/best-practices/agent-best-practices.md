---
name: agent-best-practices
description: "Best practices for designing effective, reusable agents that enhance Claude Code capabilities."
---

# ⭐ Agent Best Practices
> 💡 *Proven approaches and techniques for creating high-quality agents.*

## Design Principles

### WHEN designing agent architecture
**Single Responsibility Principle:**
- Focus each agent on one clear, well-defined purpose
- Resist the temptation to combine multiple functions
- Create separate agents rather than multi-purpose ones
- Ensure the agent name reflects its single purpose

**Autonomy Within Scope:**
- Design agents to operate independently within their domain
- Provide all necessary context and instructions
- Minimize dependencies on external clarification
- Enable decision-making within defined boundaries

**Reusability Focus:**
- Create agents that work across different projects
- Avoid project-specific hardcoding
- Use wikilinks for configuration and templates
- Design for composition with other agents

## Prompt Engineering

### WHEN writing agent system prompts
**Clarity and Specificity:**
- Be explicit about requirements and constraints
- Use concrete examples to illustrate concepts
- Define technical terms and acronyms
- Avoid ambiguous language

**Structured Thinking:**
- Use XML tags for complex input processing
- Apply chain-of-thought reasoning for complex tasks
- Break down multi-step processes clearly
- Include decision trees for branching logic

**Positive Framing:**
- Frame instructions as "what to do" rather than "what not to do"
- Use ALWAYS for required actions before NEVER for prohibitions
- Focus on desired outcomes and behaviors
- Reserve NEVER rules for critical prohibitions only

**Progressive Disclosure:**
- Start with high-level purpose and role
- Add detail progressively through sections
- Use subsections for complex topics
- Maintain logical flow from general to specific

## Component Composition

### WHEN combining agents with other components
**WikiLink Strategy:**
- Reference existing workflows with `[[workflow-name]]`
- Embed reusable instructions with `![[instruction-name-wl-example]]`
- Link to templates for output formats
- Connect to related agents for orchestration

**Modular Architecture:**
- Extract common patterns to separate files
- Use embedding for shared instructions
- Create component libraries for reuse
- Maintain clean separation of concerns

**Version Compatibility:**
- Design agents to work with current framework version
- Document any version-specific requirements
- Plan for backward compatibility
- Test with different component versions

## Tool Security

### WHEN configuring agent tool access
**Principle of Least Privilege:**
- Grant only the minimum necessary tools
- Document why each tool is needed
- Consider security implications
- Review tool access regularly

**Tool Inheritance Patterns:**
- Omit tools field for maximum flexibility when appropriate
- List specific tools for security-sensitive operations
- Consider the agent's trust level
- Balance security with functionality

**Security Documentation:**
- Document security considerations in Purpose section
- Explain tool requirements clearly
- Note any sensitive operations
- Include security warnings where appropriate

## Error Handling

### WHEN designing agent error responses
**Graceful Degradation:**
- Plan for common failure scenarios
- Provide fallback strategies
- Include error recovery instructions
- Maintain partial functionality when possible

**Clear Error Messages:**
- Make error messages actionable
- Include specific resolution steps
- Reference relevant documentation
- Avoid technical jargon in user-facing errors

**Learning from Failures:**
- Document common error patterns
- Update instructions based on failures
- Build error prevention into workflow
- Share learnings across agents

## Documentation Excellence

### WHEN documenting agent capabilities
**Comprehensive Context:**
- Include all necessary background information
- Reference relevant project files
- Link to external documentation
- Provide domain-specific context

**Example-Driven Clarity:**
- Include concrete examples for complex concepts
- Show both correct and incorrect patterns
- Use realistic scenarios
- Follow [[template-rules]] for examples

**Maintenance Documentation:**
- Document design decisions and rationale
- Include modification guidelines
- Note dependencies and integrations
- Provide troubleshooting guidance

## Testing and Validation

### WHEN validating agent effectiveness
**Scenario Testing:**
- Test with typical use cases
- Include edge cases and error conditions
- Verify output format consistency
- Check integration with other components

**Quality Metrics:**
- Define measurable success criteria
- Include verification methods in quality standards
- Test autonomy within scope
- Measure reusability across contexts

**Iterative Refinement:**
- Start with basic functionality
- Enhance based on usage patterns
- Incorporate user feedback
- Refine instructions for clarity

## Performance Optimization

### WHEN optimizing agent performance
**Instruction Efficiency:**
- Keep instructions concise but complete
- Remove redundant instructions
- Optimize instruction ordering
- Use references instead of repetition

**Cognitive Load Management:**
- Break complex tasks into steps
- Use clear section organization
- Provide visual hierarchy with headers
- Limit parallel considerations

**Response Optimization:**
- Define clear output formats
- Specify desired response structure
- Include examples of ideal output
- Set appropriate detail levels

## Integration Patterns

### WHEN integrating agents into workflows
**Orchestration Design:**
- Plan agent handoffs clearly
- Define input/output contracts
- Document state management
- Ensure smooth transitions

**Communication Protocols:**
- Standardize data formats between agents
- Define clear interfaces
- Document expected inputs/outputs
- Handle format conversions gracefully

**Workflow Participation:**
- Design agents as workflow components
- Enable both standalone and orchestrated use
- Document workflow integration points
- Maintain consistency across touchpoints

## Evolution and Maintenance

### WHEN maintaining and updating agents
**Version Management:**
- Document changes clearly
- Maintain backward compatibility
- Plan deprecation carefully
- Communicate breaking changes

**Continuous Improvement:**
- Monitor agent usage patterns
- Collect performance metrics
- Incorporate lessons learned
- Update based on framework evolution

**Knowledge Sharing:**
- Document patterns for reuse
- Share successful agent designs
- Create agent templates for common needs
- Build agent component libraries
