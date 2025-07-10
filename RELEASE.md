# Release v0.1: The Team-Based Workflow & Freelancer Hub

This is the first major release of the **Ultra Turbo Claude Code Context Teams** framework, version 0.1. This version marks a complete reorganization of the repository, moving from a simple agent structure to a comprehensive, team-based workflow designed for end-to-end software development with AI.

## ✨ What's New?

*   **Complete Repo Reorganization:** The framework is now structured around seven distinct teams (`01-research-team` to `07-review-team`), each responsible for a specific phase of the software development lifecycle. This provides a clear, step-by-step process for taking a project from idea to completion.

*   **Introduction of the "Freelancer" Hub:** All individual specialist agents (Architect, Developer, Tester, etc.) have been moved into the `00-freelancers` directory. They can be called upon for ad-hoc tasks that fall outside the standard team workflow.

*   **Powerful Orchestration Model:** The framework now includes a top-level `you-are-team-orchestrator-agent.md` that can guide users through the entire lifecycle by delegating tasks to the appropriate team orchestrator. This creates a clear and powerful hierarchy for managing AI collaboration.

*   **Standalone Team Agents for Custom GPTs:** The new `100-all-teams` directory provides single-file versions of each team's complete prompt set. This allows you to easily create powerful, specialized agents on platforms like ChatGPT (as custom GPTs) or Gemini by using these files as system prompts.

*   **Enhanced Claude Integration with `@` Linking:** The entire framework is now heavily optimized for Claude's powerful `@` file-linking feature. This allows for superior context management by automatically loading relevant project files into the conversation, significantly reducing context loss.

## 🚀 Getting Started

1.  **Clone the Project:**
    ```bash
    git clone https://github.com/your-repo/ultra-turbo-claude-code-context-teams.git
    ```
2.  **Copy Teams to Claude:**
    Copy the team folders (`00-freelancers`, `01-research-team`, etc.) and the root `you-are-team-orchestrator-agent.md` file into your `.claude/commands/` directory.

3.  **Update Context Files:**
    This is the most important step. Go into each team's context file (e.g., `01-research-team/context/research-team-context.md`) and update the `@path/to/file.md` links to point to the relevant files in your own project.

4.  **Start a Conversation:**
    Begin a chat with `@you-are-team-orchestrator-agent` in your IDE and describe your project goal. It will guide you to the correct team to start the process.

## 🙏 Acknowledgements

A special thank you to the creators of the **[BMAD-METHOD](https://github.com/bmadcode/BMAD-METHOD)** for providing the inspiration for many of the agentic planning and context-engineering concepts used in this framework. Their work on eliminating context loss between planning and development phases has been a guiding principle for this restructure.
