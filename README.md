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
  
### Development Workflow  
1. Make changes to agents, prompts, or templates  
2. Run `plx sync claude` to update Claude Code configuration  
3. Use `/plx:{prompt-name}` commands in Claude Code to access prompts  
4. Use `/act:as-{agent-name}` commands to invoke specific agents  
5. Use `/use:{template-name}` commands to apply templates  
  
## Architecture & Structure  
  
### Framework Components  
  
1. **Agents** (`agents/`) - Specialized AI agents organized by workflow phase:  
   - `discovery/` - Research and exploration agents  
   - `plan/` - Planning and documentation agents (story, epic, milestone, etc.)  
   - `act/` - Implementation agents (commands, hooks, meta-agent)  
   - `review/` - Review and quality agents (code-review, work-log)  
   - `context/` - Context management agents (convention, role, team)  
   - `template/` - Template-specific agents for document sections  
  
2. **Prompts** (`prompts/`) - Reusable command prompts that become `/plx:` commands:  
   - `plan.md`, `refine.md` - Workflow initiators  
   - `improve.md`, `review-code.md` - Quality improvement  
   - `create-issue.md`, `commit.md` - Development tasks  
  
3. **Templates** (`templates/`) - Markdown documentation templates that become `/use:` commands:  
   - Story, Epic, Milestone templates for project management  
   - Architecture, PRD, Dev Plan templates for technical documentation  
   - Workflow templates for process documentation  
  
4. **Context** (`context/`) - Project-specific information:  
   - `actors/`, `components/`, `features/` - System elements  
   - `platforms/` - Integration points and deployment targets  
   - `roles/`, `teams/` - Organization structure  
  
5. **Workflows** (`workflows/`) - Orchestrated multi-agent processes:  
   - `refinement-workflow.md` - Project concept to PRD/Architecture  
   - `requirements-workflow.md` - Requirements gathering process  
   - `feature-conversion-workflow.md` - Feature migration process  
  
### Sync Mechanism  
  
The framework syncs to Claude Code's configuration:  
- Agents → `.claude/agents/` (flat structure) and `.claude/commands/act/` (as commands)  
- Prompts → `.claude/commands/plx/` (as `/plx:` commands)  
- Templates → `.claude/commands/use/` (as `/use:` commands)  
- Workflows → `.claude/commands/start/` (as `/start:` commands)  
  
WikiLinks (`[[filename]]`) are automatically resolved to their actual locations during sync.
  
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
3. Include references to related templates and agents  
4. Run `plx sync claude` to make available in Claude Code  
  
## Extension Points  
  
The framework is designed to be extended:  
- Add custom agents for project-specific needs  
- Create new templates for documentation types  
- Define workflows for complex processes  
- Extend the Makefile for custom commands  
  
Custom make commands can be added to the Makefile and run with `plx <command>`.
