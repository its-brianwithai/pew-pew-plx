[![npm version](https://img.shields.io/npm/v/pew-pew-plx.svg)](https://www.npmjs.com/package/pew-pew-plx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/node/v/pew-pew-plx.svg)](https://nodejs.org)
[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)

# 🔫 Pew Pew 💨 Plx 🙏

> Advanced AI project management framework for Claude Code that transforms any desire to DO something into production-ready artifacts through systematic decomposition and intelligent component reuse.

![Pew Pew Plx Hero](assets/hero.png)

## 🚀 Quick Start

```bash
# Install globally via npm
npm install -g pew-pew-plx

# Initialize in your project
plx init

# Sync with Claude Code
plx sync claude
```

That's it! You now have access to the complete artifact creation philosophy, specialized agents, smart templates, and intelligent workflows in Claude Code.

## 🎨 Core Philosophy: Create Anything from Desire

Every artifact in this framework stems from a **desire to DO something**. We systematically transform that desire into production-ready components through:

### 1️⃣ **Desire Discovery**
What do you want to DO with this framework?
- **Create** something new
- **Update** existing artifacts  
- **Make** transformations
- **Shard** into reusable pieces

### 2️⃣ **Component Decomposition**
Break desires into modular, reusable components:
- 🎯 **End Goal** - The measurable objective that determines value
- 👤 **Persona** - Specialized expertise when needed
- 📋 **Request** - Verb-first activity with deliverables
- 🔄 **Workflow** - Atomic steps with acceptance criteria
- 📏 **Instructions** - Event-driven conventions and rules
- 📊 **Output Format** - Structured delivery templates

### 3️⃣ **Progressive Sharding**
Extract and share components for maximum reuse:
```markdown
# Start with components inline
persona: Expert issue creator
workflow: Step-by-step process
instructions: When X, then Y

# Extract shareable pieces
persona: [[issue-expert-persona]]
workflow: [[issue-creation-workflow]]
instructions: [[issue-conventions]]

# Eventually combine into agent
![[issue-creator-agent]]
```

### 4️⃣ **Question-Mode Refinement**
Apply systematic YES/NO questioning at each step:
- 🔄 **Simplify** - Can we reduce complexity?
- ❓ **Clarify** - Are requirements unambiguous?
- 🔧 **Improve** - What enhancements add value?
- ➕ **Expand** - What edge cases are missing?
- ➖ **Reduce** - What can be deferred to MVP?

## 🎮 The "Anything" Commands

After syncing, use these powerful creation commands:

### 🎨 `/plx:create/anything`
Transform any desire into the right artifact type:
```markdown
User: "I want to easily identify all actors in my project"
→ Creates: identify-actors.md prompt with:
  - Actor identification workflow
  - Actor template output format
  - Systematic discovery instructions
```

### 🔄 `/plx:update/anything`
Enhance existing artifacts to current standards:
- Analyzes current state vs best practices
- Identifies improvement opportunities
- Applies modular enhancements
- Extracts shareable components

### 🔮 `/plx:make/anything`
Transform any input into desired artifacts:
- Text → Structured documentation
- Ideas → Actionable components
- Requirements → Implementation plans
- Conversations → Formal specifications

### 🧩 `/plx:shard/anything`
Extract and modularize components:
- Identifies reusable patterns
- Creates standalone component files
- Replaces with wikilinks
- Enables cross-artifact sharing

## 🔗 WikiLink Architecture: High Reusability

The framework's power comes from its **component reusability system**:

### Standard WikiLinks → Force Reads
```markdown
# In your artifact:
Follow [[project-conventions]] and use [[story-template]]

# After sync becomes:
Follow @instructions/project-conventions.md and use @templates/story-template.md

# Result: Claude automatically loads all referenced files
```

### Embedded WikiLinks → Insert Content
```markdown
# Reference (loads on activation):
Use the workflow in [[issue-workflow]]

# Embedded (content inserted during sync):
![[issue-workflow]]

# CRITICAL: Embedded wikilinks MUST be on their own line
```

### Component Evolution Path
```markdown
1. Define inline → Components in the prompt itself
2. Extract to files → [[component-name]] references
3. Create agent → Combine persona + workflow + instructions
4. Embed agent → ![[agent-name]] in prompts
```

## 📝 Anatomy of a Good Prompt

Every prompt follows this modular structure (include only what serves the end goal):

### 🎯 End Goal
The north star that determines whether any section provides value:
```markdown
## 🎯 End Goal
Successfully create a production-ready artifact that:
- Achieves the stated desire
- Maximizes reusability
- Follows all conventions
- Can be immediately used
```

### 👤 Persona (Optional)
Specialized expertise when it improves outcomes:
- Role, Expertise, Domain, Knowledge
- Experience, Skills, Abilities, Responsibilities
- Interests, Background, Preferences, Perspective
- Communication Style

### 📋 Request
Verb-first activity with clear expectations:
```markdown
## 📋 Request
Guide the user through systematic creation by:
1. Discovering their core desire
2. Decomposing into components
3. Identifying sharding opportunities
4. Assembling the final artifact
```

### 🔄 Workflow (Optional)
Atomic steps with measurable outcomes:
```markdown
### Step 1: Desire Discovery
**Deliverable:** Clear understanding of intent
**Acceptance Criteria:** Desire mapped to action verb
```

### 📏 Instructions (Optional)
Event-driven guidance:
```markdown
### WHEN gathering requirements
**Best Practices:** Start with user capabilities
**Conventions:** Use **Actor** should format
**Rules:** ALWAYS use testable conditions
```

### 📊 Output Format (Optional)
Structured delivery specifications:
```markdown
### Format Type
Markdown following [[issue-template]]

### Structure Template
![[issue-template]]
```

## 🤖 Agent Composition

Agents combine reusable components:

```markdown
# Components that make an agent:
Persona + Workflow + Instructions + Output Format

# Example agent composition:
persona: [[flutter-developer-persona]]
workflow: [[development-workflow]]
instructions: [[flutter-conventions]]
output_format: [[code-review-format]]

# When these align naturally, extract as agent:
agents/flutter-developer.md

# Then embed in prompts:
![[flutter-developer]]
```

## 📋 Issue Management Philosophy

### Parallel AI Working Paths

Enable maximum productivity through strategic organization:

#### Team Structure
- **Tech** - Development and architecture
- **Marketing** - Content and engagement
- **Sales** - Customer relations and revenue

#### Subject-Based Parallel Work
Within each team, subjects advance independently:
- Each subject improves one at a time
- MVP must-have mindset for granular releases
- Global scale productivity across levels
- Non-interrupting workflows

### Question Mode Integration

Systematic refinement through YES/NO questions:
- **Simplify** - Reduce complexity suggestions
- **Clarify** - Validate understanding
- **Improve** - Enhancement opportunities
- **Expand** - Missing requirements
- **Reduce** - MVP analysis

## 🎮 Commands

### Core Framework Commands
```bash
plx init              # Initialize framework
plx sync claude       # Sync to Claude Code
plx sync claude clean # Clean sync
plx watch claude      # Auto-sync during development
plx pull main         # Update framework
```

### Claude Code Commands (After Sync)

#### Creation Suite
- `/plx:create/anything` - Transform desires into artifacts
- `/plx:create/issue` - Systematic issue documentation
- `/plx:create/story` - User stories with criteria
- `/plx:create/agent` - New AI agents
- `/plx:create/workflow` - Multi-step processes

#### Transformation Suite  
- `/plx:update/anything` - Enhance existing artifacts
- `/plx:make/anything` - Transform content types
- `/plx:shard/anything` - Extract components
- `/plx:update/issue` - Refine existing issues
- `/plx:make/issue` - Convert content to issues

#### Agent Commands
- `/act:flutter/developer` - Flutter expertise
- `/act:story/agent` - Story creation
- `/act:code/reviewer` - Code analysis

#### Workflow Commands
- `/start:issue-workflow` - 6-phase feature development
- `/start:refinement-workflow` - 5-layer decomposition
- `/start:bug-workflow` - 4-phase bug resolution

## 🏗️ Architecture

### Directory Structure
```
pew-pew-plx/
├── .pew/            # All framework components
│   ├── agents/      # Specialized AI agents
│   ├── prompts/     # Quick-action commands
│   │   ├── create-anything.md
│   │   ├── update-anything.md
│   │   ├── make-anything.md
│   │   └── shard-anything.md
│   ├── templates/   # Document templates
│   │   ├── outputs/ # Complete templates
│   │   └── blocks/  # Reusable sections
│   ├── workflows/   # Multi-step processes
│   ├── instructions/# Conventions and rules
│   ├── modes/       # Behavioral modifications
│   │   └── question-mode.md
│   └── context/     # Project knowledge
```

### Sync Transformation
```markdown
# Components distribute to Claude Code:
Agents → .claude/agents/ + .claude/commands/act/
Prompts → .claude/commands/plx/
Templates → .claude/commands/use/
Instructions → .claude/commands/apply/
Workflows → .claude/commands/start/
Modes → .claude/commands/activate/
```

## 💡 Key Principles

### 1. Everything Starts with Desire
Don't ask "what artifact type?" Ask "what do you want to DO?"

### 2. Components Over Monoliths
Define once, use everywhere through wikilinks

### 3. Progressive Enhancement
Inline → Extracted → Agent → Reusable everywhere

### 4. Question Everything
Use question-mode to refine at each step

### 5. Agent Extraction Pattern
When Persona + Workflow + Instructions naturally align, they become an agent

## 🚦 Example: Creating an Issue

```bash
# Method 1: Direct creation
/plx:create/issue

# Method 2: Transform from notes
/plx:make/issue "Turn my meeting notes into an issue"

# Method 3: Update existing
/plx:update/issue "Enhance my draft issue"

# Method 4: From desire
/plx:create/anything "I want to track a new feature"
```

Each method leverages the same modular components, demonstrating the framework's flexibility.

## 📚 Documentation

- **Prompts**: See `.pew/prompts/` for all creation commands
- **Agents**: See `.pew/agents/` for specialized expertise
- **Templates**: See `.pew/templates/` for structured formats
- **Workflows**: See `.pew/workflows/` for orchestrated processes
- **Instructions**: See `.pew/instructions/` for conventions

## 🤝 Contributing

We welcome contributions! The framework itself follows its own philosophy:

1. Start with a desire (what do you want to DO?)
2. Create components following templates
3. Extract shareable pieces
4. Test with question-mode refinement
5. Submit PR with clear documentation

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 🔗 Links

- **Website**: [pewpewprompts.com](https://pewpewprompts.com)
- **Repository**: [GitHub](https://github.com/its-brianwithai/pew-pew-projects)
- **npm Package**: [pew-pew-plx](https://www.npmjs.com/package/pew-pew-plx)
- **Issues**: [GitHub Issues](https://github.com/its-brianwithai/pew-pew-projects/issues)

---

<p align="center">Made with ❤️ by the Pew Pew team</p>
<p align="center">⭐ Star us on GitHub if this helps your workflow!</p>
