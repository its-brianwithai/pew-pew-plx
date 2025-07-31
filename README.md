[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)
# 🔫 Pew Pew 💨 Plx 🙏

![Pew Pew Plx Hero](assets/hero.png)

AI - project management - context engineering - with large collection - prompts, agents & templates - syncing with Claude Code.

## 🧠 Folders & Concepts

### 💬 Prompting

- `agents/`: AI (sub-)agents organized by workflow phase:
  - `discovery/`: Research and idea exploration agents
  - `plan/`: Planning and documentation agents
  - `act/`: Action and implementation agents
  - `review/`: Code review and work log agents
- `prompts/`: Reusable prompts for Claude Code commands.
- `templates/`: Markdown templates for documentation.

### 📂 Context Engineering

- `context/`: Project related information used to brainstorm, plan and refine.
  - Below is an example of a possible context structure, adjust accordingly to your own project needs:
    - `actors/`: Who interacts with your system.
    - `components/`: Elements and system parts.
    - `concepts/`: Wiki style concepts.
    - `features/`: Descriptions of main features.
    - `platforms/`: Where your code runs (Supabase, GitHub, App Store, etc.).
    - `roles/`: Team member responsibilities.
    - `teams/`: Responsibilities and organization.
    - `models/`: Data structures and schemas.
    - `docs/`: Project conventions and best practices.
- `logs/`: Logs and records of project activities.
- `issues/`: Issue tracking and task management.
- `scripts/`: Utility scripts for managing the framework.

## 🥜 Syncing In A Nutshell

Running `plx sync claude` copies:

- all markdown files in `agents/` to:
  - `.claude/agents/`
    - allowing Claude Code to use them as [sub-agents](https://docs.anthropic.com/en/docs/claude-code/sub-agents).
  - `.claude/commands/act/`
    - creates `/act:as-{filename}` commands, allowing you to use them as main agent through [commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands).
- `prompts/` to:
  - `.claude/commands/plx/`
    - creates easy to use (and remember) `/plx:{verb-filename}` [commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands) (activities, instructions, plx do this, plx do that)
- `templates/` to:
  - `.claude/commands/use/`
    - creates `/use:{template-filename}` [commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands), allowing you to efficiently instruct an agent to use specific templates as output or work documents.

## 📚 WikiLinks

This framework uses [[Wiki Links]] to connect context documents, making it easy to navigate and understand relationships between different parts of your project.

### Update Mechanism
```bash
# Pull from any branch of pew-pew-plx
plx pull main     # Pull main branch
plx pull beta     # Pull beta branch
plx pull develop  # Pull develop branch

# Pull from external repositories
plx pull https://github.com/user/repo.git main
plx pull git@github.com:user/repo.git develop
```
Downloads latest version from GitHub without git. Supports any branch and external repositories.

### Makefile System
`plx` is a wrapper around make:
1. `plx init` downloads the framework
2. All other commands pass through to `make`

Add custom commands to Makefile:
```makefile
deploy:
	@echo "Deploying..."
	# deployment logic
```
Then run: `plx deploy`

## 📦 Installation

### Option 1: NPM Package

```bash
npm install -g pew-pew-plx
plx init
plx sync claude
```

### Option 2: Git Clone

```bash
git clone https://github.com/its-brianwithai/pew-pew-plx.git
cd pew-pew-plx
make sync claude
```

## 🔧 Commands

```bash
plx init                      # Download framework files
plx sync claude               # Sync to Claude Code config
plx sync claude clean         # Delete agents & commands + sync again
plx pull <branch>             # Pull from any branch of pew-pew-plx
plx pull <repo-url> [branch]  # Pull from external repository
```

## 🎯 Pro Tips

### 📎 Link Files in Commands
When using writing commands, use @path/to/file.md without `backticks` to immediately trigger a read of the file(s) upon activation of the command.

## 🛠️ Scripts

The `scripts/claude-code/` directory contains shell scripts to manage the integration with Claude Code:

-   `sync-claude-code.sh`: The main script that runs the agent and command sync scripts.
-   `sync-claude-code-agents.sh`: Copies agent definitions to `.claude/agents/` and creates act-as commands in `.claude/commands/act/`.
-   `sync-claude-code-commands.sh`: Copies prompt files from `prompts/` to `.claude/commands/plx/`.
-   `watch-claude-code.sh`: A convenience script to monitor for file changes and trigger the sync automatically.
