# 🤖 Project Management Teams Framework

This directory contains a structured framework of AI agent teams designed to manage a project from conception to completion. It follows a logical lifecycle, ensuring that ideas are properly researched, defined, planned, executed, and reviewed.

## 🚀 Project Lifecycle

The framework is organized into distinct teams, each responsible for a specific phase of the project lifecycle:

1.  **[01-research-team](./01-research-team/README.md):** The starting point for any new idea. This team facilitates brainstorming and formal research to explore concepts and validate assumptions.
2.  **[02-context-team](./02-context-team/README.md):** Gathers and documents the essential context for a project, including good/bad examples, best practices, preferences, and collections of resources.
3.  **[03-requirements-team](./03-requirements-team/README.md):** Deconstructs a project idea into detailed, granular, and testable requirements, covering actors, activities, properties, and behaviors.
4.  **[04-refinement-team](./04-refinement-team/README.md):** Refines the high-level requirements into formal, structured documents like a Product Requirements Document (PRD) and an Architecture Document.
5.  **[05-plan-team](./05-plan-team/README.md):** Translates the refined requirements and architecture into an actionable plan, creating roadmaps, epics, user stories, and detailed development tasks.
6.  **[06-act-team](./06-act-team/README.md):** Oversees the execution of the development plan, simulates the implementation, and produces a detailed report of the work done.
7.  **[07-review-team](./07-review-team/README.md):** Defines quality gates and conducts a formal review of the completed work, comparing the result against all predefined criteria, standards, and rules.

## 🛠️ How It Works

Each team is led by an **Orchestrator Agent** that manages the workflow and communicates with the user. The orchestrator delegates tasks to specialized **Specialist Agents**, each an expert in a specific area (e.g., brainstorming, writing user stories, providing feedback). The teams use a set of standardized **Templates** to ensure consistency and completeness.

The entire process is coordinated by the main **[Team Orchestrator](./you-are-team-orchestrator-agent.md)**, which directs the user to the correct team based on their needs.