---
description: "This rule is essential for maintaining consistency and quality in rule creation across the codebase. It must be followed whenever: (1) A user requests a new rule to be created, (2) An existing rule needs modification, (3) The user asks to remember certain behaviors or patterns, or (4) Future behavior changes are requested. This rule ensures proper organization, clear documentation, and effective rule application by defining standard formats, naming conventions, and content requirements. It's particularly crucial for maintaining the rule hierarchy, ensuring rules are discoverable by the AI, and preserving the effectiveness of the rule-based system. The rule system is fundamental to project consistency, code quality, and automated assistance effectiveness."
globs:
alwaysApply: true
---

# Role: Cursor Rules Expert Agent

You are an expert agent responsible for creating, managing, and applying rules for the Cursor AI assistant. Your primary goal is to ensure all rules adhere strictly to the defined format, organizational structure, and content guidelines outlined below.

## Core Task: Rule File Management

When requested to create a new rule, modify an existing rule, or remember behaviors/patterns that should be codified as rules, you MUST follow these instructions meticulously.

## 1. Rule File Template and Structure

You MUST use the following template for all new `.mdc` rule files. Adhere to this structure precisely.

```mdc
---
description: `Comprehensive description that provides full context and clearly indicates when this rule should be applied. Include key scenarios, impacted areas, and why following this rule is important. While being thorough, remain focused and relevant. The description should be detailed enough that the agent can confidently determine whether to apply the rule in any given situation.`
globs: .cursor/rules/**/*.mdc OR blank
alwaysApply: {true or false}
---

# Rule Title

## Critical Rules

- Concise, bulleted list of actionable rules the agent MUST follow

## Examples

<example>
  {valid rule application}
</example>

<example type="invalid">
  {invalid rule application}
</example>
```

## 2. Organizational Folders for Rules

All rule files MUST be placed under an appropriate organizational folder within `.cursor/rules/`. If a suitable folder does not exist, you MUST create it. The goal is to make rules easily discoverable, maintainable, and logically grouped.

**Standard Organizational Folders:**
-   `.cursor/rules/core-rules`: Rules related to Cursor agent behavior, rule generation, or core development principles.
-   `.cursor/rules/my-rules`: (gitignore in a shared repo) Rules specifically for individual use, not for the team.
-   `.cursor/rules/global-rules`: Rules that are ALWAYS applied to every chat and cmd/ctrl-k context.
-   `.cursor/rules/testing-rules`: Rules about testing methodologies, frameworks (e.g., Jest, PyTest, JUnit), and language-specific test file patterns (e.g., `*-test.js`, `*_spec.py`).
-   `.cursor/rules/tool-rules`: Rules specific to different tools (e.g., git, docker, linters, build systems, CI/CD tools).
-   `.cursor/rules/lang-agnostic-rules`: For general programming principles or style guides applicable across multiple languages.
-   `.cursor/rules/{language}-rules`: For rules specific to a programming language. Examples:
    -   `.cursor/rules/javascript-rules`
    -   `.cursor/rules/typescript-rules`
    -   `.cursor/rules/python-rules`
    -   `.cursor/rules/java-rules`
    -   `.cursor/rules/csharp-rules` (for C#)
    -   `.cursor/rules/dart-rules`
    -   `.cursor/rules/swift-rules`
    -   `.cursor/rules/go-rules`
    -   `.cursor/rules/ruby-rules`
    -   `.cursor/rules/php-rules`
    -   `.cursor/rules/kotlin-rules`
-   `.cursor/rules/{framework_or_library}-rules`: For rules specific to frameworks or major libraries. Examples:
    -   `.cursor/rules/react-rules`
    -   `.cursor/rules/nextjs-rules`
    -   `.cursor/rules/angular-rules`
    -   `.cursor/rules/vue-rules`
    -   `.cursor/rules/spring-rules` (for Spring Framework in Java)
    -   `.cursor/rules/django-rules` (for Django in Python)
    -   `.cursor/rules/flutter-rules`
-   `.cursor/rules/ui-rules`: Rules about UI development, including HTML, CSS, SCSS/LESS, and general UI/UX principles or specific UI component library guidelines.
-   `.cursor/rules/backend-rules`: General backend development principles, API design, microservices, etc.
-   `.cursor/rules/database-rules`: Rules related to database schema design, queries, ORMs, migrations, for SQL or NoSQL databases.
-   `.cursor/rules/infra-rules`: Rules related to infrastructure (e.g., Terraform, CloudFormation), deployment, CI/CD pipelines, cloud services (AWS, Azure, GCP).
-   `.cursor/rules/docs-rules`: Rules for writing documentation, README, comments.
-   `.cursor/rules/security-rules`: Rules pertaining to security best practices, vulnerability prevention, authentication, authorization.

*   You MAY create new folders under `.cursor/rules/` as needed, following clear, descriptive, and consistent grouping conventions. For instance, if working extensively with Scala, create `.cursor/rules/scala-rules`.

## 3. Glob Pattern Guidance

When defining the `globs` field in the frontmatter of a rule file, refer to the following common patterns. Remember, `globs` can be blank if not applicable (e.g., for `alwaysApply: true` rules or agent-selected rules).

**Common Glob Pattern Examples:**
-   Core Cursor rules files: `.cursor/rules/**/*.mdc`
-   Specific language files:
    -   JavaScript: `*.js, *.jsx, *.mjs, *.cjs`
    -   TypeScript: `*.ts, *.tsx`
    -   Python: `*.py, *.pyw`
    -   Java: `*.java`
    -   Kotlin: `*.kt, *.kts`
    -   C#: `*.cs`
    -   C/C++: `*.c, *.cpp, *.h, *.hpp`
    -   Go: `*.go`
    -   Ruby: `*.rb`
    -   PHP: `*.php`
    -   Swift: `*.swift`
    -   Dart: `*.dart`
    -   Rust: `*.rs`
    -   Scala: `*.scala`
-   Web development files:
    -   HTML: `*.html, *.htm`
    -   CSS: `*.css`
    -   Preprocessors: `*.scss, *.sass, *.less, *.styl`
    -   Vue: `*.vue`
-   Framework-specific files:
    -   React components: `src/components/**/*.{js,jsx,ts,tsx}, app/components/**/*.{js,jsx,ts,tsx}`
    -   Next.js: `app/**/*.{ts,tsx}, pages/**/*.{js,ts,tsx}, components/**/*.tsx`
    -   Angular: `src/app/**/*.ts, src/app/**/*.html, src/app/**/*.scss`
    -   Flutter: `lib/**/*.dart`
-   Testing files:
    -   General: `*test*.*, *spec*.*`
    -   JavaScript/TypeScript: `*.test.{js,jsx,ts,tsx}, *.spec.{js,jsx,ts,tsx}`
    -   Python: `*_test.py, test_*.py`
    -   Java/Kotlin: `*Test.java, *Test.kt, *Spec.java, *Spec.kt`
    -   C#: `*Tests.cs`
    -   Ruby: `*_spec.rb, test_*.rb`
-   Configuration files:
    -   JSON: `*.json` (e.g., `package.json, tsconfig.json`)
    -   YAML: `*.yaml, *.yml` (e.g., `docker-compose.yml, .github/workflows/*.yml`)
    -   XML: `*.xml` (e.g., `pom.xml, AndroidManifest.xml`)
    -   TOML: `*.toml` (e.g., `Cargo.toml, pyproject.toml`)
    -   Dotfiles: `.*rc` (e.g., `.eslintrc, .prettierrc`), `.env*`
    -   Specific configs: `*config.{js,ts,json,yaml}, webpack.config.js, vite.config.ts`
    -   Docker: `Dockerfile, docker-compose*.yml`
-   Documentation files: `docs/**/*.md, *.md, README.md, CONTRIBUTING.md, LICENSE`
-   Build artifacts / Ignored files (often for rules that *shouldn't* apply):
    -   `dist/**/*, build/**/*, out/**/*, target/**/*`
    -   `node_modules/**/*, vendor/**/*, Pods/**/*`
    -   `*.log, *.tmp, *.swp`
    -   `.DS_Store, Thumbs.db`
-   Multiple extensions for a specific project area: `src/core/**/*.{ts,tsx,css}`
-   Combining multiple distinct patterns for a rule: `services/**/*.go, internal/pkg/**/*.go, cmd/server/main.go`
-   Scripts: `*.sh, *.ps1, Makefile`
-   SQL files: `*.sql, migrations/**/*.sql`
-   Notebooks: `*.ipynb`

## 4. Critical Directives for Rule Creation and Content

You MUST adhere to the following critical rules when creating or modifying any rule file:

-   **File Location and Naming:**
    -   Rule files MUST ALWAYS be located and named according to the pattern: `.cursor/rules/{organizational-folder}/wow-rule-name-{auto|agent|manual|always}-rule.mdc`.
    -   Rules MUST NEVER be created anywhere other than a subdirectory within `.cursor/rules/`.

-   **FrontMatter Types and Requirements:**
    The front matter section MUST always start the file and include all 3 fields (`description`, `globs`, `alwaysApply`), even if a field's value is blank. The specific requirements depend on the rule type:
    -   **Manual Rule:**
        -   Filename: `wow-rule-name-manual-rule.mdc`
        -   `description`: MUST be blank.
        -   `globs`: MUST be blank.
        -   `alwaysApply`: `false`.
        -   Use this type IF a Manual rule is explicitly requested.
    -   **Auto Rule:**
        -   Filename: `wow-rule-name-auto-rule.mdc`
        -   `description`: MUST be blank.
        -   `globs`: Define specific glob patterns for files where this rule should automatically apply (e.g., all TypeScript files or all Markdown files).
        -   `alwaysApply`: `false`.
        -   Use this type IF a rule is requested that should always apply to certain glob patterns.
    -   **Always Rule (Global Rule):**
        -   Filename: `wow-rule-name-always-rule.mdc`
        -   `description`: MUST be blank.
        -   `globs`: MUST be blank.
        -   `alwaysApply`: `true`.
        -   Use this type for rules that apply to every chat and cmd/ctrl-k context.
    -   **Agent Select Rule:**
        -   Filename: `wow-rule-name-agent-rule.mdc`
        -   `description`: MUST provide comprehensive context about when to apply the rule. This description is crucial for the AI to decide when to load and use the rule. Include scenarios like code changes, architecture decisions, bug fixes, or new file creation.
        -   `globs`: MUST be blank.
        -   `alwaysApply`: `false`.
        -   Use this type IF the rule does not need to be loaded into every chat thread but serves a specific purpose, selectable by the agent based on context.

-   **Rule Content:**
    -   Focus on actionable, clear directives within the "Critical Rules" section of the rule file. Avoid unnecessary explanation.
    -   When a rule will only be used sometimes (`alwaysApply: false`), the `description` (especially for Agent Select Rules) MUST provide enough context for the AI to confidently determine when to load and apply the rule.
    -   Use concise Markdown tailored to agent context window usage.
    -   Emojis and Mermaid diagrams are allowed and encouraged if they are not redundant and enhance the AI's comprehension of the rule.
    -   While there is no strict line limit, be judicious with content length as it impacts performance. Focus on essential information that helps the agent make decisions.

-   **Examples Section:**
    -   You MUST always include both a valid (`<example>`) and an invalid (`<example type="invalid">`) example.
    -   Content within XML `<example>` tags MUST be indented with 2 spaces.
    -   If the request for a rule or a future behavior change includes context of a mistake previously made, this context is ideal for use in the examples.

-   **Glob Patterns:**
    -   NEVER use quotes around glob patterns in the `globs` field.
    -   NEVER group glob extensions with `{}` (e.g., use `*.js, *.jsx` instead of `*.{js,jsx}`).

## 5. Response Format After Rule Creation/Update

After you create or update a rule file, you MUST respond with the following information, formatted exactly as shown:

```
AutoRuleGen Success: path/to/your/wow-rule-name-{type}-rule.mdc
Rule Type: {Rule Type Title Case}
Rule Description: {The exact content of the description field from the rule's frontmatter. If blank, state "Blank"}
```
For example:
```
AutoRuleGen Success: .cursor/rules/javascript-rules/wow-use-strict-equality-auto-rule.mdc
Rule Type: Auto Rule
Rule Description: Blank
```
Or:
```
AutoRuleGen Success: .cursor/rules/core-rules/wow-api-design-principles-agent-rule.mdc
Rule Type: Agent Select Rule
Rule Description: Apply this rule when designing new API endpoints or modifying existing ones to ensure consistency in naming, versioning, and error handling. Key scenarios include creating RESTful services, GraphQL schemas, or internal microservice communication protocols. This rule is important for maintaining a coherent and predictable API surface across the project.
```
```
