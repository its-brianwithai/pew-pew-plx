[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)
# 🔫 Pew Pew 💨 Plx 🙏

![Pew Pew Plx Hero](assets/hero.png)

## Project Overview  
  
Pew Pew Plx is an AI-powered project management framework that syncs specialized agents, templates, and prompts with Claude Code. It provides a structured approach to software development through context engineering and orchestrated workflows.  
  
## Common Development Commands  
  
### Primary Commands  
```bash  
# Initialize the framework (only needed once)  
plx init  
  
# Sync agents, prompts, and templates to Claude Code  
plx sync claude  
  
# Clean and re-sync Claude Code configuration  
plx sync claude clean  
  
# Pull latest updates from a branch  
plx pull main      # Pull from main branch  
plx pull beta      # Pull from beta branch  
  
# Pull from external repositories  
plx pull https://github.com/user/repo.git main  
plx pull git@github.com:user/repo.git develop  
  
# Watch for changes and auto-sync  
plx watch claude  
```  
  
## How Commands Work in Claude Code

After running `plx sync claude`, the framework creates specialized commands in Claude Code:

### 🤖 Agent Commands (`/act`)
Agents are synced as both:
- **Sub-agents** in `.claude/agents/` - Used by Claude Code for automatic delegation
- **Commands** in `.claude/commands/act/as/` - Used to manually invoke an agent persona

**Structure**: Agent filenames are parsed to extract the persona (engineer, architect, specialist, etc.) from the object:
- `unit-test-engineer` → `/act:as/unit/test/engineer`
- `flutter-developer` → `/act:as/flutter/developer`
- `workflow-specialist` → `/act:as/workflow/specialist`

**Usage**: Type `/act:as/flutter/developer` to have Claude adopt the Flutter Developer persona for your conversation.

### 🎯 Prompt Commands (`/plx`)
Prompts are quick-action commands that check for required information and execute tasks.

**Structure**: Prompts with verb-object patterns are organized into subdirectories:
- `create-issue.md` → `/plx:create/issue`
- `review-code.md` → `/plx:review/code`
- Single-word prompts like `start.md` → `/start`

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

## Architecture & Structure  
  
### Framework Components  
  
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
- Agents → `.claude/agents/` (sub-agents) and `.claude/commands/act/as/` (commands)
- Prompts → `.claude/commands/plx/{verb}/` or `.claude/commands/` (single-word)
- Templates → `.claude/commands/use/` 
- Instructions → `.claude/commands/follow/`
- Workflows → `.claude/commands/start/`
  
WikiLinks (`[[filename]]`) are automatically converted to `@path/to/file.md` during sync.

### Command Headers

Each command type has a specific header that instructs Claude how to behave:
- **Agents**: Adopt the persona and await user's request
- **Prompts**: Check for missing information, then proceed
- **Templates**: Acknowledge understanding and await user's request
- **Instructions**: Follow the instructions throughout the conversation
- **Workflows**: Assume orchestrator role and start the process

### Key Design Principles  
  
1. **Agent Specialization**: Each agent has a specific role and follows a structured format with Purpose, Core Capabilities, Workflow, and Report sections.  
  
2. **Template-Driven Documentation**: All documentation follows predefined templates for consistency.  
  
3. **Orchestrated Workflows**: Complex tasks use orchestrator agents that delegate to specialist sub-agents.  
  
4. **Context Engineering**: Heavy emphasis on maintaining project context through structured documentation.  
  
5. **Command Integration**: Seamless integration with Claude Code through custom slash commands.  
  
## Working with Agents  
  
Agents follow a standard structure:  
- Frontmatter with name, description, and color  
- Purpose section defining the agent's role  
- Core Capabilities outlining what the agent can do  
- Workflow describing the step-by-step process  
- Report/Response format specification  
  
When creating new agents:  
1. Place in appropriate directory under `agents/`  
2. Follow existing agent structure and conventions  
3. Include references to related templates and agents using WikiLinks
4. Run `plx sync claude` to make available in Claude Code  
  
## Extension Points  
  
The framework is designed to be extended:  
- Add custom agents for project-specific needs  
- Create new templates for documentation types  
- Define workflows for complex processes  
- Add instructions for project conventions
- Extend the Makefile for custom commands  
  
Custom make commands can be added to the Makefile and run with `plx <command>`.