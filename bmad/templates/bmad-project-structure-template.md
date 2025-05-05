# {Project Name} Project Structure

{Provide an ASCII or Mermaid diagram representing the project's folder structure such as the following example.}

```plaintext
{project-root}/
├── .github/                    # CI/CD workflows (e.g., GitHub Actions)
│   └── workflows/
│       └── main.yml
├── .vscode/                    # VSCode settings (optional)
│   └── settings.json
├── build/                      # Compiled output (if applicable, often git-ignored)
├── config/                     # Static configuration files (if any)
├── docs/                       # Project documentation (PRD, Arch, etc.)
│   ├── index.md
│   └── ... (other .md files)
├── infra/                      # Infrastructure as Code (e.g., CDK, Terraform)
│   └── lib/
│   └── bin/
├── node_modules/               # Project dependencies (git-ignored)
├── scripts/                    # Utility scripts (build, deploy helpers, etc.)
├── src/                        # Application source code
│   ├── common/                 # Shared utilities, types, constants
│   ├── components/             # Reusable UI components (if UI exists)
│   ├── features/               # Feature-specific modules (alternative structure)
│   │   └── feature-a/
│   ├── core/                   # Core business logic
│   ├── clients/                # External API/Service clients
│   ├── services/               # Internal services / Cloud SDK wrappers
│   ├── pages/ / routes/        # UI pages or API route definitions
│   └── main.ts / index.ts / app.ts # Application entry point
├── stories/                    # Generated story files for development (optional)
│   └── epic1/
├── test/                       # Automated tests
│   ├── unit/                   # Unit tests (mirroring src structure)
│   ├── integration/            # Integration tests
│   └── e2e/                    # End-to-end tests
├── .env.example                # Example environment variables
├── .gitignore                  # Git ignore rules
├── package.json                # Project manifest and dependencies
├── tsconfig.json               # TypeScript configuration (if applicable)
├── Dockerfile                  # Docker build instructions (if applicable)
└── README.md                   # Project overview and setup instructions
```

(Adjust the example tree based on the actual project type - e.g., Python would have requirements.txt, etc.)

## Key Directory Descriptions

docs/: Contains all project planning and reference documentation.
infra/: Holds the Infrastructure as Code definitions (e.g., AWS CDK, Terraform).
src/: Contains the main application source code.
common/: Code shared across multiple modules (utilities, types, constants). Avoid business logic here.
core/ / domain/: Core business logic, entities, use cases, independent of frameworks/external services.
clients/: Modules responsible for communicating with external APIs or services.
services/ / adapters/ / infrastructure/: Implementation details, interactions with databases, cloud SDKs, frameworks.
routes/ / controllers/ / pages/: Entry points for API requests or UI views.
test/: Contains all automated tests, mirroring the src/ structure where applicable.
scripts/: Helper scripts for build, deployment, database migrations, etc.

## Notes

{Mention any specific build output paths, compiler configuration pointers, or other relevant structural notes.}

## Change Log

| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
