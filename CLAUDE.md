# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Development Commands

### Core Commands
```bash
# Sync all framework components to Claude Code
plx sync claude

# Clean sync (removes and re-adds all components)
plx sync claude clean

# Pull latest framework updates
plx pull main      # From main branch
plx pull beta      # From beta branch

# Watch mode for auto-sync during development
plx watch claude

# Initialize framework in a new project
plx init
```

### Testing Framework Components
```bash
# Test agent functionality
node bin/plx.js sync claude

# Test specific sync scripts
./scripts/claude-code/sync-claude-code-agents.sh
./scripts/claude-code/sync-claude-code-prompts.sh
```

## Architecture Overview

### Component Types and Sync Behaviour

1. **Agents** (`agents/`) → Synced as both:
   - Sub-agents in `.claude/agents/` (for automatic delegation)
   - Commands in `.claude/commands/act/` (for manual invocation via `/act:`)

2. **Prompts** (`prompts/`) → Synced to `.claude/commands/`:
   - Verb-object patterns create subdirectories (e.g., `create-issue.md` → `/plx:create/issue`)
   - Single-word prompts go directly to commands directory

3. **Templates** (`templates/`) → Synced to `.claude/commands/use/`
   - Available as `/use:{template-name}`

4. **Instructions** (`instructions/`) → Synced to `.claude/commands/follow/`
   - Available as `/follow:{instruction-name}`

5. **Workflows** (`workflows/`) → Synced to `.claude/commands/start/`
   - Available as `/start:{workflow-name}`

### WikiLink Resolution System

The framework automatically resolves WikiLinks (`[[filename]]`) to absolute paths during sync:
- Search order: project directories first (`prompts/`, `agents/`, etc.), then `.claude/` recursively
- Converted to `@path/to/file.md` format for Claude Code
- Enables automatic context loading when commands are used

### Command Header Processing

Each component type has specific headers that instruct Claude's behavior:
- Headers are processed by `process-claude-code-headers.sh`
- Define how Claude should respond when a command is invoked
- Located at the top of each markdown file

## Key Implementation Details

### CLI Architecture
- Main entry: `bin/plx.js` (ES module)
- Delegates to Makefile for command execution
- `lib/init.js` handles project initialization

### Sync Scripts
- Master script: `scripts/claude-code/sync-claude-code.sh`
- Component-specific scripts handle different file types
- WikiLink resolution: `sync-claude-code-wikilinks.sh`
- Uses temporary directory for atomic operations

### Directory Structure
```
pew-pew-plx/
├── agents/          # AI agents organized by category
│   ├── dev/         # Development agents
│   ├── discovery/   # Research agents
│   ├── meta/        # Framework meta-agents
│   ├── plan/        # Planning agents
│   └── review/      # Review agents
├── prompts/         # Quick-action commands
├── templates/       # Document templates
├── instructions/    # Convention documents
├── workflows/       # Multi-agent orchestrations
├── blocks/          # Reusable content blocks
├── context/         # Project-specific information
├── scripts/         # Sync and utility scripts
│   └── claude-code/ # Claude Code sync scripts
├── lib/             # Core JavaScript modules
└── bin/             # CLI executable
```

### Agent Naming Convention
Agent filenames are parsed to extract personas:
- Pattern: `{feature}-{role}.md` or `{feature}-{compound}-{role}.md`
- Examples: `flutter-developer.md`, `unit-test-engineer.md`
- Role extraction for command generation

## Development Guidelines

### Adding New Components
1. Create file in appropriate directory (`agents/`, `prompts/`, etc.)
2. Include proper header for Claude Code behavior
3. Use WikiLinks for cross-references
4. Run `plx sync claude` to make available

### Modifying Sync Behaviour
- Sync scripts are in `scripts/claude-code/`
- Each component type has its own sync script
- WikiLink resolution happens after initial sync

### Testing Changes
1. Make changes to components
2. Run `plx sync claude clean` for fresh sync
3. Test commands in Claude Code
4. Use `plx watch claude` for continuous development

## Important Notes

- Framework uses GNU Make for command orchestration
- All paths must be absolute in final output
- Temporary sync directory ensures atomic operations
- Clean flag removes existing `.claude/` directories before sync
- Watch mode monitors `agents/` and `prompts/` directories only
