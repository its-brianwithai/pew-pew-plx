[![Brought to you by pewpewprompts.com](https://img.shields.io/badge/Brought%20to%20you%20by-pewpewprompts.com-blue)](https://pewpewprompts.com)

# Pew Pew Projects

A comprehensive framework for managing software development projects using AI agents, structured documentation, and predefined conventions. This repository provides a robust set of templates and agent definitions designed to work with tools like Claude Code to streamline planning, execution, and review processes.

## ✨ Key Features

-   **AI Agent Definitions:** A suite of specialized AI sub-agents for tasks like planning, research, code review, and documentation.
-   **Structured Templates:** A rich library of markdown templates for creating consistent and comprehensive project documentation (PRDs, architecture, user stories, etc.).
-   **Convention-Driven:** Establishes clear conventions for code, architecture, and development practices.
-   **Automated Syncing:** Scripts to synchronize agent and command definitions with Claude Code's local configuration (`.claude/`).
-   **Extensible:** Easily add new agents, templates, and conventions to fit your project's needs.

## 📂 Directory Structure

This framework is organized into several key directories:

-   `agents/`: Contains definitions for specialized AI sub-agents, categorized by function (idea, plan, act, review).
-   `context/`: Provides project-specific context, including documentation on platforms, roles, and teams.
-   `conventions/`: Defines project standards, patterns, and best practices.
-   `issues/`: A place to track issues and tasks.
-   `prompts/`: Stores reusable prompts that can be used as custom Claude Code commands.
-   `scripts/`: Holds utility scripts for managing the framework, primarily for syncing configurations.
-   `templates/`: A collection of markdown templates for all types of project documentation.

## 🚀 Getting Started

To integrate this framework with your local Claude Code setup, follow these steps:

1.  **Clone the Repository:**
    ```bash
    git clone <repository-url>
    cd pew-pew-project-context
    ```

2.  **Run the Sync Script:**
    Execute the main sync script to copy all agent and prompt definitions into your local `.claude` directory, making them available to Claude Code.
    ```bash
    ./scripts/claude-code/sync-claude-code.sh
    ```
    This will create `.claude/agents/` and `.claude/commands/` directories in your project root and populate them.

3.  **Watch for Changes (Optional):**
    If you plan to develop new agents or prompts, you can run the watch script. It monitors the `agents/` and `prompts/` directories for changes and automatically re-runs the sync script.
    ```bash
    ./scripts/claude-code/watch-claude-code.sh
    ```
    *Note: `fswatch` is recommended for better performance. The script will fall back to a polling mechanism if it's not installed (`brew install fswatch` on macOS).*

## 💡 Core Concepts

-   **🤖 Agents:** Specialized AI assistants defined in the `agents/` directory. Each is tailored for a specific task (e.g., `code-review-agent`, `prd-agent`) with its own system prompt and instructions. Claude Code can delegate tasks to these agents automatically or upon request.

-   **📄 Templates:** Standardized markdown files located in `templates/` used to create consistent documentation for various project artifacts like user stories, milestones, and architectural designs.

-   **🌐 Context:** The `context/` directory stores documents that provide shared knowledge about the project's ecosystem, including platforms used (`supabase`, `codemagic`), team structures, and roles.

-   **📜 Conventions:** Located in `conventions/`, these documents establish the rules, patterns, and guidelines for the project to ensure consistency and quality in code and processes.

## 🛠️ Scripts

The `scripts/claude-code/` directory contains shell scripts to manage the integration with Claude Code:

-   `sync-claude-code.sh`: The main script that runs the agent and command sync scripts.
-   `sync-claude-code-agents.sh`: Copies agent definitions from `agents/` to `.claude/agents/`.
-   `sync-claude-code-commands.sh`: Copies prompt files from `prompts/` to `.claude/commands/`.
-   `watch-claude-code.sh`: A convenience script to monitor for file changes and trigger the sync automatically.
