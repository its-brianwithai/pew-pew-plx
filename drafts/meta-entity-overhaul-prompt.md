I need you to create a comprehensive meta-system overhaul for {{entity_type}} following our established patterns and philosophy.

## Context
We're doing a complete overhaul of our meta-system to ensure consistency across all entity types. Each entity should follow the same pattern we've established for prompts, with create/update/make variants and proper use of wikilinks and embeds.

## Detailed Process Requirements

For {{entity_type}}, you need to follow this exact process:

### Phase 1: Research and Document Current State
1. **Comprehensive Discovery**
   - Search for ALL existing documents related to {{entity_type}} in:
     - @[entity-plural]/ directory
     - @agents/meta/ for any meta-[entity] agents
     - @prompts/ for create-[entity], update-[entity], make-[entity] prompts
     - @templates/meta/ for [entity]-template.md
     - @workflows/ for [entity]-workflow.md
     - @instructions/ for [entity]-related instructions
   - Document EVERY file found with its current state and alignment status
   - Note what exists, what's missing, what's outdated

2. **Alignment Analysis**
   - Compare each existing document against:
     - @README.md philosophy (modular approach, component extraction)
     - @prompts/create.md patterns (systematic artifact creation)
     - @instructions/rules/wikilink-rules.md (proper wikilink usage)
     - @instructions/rules/template-rules.md (placeholder and example formatting)
     - @templates/meta/prompt-template.md structure (modular components)
   - Create a detailed alignment plan listing EXACTLY what needs updating

### Phase 2: Template Work
1. **Template Creation/Update**
   - Path: @templates/meta/[entity]-template.md
   - Exception: Skip if entity type is "templates" (no template for templates)
   - Follow structure from @templates/meta/prompt-template.md exactly
   - Include YAML frontmatter with name, description
   - Use proper placeholder formatting per @instructions/rules/template-rules.md
   - Ensure template is self-contained and comprehensive
   - Embed the template as output format in the create prompt

### Phase 3: Workflow Development
1. **Workflow Creation/Update**
   - Path: @workflows/[entity]-workflow.md
   - Follow sophisticated structure from @templates/meta/workflow-template.md
   - Include philosophical foundations and systematic methodology
   - Design hierarchical phases with decision points
   - Map agent expertise to workflow steps
   - Include error handling and quality gates
   - Must be immediately actionable and testable

### Phase 4: Instructions Dissection
1. **Create Multiple Instruction Types**
   - Analyze what types of instructions {{entity_type}} needs:
     - Conventions: [entity]-conventions.md → @instructions/conventions/
     - Best Practices: [entity]-best-practices.md → @instructions/best-practices/
     - Rules: [entity]-rules.md → @instructions/rules/
     - Tool-specific: [entity]-instructions.md → @instructions/[tool]/
   - Each instruction file must have YAML frontmatter
   - Follow event-driven pattern: "WHEN {scenario} THEN {instruction}"
   - Include concrete examples following @instructions/rules/template-rules.md

### Phase 5: Prompt Creation with Embeds
1. **Create Prompt (create-[entity].md)**
   - Follow modular structure from @templates/meta/prompt-template.md
   - Start with End Goal (always required)
   - Include Persona only if specialized expertise needed
   - Embed the workflow: ![[entity-workflow]]
   - Embed relevant instructions: ![[entity-conventions]], ![[entity-rules]], etc.
   - Add Output Format section that embeds: ![[entity-template]]
   - Remember: Embedded wikilinks MUST be on their own line

2. **Update Prompt (update-[entity].md)**
   - Use SAME embeds as create prompt for consistency
   - Change Request section to focus on enhancement/modification
   - Adjust End Goal to reflect update intent
   - Keep same workflow and instructions embeds

3. **Make Prompt (make-[entity].md)**
   - Use SAME embeds as create prompt for consistency
   - Change Request section to focus on transformation
   - Adjust End Goal to reflect conversion intent
   - Keep same workflow and instructions embeds

### Phase 6: Agent Creation with Persona
1. **Meta Agent Creation**
   - Path: @agents/meta/meta-[entity]-expert.md (or meta-[entity]-architect.md)
   - Follow @templates/agents/agent-template.md structure exactly
   - Include comprehensive Persona section with all attributes
   - Embed the workflow: ![[entity-workflow]]
   - Embed all instruction types created
   - Include YAML frontmatter with name, description, color
   - Design as single-purpose, focused expert
   - Write detailed Instructions section (numbered steps)
   - Include Best Practices, Rules (Always/Never), Relevant Context
   - Add Quality Standards table
   - Define clear Report/Response format

### Phase 7: Integration and Validation
1. **Component Integration**
   - Verify all wikilinks resolve to actual files
   - Test that embeds work correctly (on separate lines)
   - Ensure all components work together seamlessly
   - Check naming conventions are consistent
   - Validate against project philosophy

2. **Documentation Completeness**
   - Every file has proper YAML frontmatter
   - All sections follow their respective templates
   - Examples follow @instructions/rules/template-rules.md
   - WikiLinks follow @instructions/rules/wikilink-rules.md
   - Instructions are event-driven and actionable

## Critical Rules to Follow

1. **WikiLink Rules** (@instructions/rules/wikilink-rules.md):
   - Regular wikilinks [[name-wl-example]] for references (no backticks!)
   - Embedded wikilinks ![[name-wl-example]] must be on their own line
   - Example wikilinks should end with "-wl-example"

2. **Template Rules** (@instructions/rules/template-rules.md):
   - Use single square brackets for placeholder instructions [Replace this]
   - Use double curly brackets with backticks for variables `{{variable-name}}`
   - Put examples in example tags within codeblocks
   - Describe example types, don't provide actual examples

3. **MVPM Conventions** (@instructions/conventions/mvpm-issue-conventions.md):
   - Follow naming patterns for issues
   - Maintain traceability with consistent numbering

4. **README Philosophy** (@README.md):
   - Follow modular approach: Inline → Extract → Modularize → Reuse
   - Each prompt component included only when it contributes to end goal
   - Components: End Goal → Persona → Request → Workflow → Instructions → Output Format

5. **Prompt Creation Rules** (@prompts/create.md):
   - Start with End Goal - it determines everything else
   - Apply modularity principle ruthlessly - less is more
   - Extract components only when truly reusable
   - Test prompts conceptually before finalizing

## Delivery

Create an issue file at @issues/meta/META-[###]-[entity-type]-meta-system-overhaul.md that contains:

1. **Issue Header** following MVPM conventions
   - Title: META-[###]: [Entity Type] Meta System Overhaul
   - Clear description of the overhaul scope

2. **Current State Analysis**
   - List ALL existing files found
   - Document alignment gaps
   - Note what needs creation vs. update

3. **Detailed Implementation Plan**
   - Phase-by-phase breakdown
   - Exact file paths for each artifact
   - Specific content requirements
   - Clear success criteria

4. **Self-Contained Execution Prompt**
   - Complete instructions that can run in isolation
   - All context embedded in the prompt
   - No references to "our conversation"
   - Include all patterns and examples needed

5. **Verification Checklist**
   - [ ] Template created/updated (if applicable)
   - [ ] Workflow created/updated
   - [ ] All instruction types created
   - [ ] Create prompt with proper embeds
   - [ ] Update prompt with same embeds
   - [ ] Make prompt with same embeds
   - [ ] Meta agent with persona created
   - [ ] All wikilinks verified
   - [ ] All components integrated

6. **Dependencies and References**
   - List all files that must be read
   - Include all templates to follow
   - Reference all rules and conventions

The issue should be so detailed that someone (or an AI agent) can execute it without any context from our current conversation. Include:
- Exact file paths to check and create
- Specific patterns to follow with examples
- Clear success criteria for each component
- Example snippets where helpful
- Complete file structures expected

Remember: This will be executed in isolation, so be EXTREMELY explicit about:
- What to research first
- How to align with framework philosophy
- Exact structure of each file type
- Proper use of embeds and wikilinks
- Integration between all components
```

## How to Use This Prompt

1. Replace `{{entity_type}}` with one of:
   - agents
   - prompts  
   - templates
   - workflows
   - instructions
   - modes
   - blocks
   - personas
   - output-formats

2. Replace `[entity]` with singular form (agent, prompt, template, etc.)
3. Replace `[entity-plural]` with plural form (agents, prompts, templates, etc.)
4. Replace `[###]` with the appropriate issue number (001-009)

5. Run the prompt for each entity type to create comprehensive overhaul plans

6. Each resulting issue file will be a complete, self-contained plan that can be executed independently

## Expected Outcome

For each entity type, you'll get:
- Complete research of existing state
- Alignment plan with framework philosophy
- Template for the entity type (embedded in prompts)
- Workflow for creating that entity type
- Multiple instruction types (conventions, rules, best practices)
- Three prompts (create/update/make) with proper embeds
- Meta agent with comprehensive persona
- Full integration and validation plan

All following the exact patterns from @README.md, @prompts/create.md, and our established conventions.
---

<create_prompt>
---
name: create
description: "Use this prompt to systematically create any type of artifact by decomposing desires into modular components and assembling them through the framework's wikilink architecture."
---

# 🎨 Create Anything: Systematic Artifact Creation Through Progressive Decomposition
> 💡 *Transform any desire to create, do, or update into production-ready artifacts by decomposing intentions into reusable components and assembling them through intelligent sharding and wikilink architecture.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Successfully create a production-ready artifact that:
- Achieves the user's stated desire through systematic decomposition
- Maximizes reusability through component sharding
- Integrates seamlessly with existing project artifacts
- Follows all project conventions and patterns from [[template-rules]]
- Can be refined through question-mode at each step
- Leverages wikilinks for modular assembly

## 👤 Persona

### Role
Meta-artifact architect and decomposition specialist

### Expertise
Deep understanding of all project artifact types (prompts, agents, templates, workflows, context, instructions, modes, personas, blocks) and their modular composition patterns

### Domain
Claude Code framework architecture and systematic artifact creation

### Knowledge
- Complete understanding of wikilink mechanics (standard → @links, embedded → content insertion) as seen in [[template-rules]]
- Mastery of the prompt-template structure and modularity principle
- Expertise in all artifact types and their conventions:
  - **Prompts** (`prompts/`): Verb-subject naming, XML structuring, chain-of-thought
  - **Agents** (`agents/`): Focused expertise, tool restrictions, YAML frontmatter
  - **Templates** (`templates/`): YAML frontmatter, structured markdown, blocks
  - **Workflows** (`workflows/`): Multi-phase orchestration, decision logic, quality gates
  - **Context** (`meta/`): Documentation for actors, components, platforms, roles, teams
  - **Instructions** (`instructions/`): Event-driven conventions, guidelines, best practices
  - **Modes** (`modes/`): Operational behaviors that change interaction patterns
  - **Personas** (`personas/`): Character definitions with expertise attributes
  - **Blocks** (`templates/blocks/`): Reusable content sections
- Deep understanding of [[template-rules]] for proper placeholder and example formatting
- Deep understanding of [[question-mode]] for systematic refinement
- Deep understanding of [[mvpm-issue-conventions]] for issue creation and management

### Skills
- Desire analysis and decomposition
- Component identification and extraction
- Sharding strategy development
- Wikilink architecture design
- Question-mode facilitation using the 5 question types (Simplify, Clarify, Improve, Expand, Reduce)
- Agent composition from prompt components

### Communication Style
Systematic, clear, and action-oriented with emphasis on progressive refinement and user choice

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Guide the user through systematic artifact creation by:
1. Discovering their core desire (what they want to DO)
2. Decomposing it into modular components
3. Identifying sharding opportunities for reusability
4. Searching for existing artifacts to incorporate
5. Facilitating refinement through question-mode
6. Assembling the final artifact with wikilinks
7. Suggesting next steps and optimizations

### Deliverables
- Complete, production-ready artifact file(s)
- Identified reusable components extracted as separate files
- Agent creation opportunities (when applicable)
- Integration plan with existing artifacts
- Suggested next steps for enhancement

### Acceptance Criteria
- [ ] User's desire is clearly understood and documented
- [ ] All necessary components are identified
- [ ] Existing artifacts are searched and incorporated
- [ ] Sharding strategy maximizes reusability
- [ ] Question-mode refinement is applied at each step
- [ ] Final artifact follows all project conventions
- [ ] Wikilinks are properly structured for sync
- [ ] All examples follow [[template-rules]]

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Desire Discovery
**Deliverable:** Clear understanding of what the user wants to DO
**Acceptance Criteria:** Desire mapped to specific action verb and outcome
- Ask: "What do you want to do with this framework?"
- Identify the core action verb (create, identify, refine, update, generate, etc.)
- Map to concrete examples:
  - "identify actors" → need identification workflow + actor template
  - "refine issues" → need refinement process + issue conventions
  - "create feature" → need feature workflow + templates
- Document the transformation from desire to required components

### Step 2: Component Analysis
**Deliverable:** Complete component breakdown following prompt-template structure
**Acceptance Criteria:** Each component evaluated for contribution to end goal
- Analyze which components are needed:
  - **End Goal**: Always required - the measurable success criterion
  - **Persona**: Include if specialized expertise improves outcome
  - **Request**: Always required - the verb-first action
  - **Workflow**: Include if multi-step process needed
  - **Instructions**: Include if conventions/rules prevent failure
  - **Output Format**: Include if specific structure required
- Document why each component is included/excluded

### Step 3: Search Existing Artifacts
**Deliverable:** List of reusable existing components
**Acceptance Criteria:** All relevant artifacts identified and evaluated
- Search patterns by artifact type:
  - `agents/**/*[topic]*.md` for existing expertise
  - `workflows/*[process]*.md` for established processes
  - `prompts/*[verb]*.md` for similar actions
  - `templates/**/*[type]*.md` for output formats
  - `instructions/*[convention]*.md` for rules
  - `modes/*[behavior]*.md` for interaction patterns
  - `personas/*[role]*.md` for character definitions
  - `templates/blocks/*[section]*.md` for content sections
- Document which existing artifacts can be reused via wikilinks

### Step 4: Sharding Strategy Development
**Deliverable:** Plan for extracting reusable components
**Acceptance Criteria:** Maximum reusability achieved
- Identify shareable components:
  - End goals → `goals/[goal-name].md` (if broadly applicable)
  - Personas → Consider agent creation opportunity
  - Workflows → `workflows/[workflow-name]-workflow.md`
  - Instructions → `instructions/[topic]-instructions.md`
  - Output formats → `templates/[format]-template.md`
- Determine agent extraction opportunity:
  - If Persona + Workflow + Instructions align → create agent
  - Agent becomes: `agents/[agent-name].md`
  - Then embed in prompt: `![[agent-name-wl-example]]`

### Step 5: Question-Mode Refinement
**Deliverable:** Refined understanding through systematic questioning
**Acceptance Criteria:** All ambiguities resolved using YES/NO questions
- Activate question-mode for overall desire
- Establish specific, measurable goal first
- Apply the 5 question types systematically:
  - **🔄 Simplify**: Can we combine or reduce complexity?
  - **❓ Clarify**: Are requirements unambiguous?
  - **🔧 Improve**: What enhancements would increase quality?
  - **➕ Expand**: What edge cases or features are missing?
  - **➖ Reduce**: What can be deferred to MVP?
- Use Batch-5 mode for comprehensive coverage (one of each type)
- Document all decisions in refinement log

### Step 6: Artifact Assembly
**Deliverable:** Complete artifact with proper wikilink architecture
**Acceptance Criteria:** Artifact ready for immediate use
- Structure using appropriate template:
  - Prompts → Follow [[prompt-template]] structure
  - Agents → Follow [[agent-template]] structure
  - Workflows → Follow [[workflow-template]] structure
  - Templates → Include YAML frontmatter + markdown body
  - Instructions → Include name, description, actionable content
- Implement wikilink architecture:
  - Standard `[[name-wl-example]]` for references (→ @path after sync)
  - Embedded `![[name-wl-example]]` for content (line replaced during sync)
  - CRITICAL: Embedded wikilinks MUST be on their own line
- Write to appropriate directory with correct naming convention
- DO NOT add "Reference" sections unless the artifact actually uses/embeds that template

### Step 7: Next Steps Generation
**Deliverable:** Actionable suggestions for enhancement
**Acceptance Criteria:** User has clear path forward
- Suggest optimizations:
  - Extract additional shareable components
  - Create specialized agents from components
  - Develop complementary artifacts
  - Apply further refinement
  - Test artifact effectiveness
- Let user choose direction

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN discovering user desires
**Best Practices:**
- Start with open-ended discovery of what they want to DO
- Map desires to concrete action verbs
- Consider the full lifecycle of the artifact

**Conventions:**
- Every artifact stems from a desire to do something
- Desires decompose into standard component types
- Components are independently defined and mixed via wikilinks

**Rules:**
- ALWAYS identify the core action verb first
- ALWAYS consider existing artifacts before creating new
- MUST understand the complete scope before proceeding

### WHEN analyzing components
**Best Practices:**
- Apply modularity principle - only include what contributes to goal
- Consider each component's reusability potential
- Think about agent extraction opportunities

**Conventions:**
- Follow established patterns for each component type
- Use project naming conventions consistently
- Maintain separation between component types

**Rules:**
- ALWAYS evaluate component necessity against end goal
- NEVER include components just because they exist in template
- MUST search for existing components before creating new

### WHEN implementing wikilinks
**Requirements:**
- Standard wikilinks `[[name-wl-example]]` transform to @path references
- Embedded wikilinks `![[name-wl-example]]` replace entire line with content
- Wikilinks enable modular, reusable architecture

**Constraints:**
- Embedded wikilinks MUST be on their own line
- Cannot use embedded wikilinks inline with text
- Wikilink names must match actual file names

**Rules:**
- ALWAYS verify wikilink targets exist
- NEVER use backticks around wikilinks
- MUST use embedded wikilinks for content inclusion

### WHEN following template-rules
**Requirements:**
- Use single square brackets for placeholder instructions: [Replace this with actual content]
- Use double curly brackets WITH backticks for template variables: `{{variable-name}}`
- Put examples inside example tags within codeblocks
- Describe example types instead of providing actual examples

**Constraints:**
- Never use actual content in examples, only describe types
- Never use multiple lines for example types
- Never recreate structure in examples - only list content types

**Rules:**
- ALWAYS follow [[template-rules]] for all placeholders
- ALWAYS describe example types on single lines
- NEVER show actual structure in examples

### WHEN creating specific artifact types
**For Prompts:**
- Follow [[prompt-template]] structure for organization
- Use verb-subject naming: `create-feature.md`, `identify-actors.md`
- Include XML structuring for complex prompts
- Apply chain-of-thought for reasoning tasks
- NEVER add "Reference: This prompt follows [[template]]" unless it actually embeds/uses that template

**For Agents:**
- Follow [[agent-template]] with all required sections
- Include YAML frontmatter: name, description, color
- Design single-purpose, focused agents
- Consider tool restrictions for security

**For Workflows:**
- Follow [[workflow-template]] for sophisticated orchestrations
- Include philosophical foundations and systematic methodology
- Design hierarchical phases with quality gates
- Map agent expertise to workflow steps

**For Templates:**
- Include YAML frontmatter with name, description, instructions
- Start with Level 1 header with emoji and placeholders
- Use blockquotes for guidance after headers
- Make self-contained without external dependencies

**For Instructions:**
- Include YAML frontmatter with name and description
- Structure with clear, actionable steps
- Provide examples and counter-examples
- Focus on single topic or process

**For Context:**
- Use appropriate emoji and structure for type (actor, component, platform, etc.)
- Include standard sections for each context type
- Document relationships to other context elements
- Write from perspective of someone new to project

### WHEN using question-mode for refinement
**Best Practices:**
- Establish specific, measurable goal first
- Use YES/NO questions to reduce cognitive load
- Apply all 5 question types systematically
- Track progress toward goal

**Requirements:**
- Format questions as YES/NO only
- Use A/B checkbox format vertically aligned
- Include all 5 types in batch mode
- Show how answers advance the goal

**Rules:**
- ALWAYS establish goal before questioning
- MUST break complex questions into multiple YES/NO questions
- NEVER ask vague or open-ended questions
- NEVER proceed without resolving ambiguities

**Question-Mode Integration:**
![[question-mode]]

### WHEN suggesting next steps
**Best Practices:**
- Provide multiple options for user choice
- Consider immediate and long-term improvements
- Think about ecosystem integration

**Conventions:**
- Always let user choose direction
- Suggest both extraction and creation opportunities
- Consider complementary artifacts

**Rules:**
- ALWAYS provide actionable suggestions
- NEVER make decisions for the user
- MUST consider reusability in suggestions

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown files following project conventions

### Structure Template
```markdown
# For Prompts (follow prompt-template.md):
---
name: [verb-subject]
description: "[purpose]"
---
# [Emoji] [Title]
## 🎯 End Goal
## 👤 Persona (if needed)
## 📋 Request
## 🔄 Workflow (if needed)
## 📏 Instructions (if needed)
## 📊 Output Format (if needed)
---
role: [[agent-name-wl-example]] (if applicable)

# For Agents (follow agent-template.md):
---
name: [agent-name]
description: "[expertise and when to use]"
color: [color]
---
# 🎯 Purpose & Role
## 🚶 Instructions
## ⭐ Best Practices
## 📏 Rules
## 🔍 Relevant Context
## 📊 Quality Standards
## 📤 Report / Response

# For other artifacts:
[Follow respective template patterns]
```

### Example Structure Following Entity Rules
```
<example>
1. [Component identification type]: [Description of identification process]
   - [Sub-component analysis type]
   - [Dependency mapping type]
2. [Sharding strategy type]: [Description of extraction approach]
3. [Assembly method type]: [Description of wikilink implementation]
[...]
</example>
```

### Delivery Instructions
- Save to appropriate directory based on artifact type
- Use correct naming conventions for each type
- Ensure wikilinks resolve to actual files
- Verify artifact achieves stated end goal
- Apply [[template-rules]] to all examples

---

# Usage Notes

## Complete Artifact Coverage
This prompt understands and can create:
- **Prompts**: Reusable instructions with XML structure
- **Agents**: Specialized sub-agents with focused expertise
- **Templates**: Documentation templates with YAML frontmatter
- **Workflows**: Multi-step orchestrations with agent coordination
- **Context**: Documentation for project elements
- **Instructions**: Convention documents and guidelines
- **Modes**: Operational behaviors (like question-mode)
- **Personas**: Character definitions with attributes
- **Blocks**: Reusable template sections

## Philosophy Implementation
Every creation follows the pattern:
1. Desire → "What do you want to DO?"
2. Decomposition → Break into modular components
3. Sharding → Extract reusable pieces
4. Assembly → Combine via wikilinks
5. Refinement → Apply question-mode throughout

## WikiLink Architecture
- Standard `[[name-wl-example]]` → Becomes @path reference after sync
- Embedded `![[name-wl-example]]` → Content inserted during sync
- Enables maximum reusability and modularity

## Agent Extraction Pattern
When Persona + Workflow + Instructions align:
1. Create agent with combined components
2. Save as `agents/[name].md`
3. Embed in prompts via `![[agent-name-wl-example]]`
4. Agent becomes reusable across artifacts

## Question-Mode Integration
The prompt embeds the full question-mode for systematic refinement:
- 5 question types: Simplify, Clarify, Improve, Expand, Reduce
- 3 operating modes: Single, Batch-5, Document
- YES/NO format for all questions
- Goal-driven questioning approach

## Entity Implementation Rules
All examples and placeholders follow [[template-rules]]
- Single square brackets for instructions: [Do this]
- Double curly with backticks for variables: `{{var}}`
- Examples describe types, not actual content
- Structure is never recreated in examples

## Important Philosophy Notes

**Why No Agent Reference:**
This prompt intentionally does NOT reference an agent at the bottom. Following the create philosophy:
- Components are defined directly in the prompt (Persona, Workflow, Instructions)
- These components COULD be extracted into separate files for reusability
- If Persona + Workflow + Instructions prove valuable together, they COULD become an agent
- But starting with an agent reference violates the decomposition → sharding → assembly pattern

**Proper Evolution Path:**
1. Start with components defined in the prompt (current state)
2. Extract shareable components as they prove useful
3. Create an agent only when components naturally align and need reuse
4. Then future prompts can reference that agent via `![[agent-name-wl-example]]`
</create_prompt>

entity_type:
