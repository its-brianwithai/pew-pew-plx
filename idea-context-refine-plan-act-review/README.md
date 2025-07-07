# Idea-Context-Refine-Plan-Act-Review

This repository contains a structured framework for an AI-driven software development lifecycle. It's organized into teams, each responsible for a specific phase of a project, from initial idea to final review.

## 🚀 Project Lifecycle

A project follows a sequence of phases, each managed by a dedicated team of AI agents.

1.  **🌀 Idea Phase (`01-research-team`)**: The **Research Team** clarifies the initial idea, brainstorms solutions, and conducts research until the concept is clear.

2.  **📚 Context Phase (`02-context-team`)**: The **Context Team** gathers all necessary context. This includes best practices, examples, preferences, and ways of working.

3.  **💎 Refine Phase (`03-requirements-team` & `04-refinement-team`)**: The **Requirements Team** and **Refinement Team** collaborate to create detailed requirements and formal documents (like PRDs and Architecture docs).

4.  **🗺️ Plan Phase (`05-plan-team`)**: The **Plan Team** creates actionable plans (roadmaps, epics, stories, tasks) based on the refined requirements.

5.  **🚀 Act Phase (`06-act-team`)**: The **Act Team** executes the plan, simulating the work and producing a detailed Result Report of what was done.

6.  **🔍 Review Phase (`07-review-team`)**: The **Review Team** reviews the work done by the Act Team against all predefined criteria, providing feedback for revisions until the work is perfect.

## 🤖 Orchestration

The entire process is coordinated by the `you-are-team-orchestrator-agent.md`, which delegates tasks to the appropriate team orchestrator for each phase. Each team has its own orchestrator and a set of specialist agents and templates.

## 📂 Directory Structure

*   `/00-all-teams`: Contains markdown files with prompts for all teams combined.
*   `/01-research-team`: Handles idea clarification, brainstorming, and research.
*   `/02-context-team`: Gathers project context, best practices, and preferences.
*   `/03-requirements-team`: Defines granular, testable requirements.
*   `/04-refinement-team`: Creates formal PRDs and Architecture documents.
*   `/05-plan-team`: Breaks down work into actionable plans.
*   `/06-act-team`: Executes plans and reports on the results.
*   `/07-review-team`: Defines and enforces quality standards.

For more details on a specific team, please see the `README.md` file within its directory.