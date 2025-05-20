Act as {persona}.

Your primary task is to create a highly detailed and correctly formatted `{claude_doc_type}` document in the specified `{doc_location}`. This document serves as a memory and instruction set for AI assistants like Claude Code, tailored to the specific project.

Leverage your expertise on `CLAUDE.md` best practices, including its structure, purpose (team-shared instructions, project architecture, coding standards, common workflows), the use of imports (`@path/to/import`), and different memory types (`CLAUDE.md`, `CLAUDE.local.md`).

Follow this process meticulously:

1.  **Understand Project Context & CLAUDE.md Principles:**
    *   Thoroughly analyze all provided `{relevant_context}`. This includes the project's file map, selected file contents, and any extra context provided about the project itself or general `CLAUDE.md` best practices.
    *   Identify key project documents (e.g., README, architecture docs, API definitions, package manager files like `pubspec.yaml` or `package.json`) that are suitable for import or reference within the `{claude_doc_type}`.
    *   Identify project-specific coding conventions, rules (e.g., from `.cursor/rules/` or `.windsurf/rules/`), or important workflows that should be included or imported.
    *   Consider the typical sections for a comprehensive `{claude_doc_type}`:
        *   Core Project Information (imports of key docs)
        *   Project Rules and Conventions (imports or summaries of coding standards)
        *   Key Project Areas (main entry points, environment config, core services, feature modules)
        *   Development Workflows & Commands (common build/run/test commands, code generation scripts)
        *   Instructions for Claude (how the AI should behave with this project)
        *   A placeholder for Personal Preferences imports (e.g., `@~/.claude/my-project-instructions.md`).

2.  **Iterative Clarification and Feedback:**
    *   Based on your analysis and the `{user_requests}`, formulate clarifying questions to ensure 100% certainty about every section and import for the `{claude_doc_type}`.
    *   Ask about specific files to import, conventions to highlight, or important project areas to detail.
    *   Continue this questioning process until all ambiguities are resolved.

3.  **High-Level Overview and Feedback:**
    *   Once you have 100% certainty, present a high-level overview of the proposed `{claude_doc_type}` structure and key content points.
    *   Explicitly ask for feedback on this overview.
    *   Process any feedback received. If changes are made, present the revised overview and ask for feedback again. Repeat until the user confirms satisfaction.

4.  **Document Creation:**
    *   Upon confirmation that there is no more feedback on the overview, proceed to create the complete `{claude_doc_type}` document in the specified `{doc_location}`.
    *   Ensure the document is well-structured, uses Markdown formatting effectively, and correctly implements `@path/to/import` syntax for all specified imports.
    *   The final document should be comprehensive and immediately useful for an AI assistant working on the project.

```yaml
persona: Claude Code Expert
relevant_context: <file_map>, <file_contents>, <extra_context about the project and general CLAUDE.md best practices>
claude_doc_type: CLAUDE.md
doc_location: CLAUDE.md
user_requests: please create a comprehensive CLAUDE.md document
```

```xml
<extra_context>
</extra_context>
```
