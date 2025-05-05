# {Project Name} Product Requirements Document (PRD)

## Intro

{Short 1-2 paragraph describing the what and why of the product/system being built for this version/MVP, referencing the `project-brief.md`.}

## Goals and Context

- **Project Objectives:** {Summarize the key business/user objectives this product/MVP aims to achieve. Refine goals from the Project Brief.}
- **Measurable Outcomes:** {How will success be tangibly measured? Define specific outcomes.}
- **Success Criteria:** {What conditions must be met for the MVP/release to be considered successful?}
- **Key Performance Indicators (KPIs):** {List the specific metrics that will be tracked.}

## Scope and Requirements (MVP / Current Version)

### Functional Requirements (High-Level)

{List the major capabilities the system must have. Describe _what_ the system does, not _how_. Group related requirements.}

- Capability 1: ...
- Capability 2: ...

### Non-Functional Requirements (NFRs)

{List key quality attributes and constraints.}

- **Performance:** {e.g., Response times, load capacity}
- **Scalability:** {e.g., Ability to handle growth}
- **Reliability/Availability:** {e.g., Uptime requirements, error handling expectations}
- **Security:** {e.g., Authentication, authorization, data protection, compliance}
- **Maintainability:** {e.g., Code quality standards, documentation needs}
- **Usability/Accessibility:** {High-level goals; details in UI/UX Spec if applicable}
- **Other Constraints:** {e.g., Technology constraints, budget, timeline}

### User Experience (UX) Requirements (High-Level)

{Describe the key aspects of the desired user experience. If a UI exists, link to `docs/ui-ux-spec.md` for details.}

- UX Goal 1: ...
- UX Goal 2: ...

### Integration Requirements (High-Level)

{List key external systems or services this product needs to interact with.}

- Integration Point 1: {e.g., Payment Gateway, External API X, Internal Service Y}
- Integration Point 2: ...
- _(See `docs/api-reference.md` for technical details)_

### Testing Requirements (High-Level)

{Briefly outline the overall expectation for testing - as the details will be in the testing strategy doc.}

- {e.g., "Comprehensive unit, integration, and E2E tests are required.", "Specific performance testing is needed for component X."}
- _(See `docs/testing-strategy.md` for details)_

## Epic Overview (MVP / Current Version)

{List the major epics that break down the work for the MVP. Include a brief goal for each epic. Detailed stories reside in `docs/epicN.md` files.}

- **Epic 1: {Epic Title}** - Goal: {...}
- **Epic 2: {Epic Title}** - Goal: {...}
- **Epic N: {Epic Title}** - Goal: {...}

## Key Reference Documents

{Link to other relevant documents in the `docs/` folder.}

- `docs/project-brief.md`
- `docs/architecture.md`
- `docs/epic1.md`, `docs/epic2.md`, ...
- `docs/tech-stack.md`
- `docs/api-reference.md`
- `docs/testing-strategy.md`
- `docs/ui-ux-spec.md` (if applicable)
- ... (other relevant docs)

## Post-MVP / Future Enhancements

{List ideas or planned features for future versions beyond the scope of the current PRD.}

- Idea 1: ...
- Idea 2: ...

## Change Log

| Change | Date | Version | Description | Author |
| ------ | ---- | ------- | ----------- | ------ |

## Initial Architect Prompt

{Provide a comprehensive summary of technical infrastructure decisions, constraints, and considerations for the Architect to reference when designing the system architecture. Include:}

### Technical Infrastructure

- **Starter Project/Template:** {Information about any starter projects, templates, or existing codebases that should be used}
- **Hosting/Cloud Provider:** {Specified cloud platform (AWS, Azure, GCP, etc.) or hosting requirements}
- **Frontend Platform:** {Framework/library preferences or requirements (React, Angular, Vue, etc.)}
- **Backend Platform:** {Framework/language preferences or requirements (Node.js, Python/Django, etc.)}
- **Database Requirements:** {Relational, NoSQL, specific products or services preferred}

### Technical Constraints

- {List any technical constraints that impact architecture decisions}
- {Include any mandatory technologies, services, or platforms}
- {Note any integration requirements with specific technical implications}

### Deployment Considerations

- {Deployment frequency expectations}
- {CI/CD requirements}
- {Environment requirements (dev, staging, production)}

### Local Development & Testing Requirements

{Include this section only if the user has indicated these capabilities are important. If not applicable based on user preferences, you may remove this section.}

- {Requirements for local development environment}
- {Expectations for command-line testing capabilities}
- {Needs for testing across different environments}
- {Utility scripts or tools that should be provided}
- {Any specific testability requirements for components}

### Other Technical Considerations

- {Security requirements with technical implications}
- {Scalability needs with architectural impact}
- {Any other technical context the Architect should consider}
