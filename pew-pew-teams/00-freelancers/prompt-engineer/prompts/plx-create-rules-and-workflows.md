Please analyze the conversation. Your goal is to identify recurring patterns, desired behaviors, or explicit requests that indicate missing automation rules or standardized workflows within the project.

Based on your analysis:

1. **Identify Missing Rules:**
    *   Highlight any existing rules that are missing or incomplete.
    *   For each missing rule, specify if it's for Windsurf or Cursor and provide a brief description of the expected content and structure.

2. **Suggest New Rules:**
    *   Propose a list of new rules that should be created.
    *   For each rule, specify if it's for Windsurf (`.windsurf/rules/*.md`) or Cursor (`.cursor/rules/**/*.mdc`).
    *   **Crucially**, ensure the *structure, content, naming, and frontmatter* of each proposed rule strictly adhere to the conventions defined in the respective expert agent prompts:
        *   Windsurf Rules Conventions: `.windsurf/rules/you-are-windsurf-rules-expert.md`
        *   Cursor Rules Conventions: `.cursor/rules/you-are-cursor-rules-expert.mdc`
    *   Detail the purpose, trigger/type (e.g., `manual`, `glob`, `always_on`, `model_decision` for Windsurf; `manual`, `auto`, `always`, `agent` for Cursor), potential `globs`, and a brief outline of the rule content.

3. **Suggest New Workflows:**
    *   Identify any processes discussed in the conversation that could be standardized or automated using a set of repeatable tasks (workflow).
    *   Suggest names and briefly describe the purpose and potential steps for these new workflows.

4. **Ask Feedback:**
    *   After providing the above suggestions, ask the user for feedback on the proposed rules and workflows.
    *   Process the feedback and optionally create the rules and workflows based on the user's input.
