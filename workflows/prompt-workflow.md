# 🌊 Prompt Workflow: Systematic Creation Through Modular Decomposition
> 💡 *Transform desires into production-ready prompts by systematically decomposing requirements into modular components that contribute to a measurable End Goal.*

The prompt workflow embodies the framework's core philosophy: every effective prompt consists of modular components, each included only when it contributes to achieving the end goal. This workflow guides the systematic creation of prompts that are focused, reusable, and aligned with project conventions.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
This workflow exists to transform vague desires into precise, modular prompts that achieve specific outcomes. It enables the creation of prompts that are not just functional, but architecturally sound - following the evolution path from inline implementation to extracted components to reusable modules.

### Guiding Principles
1. **End Goal Primacy**: The End Goal determines everything - it's the north star that decides whether any component should exist
2. **Ruthless Modularity**: Include only what contributes; exclude everything else no matter how common or expected
3. **Progressive Enhancement**: Start complete inline, then extract patterns, then modularize for reuse
4. **Systematic Refinement**: Apply structured questioning to eliminate ambiguity and maximize clarity

### Success Criteria
- Prompt achieves its End Goal without unnecessary components
- Every included section demonstrably contributes to the outcome
- Reusable components are properly extracted and referenced
- The prompt follows all project conventions and patterns
- WikiLinks enable maximum modularity and maintenance

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **End Goal**: The measurable objective that determines component inclusion
- **Persona**: Optional expertise attributes that enhance outcome quality
- **Request**: The verb-first activity specification
- **Workflow**: Optional atomic steps for multi-phase processes
- **Instructions**: Optional event-driven rules that prevent failure
- **Output Format**: Optional structure specifications for deliverables

### Workflow Patterns
- **Decomposition Pattern**: Break desires into standard component types
- **Extraction Pattern**: Move inline content to reusable files
- **Embedding Pattern**: Include content via `![[wikilinks-wl-example]]` on separate lines
- **Validation Pattern**: Test each component against End Goal contribution

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow systematically transforms user desires into production-ready prompts through a five-phase process. Each phase builds on the previous, with quality gates ensuring alignment with the modular philosophy. The methodology emphasizes progressive refinement and component reusability.

### Phase Architecture
```
Phase 1: Desire Discovery
├── Step 1.1: Capture Initial Request
├── Step 1.2: Extract Core Verb
└── Quality Gate: Clear Action Identified

Phase 2: Component Analysis
├── Step 2.1: Define End Goal
├── Step 2.2: Evaluate Component Needs
├── Decision Point: Component Inclusion
└── Quality Gate: Modularity Verified

Phase 3: Structure Assembly
├── Step 3.1: Apply Prompt Template
├── Step 3.2: Populate Required Sections
├── Step 3.3: Add Optional Components
└── Quality Gate: Structure Validated

Phase 4: Refinement Application
├── Step 4.1: Apply Question-Mode
├── Step 4.2: Resolve Ambiguities
├── Step 4.3: Optimize Components
└── Quality Gate: Clarity Achieved

Phase 5: Integration & Extraction
├── Step 5.1: Identify Reusable Components
├── Step 5.2: Extract to Files
├── Step 5.3: Implement WikiLinks
└── Quality Gate: Modularity Maximized
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Desire Discovery
> *Understanding what the user wants to achieve is the foundation of effective prompt creation.*

#### Prerequisites
- User has a task or outcome in mind
- Access to prompt creation tools
- Understanding of framework conventions

#### Step 1.1: Capture Initial Request
- **Purpose**: Understand the user's core desire
- **Instructions**: Ask "What do you want to do with this prompt?"
- **Agent**: [[meta-prompt-engineer]] - Expert in prompt design
- **Inputs**: User's initial request or description
- **Outputs**: Documented desire statement
- **Success Criteria**: Clear understanding of intended outcome
- **Error Handling**:
    - **Likely Failures**: Vague or overly broad requests
    - **Recovery Strategy**: Apply clarifying questions
    - **Escalation Path**: Request specific examples
- **Timing**: 2-5 minutes

#### Step 1.2: Extract Core Verb
- **Purpose**: Identify the primary action the prompt must enable
- **Instructions**: Map desire to action verb (create, update, analyze, transform)
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Desire statement
- **Outputs**: Core verb and activity specification
- **Success Criteria**: Verb-first request formulated
- **Error Handling**:
    - **Likely Failures**: Multiple competing verbs
    - **Recovery Strategy**: Identify primary vs. secondary actions
    - **Escalation Path**: Split into multiple prompts
- **Timing**: 1-2 minutes

#### Quality Gate: Clear Action Identified
- **Validation Criteria**:
    - [ ] Core verb is specific and actionable
    - [ ] Activity scope is well-defined
    - [ ] Outcome is measurable
- **Pass Actions**: Proceed to Component Analysis
- **Fail Actions**: Return to Desire Discovery with targeted questions

### Phase 2: Component Analysis
> *Determining which components contribute to the End Goal ensures ruthless modularity.*

#### Prerequisites
- Clear action verb identified
- Understanding of component types
- Access to existing components

#### Step 2.1: Define End Goal
- **Purpose**: Establish the north star for component inclusion
- **Instructions**: Write clear, measurable success criteria
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Core verb and activity
- **Outputs**: End Goal statement
- **Success Criteria**: Specific, measurable objective defined
- **Error Handling**:
    - **Likely Failures**: Too abstract or unmeasurable
    - **Recovery Strategy**: Add specific success metrics
    - **Escalation Path**: Break into sub-goals
- **Timing**: 3-5 minutes

#### Step 2.2: Evaluate Component Needs
- **Purpose**: Determine which optional components add value
- **Instructions**: Test each component type against End Goal
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: End Goal and component list
- **Outputs**: Component inclusion decisions
- **Success Criteria**: Clear rationale for each inclusion/exclusion
- **Error Handling**:
    - **Likely Failures**: Including components by default
    - **Recovery Strategy**: Re-test against End Goal
    - **Escalation Path**: Document exclusion rationale
- **Timing**: 5-10 minutes

#### Decision Point: Component Inclusion
- **Decision Criteria Matrix**:
  ```
  | Component | Contributes? | Complexity | Include |
  |:----------|:------------|:-----------|:--------|
  | Persona   | Significantly | Low        | Yes     |
  | Persona   | Marginally   | High       | No      |
  | Workflow  | Required     | Any        | Yes     |
  | Instructions | Prevents Failure | Any   | Yes     |
  ```
- **Evaluation Logic**: Include only if contribution exceeds complexity
- **Default Path**: Exclude unless proven necessary

#### Quality Gate: Modularity Verified
- **Validation Criteria**:
    - [ ] Every included component has clear justification
    - [ ] No components included by convention alone
    - [ ] End Goal drives all decisions
- **Pass Actions**: Proceed to Structure Assembly
- **Fail Actions**: Re-evaluate component necessity

### Phase 3: Structure Assembly
> *Building the prompt using the established template ensures consistency and completeness.*

#### Prerequisites
- Component decisions finalized
- Access to prompt-template.md
- Understanding of markdown structure

#### Step 3.1: Apply Prompt Template
- **Purpose**: Establish consistent structure
- **Instructions**: Use [[prompt-template]] as foundation
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Component decisions
- **Outputs**: Basic prompt structure
- **Success Criteria**: Template properly applied
- **Error Handling**:
    - **Likely Failures**: Deviating from template
    - **Recovery Strategy**: Reset to template
    - **Escalation Path**: Document why deviation needed
- **Timing**: 2-3 minutes

#### Step 3.2: Populate Required Sections
- **Purpose**: Fill in End Goal and Request (always required)
- **Instructions**: Write clear, specific content for required sections
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: End Goal statement, verb-first request
- **Outputs**: Completed required sections
- **Success Criteria**: Sections clear and actionable
- **Error Handling**:
    - **Likely Failures**: Vague or verbose content
    - **Recovery Strategy**: Simplify and clarify
    - **Escalation Path**: Get user input
- **Timing**: 5-10 minutes

#### Step 3.3: Add Optional Components
- **Purpose**: Include only components that passed evaluation
- **Instructions**: Add Persona, Workflow, Instructions, Output Format as needed
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Component content
- **Outputs**: Complete prompt draft
- **Success Criteria**: All included components properly structured
- **Error Handling**:
    - **Likely Failures**: Component creep during writing
    - **Recovery Strategy**: Re-validate against End Goal
    - **Escalation Path**: Remove marginal components
- **Timing**: 10-20 minutes

#### Quality Gate: Structure Validated
- **Validation Criteria**:
    - [ ] Follows prompt-template.md exactly
    - [ ] All sections properly formatted
    - [ ] YAML frontmatter included if needed
- **Pass Actions**: Proceed to Refinement
- **Fail Actions**: Correct structural issues

### Phase 4: Refinement Application
> *Systematic questioning eliminates ambiguity and maximizes clarity.*

#### Prerequisites
- Complete prompt draft
- Understanding of question-mode
- Time for iterative refinement

#### Step 4.1: Apply Question-Mode
- **Purpose**: Systematically improve prompt quality
- **Instructions**: Use 5 question types: Simplify, Clarify, Improve, Expand, Reduce
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Prompt draft
- **Outputs**: Refinement questions
- **Success Criteria**: All question types applied
- **Error Handling**:
    - **Likely Failures**: Skipping question types
    - **Recovery Strategy**: Use Batch-5 mode
    - **Escalation Path**: Document why skipped
- **Timing**: 10-15 minutes

#### Step 4.2: Resolve Ambiguities
- **Purpose**: Eliminate unclear or vague elements
- **Instructions**: Address each identified ambiguity
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Refinement questions
- **Outputs**: Clarified prompt content
- **Success Criteria**: No ambiguities remain
- **Error Handling**:
    - **Likely Failures**: Hidden assumptions
    - **Recovery Strategy**: External review
    - **Escalation Path**: Document assumptions
- **Timing**: 5-10 minutes

#### Step 4.3: Optimize Components
- **Purpose**: Ensure maximum effectiveness with minimum complexity
- **Instructions**: Simplify without losing functionality
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Refined prompt
- **Outputs**: Optimized prompt
- **Success Criteria**: Cannot simplify further without losing value
- **Error Handling**:
    - **Likely Failures**: Over-optimization
    - **Recovery Strategy**: Test against use cases
    - **Escalation Path**: Keep complex if needed
- **Timing**: 5-10 minutes

#### Quality Gate: Clarity Achieved
- **Validation Criteria**:
    - [ ] All ambiguities resolved
    - [ ] Language is precise and clear
    - [ ] Examples follow template-rules
- **Pass Actions**: Proceed to Integration
- **Fail Actions**: Continue refinement

### Phase 5: Integration & Extraction
> *Maximizing reusability through component extraction and wikilink implementation.*

#### Prerequisites
- Refined prompt complete
- Understanding of wikilink mechanics
- Access to component directories

#### Step 5.1: Identify Reusable Components
- **Purpose**: Find components that could benefit other prompts
- **Instructions**: Evaluate each component for reusability
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Complete prompt
- **Outputs**: List of extractable components
- **Success Criteria**: Reusable components identified
- **Error Handling**:
    - **Likely Failures**: Over-extraction
    - **Recovery Strategy**: Test reusability scenarios
    - **Escalation Path**: Keep inline if uncertain
- **Timing**: 5-10 minutes

#### Step 5.2: Extract to Files
- **Purpose**: Create separate files for reusable components
- **Instructions**: Save to appropriate directories with proper naming
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Components to extract
- **Outputs**: Component files created
- **Success Criteria**: Files follow naming conventions
- **Error Handling**:
    - **Likely Failures**: Wrong directory placement
    - **Recovery Strategy**: Check conventions
    - **Escalation Path**: Create new category
- **Timing**: 10-15 minutes

#### Step 5.3: Implement WikiLinks
- **Purpose**: Connect prompt to extracted components
- **Instructions**: Replace inline content with `![[component-wl-example]]` on separate lines
- **Agent**: [[meta-prompt-engineer]]
- **Inputs**: Component file names
- **Outputs**: Prompt with wikilinks
- **Success Criteria**: All wikilinks properly formatted
- **Error Handling**:
    - **Likely Failures**: Inline embedding
    - **Recovery Strategy**: Move to separate line
    - **Escalation Path**: Keep inline if needed
- **Timing**: 5-10 minutes

#### Quality Gate: Modularity Maximized
- **Validation Criteria**:
    - [ ] Reusable components extracted
    - [ ] WikiLinks properly implemented
    - [ ] Embedded wikilinks on separate lines
- **Pass Actions**: Prompt complete
- **Fail Actions**: Fix wikilink issues

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:-----------|:---------|:-----------------|:------------------|
| Vague End Goal | High | Cannot measure success | Apply SMART criteria |
| Component Creep | Medium | Unnecessary sections | Re-test against End Goal |
| WikiLink Errors | Low | Broken references | Verify file existence |
| Template Deviation | Medium | Structure mismatch | Reset to template |

### Circuit Breaker Patterns
- **Complexity Overload**: Stop if more than 5 optional components
- **Refinement Loop**: Maximum 3 refinement iterations
- **Extraction Paralysis**: Keep inline if >2 minutes deciding

### Rollback Procedures
1. **Phase-Level Rollback**: Return to previous phase output
2. **Component Rollback**: Remove questionable components
3. **Structure Rollback**: Reset to template baseline

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Component Efficiency**: Ratio of included to considered components
- **Refinement Cycles**: Number of iterations needed
- **Reusability Rate**: Percentage of components extracted
- **Time to Completion**: Total workflow duration

### Optimization Opportunities
- **Template Variations**: Create specialized templates for common patterns
- **Component Library**: Build catalog of reusable components
- **Question Banks**: Develop targeted question sets

### Learning Loops
- **Usage Tracking**: Monitor which components are most reused
- **Failure Analysis**: Study why prompts fail to achieve goals
- **Evolution Patterns**: Track inline → extracted → agent progression

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Clear understanding of desired outcome
- [ ] Access to prompt-template.md
- [ ] Knowledge of wikilink syntax
- [ ] Understanding of project conventions

### Resource Requirements
- **Agents**: meta-prompt-engineer
- **Tools**: Text editor, file system access
- **Time**: 45-90 minutes for complete workflow
- **Skills**: Prompt engineering, modular design

### Execution Checklist
1. [ ] Capture user desire
2. [ ] Extract core verb
3. [ ] Define End Goal
4. [ ] Evaluate components
5. [ ] Apply template
6. [ ] Populate sections
7. [ ] Apply refinement
8. [ ] Extract components
9. [ ] Implement wikilinks
10. [ ] Validate output

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:--------|:-------------|:-----------|
| Prompt too complex | Too many components | Remove marginal contributors |
| Unclear outcomes | Vague End Goal | Apply SMART criteria |
| Broken wikilinks | Wrong file names | Verify exact names |
| Poor reusability | Over-specific content | Generalize components |

## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: Initial workflow with 5-phase structure
- **v1.1**: Added question-mode integration
- **v1.2**: Enhanced component extraction patterns

### Modification Triggers
- Discovery of new component patterns
- Changes to prompt-template.md
- Framework philosophy updates
- User feedback on effectiveness

### Deprecation Strategy
- Gradual migration to new patterns
- Backward compatibility via aliases
- Documentation of breaking changes
