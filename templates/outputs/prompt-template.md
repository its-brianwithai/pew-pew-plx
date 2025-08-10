---
name: prompt-template
description: "Use this template when creating prompts that follow the modular structure principle where each section only exists if it contributes to the end goal. Supports wikilink embedding for reusable components."
---

# [Emoji] [Prompt Title]
> 💡 *[One-line description of what this prompt achieves and its transformative purpose]*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

[Clear, specific statement of what success looks like - this determines whether any section below should exist]

## 👤 Persona
> 💡 *Optional: Include only attributes that directly contribute to achieving the end goal. Each attribute should improve the quality or accuracy of the output.*

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
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

[Verb] [specific activity description with clear scope]

### Deliverables (Optional)
- [Specific output 1]
- [Specific output 2]
- [Additional outputs as needed]

### Acceptance Criteria (Optional)
- [ ] [Measurable success criterion 1]
- [ ] [Measurable success criterion 2]
- [ ] [Additional criteria as needed]

## 🔄 Workflow
> 💡 *Optional: Atomic steps that systematically achieve the end goal. Include only if multi-step process improves outcome.*

### Step 1: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific atomic action]
- [Follow-up action if needed]

### Step 2: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific atomic action]
- [Follow-up action if needed]

### Step N: [Action Name]
**Deliverable:** [What this step produces]
**Acceptance Criteria:** [How to verify completion]
- [Specific atomic action]
- [Follow-up action if needed]

## 📏 Instructions
> 💡 *Optional: Event-driven best practices, conventions, constraints and rules. Include only patterns that prevent failure or ensure quality. Avoid redundancy - if something is clearly stated, don't create an opposite rule.*

### WHEN [scenario/event/context]
**Best Practices:**
- [Best practice 1]
- [Best practice 2]
- [Best practice 3]

**Conventions:**
- [Convention to follow]
- [Standard to maintain]

**Rules:**
- ALWAYS [required action]
- NEVER [prohibited action] (only if not obvious from ALWAYS statements)
- MUST [critical requirement]

### WHEN [different scenario/event/context]
**Best Practices:**
- [Context-specific best practice]
- [Domain-specific approach]

**Constraints:**
- [Limitation to respect]
- [Boundary to maintain]

### WHEN [another scenario/event/context]
**Requirements:**
- [Essential requirement]
- [Mandatory element]

**Prohibitions:**
- [What to avoid] (only if not implied by requirements)

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
Every section and subsection is **optional** and should only exist if it directly contributes to achieving the End Goal. Before including any section, ask: "Does this improve our chances of reaching the desired outcome?"

## WikiLink Embedding
Sections can be extracted and embedded as reusable components:
- `![[persona-name-example-wiki-link]]` - Embed a reusable persona
- `![[workflow-name-example-wiki-link]]` - Embed a standard workflow
- `![[instructions-name-example-wiki-link]]` - Embed common instructions
- `![[output-format-name-example-wiki-link]]` - Embed standard output format

**Important:** WikiLinks must be on their own line - the entire line gets replaced during sync.

## Agent Composition
Agents can be composed from:
- Persona (defines expertise)
- Workflow (defines process)
- Instructions (defines rules)
- Output Format (defines delivery)

## Template Blocks
Templates use blocks for inspiration only - examine patterns but create complete content.

## Example Implementations

### Minimal Prompt (End Goal + Request Only)
```markdown
## 🎯 End Goal
Generate unit tests for the authentication module

## 📋 Request
Create comprehensive unit tests covering all authentication functions
```

### Full Prompt (All Sections Contributing)
```markdown
## 🎯 End Goal
Create production-ready Flutter widget tests with 100% coverage

## 👤 Persona
![[flutter-test-engineer-persona-example-wiki-link]]

## 📋 Request
Design and implement widget tests for the shopping cart feature

### Deliverables
- Complete test suite file
- Coverage report
- Performance metrics

## 🔄 Workflow
![[widget-testing-workflow-example-wiki-link]]

## 📏 Instructions
### WHEN writing test code
**Best Practices:**
- Use descriptive test names
- Follow AAA pattern (Arrange, Act, Assert)
- Group related tests logically

**Conventions:**
- Place test files in test/ directory
- Match source file structure
- Use _test.dart suffix

**Rules:**
- ALWAYS test both happy and error paths
- MUST include widget key assertions

### WHEN handling async operations
**Requirements:**
- Use pumpAndSettle for animations
- Await all future operations
- Set appropriate timeouts

## 📊 Output Format
![[flutter-test-output-format-example-wiki-link]]
```

## Quality Checklist
- [ ] End Goal is clear and measurable
- [ ] Only included sections that contribute to End Goal
- [ ] Request starts with a verb
- [ ] Workflow steps are atomic with clear deliverables
- [ ] Instructions use WHEN/THEN event pattern
- [ ] Output format provides clear structure
- [ ] WikiLinks are on separate lines (if used)
- [ ] No unnecessary sections or attributes