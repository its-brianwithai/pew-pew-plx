# {Project Name} Coding Standards and Patterns

## Architectural / Design Patterns Adopted

{List the key high-level patterns chosen in the architecture document.}

- **Pattern 1:** {e.g., Serverless, Event-Driven, Microservices, CQRS} - _Rationale/Reference:_ {Briefly why, or link to `docs/architecture.md` section}
- **Pattern 2:** {e.g., Dependency Injection, Repository Pattern, Module Pattern} - _Rationale/Reference:_ {...}
- **Pattern N:** {...}

## Coding Standards (Consider adding these to Dev Agent Context or Rules)

- **Primary Language(s):** {e.g., TypeScript 5.x, Python 3.11, Go 1.2x}
- **Primary Runtime(s):** {e.g., Node.js 22.x, Python Runtime for Lambda}
- **Style Guide & Linter:** {e.g., ESLint with Airbnb config, Prettier; Black, Flake8; Go fmt} - _Configuration:_ {Link to config files or describe setup}
- **Naming Conventions:**
  - Variables: `{e.g., camelCase}`
  - Functions: `{e.g., camelCase}`
  - Classes/Types/Interfaces: `{e.g., PascalCase}`
  - Constants: `{e.g., UPPER_SNAKE_CASE}`
  - Files: `{e.g., kebab-case.ts, snake_case.py}`
- **File Structure:** Adhere to the layout defined in `docs/project-structure.md`.
- **Asynchronous Operations:** {e.g., Use `async`/`await` in TypeScript/Python, Goroutines/Channels in Go.}
- **Type Safety:** {e.g., Leverage TypeScript strict mode, Python type hints, Go static typing.} - _Type Definitions:_ {Location, e.g., `src/common/types.ts`}
- **Comments & Documentation:** {Expectations for code comments, docstrings, READMEs.}
- **Dependency Management:** {Tool used - e.g., npm, pip, Go modules. Policy on adding dependencies.}

## Error Handling Strategy

- **General Approach:** {e.g., Use exceptions, return error codes/tuples, specific error types.}
- **Logging:**
  - Library/Method: {e.g., `console.log/error`, Python `logging` module, dedicated logging library}
  - Format: {e.g., JSON, plain text}
  - Levels: {e.g., DEBUG, INFO, WARN, ERROR}
  - Context: {What contextual information should be included?}
- **Specific Handling Patterns:**
  - External API Calls: {e.g., Use `try/catch`, check response codes, implement retries with backoff for transient errors?}
  - Input Validation: {Where and how is input validated?}
  - Graceful Degradation vs. Critical Failure: {Define criteria for when to continue vs. halt.}

## Security Best Practices

{Outline key security considerations relevant to the codebase.}

- Input Sanitization/Validation: {...}
- Secrets Management: {How are secrets handled in code? Reference `docs/environment-vars.md` regarding storage.}
- Dependency Security: {Policy on checking for vulnerable dependencies.}
- Authentication/Authorization Checks: {Where should these be enforced?}
- {Other relevant practices...}

## Change Log

| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
