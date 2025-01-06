# 🤖 Ultra Wide Turbo Agent Framework

A structured framework for AI agents to maintain context, track progress, and deliver high-quality implementations.

## 🎯 Core Principles

See [system-prompt.md](system-prompt.md) for the complete agent behavior specification. Key aspects:

1. **Test-Driven Development**: Write tests first, verify thoroughly
2. **Autonomous Operation**: Work independently between milestones
3. **Context Management**: Keep files focused, optimize regularly
4. **File Management**: Monitor sizes, maintain clarity

## 📋 Workspace Structure

1. **Core Files** (your-*.md)
   - `your-memory.md`: Current state and decisions
   - `your-todo-list.md`: Tasks and milestones
   - `your-requirements.md`: Project requirements

2. **Log Files** (our-*.md)
   - `our-hours.md`: Work sessions and progress

3. **Protocols** (plx-*.md)
   - `plx-start`: Begin new tasks
   - `plx-next`: Continue work
   - `plx-pause`: Save state
   - `plx-resume`: Restore context
   - `plx-test`: Verify work
   - `plx-sync`: Check alignment
   - `plx-optimise`: Maintain clarity
   - `plx-finish`: Complete work
   - `plx-archive`: Preserve state
   - `plx-reset`: Fresh start
   - `plx-log`: Record hours

## 🔄 Quick Start

1. Begin with `plx-start`
2. Follow test-driven development
3. Use `plx-next` to progress
4. `plx-pause` when stopping
5. `plx-resume` when continuing
6. `plx-finish` when done
7. Log hours with `plx-log`

## 📝 File Management

- Keep files under 100 lines
- Auto-optimize when needed
- Only modify your-*.md files
- Preserve core protocols
- Log all work sessions

See [CHANGELOG.md](CHANGELOG.md) for version history.
