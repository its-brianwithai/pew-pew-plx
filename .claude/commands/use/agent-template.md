# Template Command

When this command is used, use the following template. Acknowledge your understanding and then await the user's request.

---

``````````
name: `{{generated-agent-name}}`
description: "[Describe expertise]. [Describe when to delegate tasks to this agent]."
color: `{{selected-color}}`
---
# 🎯 Main Goal
> 💡 *The behavioral objective that determines whether any following section provides value. This is the north star - every component should directly contribute to achieving this goal.*

[Clear, measurable behavioral objective that defines what this agent consistently does. Should be specific enough to validate achievement and guide all decisions about what to include or exclude]

### Deliverables
[What this agent must produce or accomplish]

```
<example>
- [Specific artifact or output the agent creates]
- [Document or code the agent generates]
- [Analysis or report the agent produces]
- [Decision or recommendation the agent provides]
</example>
```

### Acceptance Criteria
[How to verify this agent has achieved its goal]

```
<example>
- [ ] [Specific condition that confirms success]
- [ ] [Quality metric that must be met]
- [ ] [Performance threshold achieved]
- [ ] [Stakeholder requirement satisfied]
</example>
```

## 👤 Persona
> 💡 *Optional: Include only expertise attributes that directly contribute to achieving the main goal. Each attribute should improve the quality or accuracy of the output.*

### Role
[Only if role expertise impacts outcome quality]

### Expertise
[Only if specific domain knowledge is required]

### Domain
[Only if domain context affects approach]

### Knowledge
[Only if specialized knowledge improves results]

### Experience
[Only if past experience patterns matter]

### Skills
[Only if specific skills are needed]

### Abilities
[Only if unique abilities enhance output]

### Responsibilities
[Only if understanding responsibilities shapes behavior]

### Interests
[Only if interests influence approach or quality]

### Background
[Only if background context improves understanding]

### Preferences
[Only if preferences affect delivery style]

### Perspective
[Only if viewpoint shapes analysis]

### Communication Style
[Only if style impacts effectiveness]

## 📋 Request
> 💡 *Verb-first specification of what this agent does*

[Verb] [specific activity description with clear scope defining what this agent does]

### Deliverables (Optional)
- [Specific output 1]
- [Specific output 2]
- [Additional outputs as needed]

### Acceptance Criteria (Optional)
- [ ] [Measurable success criterion 1]
- [ ] [Measurable success criterion 2]
- [ ] [Additional criteria as needed]

## 🔄 Workflow
> 💡 *Optional: Multi-step process that systematically achieves the main goal. Include only if multiple steps improve outcome.*

### Step 1: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific action]
- [Follow-up action if needed]

### Step 2: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific action]
- [Follow-up action if needed]

### Step N: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific action]
- [Follow-up action if needed]

## 📏 Instructions
> 💡 *Optional: Event-driven guidance. Include only subsections that prevent failure or ensure quality. Each subsection is optional and should only exist if it contributes to the main goal.*

### Best Practices
> 💡 *Industry standards and recommended approaches that should be followed.*

[List best practices with references to relevant documentation]

```
<example>
- [Domain-specific best practice with reference]
- [Project convention with documentation reference]
- [Quality practice with standards reference]
- [Performance consideration with guide reference]
- [...] 
</example>
```

### Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

#### Always
```
<example>
- WHEN [event] ALWAYS [behavior]
- WHEN referencing project documents ALWAYS use wikilinks without backticks
- [More ALWAYS rules if needed]
- [...]
</example>
```

#### Never
```
<example>
- WHEN [event] NEVER [prohibited behavior]
- WHEN working with security NEVER violate documented security policies
- [More NEVER rules if needed]
- [...]
</example>
```

### Conventions
> 💡 *Project-specific conventions and patterns to follow.*

[List conventions that must be followed]

```
<example>
- [Naming convention with pattern]
- [File structure convention]
- [Code style convention]
- [...]
</example>
```

### References
> 💡 *Essential resources and documentation to consult.*

[List all project files, documentation, and resources that must be understood]

```
<example>
- [Wikilink to relevant file] - (Relevance: [Why this is important])
- [Wikilink to project documentation] - (Relevance: [Description of relevance])
- [External documentation URL] - (Relevance: [Description of external resource])
- [...]
</example>
```

## 📊 Output Format
> 💡 *Optional: How to structure and deliver the output. Include only if specific format improves usability or integration.*

### Format Type
[Specify format: Markdown, JSON, YAML, XML, Plain Text, Code, etc.]

### Structure Template
```[format]
[Exact structure showing how output should be formatted]
[Include placeholders for dynamic content]
[Show nesting and organization]
```

### Delivery Instructions
- [Where to save/output]
- [Naming conventions]
- [Any post-processing required]

---

# Usage Notes

## Modularity Principle
Every section and subsection is **optional** and should only exist if it directly contributes to achieving the Main Goal. Before including any section, ask: "Does this improve our chances of reaching the desired behavioral outcome?"

## Section Guidelines
- **Main Goal**: ALWAYS required - defines the behavioral focus
- **Persona**: Include only attributes that enhance expertise for the goal
- **Request**: Define what the agent does (verb-first)
- **Workflow**: Only for multi-step processes
- **Instructions**: Include only subsections that guide behavior
  - Best Practices: Only if industry standards apply
  - Rules: Only if ALWAYS/NEVER constraints needed
  - Conventions: Only if project patterns must be followed
  - References: Only if external resources required
- **Output Format**: Only if specific structure needed

Remember: Agents are behavioral - they define HOW to consistently perform tasks, not just WHAT to achieve.
``````````
