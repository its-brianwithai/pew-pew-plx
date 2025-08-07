[![npm version](https://img.shields.io/npm/v/pew-pew-plx.svg)](https://www.npmjs.com/package/pew-pew-plx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/node/v/pew-pew-plx.svg)](https://nodejs.org)
[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)

# 🔫 Pew Pew 💨 Plx 🙏

> Advanced AI project management framework for Claude Code with specialized agents, smart templates, and context-aware workflows.

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

Pew Pew Plx is an AI project management framework that enhances Claude Code with:
- **🤖 30+ Specialized Agents** - From Flutter developers to workflow orchestrators
- **🎯 50+ Smart Prompts** - Quick-action commands for common tasks
- **📋 25+ Templates** - Structured formats for consistent documentation
- **🔄 Intelligent Workflows** - Multi-agent orchestration for complex tasks
- **🔗 WikiLink Resolution** - Automatic context loading and cross-referencing
- **📚 Context Engineering** - Maintain project knowledge across conversations

## 📦 Installation Methods

### Via Git (Development)
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
```
# In your agent file:
Follow the conventions in [[project-conventions]] and use [[story-template]].

# After sync becomes:
Follow the conventions in @instructions/project-conventions.md and use @templates/story-template.md.
```

This means when you use a command, all referenced documentation is automatically included in the context!

## 🏗️ Architecture  
  
### Core Components

1. **Agents** (`agents/`) - Specialized AI agents with specific expertise:
   - **Development** (`dev/`): Flutter Developer, Lead Developer
   - **Planning** (`plan/`): Discovery, Requirements, Refinement, Story, Roadmap, Implementation Agents
   - **Review** (`review/`): Code Reviewer, Unit Test Engineer, Bug Management Agents
   - **Meta** (`meta/`): Framework architects for creating agents, prompts, templates, workflows
   - **Claude** (`claude/`): Claude Code-specific tools (Commands, Hooks, MCP)
   - **Discovery** (`discovery/`): Research Specialist
   - **Standalone**: Makefile Expert
  
2. **Prompts** (`prompts/`) - Quick-action commands for common tasks:
   - **Creation**: create-{issue, story, milestone, agent, prompt, template, workflow, test, bug-report}
   - **Updates**: update-{issue, story, milestone, agent, prompt, template, workflow, readme}
   - **Reviews**: review-code, verify-bug-fix, triage-bug-report
   - **Process**: commit, push, sync-claude, refine, improve
   - **Research**: research-project, give-feedback, process-feedback
  
3. **Templates** (`templates/`) - Structured documentation formats:
   - **Planning**: story, epic, milestone, roadmap, task, proposal templates
   - **Workflows**: requirements, discovery, implementation-plan, refinement templates  
   - **Review**: bug-report, pull-request, feedback, work-log templates
   - **Context**: platform, role, team, persona templates
   - **Meta**: agent, workflow, block templates
  
4. **Instructions** (`instructions/`) - Project conventions and guidelines:
   - Claude Code sub-agent documentation
   - Example and instruction best practices
   - Issue creation conventions
   - Makefile best practices
  
5. **Workflows** (`workflows/`) - Multi-step orchestrated processes:
   - **Refinement Workflow**: 5-layer systematic approach to breaking down features
   - **Issue Workflow**: 6-phase feature development from discovery to implementation
   - **Bug Workflow**: 4-phase bug resolution from report to verification
   
6. **Blocks** (`blocks/`) - Reusable content components:
   - **Context**: Access config, capabilities, functions, purpose blocks
   - **Instructions**: Best practices, rules, quality standards blocks
   - **Meta**: Command blocks for different artifact types
   - **Refinements**: 40+ specialized blocks for comprehensive documentation
   - **Workflows**: Inputs, outputs, steps, orchestrator blocks
   
7. **Context** (`context/`) - Project knowledge base:
   - **Platforms**: External services and integrations
   - **Roles**: Team member responsibilities
   - **Teams**: Department organization
   - **Actors, Components, Concepts, Features, Models**: System documentation
  
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

**Development Agents:**
- **Flutter Developer** - Mobile app development with shadcn-flutter expertise
- **Lead Developer** - Architecture, code quality, and technical leadership

**Planning Agents:**
- **Discovery Agent** - Initial research and context gathering
- **Requirements Agent** - Detailed requirements elaboration
- **Refinement Agent** - System architecture and component design
- **Story Agent** - User story creation with acceptance criteria
- **Roadmap Agent** - Milestone planning and effort estimation
- **Implementation Agent** - Technical implementation planning
- **Issue Workflow Orchestrator** - 6-phase feature development coordination

**Review & Quality Agents:**
- **Code Reviewer** - Comprehensive code quality analysis
- **Unit Test Engineer** - Pure unit testing without mocks
- **Bug Reporter/Triage/Fix/Verifier** - Complete bug lifecycle management
- **Bug Workflow Orchestrator** - 4-phase bug resolution coordination
- **Content Drafter** - SaaS content and documentation

**Meta Framework Agents:**
- **Meta Architect** - Ultimate artifact creator (prompts, agents, templates, workflows)
- **Meta Prompt Engineer** - Advanced prompt optimization
- **Meta Sub-Agent Architect** - Agent creation specialist
- **Meta Template Expert** - Documentation template architect
- **Meta Workflow Specialist** - Multi-agent orchestration designer
- **Meta Context Expert** - Context documentation specialist
- **Meta Instructions Expert** - Convention documentation architect

**Claude Code Specialists:**
- **Command Agent** - Slash command creation
- **Hook Architect** - Event hook automation
- **MCP Specialist** - Model Context Protocol server configuration

**Other Specialists:**
- **Makefile Expert** - GNU Make mastery and build automation
- **Research Specialist** - Comprehensive research and analysis

### 🎯 Smart Prompts
Quick-action commands that streamline workflows:

**Creation Commands:**
- `/plx:create/issue` - Create GitHub issues with proper formatting
- `/plx:create/story` - Generate user stories with acceptance criteria
- `/plx:create/milestone` - Plan project milestones
- `/plx:create/bug-report` - File comprehensive bug reports
- `/plx:create/test` - Generate unit tests
- `/plx:create/agent` - Build new AI agents
- `/plx:create/workflow` - Design multi-step processes

**Update Commands:**
- `/plx:update/readme` - Keep documentation current
- `/plx:update/story` - Refine user stories
- `/plx:update/agent` - Modify agent behavior
- `/plx:update/makefile` - Enhance build scripts

**Review & Process:**
- `/plx:review/code` - Comprehensive code analysis
- `/plx:commit` - Smart git commits
- `/plx:push` - Push changes with checks
- `/plx:sync/claude` - Sync framework components
- `/plx:refine` - Refine concepts systematically

**Research & Analysis:**
- `/plx:research/project` - Deep project research
- `/plx:give/feedback` - Provide structured feedback
- `/plx:process/feedback` - Integrate feedback systematically

### 📋 Structured Templates
Consistent documentation formats:

**Planning Templates:**
- **Story/Epic/Task** - Agile project artifacts
- **Milestone/Roadmap** - Project planning
- **Proposal** - Feature proposals

**Workflow Templates:**
- **Requirements** - Comprehensive requirement docs
- **Discovery** - Research documentation
- **Implementation Plan** - Technical planning
- **Refinement** - System design docs

**Review Templates:**
- **Bug Report** - Issue tracking
- **Pull Request** - PR descriptions
- **Feedback** - Structured feedback
- **Work Log** - Progress tracking

**Context Templates:**
- **Platform** - Integration documentation
- **Role/Team** - Organization structure
- **Persona** - User profiles

**Meta Templates:**
- **Agent** - AI agent creation
- **Workflow** - Process design
- **Block** - Reusable components

### 🔄 Intelligent Workflows
Multi-agent orchestration for complex tasks:

**Refinement Workflow** (`/start:refinement-workflow`)
- 5-layer systematic decomposition
- Actors & Components → Activities → Flows → Properties → Behaviors
- Transforms concepts into testable requirements

**Issue Workflow** (`/start:issue-workflow`)
- 6-phase feature development
- Discovery → Requirements → Refinement → Story Creation → Roadmap → Implementation
- Complete feature lifecycle management

**Bug Workflow** (`/start:bug-workflow`)
- 4-phase bug resolution
- Reporting → Triage → Fix Planning → Verification
- Systematic bug lifecycle management

### 🔗 WikiLink Magic
Automatic context loading:
```
# In your documents:
Follow [[issue-creation-conventions]] and use [[story-template]]

# Becomes after sync:
Follow @instructions/issue-creation-conventions.md and use @templates/plan/story-template.md
```


## 🚦 Common Workflows
### Starting a New Feature
```bash
# 1. Use the refinement workflow
/start:issue-workflow

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

## 🔧 Advanced Features

### 🎨 Blocks System
Reusable content components for building comprehensive documentation:

**Available Block Categories:**
- **Context Blocks**: Access configuration, capabilities, functions
- **Instruction Blocks**: Best practices, rules, quality standards
- **Meta Blocks**: Command headers for different artifact types
- **Refinement Blocks**: 40+ specialized blocks for requirements
- **Workflow Blocks**: Process components


### 🛠️ Custom Make Commands
Extend the CLI with project-specific commands:
```makefile
# In your Makefile
deploy:
    @echo "Deploying to production..."
    # Your deployment logic here

tests:
    @npm test

lint:
    @npm run lint
```

Then run:
```bash
plx deploy
plx tests
plx lint
```


### 🔄 Watch Mode
Auto-sync changes during development:
```bash
plx watch claude
```
Monitors `agents/` and `prompts/` directories for changes.

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
