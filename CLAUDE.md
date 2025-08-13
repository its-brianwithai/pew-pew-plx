# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Pew Pew Workspace is an AI project management framework that transforms requirements into production-ready artifacts through intelligent decomposition and component reuse. The project uses a sophisticated WikiLink-based architecture and Claude Code slash commands for AI-assisted development.

## Common Development Commands

### Sync and Build Commands
```bash
# Main sync command - transforms WikiLinks and syncs to .claude/
make -f .pew/Makefile sync claude

# Sync with clean (removes .claude/ first)
make -f .pew/Makefile sync claude clean

# Watch for changes and auto-sync
make -f .pew/Makefile watch claude

# Test sync in isolated environment (direct script call)
./.pew/scripts/claude-code/test-sync.sh

# Pull latest updates from repository
make -f .pew/Makefile pull main                        # Pull main branch
make -f .pew/Makefile pull beta                        # Pull beta branch
make -f .pew/Makefile pull https://github.com/user/repo.git main  # Pull from any repository

# Alternative: Direct script execution (if needed)
./.pew/scripts/claude-code/sync-claude-code.sh
./.pew/scripts/claude-code/sync-claude-code.sh --clean
./.pew/scripts/claude-code/watch-claude-code.sh
```

### Quick Setup for New Projects
```bash
# Add Pew Pew framework to any existing project
rm -rf /tmp/pew-pew && git clone --depth 1 https://github.com/its-brianwithai/pew-pew-workspace.git /tmp/pew-pew && cd "$(pwd)" && mkdir -p .pew && for dir in agents prompts templates workflows instructions modes blocks output-formats personas scripts Makefile install.sh; do if [ -f "/tmp/pew-pew/.pew/$dir" ]; then cp "/tmp/pew-pew/.pew/$dir" ".pew/$dir"; elif [ -d "/tmp/pew-pew/.pew/$dir" ]; then mkdir -p ".pew/$dir" && cp -r "/tmp/pew-pew/.pew/$dir"/* ".pew/$dir"/ 2>/dev/null || true; fi; done && cp /tmp/pew-pew/.pew/plx.yaml .pew/plx.yaml && ./.pew/scripts/claude-code/sync-claude-code.sh && rm -rf /tmp/pew-pew
```

## High-Level Architecture

### Core Architecture: WikiLink System
The project uses a WikiLink architecture where components reference each other using `[[component-name]]` syntax. During sync:
- `[[wikilinks]]` → transformed to `@path/to/file.md` for dynamic loading
- `![[embedded-wikilinks]]` → replaced with actual file content inline

### Directory Structure
```
pew-pew-workspace/
├── .pew/                    # ALL framework files and configuration
│   ├── plx.yaml            # Sync configuration (committed)
│   ├── plx.local.yaml      # Local override config (gitignored)
│   ├── Makefile            # Make commands for sync operations
│   ├── install.sh          # Installation script
│   ├── scripts/            # Sync and utility scripts
│   │   └── claude-code/    # All sync-related scripts
│   ├── agents/             # AI agent definitions (personas + workflows + instructions)
│   ├── prompts/            # Reusable prompt templates (/plx: commands)
│   ├── templates/          # Document templates (/use: commands)
│   ├── workflows/          # Multi-phase processes (/start: commands)
│   ├── instructions/       # Rules and conventions (/apply: commands)
│   │   ├── conventions/    # *-conventions.md files
│   │   ├── best-practices/ # *-best-practices.md files
│   │   ├── rules/          # *-rules.md files (always/never)
│   │   └── [tool-specific]/ # Tool-specific instructions
│   ├── modes/              # Operational modes (/activate: commands)
│   ├── blocks/             # Reusable content blocks (/add: commands)
│   ├── output-formats/     # Output specifications (/output: commands)
│   └── personas/           # Role definitions (/act: commands)
├── agents/                 # Source agent definitions (used during development)
├── prompts/                # Source prompts (used during development)
├── templates/              # Source templates (used during development)
├── workflows/              # Source workflows (used during development)
├── instructions/           # Source instructions (used during development)
├── modes/                  # Source modes (used during development)
├── blocks/                 # Source blocks (used during development)
├── output-formats/         # Source output formats (used during development)
├── personas/               # Source personas (used during development)
└── .claude/                # AUTO-GENERATED - Synced Claude Code artifacts
    ├── agents/             # Processed agent files
    └── commands/           # Slash command directories
        ├── act/            # /act: agent & persona commands
        ├── plx/            # /plx: prompt commands
        ├── use/            # /use: template commands
        ├── add/            # /add: block commands
        ├── output/         # /output: format commands
        ├── apply/          # /apply: instruction commands
        ├── start/          # /start: workflow commands
        └── activate/       # /activate: mode commands
```

### Sync Process Architecture
1. **Configuration**: `.pew/plx.yaml` defines source and target directories
2. **WikiLink Processing**: Transforms `[[refs]]` to `@path/file.md`
3. **Embedding**: Replaces `![[embeds]]` with actual content
4. **Command Generation**: Creates slash commands in `.claude/commands/`
5. **Cleanup**: Manages temporary directories and old artifacts

### Component Types
- **Agents**: Composed personas with workflows and instructions
- **Prompts**: Verb-first activity specifications (`/plx:` commands)
- **Templates**: Structured document formats
- **Workflows**: Multi-phase orchestrated processes
- **Instructions**: Event-driven guidance (conventions, best practices, rules)
- **Blocks**: Reusable content sections for documentation
- **Modes**: Operational contexts and behaviors
- **Output Formats**: Deliverable structure specifications

## Key Development Patterns

### WikiLink Usage
- **Reference**: `[[component-name]]` - Creates dynamic reference
- **Embed**: `![[component-name]]` - Embeds content inline (must be on own line)
- **After sync**: References become `@path/to/file.md` for Claude to load

### Naming Conventions
- **Instructions**: 
  - Conventions: `*-conventions.md` → `instructions/conventions/`
  - Best practices: `*-best-practices.md` → `instructions/best-practices/`
  - Rules: `*-rules.md` → `instructions/rules/`
  - Tool-specific: `*-instructions.md` → `instructions/[tool]/`
- **Agents**: `[domain]-[role].md` (e.g., `flutter-developer.md`)
- **Templates**: `[type]-template.md` (e.g., `story-template.md`)
- **Workflows**: `[process]-workflow.md` (e.g., `feature-workflow.md`)

### Component Evolution Pattern
1. **Inline**: Start with everything in one file
2. **Extract**: Move reusable parts to separate files
3. **Reference**: Use `[[wikilinks]]` to reference components
4. **Compose**: Combine into agents for complex behaviors
5. **Embed**: Use `![[embeds]]` for content inclusion

### Configuration System
- **Main config**: `.pew/plx.yaml` (committed, shared)
- **Local override**: `.pew/plx.local.yaml` (gitignored, personal)
- **Config controls**: Source dirs, target dirs, cleanup behavior

## Workflow Development Process

### Creating New Components
1. Choose component type (agent, prompt, template, workflow, etc.)
2. Follow naming convention for the type
3. Place in correct directory
4. Use WikiLinks for referencing other components
5. Run sync to generate Claude commands

### Testing Changes
```bash
# Test sync in isolated environment
./.pew/scripts/claude-code/test-sync.sh

# Check sync results
ls -la .claude/commands/

# Verify WikiLink transformations
grep -r "@" .claude/commands/ | head -5
```

### Debugging Sync Issues
1. Check `.pew/plx.yaml` configuration
2. Verify WikiLink syntax (must match exact filenames)
3. Ensure embedded WikiLinks are on their own lines
4. Check for sync script errors in output
5. Review temporary directory cleanup

## Important Notes

- **DO NOT** manually edit files in `.claude/` - they are auto-generated
- **DO NOT** commit `.pew/plx.local.yaml` - it's for personal overrides
- **ALWAYS** run sync after modifying components to update Claude commands
- **WikiLinks** must match exact filenames (without .md extension)
- **Embedded WikiLinks** (`![[name]]`) must be on their own line
- The `.pew/` directory structure is for projects using Pew Pew as a dependency
- Legacy team directories (`00-freelancers/` through `07-review-team/`) contain older 7-phase model components being extracted into the modular framework