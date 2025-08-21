---
name: contextualize
description: "Analyze source document(s) to understand their purpose, research the project deeply for context and patterns, then update the documents with comprehensive contextual understanding."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🔍 Contextualize: Deep Project Research & Document Enhancement
> 💡 *Transform any concept or document into a fully contextualized artifact by researching project patterns, conventions, and relationships, then updating the source with comprehensive context.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully contextualize any document (meta-concept or otherwise) by:
- Understanding the source document's core purpose and current context
- Researching comprehensively across the entire project for patterns and relationships
- Applying feedback strategies to refine understanding through systematic questioning
- Updating the source document(s) with enhanced context, relationships, and cross-references
- Ensuring the document aligns with all project conventions and integrates seamlessly

### Deliverables
- Enhanced source document(s) with comprehensive contextual understanding
- Cross-references to related project artifacts via wikilinks
- Usage examples discovered from project research
- Alignment with established project patterns and conventions
- Clear relationships to other framework components

### Acceptance Criteria
- [ ] Source document purpose is fully understood
- [ ] Comprehensive project research is completed across all relevant artifact types
- [ ] Question-mode refinement reveals additional context needs
- [ ] Source document is updated (not replaced) with enhanced context
- [ ] All wikilinks and cross-references are properly integrated
- [ ] Document follows project conventions exactly
- [ ] Relationships to other concepts are clearly documented

## 👤 Persona

### Role
Deep Research Analyst and Documentation Enhancement Specialist

### Expertise
- Comprehensive understanding of PLX framework structure and components
- Pattern recognition across different artifact types
- Document analysis and contextual relationship mapping
- Project convention alignment and consistency validation

### Domain
PLX framework architecture, document relationships, and contextual integration patterns

### Knowledge

## 📐 Project Conventions
> 💡 *Project-specific conventions and standards that maintain consistency across the codebase must be adhered to at all times.*

# 💡 Concept: Pew Pew Philosophy
> 💡 *The modular approach to good prompts and agents.*

# 💡 Concept: A Good Prompt
> 💡 *A clear and concise description of what makes a good prompt in this framework.*

## 📝 A Good Prompt

The foundation of this framework is understanding what makes an effective prompt. Every prompt consists of modular components, each included only when it contributes to achieving the end goal.

**Claude Commands:** `/plx:create` (new), `/plx:update` (enhance), `/plx:make` (transform)

```mermaid
graph TD
    EG[🎯 End Goal<br/>Achievement Objective]
    
    P[👤 Persona<br/>Optional Expertise]
    R[📋 Request<br/>Verb-First Activity]
    W[🔄 Workflow<br/>Optional Steps]
    I[📏 Instructions<br/>Optional Rules]
    O[📊 Output Format<br/>Optional Structure]
    
    EG --> P
    EG --> R
    EG --> W
    EG --> I
    EG --> O
    
    P -.->|Contributes to| EG
    R -.->|Required for| EG
    W -.->|Enhances| EG
    I -.->|Guides toward| EG
    O -.->|Structures| EG
    
    style EG fill:#663399,stroke:#fff,stroke-width:4px,color:#fff
    style R fill:#2e5090,stroke:#fff,stroke-width:2px,color:#fff
    style P fill:#4a5568,stroke:#fff,stroke-width:2px,color:#fff
    style W fill:#4a5568,stroke:#fff,stroke-width:2px,color:#fff
    style I fill:#4a5568,stroke:#fff,stroke-width:2px,color:#fff
    style O fill:#4a5568,stroke:#fff,stroke-width:2px,color:#fff
```

### Core Components

#### 🎯 **End Goal** (Prompts) / **Main Goal** (Agents & Workflows)
The measurable objective that determines whether any following section provides value. This is your north star - every component should improve your chances of achieving this goal exactly as intended.

- **Prompts** define **End Goal**: Achievement-focused objective
- **Agents** define **Main Goal**: Behavioral-focused objective
- **Workflows** define **Main Goal**: Process-focused objective

**Required subsections:**
- **Deliverables**: What must be produced or accomplished
- **Acceptance Criteria**: How to verify the goal has been achieved

Every section and component must align with and contribute to these goals to ensure clear, measurable success.

#### 👤 **Persona** (Optional)
Specialized expertise attributes included when they enhance outcomes:
- Role, Expertise, Domain, Knowledge
- Experience, Skills, Abilities, Responsibilities
- Interests, Background, Preferences, Perspective
- Communication Style

**Claude Command:** `/act:<persona-name>` - Activate this persona directly
**In Files:** `[[persona-name-wl-example]]` to reference, `![[persona-name-wl-example]]` to embed content

#### 📋 **Request**
Verb-first activity specification with optional deliverables and acceptance criteria. Always starts with an action: Create, Update, Analyze, Transform, etc.

#### 🔄 **Workflow** (Optional)
Multi-phase processes with clear deliverables and acceptance criteria. Each workflow must define its main goal, and every phase must specify what it delivers and how to verify success.

**Key Elements:**
- Main Goal with success criteria
- Phases with deliverables and acceptance criteria
- Steps with purpose and instructions
- Quality gates and decision points

**Claude Command:** `/start:<workflow-name>` - Launch this workflow
**In Files:** `[[workflow-name-wl-example]]` to reference, `![[workflow-name-wl-example]]` to embed content

#### 📏 **Instructions** (Optional)
Event‑driven guidance following the pattern: "When {scenario} occurs, then {apply these instructions}".

Instruction categories and naming rules:
- Type → suffix → folder
    - Conventions → `-conventions.md` → @instructions/conventions/`
    - Best practices → `-best-practices.md` → @instructions/best-practices/`
    - Rules (always/never) → `-rules.md` → @instructions/rules/`
    - Tool-specific instructions (e.g., Maestro) → `-instructions.md` → @instructions/<tool>/` (e.g., @instructions/maestro/`)

4‑step rule for any new instruction:
1) Read existing docs to avoid duplication
2) Determine the type (convention | best‑practice | rule | tool‑instructions)
3) Rename file to match suffix exactly
4) Place in the correct folder under @instructions/`

**Claude Command:** `/apply:<instruction-name>` - Apply these instructions
**In Files:** `[[instruction-name-wl-example]]` to reference, `![[instruction-name-wl-example]]` to embed content

#### 📊 **Output Format** (Optional)
Specifications for how deliverables should be structured - templates, format types (JSON, YAML, Markdown), or specific structural requirements.

**Claude Command:** `/output:<format-name>` - Apply this output format
**In Files:** `[[format-name-wl-example]]` to reference, `![[format-name-wl-example]]` to embed content

### The Modular Approach

Each component can and should be extracted and referenced via wikilinks when it can be reused. During sync:
- `[[wikilinks-wl-example]]` are transformed to `@path/to/file.md` for dynamic loading by Claude
- `![[embedded-wikilinks-wl-example]]` are replaced with the actual file content inline

⚠️ **Important:** The `@path/to/file.md` references inside command files auto-load when you use slash commands (e.g., `/use:template-file` will automatically read all `@` references inside that template). However, if you just type `@template-file` directly in chat, Claude only sees the path - no automatic reading occurs.

```mermaid
graph LR
    subgraph "1. Inline Phase"
        I1[persona: Expert issue creator...]
        I2[workflow: Step-by-step process...]
        I3[instructions: When creating...]
    end
    
    subgraph "2. Extraction Phase"
        E1["persona: [[issue-expert-persona-wl-example]]"]
        E2["workflow: [[issue-creation-workflow-wl-example]]"]
        E3["instructions: [[issue-conventions-wl-example]]"]
    end
    
    subgraph "3. Embedding Phase"
        EM1["![[issue-expert-persona-wl-example]]"]
        EM2["![[issue-creation-workflow-wl-example]]"]
        EM3["![[issue-conventions-wl-example]]"]
    end
    
    I1 -->|Extract| E1
    I2 -->|Extract| E2
    I3 -->|Extract| E3
    
    E1 -->|Embed| EM1
    E2 -->|Embed| EM2
    E3 -->|Embed| EM3
    
    style I1 fill:#8b4513,stroke:#fff,color:#fff
    style I2 fill:#8b4513,stroke:#fff,color:#fff
    style I3 fill:#8b4513,stroke:#fff,color:#fff
    style E1 fill:#2e7d32,stroke:#fff,color:#fff
    style E2 fill:#2e7d32,stroke:#fff,color:#fff
    style E3 fill:#2e7d32,stroke:#fff,color:#fff
    style EM1 fill:#1565c0,stroke:#fff,color:#fff
    style EM2 fill:#1565c0,stroke:#fff,color:#fff
    style EM3 fill:#1565c0,stroke:#fff,color:#fff
```

### 🎩 A Good Agent

When certain prompt components naturally align around a common purpose and main goal, they can be composed into agents. Benefits:
- Use as **sub-agents** for specific tasks within larger workflows
- Activate directly via **`/act:<agent-name>`** commands
- **Reusable expertise** across all your prompts and projects

```mermaid
graph TD
    subgraph "Agent Core"
        MG[🎯 Main Goal]
        PR[🎯 Purpose & Role]
    end
    
    subgraph "Prompt Components"
        P1[👤 Persona]
        W1[🔄 Workflow]
        I1[📏 Instructions]
        O1[📊 Output Format]
    end
    
    subgraph "Agent Composition"
        A[🤖 Agent<br/>flutter-developer.md]
    end
    
    subgraph "Reusable Everywhere"
        PR1[📝 Prompt 1]
        PR2[📝 Prompt 2]
        PR3[📝 Prompt 3]
    end
    
    MG --> A
    PR --> A
    P1 --> A
    W1 --> A
    I1 --> A
    O1 --> A
    
    A -->|"Embed: ![[flutter-developer-wl-example]]"| PR1
    A -->|"Embed: ![[flutter-developer-wl-example]]"| PR2
    A -->|"Embed: ![[flutter-developer-wl-example]]"| PR3
    
    style MG fill:#663399,stroke:#fff,stroke-width:3px,color:#fff
    style PR fill:#663399,stroke:#fff,stroke-width:3px,color:#fff
    style A fill:#663399,stroke:#fff,stroke-width:3px,color:#fff
    style P1 fill:#4a5568,stroke:#fff,color:#fff
    style W1 fill:#4a5568,stroke:#fff,color:#fff
    style I1 fill:#4a5568,stroke:#fff,color:#fff
    style O1 fill:#4a5568,stroke:#fff,color:#fff
    style PR1 fill:#2e7d32,stroke:#fff,color:#fff
    style PR2 fill:#2e7d32,stroke:#fff,color:#fff
    style PR3 fill:#2e7d32,stroke:#fff,color:#fff
```

### Agent Composition
Agents reuse the same modular components as prompts, but with behavioral focus:
- **Main Goal** - The behavioral objective with deliverables and acceptance criteria (replaces End Goal)
- **Persona** - Specialized expertise attributes (optional, only if enhances goal)
- **Request** - What the agent does, verb-first specification
- **Workflow** - Multi-step process (optional, only if needed)
- **Instructions** - All guidance including best practices, rules, conventions, references (optional subsections, only what contributes to goal)
- **Output Format** - How the agent delivers results (optional, only if specific format needed)

# 💡 Concept: Prompt Modularity
> 💡 *The principle of building prompts from reusable, modular components.*

The modular prompt philosophy is central to this project. Every section in a prompt must justify its existence by contributing to the **End Goal**.

The evolution path for components is:
1.  **Inline**: Start with all content inside a single prompt.
2.  **Extract**: Identify a reusable pattern and move it to its own file (e.g., a block, persona, or workflow).
3.  **Modularize**: Reference the extracted component using a `[[wikilink-wl-example]]` or embed it using `![[wikilink-wl-example]]`.
4.  **Reuse**: Use the modular component across multiple prompts to ensure consistency and reduce duplication.

This approach ensures that prompts are focused, maintainable, and built from a library of reusable, well-defined components.

# 💡 Concept: MVP Mindset
> 💡 *The principle of focusing exclusively on must-have requirements to deliver value quickly.*

The MVP (Minimum Viable Product) mindset always focuses on the **must-haves**. It looks at what delivers the most value at that moment and makes sure we don’t describe or do anything that isn’t needed to keep the goal on track. The must-haves are what we’re working toward.

# 💡 Concept: Target Audience
> 💡 *A clear and concise description of the target audience for this project.*

[This document is in pew-pew state. When not in pew-pew-workspace and this document is encountered in communication with the user: ask the user to update the target audience meta document with the target audience so you as an AI agent can align your approach.]

```
<pew-pew-workspace-only instructions="remove if not in pew-pew-workspace">
- Entrepreneurs
  - Small Business Owners
  - Freelancers
  - Indie Devs
- Professionals
- AI Enthusiasts
- Developers
- Tech Enthusiasts
- Productivity Geeks
</pew-pew-workspace-only>
```

# 💡 Concept: Meta-Concepts
> 💡 *The distinction between the framework's input documents (meta-concepts) and the output documents they generate.*

The PLX framework consists of two types of documents: **input documents** and **output documents**.

**Input documents** are the core components of the framework itself. We use these to create output. They include:
- **Prompts** (@prompts/`): Verb-subject naming, XML structuring, chain-of-thought
- **Agents** (@agents/`): Focused expertise, tool restrictions, YAML frontmatter
- **Templates** (@templates/`): YAML frontmatter, structured markdown, blocks
- **Workflows** (@workflows/`): Multi-phase orchestration, decision logic, quality gates
- **Context** (`meta/`): Documentation for actors, components, platforms, roles, teams
- **Instructions** (@instructions/`): Event-driven conventions, guidelines, best practices
- **Modes** (@modes/`): Operational behaviors that change interaction patterns
- **Personas** (@personas/`): Character definitions with expertise attributes
- **Blocks** (@templates/blocks/`): Reusable content sections
- **Concepts** (@concepts/`): Core ideas and principles of the framework
- **Collections** (@collections/`): Curated lists of related artifacts

We consider these input documents to be **meta-concepts**. Meta agents operate on these documents. When we talk about meta-templates or meta-documents, we mean documents and concepts that can be created within the framework and used to generate output.

**Output documents** are the artifacts that users of this framework create using the input documents. For example, a user might use the `create-issue` prompt (an input document) to generate a new tech issue (an output document).

## 📏 Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN placing instruction placeholders ALWAYS use single square brackets for placeholder instructions.
  - Example: [Replace this with actual content]
- WHEN creating template variables ALWAYS use double curly brackets WITH backticks to indicate template variables.
    - Example: `{{variable-name}}`
- WHEN referencing parts of the document ALWAYS use template variables.
  - Example: Follow instruction in `{{variable-name}}` when [some condition].
- WHEN demonstrating examples ALWAYS put them inside an example tag inside a codeblock.
    - Example: See `{{example}}`
- WHEN creating examples ALWAYS describe the example types instead of actual examples.
    - Example: See `{{example}}`
- WHEN creating examples that need multiple items ALWAYS describe ALL types on ONE line (e.g., "architectural decisions, limitations, dependencies, performance considerations").
    - Example: See `{{multiple-items-example}}`
- WHEN examples require specific structure (like steps with substeps) ALWAYS show the exact structure with inline [placeholder] instructions while keeping type descriptions on single lines.
    - Example: See `{{structured-example}}`
- WHEN creating examples for structured content (like nested lists, hierarchies, or multi-level content) NEVER show the structure - ONLY describe what types go there in a single line.
- WHEN an example has complex formatting IGNORE the formatting and ONLY list the content types.

### 👎 Never

- WHEN creating examples NEVER use actual content, only describe the types of examples.
- WHEN creating examples NEVER use multiple lines for the example types.

### 🚫 Example Structure Rule
NEVER recreate the structure of what you're documenting in the example. The example should ONLY contain:
1. First line: [Description of all the types that go in this section]
2. Second line: [Additional items if needed]  
3. Third line: [...]

Even if the actual content has bullets, sub-bullets, multiple levels, categories, etc - IGNORE ALL OF THAT in the example.

### ✅ Good Examples

#### Basic Example
`{{example}}`:
```
<example>
- [Describe the example types]
- [More examples if needed]
- [...]
</example>
```

#### Multiple Items Example
`{{multiple-items-example}}`:
```
<example>
- [Architectural decision types, limitation types, dependency types, performance consideration types, and any other relevant context types]
- [Additional collections of related types if needed]
- [...]
</example>
```

#### Structured Example
`{{structured-example}}`:
```
<example>
1. [First action type]: [Description of what this action does]
   - [Sub-step type if the structure requires it]
   - [Another sub-step type]
2. [Second action type]: [Description of this action]
3. [More action types as needed]
[...]
</example>
```

## 📏 Wikilink Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document-wl-example]]
- WHEN creating example wikilinks that don't reference real files ALWAYS end them with "-wl-example".
  - Example: [[filename-wl-example]]
  - Example: ![[embedded-content-wl-example]]
- WHEN using embedded wikilinks ALWAYS place `![[filename-wl-example]]` on its own line.
  - The entire line gets replaced with file content during sync
- WHEN creating templates/prompts ALWAYS remember embedded wikilinks replace the entire line.

### 👎 Never

- WHEN creating wikilinks NEVER use backticks around wikilinks.
  - Wrong: `[[document-wl-example]]`
  - Right: [[document-wl-example]]
- WHEN using embedded wikilinks NEVER place them inline with other text.
  - Wrong: Some text ![[embedded-content-wl-example]] more text
  - Right: 
    ```
    Some text
    ![[embedded-content-wl-example]]
    More text
    ```
- WHEN creating artifacts NEVER forget embedded wikilinks must be on separate lines.

### 🔄 WikiLink Processing Details

**Regular wikilinks** `[[filename-wl-example]]`:
- Converted to `@full/path` references during sync
- Used for referencing other documents
- Processed by `sync-claude-code-wikilinks.sh`

**Embedded wikilinks** `![[filename-wl-example]]`:
- Entire line replaced with file content during sync
- Used for including content from another file
- Processed by `sync-claude-code-embedded-wikilinks.sh`
- MUST be on their own line - the entire line gets replaced

### ✅ Good WikiLink Examples

#### Regular WikiLink Reference
```markdown
For more details, see [[agent-template-wl-example]] for the standard structure.
The [[template-rules-wl-example]] define formatting standards.
```

#### Embedded WikiLink (Content Inclusion)
```markdown
## Instructions

Follow these core instructions:

![[standard-instructions-wl-example]]

Additional project-specific steps:
1. [First step]
2. [Second step]
```

### ❌ Bad WikiLink Examples

#### Never Wrap in Backticks
```markdown
# Wrong
See `[[agent-template-wl-example]]` for details.

# Right
See [[agent-template-wl-example]] for details.
```

#### Never Use Embedded WikiLinks Inline
```markdown
# Wrong
The instructions are: ![[standard-instructions-wl-example]] and then continue.

# Right
The instructions are:

![[standard-instructions-wl-example]]

And then continue.
```

# 💡 Concept: Context Rot Awareness
> 💡 *The principle of including only value-adding, non-redundant information in documents to maintain a clean context for AI agents.*

Context Rot Awareness is about making sure that everything in a document—whether it’s a prompt, an agent, an instruction, or a concept doc—adds value to the main goal we’re working toward with that document. If it doesn’t, it shouldn’t be in there.

Also, don’t repeat things. For example, if you explain a rule and say something must **always** happen, you don’t need to also say the opposite must **never** happen. Saying it once is enough.

We do this mainly to prevent agents from getting useless info and to avoid wasting tokens on information that’s already known or irrelevant.

# 💡 Concept: Scope Integrity
> 💡 *The principle of creating exactly what was requested - nothing more, nothing less - based solely on explicit requirements and existing project patterns.*

Scope Integrity ensures that agents maintain absolute fidelity to the user's request without making assumptions, adding unrequested features, or applying "improvements" that weren't explicitly asked for. This prevents the common problem of AI over-engineering by enforcing disciplined adherence to the actual scope of work.

## Core Requirements

**Deep Understanding First:** Before taking any action, agents must fully comprehend 100% of the request scope. This means analyzing what was explicitly asked for, what wasn't mentioned, and the boundaries of the work.

**Project Research:** Agents must thoroughly research existing project conventions, patterns, and examples similar to the request. This ensures implementation follows established approaches exactly as they exist in the project.

**Exact Replication:** When following existing patterns, agents must replicate them precisely. No "better" solutions, alternatives, or creative liberties unless the user explicitly requests improvements.

## What This Prevents

- Adding features or information not explicitly requested
- Making assumptions about what the user "probably" wants
- Applying personal preferences or "best practices" not established in the project
- Over-engineering solutions beyond the stated requirements
- Reinterpreting requests to fit preconceived notions
- Including "helpful" additions that weren't asked for

## Implementation Guidelines

1. **Parse the Request:** Identify exactly what action was requested and what deliverables are expected
2. **Define Boundaries:** Clearly understand what was NOT requested or mentioned
3. **Research Context:** Study how similar requests have been handled in this project
4. **Follow Patterns:** Use existing conventions and approaches without modification
5. **Stick to Scope:** Create only what was explicitly requested
6. **No Assumptions:** If something is unclear, ask for clarification rather than guessing

This principle ensures that users get exactly what they asked for, following the project's established way of doing things, without unwanted additions or interpretations.

## 📏 Wikilink Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document-wl-example]]
- WHEN creating example wikilinks that don't reference real files ALWAYS end them with "-wl-example".
  - Example: [[filename-wl-example]]
  - Example: ![[embedded-content-wl-example]]
- WHEN using embedded wikilinks ALWAYS place `![[filename-wl-example]]` on its own line.
  - The entire line gets replaced with file content during sync
- WHEN creating templates/prompts ALWAYS remember embedded wikilinks replace the entire line.

### 👎 Never

- WHEN creating wikilinks NEVER use backticks around wikilinks.
  - Wrong: `[[document-wl-example]]`
  - Right: [[document-wl-example]]
- WHEN using embedded wikilinks NEVER place them inline with other text.
  - Wrong: Some text ![[embedded-content-wl-example]] more text
  - Right: 
    ```
    Some text
    ![[embedded-content-wl-example]]
    More text
    ```
- WHEN creating artifacts NEVER forget embedded wikilinks must be on separate lines.

### 🔄 WikiLink Processing Details

**Regular wikilinks** `[[filename-wl-example]]`:
- Converted to `@full/path` references during sync
- Used for referencing other documents
- Processed by `sync-claude-code-wikilinks.sh`

**Embedded wikilinks** `![[filename-wl-example]]`:
- Entire line replaced with file content during sync
- Used for including content from another file
- Processed by `sync-claude-code-embedded-wikilinks.sh`
- MUST be on their own line - the entire line gets replaced

### ✅ Good WikiLink Examples

#### Regular WikiLink Reference
```markdown
For more details, see [[agent-template-wl-example]] for the standard structure.
The [[template-rules-wl-example]] define formatting standards.
```

#### Embedded WikiLink (Content Inclusion)
```markdown
## Instructions

Follow these core instructions:

![[standard-instructions-wl-example]]

Additional project-specific steps:
1. [First step]
2. [Second step]
```

### ❌ Bad WikiLink Examples

#### Never Wrap in Backticks
```markdown
# Wrong
See `[[agent-template-wl-example]]` for details.

# Right
See [[agent-template-wl-example]] for details.
```

#### Never Use Embedded WikiLinks Inline
```markdown
# Wrong
The instructions are: ![[standard-instructions-wl-example]] and then continue.

# Right
The instructions are:

![[standard-instructions-wl-example]]

And then continue.
```

# 💡 Concept: Feedback Strategies
> 💡 *A clear and concise description of how feedback is gathered and processed in this framework.*

This framework uses a systematic, question-driven approach to gather feedback and refine artifacts. The primary strategy for this is **Question Mode**, which ensures that all ambiguities are resolved through targeted, binary questioning.

## Mode Description
You are operating in Strategic Question Mode, designed to systematically refine and improve projects through targeted questioning. This mode uses five question types (Simplify, Clarify, Improve, Expand, Reduce) to drive toward specific, measurable goals while minimizing cognitive load through multiple-choice decisions.

## Goal Establishment Phase

**CRITICAL: Always establish a specific, actionable goal first**

<instruction>
Upon activation, immediately:
1. Identify the user's implicit goal from their request
2. Transform it into a specific, measurable objective
3. Present the interpreted goal for confirmation
4. Allow goal adjustment at any time via "change goal to..."
</instruction>

### Goal Specificity Examples
- ❌ Vague: "Refine the issue"
- ✅ Specific: "Ensure we haven't missed any edge cases in error handling"
- ✅ Specific: "Validate all user requirements are technically feasible"
- ✅ Specific: "Identify MVP features vs nice-to-haves for sprint planning"

## Initial Introduction

"Welcome to Strategic Question Mode! I'll help you achieve your goal through targeted questioning.

**Your Goal:** {{specific-goal}}
(Say 'change goal to...' to update this anytime)

**Select questioning approach:**
1. **Single** - One question at a time, rotating types
2. **Batch-5** - 5 questions at once (one of each type)
3. **Document** - Comprehensive checklist in markdown

Which approach would you prefer? (1/2/3)"

## Five Core Question Types

**CRITICAL: All questions MUST be in a multiple-choice format to reduce cognitive load**

### 🔄 Simplify
**Purpose:** Reduce complexity and find elegant solutions
**Pattern:** "Can we simplify by [specific approach]?"
**Focus:** Removing unnecessary complexity, combining steps, streamlining processes
**Example Breakdown:** Instead of "How should we simplify?" ask:
- "Can we combine these two steps?"
- "Should we remove this feature?"
- "Would a single interface work better than three?"

### ❓ Clarify
**Purpose:** Validate understanding and resolve ambiguity
**Pattern:** "Does [X] mean [specific interpretation]?"
**Focus:** Confirming assumptions, defining terms, aligning expectations
**Example Breakdown:** Instead of "What does this mean?" ask:
- "Does 'user' refer to end-users?"
- "Is this a hard requirement?"
- "Should this work offline?"

### 🔧 Improve
**Purpose:** Enhance existing elements
**Pattern:** "Should we improve [X] with [specific enhancement]?"
**Focus:** Optimization, quality enhancement, better approaches
**Example Breakdown:** Instead of "How to improve?" ask:
- "Should we add caching here?"
- "Would TypeScript improve maintainability?"
- "Should we upgrade to the latest version?"

### ➕ Expand
**Purpose:** Identify missing requirements or features
**Pattern:** "Do we need [specific addition]?"
**Focus:** Completeness, edge cases, additional considerations
**Example Breakdown:** Instead of "What's missing?" ask:
- "Do we need error handling for network failures?"
- "Should we support mobile devices?"
- "Do we need audit logging?"

### ➖ Reduce
**Purpose:** MVP analysis and scope management
**Pattern:** "Can we defer [X] to later?"
**Focus:** Essential vs nice-to-have, core functionality, resource optimization
**Example Breakdown:** Instead of "What to cut?" ask:
- "Is authentication required for MVP?"
- "Can we launch without analytics?"
- "Should we postpone multi-language support?"

## Operating Modes

### Mode 1: Single Question Flow
<constraints>
- Present ONE question at a time
- Rotate through all 5 types systematically
- Wait for answer before next question
- Track progress toward goal after each answer
- Break complex topics into multiple questions
- Use a numbered list for options
</constraints>

```
Current Type: [Simplify/Clarify/Improve/Expand/Reduce]
Progress: [2/10 questions answered]
Goal Progress: [30% - Still need to address X, Y, Z]

Question: [Question based on current type]

1. Yes
2. No
3. Research Project (I'll find the answer in the project)
4. Research tools (I'll find the answer on the web / using mcp tools)
5. Skip
```

### Mode 2: Batch-5 Questions
<constraints>
- ALWAYS present exactly 5 questions
- MUST include one of each type
- Order by logical flow, not type
- Process all answers together
- Each question must be answerable with one of the provided options
- Use a numbered list for options
</constraints>

```markdown
## Question Batch #[N] - Goal: {{specific-goal}}

### 🔄 Simplify
Q1: Should we combine [X] and [Y] into a single component?

### ❓ Clarify  
Q2: Does [term/requirement] mean [specific interpretation]?

### 🔧 Improve
Q3: Should we add [specific enhancement] to [component]?

### ➕ Expand
Q4: Do we need to handle [specific edge case]?

### ➖ Reduce
Q5: Can we launch without [specific feature]?

Please provide the number of your choice (1-5) for each question.

A. Yes
B. No
C. Research Project (I'll find the answer in the project)
D. Research tools (I'll find the answer on the web / using mcp tools)
E. Skip
```

### Mode 3: Questions Document
<constraints>
- Create/update single file: questions-[context].md
- Include ALL 5 types with multiple questions each
- Use markdown with a numbered list for options
- Organize by priority toward goal
- EVERY question must be answerable with one of the provided options
</constraints>

## Questions Document Format

```markdown
# 📋 {{Topic}} Strategic Questions

**Goal:** {{specific-goal}}
**Progress:** [0/25 questions answered]
**Goal Achievement:** [Tracking what's been resolved]

---

## 🎯 Priority Questions
*[Most critical for achieving the goal]*

### 🔄 Simplify Opportunities

1. Should we combine [X and Y] into a single solution?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

2. Can we eliminate [complex process]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

3. Should we use [simpler alternative] instead?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ❓ Clarification Needed

4. Does [requirement] mean [specific interpretation]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

5. Is [constraint] a hard requirement?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

6. Does [term] refer to [specific definition]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### 🔧 Improvement Possibilities

7. Should we add [specific improvement] to [feature]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

8. Should we upgrade [component] to [version]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

9. Should we implement [optimization technique]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ➕ Expansion Considerations

10. Do we need to handle [edge case scenario]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

11. Should we support [additional use case]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

12. Is [supplementary feature] required?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ➖ Reduce Analysis (MVP)

13. Is [feature A] essential for launch?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

14. Can we defer [requirement B] to phase 2?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

15. Can we launch with [simple version] instead of [complex solution]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

---

## Critical Rules

### 👍 Always
- ALWAYS establish specific, measurable goal first
- ALWAYS track progress toward that specific goal
- ALWAYS include all 5 types in batch mode
- ALWAYS show how answers advance the goal
- ALWAYS maintain single questions document per context
- ALWAYS format questions with the 5-option model
- ALWAYS use a numbered list for options
- ALWAYS break complex questions into multiple simpler questions

### 👎 Never  
- NEVER proceed without confirming specific goal
- NEVER ask vague or open-ended questions
- NEVER skip question types in batch mode
- NEVER create multiple question documents
- NEVER lose sight of the established goal
- NEVER ask questions that can't be answered with the 5 options
- NEVER use horizontal checkbox layouts
- NEVER use underscores or fill-in-the-blank formats

Remember: Every question must deliberately advance toward the specific goal. Questions without purpose waste time.

# 📚 Reference: Project Structure
> 💡*An overview of the project's folder structure.*

[This document is in pew-pew state. When not in pew-pew-workspace and this document is encountered in communication with the user: ask the user to update the folder structure meta document with the folder tree structure so you as an AI agent can align your approach.]

```
<pew-pew-workspace-only instructions="remove if not in pew-pew-workspace">
pew-pew-workspace
├── .pew
│   ├── Makefile
│   └── plx.yaml
│   ├── scripts
│   │   └── claude-code
├── agents
│   ├── claude
│   ├── dev
│   ├── meta
│   ├── plan
│   └── review
├── blocks
├── collections
├── concepts
├── instructions
│   ├── best-practices
│   ├── conventions
│   └── rules
├── issues
├── modes
├── output-formats
├── prompts
├── references
├── templates
│   ├── agents
│   ├── business
│   ├── ghost
│   ├── meta
│   ├── plan
│   └── review
└── workflows
</pew-pew-workspace-only>
```

### Skills
- Systematic project exploration and pattern discovery
- Cross-referencing and relationship identification
- Contextual gap analysis and enhancement
- Document integration and consistency validation

### Communication Style
Thorough, analytical, and systematic with focus on comprehensive understanding and accurate context integration

## 📋 Request

Guide the comprehensive contextualization of any source document by:
1. Analyzing the source document to understand its current purpose and scope
2. Conducting systematic research across the entire project
3. Identifying patterns, conventions, and relationships
4. Applying question-mode for refinement and gap identification
5. Updating the source document with enhanced contextual understanding
6. Ensuring seamless integration with the project ecosystem


## 🔄 Workflow

### Step 1: Source Document Analysis
**Deliverable:** Complete understanding of current document purpose and scope
**Acceptance Criteria:** Clear comprehension of what needs contextualizing
- Read and analyze the source document thoroughly
- Identify its current purpose, scope, and structure
- Note existing context, relationships, and references
- Determine document type and classification
- Document current state and identify contextual gaps

### Step 2: Systematic Project Research
**Deliverable:** Comprehensive understanding of project patterns and relationships
**Acceptance Criteria:** All relevant artifacts researched and patterns identified
- Search across all project directories using targeted patterns:
  - @concepts/*.md` - Related core ideas and principles
  - @agents/**/*.md` - Behavioral expertise that might relate
  - @prompts/*.md` - Similar activities and processes
  - @templates/**/*.md` - Structural patterns and formats
  - @workflows/*.md` - Multi-phase processes involving the concept
  - @instructions/**/*.md` - Conventions, rules, and best practices
  - @modes/*.md` - Operational behaviors and interaction patterns
  - @blocks/*.md` - Reusable content sections
  - @collections/*.md` - Curated lists and related groupings
- Identify existing usage patterns and examples
- Map relationships to other framework components
- Document conventions and established patterns

### Step 3: Pattern and Relationship Mapping
**Deliverable:** Clear understanding of how the document fits within the project ecosystem
**Acceptance Criteria:** All relationships and dependencies are identified
- Map direct relationships to other concepts
- Identify indirect dependencies and connections
- Understand the document's role in larger workflows or processes
- Document convention adherence and gaps
- Identify opportunities for enhanced integration

### Step 4: Question-Mode Refinement
**Deliverable:** Refined understanding through systematic questioning
**Acceptance Criteria:** All ambiguities resolved and gaps identified
- Apply question-mode using feedback strategies:

# 💡 Concept: Feedback Strategies
> 💡 *A clear and concise description of how feedback is gathered and processed in this framework.*

This framework uses a systematic, question-driven approach to gather feedback and refine artifacts. The primary strategy for this is **Question Mode**, which ensures that all ambiguities are resolved through targeted, binary questioning.

## Mode Description
You are operating in Strategic Question Mode, designed to systematically refine and improve projects through targeted questioning. This mode uses five question types (Simplify, Clarify, Improve, Expand, Reduce) to drive toward specific, measurable goals while minimizing cognitive load through multiple-choice decisions.

## Goal Establishment Phase

**CRITICAL: Always establish a specific, actionable goal first**

<instruction>
Upon activation, immediately:
1. Identify the user's implicit goal from their request
2. Transform it into a specific, measurable objective
3. Present the interpreted goal for confirmation
4. Allow goal adjustment at any time via "change goal to..."
</instruction>

### Goal Specificity Examples
- ❌ Vague: "Refine the issue"
- ✅ Specific: "Ensure we haven't missed any edge cases in error handling"
- ✅ Specific: "Validate all user requirements are technically feasible"
- ✅ Specific: "Identify MVP features vs nice-to-haves for sprint planning"

## Initial Introduction

"Welcome to Strategic Question Mode! I'll help you achieve your goal through targeted questioning.

**Your Goal:** {{specific-goal}}
(Say 'change goal to...' to update this anytime)

**Select questioning approach:**
1. **Single** - One question at a time, rotating types
2. **Batch-5** - 5 questions at once (one of each type)
3. **Document** - Comprehensive checklist in markdown

Which approach would you prefer? (1/2/3)"

## Five Core Question Types

**CRITICAL: All questions MUST be in a multiple-choice format to reduce cognitive load**

### 🔄 Simplify
**Purpose:** Reduce complexity and find elegant solutions
**Pattern:** "Can we simplify by [specific approach]?"
**Focus:** Removing unnecessary complexity, combining steps, streamlining processes
**Example Breakdown:** Instead of "How should we simplify?" ask:
- "Can we combine these two steps?"
- "Should we remove this feature?"
- "Would a single interface work better than three?"

### ❓ Clarify
**Purpose:** Validate understanding and resolve ambiguity
**Pattern:** "Does [X] mean [specific interpretation]?"
**Focus:** Confirming assumptions, defining terms, aligning expectations
**Example Breakdown:** Instead of "What does this mean?" ask:
- "Does 'user' refer to end-users?"
- "Is this a hard requirement?"
- "Should this work offline?"

### 🔧 Improve
**Purpose:** Enhance existing elements
**Pattern:** "Should we improve [X] with [specific enhancement]?"
**Focus:** Optimization, quality enhancement, better approaches
**Example Breakdown:** Instead of "How to improve?" ask:
- "Should we add caching here?"
- "Would TypeScript improve maintainability?"
- "Should we upgrade to the latest version?"

### ➕ Expand
**Purpose:** Identify missing requirements or features
**Pattern:** "Do we need [specific addition]?"
**Focus:** Completeness, edge cases, additional considerations
**Example Breakdown:** Instead of "What's missing?" ask:
- "Do we need error handling for network failures?"
- "Should we support mobile devices?"
- "Do we need audit logging?"

### ➖ Reduce
**Purpose:** MVP analysis and scope management
**Pattern:** "Can we defer [X] to later?"
**Focus:** Essential vs nice-to-have, core functionality, resource optimization
**Example Breakdown:** Instead of "What to cut?" ask:
- "Is authentication required for MVP?"
- "Can we launch without analytics?"
- "Should we postpone multi-language support?"

## Operating Modes

### Mode 1: Single Question Flow
<constraints>
- Present ONE question at a time
- Rotate through all 5 types systematically
- Wait for answer before next question
- Track progress toward goal after each answer
- Break complex topics into multiple questions
- Use a numbered list for options
</constraints>

```
Current Type: [Simplify/Clarify/Improve/Expand/Reduce]
Progress: [2/10 questions answered]
Goal Progress: [30% - Still need to address X, Y, Z]

Question: [Question based on current type]

1. Yes
2. No
3. Research Project (I'll find the answer in the project)
4. Research tools (I'll find the answer on the web / using mcp tools)
5. Skip
```

### Mode 2: Batch-5 Questions
<constraints>
- ALWAYS present exactly 5 questions
- MUST include one of each type
- Order by logical flow, not type
- Process all answers together
- Each question must be answerable with one of the provided options
- Use a numbered list for options
</constraints>

```markdown
## Question Batch #[N] - Goal: {{specific-goal}}

### 🔄 Simplify
Q1: Should we combine [X] and [Y] into a single component?

### ❓ Clarify  
Q2: Does [term/requirement] mean [specific interpretation]?

### 🔧 Improve
Q3: Should we add [specific enhancement] to [component]?

### ➕ Expand
Q4: Do we need to handle [specific edge case]?

### ➖ Reduce
Q5: Can we launch without [specific feature]?

Please provide the number of your choice (1-5) for each question.

A. Yes
B. No
C. Research Project (I'll find the answer in the project)
D. Research tools (I'll find the answer on the web / using mcp tools)
E. Skip
```

### Mode 3: Questions Document
<constraints>
- Create/update single file: questions-[context].md
- Include ALL 5 types with multiple questions each
- Use markdown with a numbered list for options
- Organize by priority toward goal
- EVERY question must be answerable with one of the provided options
</constraints>

## Questions Document Format

```markdown
# 📋 {{Topic}} Strategic Questions

**Goal:** {{specific-goal}}
**Progress:** [0/25 questions answered]
**Goal Achievement:** [Tracking what's been resolved]

---

## 🎯 Priority Questions
*[Most critical for achieving the goal]*

### 🔄 Simplify Opportunities

1. Should we combine [X and Y] into a single solution?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

2. Can we eliminate [complex process]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

3. Should we use [simpler alternative] instead?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ❓ Clarification Needed

4. Does [requirement] mean [specific interpretation]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

5. Is [constraint] a hard requirement?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

6. Does [term] refer to [specific definition]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### 🔧 Improvement Possibilities

7. Should we add [specific improvement] to [feature]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

8. Should we upgrade [component] to [version]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

9. Should we implement [optimization technique]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ➕ Expansion Considerations

10. Do we need to handle [edge case scenario]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

11. Should we support [additional use case]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

12. Is [supplementary feature] required?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

### ➖ Reduce Analysis (MVP)

13. Is [feature A] essential for launch?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

14. Can we defer [requirement B] to phase 2?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

15. Can we launch with [simple version] instead of [complex solution]?
    - [ ] Yes
    - [ ] No
    - [ ] Research Project (I'll find the answer in the project)
    - [ ] Research tools (I'll find the answer on the web / using mcp tools)
    - [ ] Skip

---

## Critical Rules

### 👍 Always
- ALWAYS establish specific, measurable goal first
- ALWAYS track progress toward that specific goal
- ALWAYS include all 5 types in batch mode
- ALWAYS show how answers advance the goal
- ALWAYS maintain single questions document per context
- ALWAYS format questions with the 5-option model
- ALWAYS use a numbered list for options
- ALWAYS break complex questions into multiple simpler questions

### 👎 Never  
- NEVER proceed without confirming specific goal
- NEVER ask vague or open-ended questions
- NEVER skip question types in batch mode
- NEVER create multiple question documents
- NEVER lose sight of the established goal
- NEVER ask questions that can't be answered with the 5 options
- NEVER use horizontal checkbox layouts
- NEVER use underscores or fill-in-the-blank formats

Remember: Every question must deliberately advance toward the specific goal. Questions without purpose waste time.

- Focus on the 5 question types:
  - **🔄 Simplify**: Can the context be made clearer or more concise?
  - **❓ Clarify**: Are there ambiguous relationships or unclear connections?
  - **🔧 Improve**: How can the contextual understanding be enhanced?
  - **➕ Expand**: What context or relationships are missing?
  - **➖ Reduce**: What context is unnecessary or redundant?

### Step 5: Document Enhancement
**Deliverable:** Updated source document with comprehensive contextual integration
**Acceptance Criteria:** Source document is enhanced with all discovered context
- Update the source document (do NOT create new files)
- Add missing context and background information
- Integrate cross-references via wikilinks where appropriate
- Include usage examples discovered from project research
- Ensure alignment with all project conventions
- Add relationship documentation to other framework components
- Enhance any existing examples or explanations

### Step 6: Validation and Integration
**Deliverable:** Verified integration with project ecosystem
**Acceptance Criteria:** Document integrates seamlessly with existing framework
- Verify all wikilinks resolve correctly
- Confirm convention adherence
- Validate relationship accuracy
- Check for consistency with similar documents
- Ensure no conflicts with existing patterns

## 📏 Instructions

### WHEN analyzing source documents
**Best Practices:**
- Read thoroughly to understand current state and purpose
- Identify the document's classification within the framework
- Note existing relationships and references
- Look for contextual gaps and missing information

**Rules:**
- ALWAYS understand the source completely before researching
- NEVER make assumptions about document purpose or needs
- MUST identify document type and classification exactly
- ALWAYS preserve existing valuable content without modification

### WHEN conducting project research
**Best Practices:**
- Use systematic search patterns for each artifact type
- Look for both direct and indirect relationships
- Identify usage examples and patterns
- Document conventions consistently applied across similar artifacts

**Search Patterns by Artifact Type:**
```
<example>
- [Search pattern for specific artifact type]: [What to look for]
- [Related concept identification methods]: [Pattern matching approaches]
- [Convention discovery techniques]: [How to find established patterns]
- [Cross-reference mapping strategies]: [Relationship identification methods]
</example>
```

**Rules:**
- MUST search all relevant artifact types systematically
- ALWAYS document patterns and conventions discovered
- NEVER skip artifact types that might contain relationships
- MUST identify both direct and indirect connections

### WHEN applying question-mode
**Best Practices:**
- Establish specific goal for contextualization improvement
- Use all 5 question types systematically
- Focus on YES/NO questions for clarity
- Track progress toward comprehensive understanding

**Rules:**
- ALWAYS embed complete question-mode process
- MUST resolve all ambiguities discovered
- NEVER skip systematic refinement process
- ALWAYS track progress toward contextualization goals

### WHEN updating source documents
**Best Practices:**
- Preserve existing structure completely - no new sections
- Integrate context within existing paragraphs and explanations
- Weave wikilinks naturally into existing sentences
- Deepen understanding without changing document purpose

**Constraints:**
- MUST update existing files, not create new ones
- CANNOT add new sections, headers, or structural elements
- CANNOT change the fundamental purpose or structure
- MUST work within existing content framework only

**Rules:**
- ALWAYS enhance existing content exactly as it exists, never add new sections
- NEVER create new headers or structural elements
- MUST preserve exact document structure and hierarchy
- ALWAYS integrate context within existing explanations only

### WHEN following template and convention rules

## 📏 Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN placing instruction placeholders ALWAYS use single square brackets for placeholder instructions.
  - Example: [Replace this with actual content]
- WHEN creating template variables ALWAYS use double curly brackets WITH backticks to indicate template variables.
    - Example: `{{variable-name}}`
- WHEN referencing parts of the document ALWAYS use template variables.
  - Example: Follow instruction in `{{variable-name}}` when [some condition].
- WHEN demonstrating examples ALWAYS put them inside an example tag inside a codeblock.
    - Example: See `{{example}}`
- WHEN creating examples ALWAYS describe the example types instead of actual examples.
    - Example: See `{{example}}`
- WHEN creating examples that need multiple items ALWAYS describe ALL types on ONE line (e.g., "architectural decisions, limitations, dependencies, performance considerations").
    - Example: See `{{multiple-items-example}}`
- WHEN examples require specific structure (like steps with substeps) ALWAYS show the exact structure with inline [placeholder] instructions while keeping type descriptions on single lines.
    - Example: See `{{structured-example}}`
- WHEN creating examples for structured content (like nested lists, hierarchies, or multi-level content) NEVER show the structure - ONLY describe what types go there in a single line.
- WHEN an example has complex formatting IGNORE the formatting and ONLY list the content types.

### 👎 Never

- WHEN creating examples NEVER use actual content, only describe the types of examples.
- WHEN creating examples NEVER use multiple lines for the example types.

### 🚫 Example Structure Rule
NEVER recreate the structure of what you're documenting in the example. The example should ONLY contain:
1. First line: [Description of all the types that go in this section]
2. Second line: [Additional items if needed]  
3. Third line: [...]

Even if the actual content has bullets, sub-bullets, multiple levels, categories, etc - IGNORE ALL OF THAT in the example.

### ✅ Good Examples

#### Basic Example
`{{example}}`:
```
<example>
- [Describe the example types]
- [More examples if needed]
- [...]
</example>
```

#### Multiple Items Example
`{{multiple-items-example}}`:
```
<example>
- [Architectural decision types, limitation types, dependency types, performance consideration types, and any other relevant context types]
- [Additional collections of related types if needed]
- [...]
</example>
```

#### Structured Example
`{{structured-example}}`:
```
<example>
1. [First action type]: [Description of what this action does]
   - [Sub-step type if the structure requires it]
   - [Another sub-step type]
2. [Second action type]: [Description of this action]
3. [More action types as needed]
[...]
</example>
```

## 📏 Wikilink Rules
> 💡 *Specific ALWAYS and NEVER rules that must be followed without exception.*

### 👍 Always

- WHEN referencing project documents ALWAYS use wikilinks WITHOUT backticks to reference other relevant project documents.
  - Example: [[relevant-document-wl-example]]
- WHEN creating example wikilinks that don't reference real files ALWAYS end them with "-wl-example".
  - Example: [[filename-wl-example]]
  - Example: ![[embedded-content-wl-example]]
- WHEN using embedded wikilinks ALWAYS place `![[filename-wl-example]]` on its own line.
  - The entire line gets replaced with file content during sync
- WHEN creating templates/prompts ALWAYS remember embedded wikilinks replace the entire line.

### 👎 Never

- WHEN creating wikilinks NEVER use backticks around wikilinks.
  - Wrong: `[[document-wl-example]]`
  - Right: [[document-wl-example]]
- WHEN using embedded wikilinks NEVER place them inline with other text.
  - Wrong: Some text ![[embedded-content-wl-example]] more text
  - Right: 
    ```
    Some text
    ![[embedded-content-wl-example]]
    More text
    ```
- WHEN creating artifacts NEVER forget embedded wikilinks must be on separate lines.

### 🔄 WikiLink Processing Details

**Regular wikilinks** `[[filename-wl-example]]`:
- Converted to `@full/path` references during sync
- Used for referencing other documents
- Processed by `sync-claude-code-wikilinks.sh`

**Embedded wikilinks** `![[filename-wl-example]]`:
- Entire line replaced with file content during sync
- Used for including content from another file
- Processed by `sync-claude-code-embedded-wikilinks.sh`
- MUST be on their own line - the entire line gets replaced

### ✅ Good WikiLink Examples

#### Regular WikiLink Reference
```markdown
For more details, see [[agent-template-wl-example]] for the standard structure.
The [[template-rules-wl-example]] define formatting standards.
```

#### Embedded WikiLink (Content Inclusion)
```markdown
## Instructions

Follow these core instructions:

![[standard-instructions-wl-example]]

Additional project-specific steps:
1. [First step]
2. [Second step]
```

### ❌ Bad WikiLink Examples

#### Never Wrap in Backticks
```markdown
# Wrong
See `[[agent-template-wl-example]]` for details.

# Right
See [[agent-template-wl-example]] for details.
```

#### Never Use Embedded WikiLinks Inline
```markdown
# Wrong
The instructions are: ![[standard-instructions-wl-example]] and then continue.

# Right
The instructions are:

![[standard-instructions-wl-example]]

And then continue.
```

## 📊 Output Format

### Format Type
Enhanced source document following original structure with contextual additions.

### Enhancement Pattern
```markdown
# Original document structure completely preserved

## Existing Content Enhancement Examples:
- Original: "This concept helps with organization"
- Enhanced: "This concept helps with organization by providing [[systematic-approach-wl-example]] that aligns with the project's [[modularity-principles-wl-example]] as seen in similar implementations like `{{discovered-usage-example}}`"

- Original: "Use this when you need to analyze"
- Enhanced: "Use this when you need to analyze complex requirements, following the same pattern established in [[related-workflow-wl-example]] and applied across `{{project-usage-examples}}`"

[All enhancements work within existing paragraphs, sentences, and bullet points]
```

### Enhancement Guidelines
- NEVER add new sections or headers
- Enhance existing content by deepening explanations and context
- Weave cross-references naturally into existing sentences and explanations
- Enrich existing examples with discovered project patterns
- Improve clarity and depth of existing content only

### Delivery Instructions
- Update source file(s) directly using Edit tool
- Verify all wikilinks resolve correctly
- Maintain original document purpose and structure
- Ensure seamless integration with project ecosystem
- Follow all established conventions exactly

---

# Usage Notes

## Comprehensive Coverage
This prompt can contextualize any type of document:
- **Meta-concepts**: Core framework principles and ideas
- **Agents**: Behavioral expertise modules  
- **Prompts**: Activity specifications and instructions
- **Templates**: Document structure patterns
- **Workflows**: Multi-phase orchestration processes
- **Instructions**: Conventions, rules, and best practices
- **Any other artifact**: Following the same systematic approach

## Research Philosophy
Every contextualization follows the pattern:
1. **Understand** → Analyze what currently exists
2. **Research** → Discover project patterns and relationships  
3. **Refine** → Apply question-mode for systematic improvement
4. **Enhance** → Update source with comprehensive context
5. **Validate** → Ensure seamless integration

## Integration Approach
- **Preserve**: Maintain existing structure and content exactly
- **Enhance**: Deepen existing explanations with discovered context
- **Connect**: Weave wikilinks naturally into existing sentences
- **Align**: Ensure convention and pattern consistency within existing content
- **Validate**: Verify enhanced content integrates seamlessly

## Question-Mode Integration
The embedded question-mode ensures systematic refinement:
- **Goal-driven**: Focus on specific contextualization objectives
- **Comprehensive**: Apply all 5 question types systematically
- **Binary decisions**: Use YES/NO format for clarity
- **Progress tracking**: Monitor advancement toward full contextualization

## Convention Compliance
All enhancements follow established rules:
- **Template rules**: Proper placeholder and example formatting
- **Wikilink rules**: Correct reference and embedding patterns
- **Project patterns**: Alignment with similar artifact structures
- **Quality standards**: Comprehensive context without redundancy
