---
name: create-agent
description: "Systematically create a new agent through requirements analysis and structured design following all conventions."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

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

# 🌊 Agent Workflow: Systematic Sub-Agent Creation
> 💡 *Transform requirements into focused, single-purpose agents through systematic decomposition and validation.*

The agent workflow represents a sophisticated orchestration for creating specialized sub-agents that enhance Claude Code capabilities. This systematic approach ensures each agent maintains focused expertise, appropriate tool access, and seamless integration with the broader framework. Through hierarchical phases and quality gates, we transform abstract requirements into production-ready agents that operate autonomously within their defined scope.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
Enable the creation of specialized sub-agents that enhance Claude Code through focused expertise and controlled tool access. Each agent serves as a reusable unit of expertise that can be composed into larger systems while maintaining independence and security.

### Guiding Principles
1. **Single Responsibility**: Each agent has one clear, well-defined purpose that it excels at
2. **Tool Security**: Grant only the minimal necessary tool access required for the agent's function
3. **Prompt Excellence**: Craft clear, actionable instructions that enable autonomous operation
4. **Reusability**: Design agents that work seamlessly across different contexts and projects
5. **Composability**: Enable agents to work together in orchestrated workflows

### Success Criteria
- Agent achieves its stated purpose without scope creep
- Tool access is minimal yet sufficient for all required tasks
- Instructions enable autonomous operation without clarification
- Agent integrates seamlessly with existing framework components
- Output format is consistent and immediately usable

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Agent Identity**: The combination of name, description, and color that defines an agent's presence
- **System Prompt**: The comprehensive instructions that shape agent behavior and expertise
- **Tool Inheritance**: The mechanism for agents to access all available tools or restrict to specific ones
- **WikiLink Architecture**: The system for referencing and embedding reusable components

### Workflow Patterns
- **Progressive Refinement**: Start broad, then narrow focus through systematic analysis
- **Validation Gates**: Ensure quality at each phase before proceeding
- **Component Reuse**: Leverage existing patterns and documentation through wikilinks
- **Error Prevention**: Design checks that catch issues before agent deployment

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow systematically transforms user requirements into production-ready agents through five distinct phases. Each phase builds upon the previous, with validation gates ensuring quality. The methodology emphasizes clarity, security, and reusability throughout the creation process.

### Phase Architecture
```
Phase 1: Requirements Analysis
├── Step 1.1: Extract Core Purpose
├── Step 1.2: Identify Task Boundaries
├── Step 1.3: Map Tool Requirements
└── Quality Gate: Clarity Validation

Phase 2: Design Agent Identity
├── Step 2.1: Choose Descriptive Name
├── Step 2.2: Write Action Description
├── Step 2.3: Select Appropriate Color
└── Quality Gate: Identity Coherence

Phase 3: Structure System Prompt
├── Parallel Block A: Core Sections
│   ├── Step 3.1a: Purpose & Role
│   ├── Step 3.2a: Instructions (0-based)
│   └── Step 3.3a: Best Practices
├── Parallel Block B: Governance
│   ├── Step 3.1b: ALWAYS/NEVER Rules
│   ├── Step 3.2b: Relevant Context
│   └── Step 3.3b: Quality Standards
└── Synchronization: Report/Response Format

Phase 4: Validate Configuration
├── Decision Point: Complexity Check
├── Branch A: Simple Agent Path
│   └── Step 4.1a: Basic Validation
├── Branch B: Complex Agent Path
│   └── Step 4.1b: Comprehensive Review
└── Quality Gate: Production Readiness

Phase 5: Deliver Agent
├── Step 5.1: Write to Filesystem
├── Step 5.2: Verify WikiLinks
└── Quality Gate: Integration Test
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Requirements Analysis
> *Extract and clarify the core requirements that will shape the agent's design*

#### Prerequisites
- Clear understanding of the desired functionality
- Access to existing project documentation
- Knowledge of available tools and their capabilities

#### Step 1.1: Extract Core Purpose
- **Purpose**: Define the single responsibility this agent will fulfill
- **Instructions**: Analyze user requirements to identify the primary function
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in agent design patterns
- **Inputs**: User requirements, project context
- **Outputs**: Clear purpose statement
- **Success Criteria**: Purpose can be stated in one sentence
- **Error Handling**:
    - **Likely Failures**: Multiple purposes identified
    - **Recovery Strategy**: Decompose into multiple agents
    - **Escalation Path**: Consult user for prioritization
- **Timing**: 5-10 minutes

#### Step 1.2: Identify Task Boundaries
- **Purpose**: Define what the agent will and won't do
- **Instructions**: Map the scope of responsibilities and explicit exclusions
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in scope definition
- **Inputs**: Purpose statement, project constraints
- **Outputs**: Boundary definition document
- **Success Criteria**: Clear inclusion/exclusion list
- **Error Handling**:
    - **Likely Failures**: Overlapping boundaries with existing agents
    - **Recovery Strategy**: Refine to eliminate overlap
    - **Escalation Path**: Review existing agent purposes
- **Timing**: 10-15 minutes

#### Step 1.3: Map Tool Requirements
- **Purpose**: Determine necessary tool access for agent function
- **Instructions**: Analyze tasks to identify required tools, prefer inheritance when broad
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in tool security
- **Inputs**: Task list, security requirements
- **Outputs**: Tool access specification
- **Success Criteria**: Minimal necessary tools identified
- **Error Handling**:
    - **Likely Failures**: Over-provisioning tool access
    - **Recovery Strategy**: Apply principle of least privilege
    - **Escalation Path**: Security review
- **Timing**: 5-10 minutes

#### Quality Gate: Clarity Validation
- **Validation Criteria**:
    - [ ] Single purpose clearly defined
    - [ ] Boundaries explicitly stated
    - [ ] Tool requirements justified
- **Pass Actions**: Proceed to Phase 2
- **Fail Actions**: Refine requirements with user input

### Phase 2: Design Agent Identity
> *Create the agent's identity elements that enable proper delegation and recognition*

#### Prerequisites
- Completed requirements analysis
- Understanding of existing agent naming patterns
- Access to color palette for selection

#### Step 2.1: Choose Descriptive Name
- **Purpose**: Create a clear, memorable identifier
- **Instructions**: Use kebab-case with descriptive terms (e.g., `flutter-developer`)
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in naming conventions
- **Inputs**: Purpose statement, existing agent names
- **Outputs**: Agent name in kebab-case
- **Success Criteria**: Name clearly indicates function
- **Error Handling**:
    - **Likely Failures**: Name collision with existing agent
    - **Recovery Strategy**: Add qualifier or modifier
    - **Escalation Path**: Review naming conventions
- **Timing**: 5 minutes

#### Step 2.2: Write Action Description
- **Purpose**: Enable automatic delegation through clear description
- **Instructions**: Write action-oriented description with "Use when..." pattern
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in descriptions
- **Inputs**: Purpose, boundaries, use cases
- **Outputs**: Two-sentence description
- **Success Criteria**: Description enables proper delegation
- **Error Handling**:
    - **Likely Failures**: Vague or generic description
    - **Recovery Strategy**: Add specific use cases
    - **Escalation Path**: Review delegation patterns
- **Timing**: 10 minutes

#### Step 2.3: Select Appropriate Color
- **Purpose**: Visual identification in Claude Code interface
- **Instructions**: Choose non-conflicting color that represents function
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in UI patterns
- **Inputs**: Existing color assignments, function type
- **Outputs**: Color selection
- **Success Criteria**: Color is unique and appropriate
- **Error Handling**:
    - **Likely Failures**: Color already in use
    - **Recovery Strategy**: Select alternative from palette
    - **Escalation Path**: Expand color options
- **Timing**: 2 minutes

#### Quality Gate: Identity Coherence
- **Validation Criteria**:
    - [ ] Name accurately reflects function
    - [ ] Description enables delegation
    - [ ] Color provides visual distinction
- **Pass Actions**: Proceed to Phase 3
- **Fail Actions**: Refine identity elements

### Phase 3: Structure System Prompt
> *Build the comprehensive system prompt that defines agent behavior*

#### Parallel Execution Block
> *Core sections and governance can be developed simultaneously*

##### Branch A: Core Sections

###### Step 3.1a: Purpose & Role
- **Purpose**: Define the agent's expertise and responsibilities
- **Instructions**: Write 1-2 paragraphs establishing role and expertise
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in prompt crafting
- **Inputs**: Requirements analysis, purpose statement
- **Outputs**: Purpose & Role section
- **Success Criteria**: Clear understanding of agent's expertise
- **Error Handling**:
    - **Likely Failures**: Too broad or narrow scope
    - **Recovery Strategy**: Align with single responsibility
    - **Escalation Path**: Review purpose definition
- **Timing**: 15 minutes

###### Step 3.2a: Instructions (0-based)
- **Purpose**: Provide numbered instructions for task execution
- **Instructions**: Start with instruction 0 for scope analysis, then specific steps
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in instruction design
- **Inputs**: Task list, workflow patterns
- **Outputs**: Numbered instructions section
- **Success Criteria**: Instructions are actionable and clear
- **Error Handling**:
    - **Likely Failures**: Missing instruction 0
    - **Recovery Strategy**: Add scope analysis instruction
    - **Escalation Path**: Review instruction patterns
- **Timing**: 20 minutes

###### Step 3.3a: Best Practices
- **Purpose**: Guide quality and approach
- **Instructions**: List domain-specific best practices with wikilinks
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in best practices
- **Inputs**: Domain knowledge, project standards
- **Outputs**: Best practices section
- **Success Criteria**: Practices enhance output quality
- **Error Handling**:
    - **Likely Failures**: Generic practices
    - **Recovery Strategy**: Add domain specificity
    - **Escalation Path**: Research domain standards
- **Timing**: 15 minutes

##### Branch B: Governance

###### Step 3.1b: ALWAYS/NEVER Rules
- **Purpose**: Define strict behavioral boundaries
- **Instructions**: Create event-driven rules using WHEN/THEN pattern
- **Agent**: @agents/meta/meta-instructions-expert.md - Expert in rule creation
- **Inputs**: Constraints, security requirements
- **Outputs**: Rules section with Always/Never subsections
- **Success Criteria**: Rules prevent errors and ensure quality
- **Error Handling**:
    - **Likely Failures**: Contradictory rules
    - **Recovery Strategy**: Resolve conflicts
    - **Escalation Path**: Priority review
- **Timing**: 15 minutes

###### Step 3.2b: Relevant Context
- **Purpose**: Provide essential references and resources
- **Instructions**: List project files, documentation, and external resources
- **Agent**: @agents/meta/meta-context-expert.md - Expert in documentation
- **Inputs**: Dependencies, related components
- **Outputs**: Relevant Context section with subsections
- **Success Criteria**: All necessary resources identified
- **Error Handling**:
    - **Likely Failures**: Missing critical references
    - **Recovery Strategy**: Review dependencies
    - **Escalation Path**: Documentation audit
- **Timing**: 10 minutes

###### Step 3.3b: Quality Standards
- **Purpose**: Define measurable quality criteria
- **Instructions**: Create table with categories, standards, and verification
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in quality metrics
- **Inputs**: Success criteria, domain standards
- **Outputs**: Quality Standards table
- **Success Criteria**: Standards are measurable
- **Error Handling**:
    - **Likely Failures**: Vague standards
    - **Recovery Strategy**: Add specific metrics
    - **Escalation Path**: Define measurements
- **Timing**: 15 minutes

#### Synchronization Point: Report/Response Format
- **Merge Conditions**: All parallel sections complete
- **Conflict Resolution**: Ensure consistency across sections
- **Combined Output**: Complete system prompt structure

### Phase 4: Validate Configuration
> *Ensure the agent meets all quality and security requirements*

#### Decision Point: Complexity Assessment
- **Decision Criteria Matrix**:
  ```
  | Tool Count | Instruction Count | Wikilinks | Route To        |
  |:---------- |:---------------- |:--------- |:--------------- |
  | < 3        | < 10             | < 5       | Simple Path     |
  | >= 3       | Any              | Any       | Complex Path    |
  | Any        | >= 10            | Any       | Complex Path    |
  | Any        | Any              | >= 5      | Complex Path    |
  ```
- **Evaluation Logic**: Count tools, instructions, and wikilinks
- **Default Path**: Complex Path for safety

#### Branch Routes

##### Simple Agent Path
###### Step 4.1a: Basic Validation
- **Purpose**: Quick validation for simple agents
- **Instructions**: Check core requirements and structure
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in validation
- **Inputs**: Complete agent definition
- **Outputs**: Validation report
- **Success Criteria**: All basic checks pass
- **Error Handling**:
    - **Likely Failures**: Missing required sections
    - **Recovery Strategy**: Add missing elements
    - **Escalation Path**: Full review
- **Timing**: 10 minutes

##### Complex Agent Path
###### Step 4.1b: Comprehensive Review
- **Purpose**: Thorough validation for complex agents
- **Instructions**: Deep review of all aspects including security
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in comprehensive review
- **Inputs**: Complete agent definition
- **Outputs**: Detailed review report
- **Success Criteria**: All checks pass, security verified
- **Error Handling**:
    - **Likely Failures**: Security concerns
    - **Recovery Strategy**: Restrict tool access
    - **Escalation Path**: Security team review
- **Timing**: 20 minutes

#### Quality Gate: Production Readiness
- **Validation Criteria**:
    - [ ] Single responsibility maintained
    - [ ] Tool access appropriate
    - [ ] Instructions clear and complete
    - [ ] All sections present
    - [ ] WikiLinks valid
- **Pass Actions**: Proceed to Phase 5
- **Fail Actions**: Return to appropriate phase for fixes

### Phase 5: Deliver Agent
> *Write the agent to the filesystem and verify integration*

#### Prerequisites
- Validated agent configuration
- Write access to agents directory
- Understanding of file organization

#### Step 5.1: Write to Filesystem
- **Purpose**: Create the agent file in the correct location
- **Instructions**: Write complete agent to @agents/<subdirectory>/<name>.md`
- **Agent**: System file writer
- **Inputs**: Complete agent definition, file path
- **Outputs**: Agent file on disk
- **Success Criteria**: File created successfully
- **Error Handling**:
    - **Likely Failures**: Directory doesn't exist
    - **Recovery Strategy**: Create directory structure
    - **Escalation Path**: Filesystem permissions
- **Timing**: 2 minutes

#### Step 5.2: Verify WikiLinks
- **Purpose**: Ensure all references resolve correctly
- **Instructions**: Check that all [[wikilinks-wl-example]] point to existing files
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in wikilink validation
- **Inputs**: Agent file content
- **Outputs**: WikiLink validation report
- **Success Criteria**: All wikilinks resolve
- **Error Handling**:
    - **Likely Failures**: Broken wikilinks
    - **Recovery Strategy**: Fix references or create missing files
    - **Escalation Path**: Documentation update
- **Timing**: 5 minutes

#### Quality Gate: Integration Test
- **Validation Criteria**:
    - [ ] File exists at correct path
    - [ ] YAML frontmatter valid
    - [ ] All wikilinks resolve
    - [ ] Agent activates properly
- **Pass Actions**: Agent ready for use
- **Fail Actions**: Debug integration issues

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:---------- |:-------- |:---------------- |:----------------- |
| Multiple Purposes | High | Requirements analysis | Split into multiple agents |
| Tool Over-provisioning | Critical | Security review | Apply least privilege |
| Name Collision | Medium | Filesystem check | Add qualifier |
| Broken WikiLinks | Medium | Link validation | Fix references |
| Missing Sections | High | Structure validation | Add required sections |

### Circuit Breaker Patterns
- **Security Violation**: Halt if excessive tool access requested
- **Scope Creep**: Stop if agent purpose expands beyond single responsibility
- **Reference Loop**: Break if circular wikilink dependencies detected

### Rollback Procedures
1. **Phase-Level Rollback**: Return to previous phase with corrections
2. **Identity Rollback**: Regenerate name/description if conflicts
3. **File Rollback**: Remove created files if validation fails

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Creation Time**: Target < 60 minutes for simple agents
- **Validation Pass Rate**: Target > 90% first-time pass
- **WikiLink Resolution**: Target 100% valid references
- **Reusability Score**: Measure cross-project usage

### Optimization Opportunities
- **Template Reuse**: Extract common patterns to templates
- **Parallel Execution**: Run independent steps simultaneously
- **Automated Validation**: Script common checks
- **Component Library**: Build reusable prompt sections

### Learning Loops
- **Pattern Recognition**: Identify recurring agent types
- **Error Analysis**: Track common validation failures
- **Performance Tuning**: Optimize slow workflow steps
- **User Feedback**: Incorporate usage patterns

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Clear requirements from user
- [ ] Access to project documentation
- [ ] Understanding of existing agents
- [ ] Write permissions to agents directory

### Resource Requirements
- **Agents**: meta-sub-agent-architect, meta-prompt-engineer, meta-instructions-expert, meta-context-expert
- **Tools**: File system access, text editor, validation scripts
- **Time**: 30-60 minutes depending on complexity
- **Skills**: Prompt engineering, system design, security awareness

### Execution Checklist
1. [ ] Gather requirements from user
2. [ ] Review existing agents for patterns
3. [ ] Begin Phase 1: Requirements Analysis
4. [ ] Complete identity design
5. [ ] Structure system prompt sections
6. [ ] Validate configuration thoroughly
7. [ ] Write agent to filesystem
8. [ ] Verify integration
9. [ ] Test agent activation
10. [ ] Document any special considerations

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| Agent too broad | Multiple purposes combined | Split into separate agents |
| Delegation fails | Vague description | Rewrite with specific "Use when..." |
| WikiLinks broken | Files moved or renamed | Update references |
| Validation fails | Missing required sections | Add sections per template |
| Tool errors | Excessive permissions | Restrict to necessary tools |

## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: Initial workflow with 5-phase structure
- **v1.1**: Added parallel execution in Phase 3
- **v1.2**: Enhanced error handling and recovery
- **vNext**: Planned automation of validation steps

### Modification Triggers
- New agent patterns emerge from usage
- Security requirements change
- Framework updates affect structure
- Performance metrics indicate bottlenecks

### Deprecation Strategy
- Maintain backward compatibility for existing agents
- Provide migration path for old formats
- Phase out obsolete patterns gradually
- Document breaking changes clearly

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
- `@templates/agents/agent-template.md` - Reference to agent template
- `[[workflow-name]]` - Reference to workflows
- `[[instruction-name-wl-example]]` - Reference to instructions
# 🌊 Agent Workflow: Systematic Sub-Agent Creation
> 💡 *Transform requirements into focused, single-purpose agents through systematic decomposition and validation.*

The agent workflow represents a sophisticated orchestration for creating specialized sub-agents that enhance Claude Code capabilities. This systematic approach ensures each agent maintains focused expertise, appropriate tool access, and seamless integration with the broader framework. Through hierarchical phases and quality gates, we transform abstract requirements into production-ready agents that operate autonomously within their defined scope.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
Enable the creation of specialized sub-agents that enhance Claude Code through focused expertise and controlled tool access. Each agent serves as a reusable unit of expertise that can be composed into larger systems while maintaining independence and security.

### Guiding Principles
1. **Single Responsibility**: Each agent has one clear, well-defined purpose that it excels at
2. **Tool Security**: Grant only the minimal necessary tool access required for the agent's function
3. **Prompt Excellence**: Craft clear, actionable instructions that enable autonomous operation
4. **Reusability**: Design agents that work seamlessly across different contexts and projects
5. **Composability**: Enable agents to work together in orchestrated workflows

### Success Criteria
- Agent achieves its stated purpose without scope creep
- Tool access is minimal yet sufficient for all required tasks
- Instructions enable autonomous operation without clarification
- Agent integrates seamlessly with existing framework components
- Output format is consistent and immediately usable

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Agent Identity**: The combination of name, description, and color that defines an agent's presence
- **System Prompt**: The comprehensive instructions that shape agent behavior and expertise
- **Tool Inheritance**: The mechanism for agents to access all available tools or restrict to specific ones
- **WikiLink Architecture**: The system for referencing and embedding reusable components

### Workflow Patterns
- **Progressive Refinement**: Start broad, then narrow focus through systematic analysis
- **Validation Gates**: Ensure quality at each phase before proceeding
- **Component Reuse**: Leverage existing patterns and documentation through wikilinks
- **Error Prevention**: Design checks that catch issues before agent deployment

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow systematically transforms user requirements into production-ready agents through five distinct phases. Each phase builds upon the previous, with validation gates ensuring quality. The methodology emphasizes clarity, security, and reusability throughout the creation process.

### Phase Architecture
```
Phase 1: Requirements Analysis
├── Step 1.1: Extract Core Purpose
├── Step 1.2: Identify Task Boundaries
├── Step 1.3: Map Tool Requirements
└── Quality Gate: Clarity Validation

Phase 2: Design Agent Identity
├── Step 2.1: Choose Descriptive Name
├── Step 2.2: Write Action Description
├── Step 2.3: Select Appropriate Color
└── Quality Gate: Identity Coherence

Phase 3: Structure System Prompt
├── Parallel Block A: Core Sections
│   ├── Step 3.1a: Purpose & Role
│   ├── Step 3.2a: Instructions (0-based)
│   └── Step 3.3a: Best Practices
├── Parallel Block B: Governance
│   ├── Step 3.1b: ALWAYS/NEVER Rules
│   ├── Step 3.2b: Relevant Context
│   └── Step 3.3b: Quality Standards
└── Synchronization: Report/Response Format

Phase 4: Validate Configuration
├── Decision Point: Complexity Check
├── Branch A: Simple Agent Path
│   └── Step 4.1a: Basic Validation
├── Branch B: Complex Agent Path
│   └── Step 4.1b: Comprehensive Review
└── Quality Gate: Production Readiness

Phase 5: Deliver Agent
├── Step 5.1: Write to Filesystem
├── Step 5.2: Verify WikiLinks
└── Quality Gate: Integration Test
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Requirements Analysis
> *Extract and clarify the core requirements that will shape the agent's design*

#### Prerequisites
- Clear understanding of the desired functionality
- Access to existing project documentation
- Knowledge of available tools and their capabilities

#### Step 1.1: Extract Core Purpose
- **Purpose**: Define the single responsibility this agent will fulfill
- **Instructions**: Analyze user requirements to identify the primary function
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in agent design patterns
- **Inputs**: User requirements, project context
- **Outputs**: Clear purpose statement
- **Success Criteria**: Purpose can be stated in one sentence
- **Error Handling**:
    - **Likely Failures**: Multiple purposes identified
    - **Recovery Strategy**: Decompose into multiple agents
    - **Escalation Path**: Consult user for prioritization
- **Timing**: 5-10 minutes

#### Step 1.2: Identify Task Boundaries
- **Purpose**: Define what the agent will and won't do
- **Instructions**: Map the scope of responsibilities and explicit exclusions
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in scope definition
- **Inputs**: Purpose statement, project constraints
- **Outputs**: Boundary definition document
- **Success Criteria**: Clear inclusion/exclusion list
- **Error Handling**:
    - **Likely Failures**: Overlapping boundaries with existing agents
    - **Recovery Strategy**: Refine to eliminate overlap
    - **Escalation Path**: Review existing agent purposes
- **Timing**: 10-15 minutes

#### Step 1.3: Map Tool Requirements
- **Purpose**: Determine necessary tool access for agent function
- **Instructions**: Analyze tasks to identify required tools, prefer inheritance when broad
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in tool security
- **Inputs**: Task list, security requirements
- **Outputs**: Tool access specification
- **Success Criteria**: Minimal necessary tools identified
- **Error Handling**:
    - **Likely Failures**: Over-provisioning tool access
    - **Recovery Strategy**: Apply principle of least privilege
    - **Escalation Path**: Security review
- **Timing**: 5-10 minutes

#### Quality Gate: Clarity Validation
- **Validation Criteria**:
    - [ ] Single purpose clearly defined
    - [ ] Boundaries explicitly stated
    - [ ] Tool requirements justified
- **Pass Actions**: Proceed to Phase 2
- **Fail Actions**: Refine requirements with user input

### Phase 2: Design Agent Identity
> *Create the agent's identity elements that enable proper delegation and recognition*

#### Prerequisites
- Completed requirements analysis
- Understanding of existing agent naming patterns
- Access to color palette for selection

#### Step 2.1: Choose Descriptive Name
- **Purpose**: Create a clear, memorable identifier
- **Instructions**: Use kebab-case with descriptive terms (e.g., `flutter-developer`)
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in naming conventions
- **Inputs**: Purpose statement, existing agent names
- **Outputs**: Agent name in kebab-case
- **Success Criteria**: Name clearly indicates function
- **Error Handling**:
    - **Likely Failures**: Name collision with existing agent
    - **Recovery Strategy**: Add qualifier or modifier
    - **Escalation Path**: Review naming conventions
- **Timing**: 5 minutes

#### Step 2.2: Write Action Description
- **Purpose**: Enable automatic delegation through clear description
- **Instructions**: Write action-oriented description with "Use when..." pattern
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in descriptions
- **Inputs**: Purpose, boundaries, use cases
- **Outputs**: Two-sentence description
- **Success Criteria**: Description enables proper delegation
- **Error Handling**:
    - **Likely Failures**: Vague or generic description
    - **Recovery Strategy**: Add specific use cases
    - **Escalation Path**: Review delegation patterns
- **Timing**: 10 minutes

#### Step 2.3: Select Appropriate Color
- **Purpose**: Visual identification in Claude Code interface
- **Instructions**: Choose non-conflicting color that represents function
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in UI patterns
- **Inputs**: Existing color assignments, function type
- **Outputs**: Color selection
- **Success Criteria**: Color is unique and appropriate
- **Error Handling**:
    - **Likely Failures**: Color already in use
    - **Recovery Strategy**: Select alternative from palette
    - **Escalation Path**: Expand color options
- **Timing**: 2 minutes

#### Quality Gate: Identity Coherence
- **Validation Criteria**:
    - [ ] Name accurately reflects function
    - [ ] Description enables delegation
    - [ ] Color provides visual distinction
- **Pass Actions**: Proceed to Phase 3
- **Fail Actions**: Refine identity elements

### Phase 3: Structure System Prompt
> *Build the comprehensive system prompt that defines agent behavior*

#### Parallel Execution Block
> *Core sections and governance can be developed simultaneously*

##### Branch A: Core Sections

###### Step 3.1a: Purpose & Role
- **Purpose**: Define the agent's expertise and responsibilities
- **Instructions**: Write 1-2 paragraphs establishing role and expertise
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in prompt crafting
- **Inputs**: Requirements analysis, purpose statement
- **Outputs**: Purpose & Role section
- **Success Criteria**: Clear understanding of agent's expertise
- **Error Handling**:
    - **Likely Failures**: Too broad or narrow scope
    - **Recovery Strategy**: Align with single responsibility
    - **Escalation Path**: Review purpose definition
- **Timing**: 15 minutes

###### Step 3.2a: Instructions (0-based)
- **Purpose**: Provide numbered instructions for task execution
- **Instructions**: Start with instruction 0 for scope analysis, then specific steps
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in instruction design
- **Inputs**: Task list, workflow patterns
- **Outputs**: Numbered instructions section
- **Success Criteria**: Instructions are actionable and clear
- **Error Handling**:
    - **Likely Failures**: Missing instruction 0
    - **Recovery Strategy**: Add scope analysis instruction
    - **Escalation Path**: Review instruction patterns
- **Timing**: 20 minutes

###### Step 3.3a: Best Practices
- **Purpose**: Guide quality and approach
- **Instructions**: List domain-specific best practices with wikilinks
- **Agent**: @agents/meta/meta-prompt-engineer.md - Expert in best practices
- **Inputs**: Domain knowledge, project standards
- **Outputs**: Best practices section
- **Success Criteria**: Practices enhance output quality
- **Error Handling**:
    - **Likely Failures**: Generic practices
    - **Recovery Strategy**: Add domain specificity
    - **Escalation Path**: Research domain standards
- **Timing**: 15 minutes

##### Branch B: Governance

###### Step 3.1b: ALWAYS/NEVER Rules
- **Purpose**: Define strict behavioral boundaries
- **Instructions**: Create event-driven rules using WHEN/THEN pattern
- **Agent**: @agents/meta/meta-instructions-expert.md - Expert in rule creation
- **Inputs**: Constraints, security requirements
- **Outputs**: Rules section with Always/Never subsections
- **Success Criteria**: Rules prevent errors and ensure quality
- **Error Handling**:
    - **Likely Failures**: Contradictory rules
    - **Recovery Strategy**: Resolve conflicts
    - **Escalation Path**: Priority review
- **Timing**: 15 minutes

###### Step 3.2b: Relevant Context
- **Purpose**: Provide essential references and resources
- **Instructions**: List project files, documentation, and external resources
- **Agent**: @agents/meta/meta-context-expert.md - Expert in documentation
- **Inputs**: Dependencies, related components
- **Outputs**: Relevant Context section with subsections
- **Success Criteria**: All necessary resources identified
- **Error Handling**:
    - **Likely Failures**: Missing critical references
    - **Recovery Strategy**: Review dependencies
    - **Escalation Path**: Documentation audit
- **Timing**: 10 minutes

###### Step 3.3b: Quality Standards
- **Purpose**: Define measurable quality criteria
- **Instructions**: Create table with categories, standards, and verification
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in quality metrics
- **Inputs**: Success criteria, domain standards
- **Outputs**: Quality Standards table
- **Success Criteria**: Standards are measurable
- **Error Handling**:
    - **Likely Failures**: Vague standards
    - **Recovery Strategy**: Add specific metrics
    - **Escalation Path**: Define measurements
- **Timing**: 15 minutes

#### Synchronization Point: Report/Response Format
- **Merge Conditions**: All parallel sections complete
- **Conflict Resolution**: Ensure consistency across sections
- **Combined Output**: Complete system prompt structure

### Phase 4: Validate Configuration
> *Ensure the agent meets all quality and security requirements*

#### Decision Point: Complexity Assessment
- **Decision Criteria Matrix**:
  ```
  | Tool Count | Instruction Count | Wikilinks | Route To        |
  |:---------- |:---------------- |:--------- |:--------------- |
  | < 3        | < 10             | < 5       | Simple Path     |
  | >= 3       | Any              | Any       | Complex Path    |
  | Any        | >= 10            | Any       | Complex Path    |
  | Any        | Any              | >= 5      | Complex Path    |
  ```
- **Evaluation Logic**: Count tools, instructions, and wikilinks
- **Default Path**: Complex Path for safety

#### Branch Routes

##### Simple Agent Path
###### Step 4.1a: Basic Validation
- **Purpose**: Quick validation for simple agents
- **Instructions**: Check core requirements and structure
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in validation
- **Inputs**: Complete agent definition
- **Outputs**: Validation report
- **Success Criteria**: All basic checks pass
- **Error Handling**:
    - **Likely Failures**: Missing required sections
    - **Recovery Strategy**: Add missing elements
    - **Escalation Path**: Full review
- **Timing**: 10 minutes

##### Complex Agent Path
###### Step 4.1b: Comprehensive Review
- **Purpose**: Thorough validation for complex agents
- **Instructions**: Deep review of all aspects including security
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in comprehensive review
- **Inputs**: Complete agent definition
- **Outputs**: Detailed review report
- **Success Criteria**: All checks pass, security verified
- **Error Handling**:
    - **Likely Failures**: Security concerns
    - **Recovery Strategy**: Restrict tool access
    - **Escalation Path**: Security team review
- **Timing**: 20 minutes

#### Quality Gate: Production Readiness
- **Validation Criteria**:
    - [ ] Single responsibility maintained
    - [ ] Tool access appropriate
    - [ ] Instructions clear and complete
    - [ ] All sections present
    - [ ] WikiLinks valid
- **Pass Actions**: Proceed to Phase 5
- **Fail Actions**: Return to appropriate phase for fixes

### Phase 5: Deliver Agent
> *Write the agent to the filesystem and verify integration*

#### Prerequisites
- Validated agent configuration
- Write access to agents directory
- Understanding of file organization

#### Step 5.1: Write to Filesystem
- **Purpose**: Create the agent file in the correct location
- **Instructions**: Write complete agent to @agents/<subdirectory>/<name>.md`
- **Agent**: System file writer
- **Inputs**: Complete agent definition, file path
- **Outputs**: Agent file on disk
- **Success Criteria**: File created successfully
- **Error Handling**:
    - **Likely Failures**: Directory doesn't exist
    - **Recovery Strategy**: Create directory structure
    - **Escalation Path**: Filesystem permissions
- **Timing**: 2 minutes

#### Step 5.2: Verify WikiLinks
- **Purpose**: Ensure all references resolve correctly
- **Instructions**: Check that all [[wikilinks-wl-example]] point to existing files
- **Agent**: @agents/meta/meta-sub-agent-architect.md - Expert in wikilink validation
- **Inputs**: Agent file content
- **Outputs**: WikiLink validation report
- **Success Criteria**: All wikilinks resolve
- **Error Handling**:
    - **Likely Failures**: Broken wikilinks
    - **Recovery Strategy**: Fix references or create missing files
    - **Escalation Path**: Documentation update
- **Timing**: 5 minutes

#### Quality Gate: Integration Test
- **Validation Criteria**:
    - [ ] File exists at correct path
    - [ ] YAML frontmatter valid
    - [ ] All wikilinks resolve
    - [ ] Agent activates properly
- **Pass Actions**: Agent ready for use
- **Fail Actions**: Debug integration issues

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:---------- |:-------- |:---------------- |:----------------- |
| Multiple Purposes | High | Requirements analysis | Split into multiple agents |
| Tool Over-provisioning | Critical | Security review | Apply least privilege |
| Name Collision | Medium | Filesystem check | Add qualifier |
| Broken WikiLinks | Medium | Link validation | Fix references |
| Missing Sections | High | Structure validation | Add required sections |

### Circuit Breaker Patterns
- **Security Violation**: Halt if excessive tool access requested
- **Scope Creep**: Stop if agent purpose expands beyond single responsibility
- **Reference Loop**: Break if circular wikilink dependencies detected

### Rollback Procedures
1. **Phase-Level Rollback**: Return to previous phase with corrections
2. **Identity Rollback**: Regenerate name/description if conflicts
3. **File Rollback**: Remove created files if validation fails

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Creation Time**: Target < 60 minutes for simple agents
- **Validation Pass Rate**: Target > 90% first-time pass
- **WikiLink Resolution**: Target 100% valid references
- **Reusability Score**: Measure cross-project usage

### Optimization Opportunities
- **Template Reuse**: Extract common patterns to templates
- **Parallel Execution**: Run independent steps simultaneously
- **Automated Validation**: Script common checks
- **Component Library**: Build reusable prompt sections

### Learning Loops
- **Pattern Recognition**: Identify recurring agent types
- **Error Analysis**: Track common validation failures
- **Performance Tuning**: Optimize slow workflow steps
- **User Feedback**: Incorporate usage patterns

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Clear requirements from user
- [ ] Access to project documentation
- [ ] Understanding of existing agents
- [ ] Write permissions to agents directory

### Resource Requirements
- **Agents**: meta-sub-agent-architect, meta-prompt-engineer, meta-instructions-expert, meta-context-expert
- **Tools**: File system access, text editor, validation scripts
- **Time**: 30-60 minutes depending on complexity
- **Skills**: Prompt engineering, system design, security awareness

### Execution Checklist
1. [ ] Gather requirements from user
2. [ ] Review existing agents for patterns
3. [ ] Begin Phase 1: Requirements Analysis
4. [ ] Complete identity design
5. [ ] Structure system prompt sections
6. [ ] Validate configuration thoroughly
7. [ ] Write agent to filesystem
8. [ ] Verify integration
9. [ ] Test agent activation
10. [ ] Document any special considerations

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| Agent too broad | Multiple purposes combined | Split into separate agents |
| Delegation fails | Vague description | Rewrite with specific "Use when..." |
| WikiLinks broken | Files moved or renamed | Update references |
| Validation fails | Missing required sections | Add sections per template |
| Tool errors | Excessive permissions | Restrict to necessary tools |

## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: Initial workflow with 5-phase structure
- **v1.1**: Added parallel execution in Phase 3
- **v1.2**: Enhanced error handling and recovery
- **vNext**: Planned automation of validation steps

### Modification Triggers
- New agent patterns emerge from usage
- Security requirements change
- Framework updates affect structure
- Performance metrics indicate bottlenecks

### Deprecation Strategy
- Maintain backward compatibility for existing agents
- Provide migration path for old formats
- Phase out obsolete patterns gradually
- Document breaking changes clearly

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
- Follow @instructions/rules/template-rules.md for examples

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

# 📏 Agent Rules
> 💡 *Non-negotiable rules that ensure agent quality, security, and consistency.*

## 👍 Always

### WHEN creating new agents
- ALWAYS include all required sections from @templates/agents/agent-template.md
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
- ALWAYS end example wikilinks with "-wl-example"
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
- Read @references/claude-code-sub-agents-reference.md
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
role: @agents/meta/meta-sub-agent-architect.md
