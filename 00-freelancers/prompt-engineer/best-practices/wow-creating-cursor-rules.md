# 🤖 How to Force your Cursor AI Agent to 🧑‍🎓 Always follow your Rules using 💡 Auto-Rule Generation Techniques

This tutorial guides you through creating structured Cursor rule files (`.mdc`) based on documented best practices. We will use a dedicated AI agent within Cursor, configured specifically for formatting these rules correctly. Following these steps ensures your rules are consistent and effectively guide the AI's behavior in your project.

## ✅ Prerequisites

*   Cursor AI code editor installed.
*   Basic understanding of Cursor's features (like chat and repo prompts).
*   A set of best practices you want to enforce, documented preferably in a Markdown file within your project.

## 1️⃣ Step 1: Obtain the Rule Generation Rule

![](https://www.ultrawideturbodevs.com/content/images/size/w2400/2025/04/CleanShot-2025-04-16-at-15.55.58@2x.png)

The core of this process relies on a [specific Cursor rule](https://github.com/bmadcode/cursor-custom-agents-rules-generator/blob/main/.cursor/rules/core-rules/rule-generating-agent.mdc) designed to guide the AI in creating *other* rules correctly. Think of it as a meta-rule: a rule about how to make rules.

This isn't a separate "agent" in the typical sense, but rather a standard Cursor rule file (`.mdc`) containing detailed instructions (its system prompt) on how to format and structure new rule files based on user input or best practices documents.

**Recommendation:** Adding this rule allows Cursor to efficiently create and update *other* rules for your project whenever you ask it to, ensuring consistency by always referencing these formatting guidelines. To do so follow the following steps:

![](https://www.ultrawideturbodevs.com/content/images/size/w2400/2025/04/CleanShot-2025-04-16-at-15.58.23@2x.png)

1.  Create the directory `.cursor/rules/core-rules/` if it doesn't exist.
2.  Save the content below into a file named `.cursor/rules/core-rules/rule-generating-agent.mdc`.
3. (Optional) Cursor has a built in view for showing cursor rules, unfortunately this view may cause updates, by agents, to be lost. To prevent this add the following to your cursor settings, so the files get opened like regular files:
```
"workbench.editorAssociations": {
  "*.mdc": "default"
}
```

For this tutorial we will reference the content of this rule file as instructions loaded directly into the chat.

**Credits:** The original rule definition used here comes from the [`cursor-custom-agents-rules-generator`](https://github.com/bmadcode/cursor-custom-agents-rules-generator/tree/main) project. The project gets updated frequently and the rule you see here might be outdated by the time your read this. You can find the [latest version here](https://github.com/bmadcode/cursor-custom-agents-rules-generator/blob/main/.cursor/rules/core-rules/rule-generating-agent.mdc). Many thanks to [BMad](https://github.com/bmadcode) for sharing this useful resource рџ™Џ.

**Content for `rule-generating-agent.mdc`:**

```
---
description: This rule is essential for maintaining consistency and quality in rule creation across the codebase. It must be followed whenever: (1) A user requests a new rule to be created, (2) An existing rule needs modification, (3) The user asks to remember certain behaviors or patterns, or (4) Future behavior changes are requested. This rule ensures proper organization, clear documentation, and effective rule application by defining standard formats, naming conventions, and content requirements. It's particularly crucial for maintaining the rule hierarchy, ensuring rules are discoverable by the AI, and preserving the effectiveness of the rule-based system. The rule system is fundamental to project consistency, code quality, and automated assistance effectiveness.
globs: 
alwaysApply: true
---
# Cursor Rules Format

## Template Structure for Rules Files

---
description: `Comprehensive description that provides full context and clearly indicates when this rule should be applied. Include key scenarios, impacted areas, and why following this rule is important. While being thorough, remain focused and relevant. The description should be detailed enough that the agent can confidently determine whether to apply the rule in any given situation.`
globs: .cursor/rules/**/*.mdc OR blank
alwaysApply: {true or false}
---

# Rule Title

## Critical Rules

- Concise, bulleted list of actionable rules the agent MUST follow

## Examples

&lt;example&gt;
{valid rule application}
&lt;/example;&gt;

&lt;example type="invalid";&gt;
{invalid rule application}
&lt;/example;&gt;

### Organizational Folders (Create if non existent)
All rules files will be under an organizational folder:
- .cursor/rules/core-rules - rules related to cursor agent behavior or rule generation specifically
- .cursor/rules/my-rules - gitignore in a shared repo, rules specifically for ME only
- .cursor/rules/global-rules - these will be rules that are ALWAYS applied to every chat and cmd/ctrl-k context
- .cursor/rules/testing-rules - rules about testing
- .cursor/rules/tool-rules - rules specific to different tools, such as git, linux commands, direction of usage of MCP tools
- .cursor/rules/ts-rules - typescript language specific rules
- .cursor/rules/py-rules - python specific rules
- .cursor/rules/ui-rules - rules about html, css, react
* create new folders under .cursor/rules/ as needed following similar grouping conventions,
    - for example `.cursor/rules/cs-rules` if we started using c# in a project

## Glob Pattern Examples
Common glob patterns for different rule types:
- Core standards: .cursor/rules/*.mdc
- Language rules: *.cs, *.cpp
- Testing standards: *.test.ts, *.test.js
- React components: src/components/**/*.tsx
- Documentation: docs/**/*.md, *.md
- Configuration files: *.config.js
- Build artifacts: dist/**/*
- Multiple extensions: *.js, *.ts, *.tsx
- Multiple patterns: dist/**/*.*, docs/**/*.md, *test*.*

## Critical Rules
- Rule files will be located and named ALWAYS as: `.cursor/rules/{organizational-folder}/rule-name-{auto|agent|manual|always}.mdc`
- Rules will NEVER be created anywhere other than .cursor/rules/**
- You will always check to see if there is an existing rule to update under all .cursor/rules sub-folders
- FrontMatter Rules Types:
    - The front matter section must always start the file and include all 3 fields, even if the field value will be blank - the types are:
        - Manual Rule: IF a Manual rule is requested - description and globs MUST be blank and alwaysApply: false and filename ends with -manual.mdc.
        - Auto Rule: IF a rule is requested that should apply always to certain glob patterns (example all typescript files or all markdown files) - description must be blank, and alwaysApply: false and filename ends with -auto.mdc.
        - Always Rule: Global Rule applies to every chat and cmd/ctrl-k - description and globs blank, and alwaysApply: true  and filename ends with -always.mdc.
        - Agent Select Rule: The rule does not need to be loaded into every chat thread, it serves a specific purpose. The description MUST provide comprehensive context about when to apply the rule, including scenarios like code changes, architecture decisions, bug fixes, or new file creation. Globs blank, and alwaysApply:false and filename ends with -agent.mdc
- For Rule Content - focus on actionable, clear directives without unnecessary explanation
- When a rule will only be used sometimes (alwaysApply: false) the description MUST provide enough context for the AI to confidently determine when to load and apply the rule
- Use Concise Markdown Tailored to Agent Context Window usage
- Always indent content within XML Example section with 2 spaces
- Emojis and Mermaid diagrams are allowed and encouraged if it is not redundant and better explains the rule for the AI comprehension
- While there is no strict line limit, be judicious with content length as it impacts performance. Focus on essential information that helps the agent make decisions
- Always include a valid and invalid example
- NEVER use quotes around glob patterns, NEVER group glob extensions with `{}`
- If the request for a rule or a future behavior change includes context of a mistake is made, this would be great to use in the example for the rule
- After rule is created or updated, Respond with the following:
    - AutoRuleGen Success: path/rule-name.mdc
    - Rule Type: {Rule Type}
    - Rule Description: {The exact content of the description field}
```

## 📋 Step 2: Document Your Best Practices

Before creating rules, you need the content for them. Gather the specific standards or best practices you want the AI to follow for a particular domain (like TypeScript coding standards, testing procedures, or commit message formats).

💡 **Tip: Use AI for Research and Generation**

You can leverage AI models with strong research capabilities (like [Perplexity](https://www.perplexity.ai/), [Claude 3 Opus](https://claude.ai/), [GPT-4](https://openai.com/gpt-4/), or [Grok](https://grok.x.ai/)) to help you generate this best practices document. Provide the AI with context about your project and ask it to research and compile relevant standards.

**Example Prompt for AI:**

```
Objective: Research and compile a list of best practices for {TECHNOLOGY_OR_DOMAIN} within the context of a {PROJECT_TYPE} project.

Context:
-   Our project uses: {LIST_KEY_TECHNOLOGIES_FRAMEWORKS}
-   Our team size is: {TEAM_SIZE}
-   Key priorities are: {LIST_PROJECT_PRIORITIES e.g., maintainability, performance, security}

Instructions:
1.  Research established best practices for {TECHNOLOGY_OR_DOMAIN}.
2.  Focus on practices relevant to {PROJECT_TYPE} and our priorities ({LIST_PROJECT_PRIORITIES}).
3.  Organize the findings into clear, actionable points suitable for documentation.
4.  Format the output as a Markdown document with appropriate headings.

---
Variable Definitions:
TECHNOLOGY_OR_DOMAIN = "TypeScript" // e.g., "Python", "React", "API Design", "Git Commit Messages"
PROJECT_TYPE = "web application" // e.g., "CLI tool", "mobile app", "data science project"
LIST_KEY_TECHNOLOGIES_FRAMEWORKS = "Node.js, Express, PostgreSQL" // e.g., "React, Next.js, Tailwind CSS"
TEAM_SIZE = "small (3-5 developers)" // e.g., "large (>10 developers)", "solo developer"
LIST_PROJECT_PRIORITIES = "code readability, test coverage, consistent error handling"
```

1.  **Create a Source Document:** Compile these best practices into a clear document within your project. A Markdown file is recommended. For example, create a file named `docs/typescript-best-practices.md`.
2.  **Write Down Practices:** List each best practice clearly.

    *Example content for `docs/your-best-practices.md`:*
    ```
    # Project Best Practices

    ## Use Consistent Naming Conventions
    Variables, functions, and classes should follow the project's agreed-upon naming style (e.g., camelCase for variables, PascalCase for classes).

    ## Add Documentation Comments
    Public functions and complex logic blocks should have clear documentation comments explaining their purpose, parameters, and return values.

    ## Handle Errors Gracefully
    Anticipate potential errors and implement proper error handling (e.g., try-catch blocks, checking return values) instead of letting the application crash.
    ```

## ✨ Step 3: Generate Rules Using the Agent

Now, you will instruct the Rule Formatting Agent (from Step 1) to create the `.mdc` rule files based on your best practices document (from Step 2).

![](https://www.ultrawideturbodevs.com/content/images/2025/04/CleanShot-2025-04-16-at-16.26.28@2x.png)

1.  **Open Cursor Chat/Repo Prompt:** Start a new chat and select all files.
2.  **Reference Agent and Document:** Make sure the Rule Formatting Agent is active (e.g., by mentioning `@rule-generating-agent` if you saved its prompt as a rule). Also, provide your best practices document as context (e.g., `@docs/typescript-best-practices.md`).

![](https://www.ultrawideturbodevs.com/content/images/size/w2400/2025/04/CleanShot-2025-04-16-at-16.22.02@2x.png)

3.  **Instruct the Agent:** Tell the agent exactly what to do using a detailed prompt. This prompt should reference the agent, the best practices document (using a variable), and specify the desired output (rule type, directory using a variable, naming, format adherence).

    **Example Prompt to Copy/Paste:**

*Note: Fill in the variable definitions at the end of this prompt before sending it.*

```
Objective: Generate individual Agent Select Cursor rules based on the best practices outlined in the referenced document (`@{BEST_PRACTICES_DOC_PATH}`).

Instructions:
1.  For each distinct best practice found in the document, create a separate Agent Select rule file (`.mdc`).
2.  Follow all formatting and content requirements defined in your system prompt (`@rule-generating-agent`) for creating Agent Select rules.
3.  After generation, confirm success by listing the paths of the created rule files.

---
Variable Definitions:
BEST_PRACTICES_DOC_PATH =

@rule-generating-agent
```

1. **Review Agent Output:** The agent will respond with the necessary file operations (e.g., `<file path="..." action="create">...`) to generate the `.mdc` files. Review these operations before applying them.

2. **Apply Changes:** If the output looks correct, allow Cursor to apply the changes, creating the new rule files in your specified directory.

![](https://www.ultrawideturbodevs.com/content/images/size/w2400/2025/04/image.png)

You might need to restart cursor or open the files for them to be indexed and take effect. Et voila. You have successfully generated structured Cursor rules from your documented best practices. By separating the *knowledge gathering* (Step 2) from the *rule formatting* (Step 3) and using a dedicated agent for formatting, you ensure consistency and maintainability in your AI-assisted development workflow. These rules will now automatically be referenced by Cursor's AI according to your project's standards.
