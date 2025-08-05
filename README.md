[![npm version](https://img.shields.io/npm/v/pew-pew-plx.svg)](https://www.npmjs.com/package/pew-pew-plx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/node/v/pew-pew-plx.svg)](https://nodejs.org)
[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)

# 🔫 Pew Pew 💨 Plx 🙏

> (Claude Code) Context framework  with AI-powered project management through specialized agents, smart templates, and context-aware workflows.

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

That's it! You now have access to 20+ specialized agents, 30+ prompt commands, and intelligent workflows in Claude Code.  
  
## 🎯 What is Pew Pew Plx?

Pew Pew Plx is a comprehensive AI project management framework that supercharges Claude Code with:

- **🤖 20+ Specialized Agents** - From Flutter developers to workflow orchestrators
- **🎯 30+ Smart Prompts** - Quick-action commands for common tasks
- **📋 15+ Templates** - Structured formats for consistent documentation
- **🔄 Intelligent Workflows** - Multi-agent orchestration for complex tasks
- **🔗 WikiLink Resolution** - Automatic context loading and cross-referencing
- **📚 Context Engineering** - Maintain project knowledge across conversations

## 📦 Installation

### Via npm (Recommended)
```bash
npm install -g pew-pew-plx
```

### Via Git
```bash
git clone https://github.com/its-brianwithai/pew-pew-projects.git
cd pew-pew-projects
npm install -g .
```

### Requirements
- Node.js >= 16.0.0
- Claude Code
- Make (for advanced commands)  
  
## 🎮 Core Commands

```bash
# Initialize framework in your project
plx init

# Sync all components to Claude Code
plx sync claude

# Clean sync (removes then re-adds)
plx sync claude clean

# Pull latest framework updates
plx pull main      # From main branch
plx pull beta      # From beta branch

# Pull from any repository
plx pull https://github.com/user/repo.git main
plx pull git@github.com:user/repo.git develop

# Watch mode for auto-sync
plx watch claude
```

## 🚀 How Commands Work in Claude Code

After running `plx sync claude`, the framework creates specialized commands in Claude Code:

### 🤖 Agent Commands (`/act`)
Agents are synced as both:
- **Sub-agents** in `.claude/agents/` - Used by Claude Code for automatic delegation
- **Commands** in `.claude/commands/act/` - Used to manually invoke an agent persona

**Structure**: Agent filenames are parsed to extract the persona (engineer, architect, specialist, etc.) from the object:
- `unit-test-engineer` → `/act:unit/test/engineer`
- `flutter-developer` → `/act:flutter/developer`
- `workflow-specialist` → `/act:workflow/specialist`

**Usage**: Type `/act:flutter/developer` to have Claude adopt the Flutter Developer persona for your conversation.

### 🎯 Prompt Commands (`/plx`)
Prompts are quick-action commands that check for required information and execute tasks.

**Structure**: Prompts with verb-object patterns are organized into subdirectories:
- `create-issue.md` → `/plx:create/issue`
- `review-code.md` → `/plx:review/code`

**Usage**: Type `/plx:create/issue` to quickly create and refine an issue file.

### 📋 Template Commands (`/use`)
Templates provide structured document formats for consistent documentation.

**Structure**: Templates are available as `/use:{template-name}`
- `story-template.md` → `/use:story-template`
- `epic-template.md` → `/use:epic-template`

**Usage**: Type `/use:story-template` to get a pre-formatted story document structure.

### 📚 Instruction Commands (`/follow`)
Instructions set conventions and guidelines that Claude will follow throughout the conversation.

**Structure**: Instructions are available as `/follow:{instruction-name}`
- `project-conventions.md` → `/follow:project-conventions`
- `code-style.md` → `/follow:code-style`

**Usage**: Type `/follow:project-conventions` to have Claude adopt your project's specific conventions.

### 🌊 Workflow Commands (`/start`)
Workflows orchestrate multi-step processes using multiple agents.

**Structure**: Workflows are available as `/start:{workflow-name}`
- `refinement-workflow.md` → `/start:refinement-workflow`

**Usage**: Type `/start:refinement-workflow` to begin a guided refinement process.

## 🔗 Automatic WikiLink Resolution

The framework uses WikiLinks (`[[filename]]`) throughout documents to reference other files. During sync, these are automatically converted to absolute paths that Claude Code can load.

### How It Works:
1. **Write**: Use `[[agent-name]]` or `[[template-name]]` in your documents
2. **Sync**: The sync process converts these to `@path/to/file.md`
3. **Load**: When a command is used, Claude automatically loads all referenced files

### Search Order:
WikiLinks are resolved in this order:
1. Project directories: `prompts/`, `agents/`, `instructions/`, `templates/`, `context/`, `docs/`
2. Claude directories: Recursively searches `.claude/`

### Example:
```markdown
# In your agent file:
Follow the conventions in [[project-conventions]] and use [[story-template]].

# After sync becomes:
Follow the conventions in @instructions/project-conventions.md and use @templates/story-template.md.
```

This means when you use a command, all referenced documentation is automatically included in the context!

## 🏗️ Architecture  
  
1. **Agents** (`agents/`) - Specialized AI agents with specific expertise:
   - Each agent has a focused role and clear responsibilities
   - Agents can work as sub-agents (automatic delegation) or via commands (manual invocation)
   - Follow a structured format: Purpose, Instructions, Best Practices, Rules, Output
  
2. **Prompts** (`prompts/`) - Quick-action commands for common tasks:
   - Check for required information before executing
   - Organized by verb (create, review, sync, etc.)
   - Streamline repetitive workflows
  
3. **Templates** (`templates/`) - Structured documentation formats:
   - Ensure consistency across project documentation
   - Include placeholders and instructions for completion
   - Cover stories, epics, architecture docs, and more
  
4. **Instructions** (`instructions/`) - Project conventions and guidelines:
   - Define coding standards, naming conventions, and best practices
   - Applied to conversations to ensure consistency
   - Can include examples and anti-patterns
  
5. **Workflows** (`workflows/`) - Multi-step orchestrated processes:
   - Coordinate multiple agents to complete complex tasks
   - Define clear phases and handoffs
   - Include decision points and quality gates
  
### Sync Mechanism  
  
The framework syncs to Claude Code's configuration:
- Agents → `.claude/agents/` (sub-agents) and `.claude/commands/act/` (commands)
- Prompts → `.claude/commands/plx/{verb}/` or `.claude/commands/` (single-word)
- Templates → `.claude/commands/use/` 
- Instructions → `.claude/commands/follow/`
- Workflows → `.claude/commands/start/`
  
### 🔧 Directory Structure

```
pew-pew-plx/
├── agents/          # Specialized AI agents
│   ├── dev/         # Development agents (flutter, lead developer)
│   ├── discovery/   # Research and exploration agents
│   ├── meta/        # Framework meta-agents
│   ├── plan/        # Planning and documentation agents
│   └── review/      # Code review and quality agents
├── prompts/         # Quick-action prompt commands
├── templates/       # Documentation templates
├── instructions/    # Project conventions and guidelines
├── workflows/       # Multi-agent orchestrated processes
├── blocks/          # Reusable content blocks
└── context/         # Project-specific information
```

WikiLinks (`[[filename]]`) are automatically converted to `@path/to/file.md` during sync.

### Command Headers

Each command type has a specific header that instructs Claude how to behave:
- **Agents**: Adopt the persona and await user's request
- **Prompts**: Check for missing information, then proceed
- **Templates**: Acknowledge understanding and await user's request
- **Instructions**: Follow the instructions throughout the conversation
- **Workflows**: Assume orchestrator role and start the process

## 💡 Key Features

### 🤖 Specialized Agents
Each agent is an expert in their domain:
- **Flutter Developer** - Mobile app development specialist
- **Lead Developer** - Architecture and code quality expert
- **Makefile Expert** - Build automation and GNU Make master
- **Unit Test Engineer** - Pure testing without mocks
- **Meta Agents** - Framework extension specialists

### 🎯 Smart Prompts
Quick-action commands that streamline workflows:
- `/plx:create/issue` - Create and refine GitHub issues
- `/plx:review/code` - Comprehensive code review
- `/plx:sync/claude` - Sync framework components
- `/plx:refine` - Refine project concepts into actionable plans

### 📋 Structured Templates
Consistent documentation formats:
- **Story/Epic/Milestone** - Agile project management
- **Architecture/PRD** - Technical documentation
- **Research Reports** - Discovery findings
- **Work Logs** - Progress tracking

### 🔄 Intelligent Workflows
Multi-agent orchestration for complex tasks:
- **Refinement Workflow** - Concept to PRD/Architecture
- **Requirements Workflow** - Comprehensive gathering
- **Feature Conversion** - Migration processes

### 🔗 WikiLink Magic
Automatic context loading:
```markdown
# In your documents:
Follow [[project-conventions]] and use [[story-template]]

# Becomes after sync:
Follow @instructions/project-conventions.md and use @templates/story-template.md
```

## 🛠️ Creating Custom Components

### Custom Agent
```bash
# Create a new agent
plx create agent my-specialist

# Edit the agent file
edit agents/my-specialist.md

# Sync to Claude Code
plx sync claude
```

### Custom Prompt
```bash
# Create a new prompt command
plx create prompt analyze-performance

# The prompt becomes available as:
/plx:analyze/performance
```

### Custom Template
```bash
# Create a new template
plx create template architecture-decision-record

# Use in Claude Code:
/use:architecture-decision-record
```

## 🚦 Common Workflows

### Starting a New Feature
```bash
# 1. Use the refinement workflow
/start:refinement-workflow

# 2. Create a story
/plx:create/story "User Authentication"

# 3. Let specialized agents help
/act:flutter/developer
```

### Code Review Process
```bash
# 1. Review your changes
/plx:review/code

# 2. Create tests
/act:unit/test/engineer

# 3. Update documentation
/plx:update/readme
```

## 🔧 Advanced Configuration

### Custom Make Commands
Add to your `Makefile`:
```makefile
# Custom deployment command
deploy:
	@echo "Deploying to production..."
	# Your deployment logic here
```

Then run:
```bash
plx deploy
```

### Project-Specific Context
Add context files to:
- `context/actors/` - System users and personas
- `context/features/` - Feature specifications
- `context/platforms/` - Integration details
- `context/roles/` - Team member roles

## 🤝 Contributing

We welcome contributions! Here's how:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Setup
```bash
# Clone the repo
git clone https://github.com/its-brianwithai/pew-pew-projects.git
cd pew-pew-projects

# Install dependencies
npm install

# Link for local development
npm link
```

## 📚 Documentation

- **[Getting Started Guide](docs/getting-started.md)** <!-- TODO: Create getting started guide -->
- **[Agent Development](docs/agent-development.md)** <!-- TODO: Create agent development guide -->
- **[Template Creation](docs/template-creation.md)** <!-- TODO: Create template creation guide -->
- **[Workflow Orchestration](docs/workflow-orchestration.md)** <!-- TODO: Create workflow guide -->

## 🐛 Troubleshooting

### Sync Issues
```bash
# Clean and re-sync
plx sync claude clean
```

### Command Not Found
```bash
# Ensure global installation
npm list -g pew-pew-plx

# Reinstall if needed
npm install -g pew-pew-plx
```

### Make Not Found
- **macOS**: `brew install make`
- **Ubuntu/Debian**: `sudo apt-get install build-essential`
- **Windows**: Use WSL or install GNU Make

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 🙏 Acknowledgments

- Built for the Claude Code community
- Inspired by modern AI development workflows
- Special thanks to all contributors

## 🔗 Links

- **Website**: [pewpewprompts.com](https://pewpewprompts.com)
- **Repository**: [GitHub](https://github.com/its-brianwithai/pew-pew-projects)
- **npm Package**: [pew-pew-plx](https://www.npmjs.com/package/pew-pew-plx)
- **Issues**: [GitHub Issues](https://github.com/its-brianwithai/pew-pew-projects/issues)

---

<p align="center">Made with ❤️ by the Pew Pew team</p>
