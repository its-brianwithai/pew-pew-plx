# Claude Code Integration & Context Simplification

## 🎯 Overview

This release brings major enhancements for Claude Code integration, enabling direct agent invocation through YAML frontmatter and simplifying the context management system.

## 🤖 Agent Enhancements

**YAML Frontmatter for All Agents**
- Added YAML frontmatter to 117 agent files across the entire workspace
- Each agent now has:
  - `name`: Unique identifier for Claude Code invocation
  - `description`: Detailed description with usage examples
- Enables direct agent invocation via Claude Code's Task tool
- Covers all team agents (63 files) and freelancer agents (54 files)

## 🛠️ Context System Improvements

**Simplified Context Management**
- Replaced complex team-specific context folders with a single `context.yaml` template
- Agents now look for `context.yaml` in the current project directory
- Users can customize context per project by adding their own `context.yaml`
- Removed old context folders from all team directories
- More flexible and project-agnostic approach

## 📁 Structural Changes

- Deleted 7 team-specific context folders
- Updated all agent references from specific context files to local `context.yaml` lookup
- Created instructional `context.yaml` template with examples

## 💡 Why This Matters

- **Claude Code Integration**: Agents can now be invoked directly by name in Claude Code
- **Better Agent Selection**: Detailed descriptions help Claude Code choose the right agent
- **Simplified Setup**: One context file per project instead of managing multiple team contexts
- **Project Flexibility**: Each project can define its own relevant files
- **Cleaner Structure**: Removed redundant context folders

## 📦 What's Included

- 117 agent files updated with YAML frontmatter
- New `context.yaml` template with instructions
- Updated documentation in README.md and CHANGELOG.md
- Cleaner directory structure without context folders

## 🚀 Upgrade Instructions

1. Pull the latest changes from the repository
2. Copy `context.yaml` to your project root
3. Customize the context.yaml with your project's file paths
4. Use Claude Code to invoke agents directly by name
5. Remove any references to old context folders in your projects

## 📚 Breaking Changes

- Context folders removed from all teams
- Agents now expect `context.yaml` in the project root
- Old context file references will no longer work