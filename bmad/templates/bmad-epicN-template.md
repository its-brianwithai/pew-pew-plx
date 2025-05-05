# Epic {N}: {Epic Title}

**Goal:** {State the overall goal this epic aims to achieve, linking back to the PRD goals.}

**Deployability:** {Explain how this epic builds on previous epics and what makes it independently deployable. For Epic 1, describe how it establishes the foundation for future epics.}

## Epic-Specific Technical Context

{For Epic 1, include necessary setup requirements such as project scaffolding, infrastructure setup, third-party accounts, or other prerequisites. For subsequent epics, describe any new technical components being introduced and how they build upon the foundation established in earlier epics.}

## Local Testability & Command-Line Access

{If the user has indicated this is important, describe how the functionality in this epic can be tested locally and/or through command-line tools. Include:}

- **Local Development:** {How can developers run and test this functionality in their local environment?}
- **Command-Line Testing:** {What utility scripts or commands should be provided for testing the functionality?}
- **Environment Testing:** {How can the functionality be tested across different environments (local, dev, staging, production)?}
- **Testing Prerequisites:** {What needs to be set up or available to enable effective testing?}

{If this section is not applicable based on user preferences, you may remove it.}

## Story List

{List all stories within this epic. Repeat the structure below for each story.}

### Story {N}.{M}: {Story Title}

- **User Story / Goal:** {Describe the story goal, ideally in "As a [role], I want [action], so that [benefit]" format, or clearly state the technical goal.}
- **Detailed Requirements:**
  - {Bulleted list explaining the specific functionalities, behaviors, or tasks required for this story.}
  - {Reference other documents for context if needed, e.g., "Handle data according to `docs/data-models.md#EntityName`".}
  - {Include any technical constraints or details identified during refinement - added by Architect/PM/Tech SM.}
- **Acceptance Criteria (ACs):**
  - AC1: {Specific, verifiable condition that must be met.}
  - AC2: {Another verifiable condition.}
  - ACN: {...}
- **Tasks (Optional Initial Breakdown):**
  - [ ] {High-level task 1}
  - [ ] {High-level task 2}
- **Dependencies:** {List any dependencies on other stories or epics. Note if this story builds on functionality from previous epics.}

---

### Story {N}.{M+1}: {Story Title}

- **User Story / Goal:** {...}
- **Detailed Requirements:**
  - {...}
- **Acceptance Criteria (ACs):**
  - AC1: {...}
  - AC2: {...}
- **Tasks (Optional Initial Breakdown):**
  - [ ] {...}
- **Dependencies:** {List dependencies, if any}

---

{... Add more stories ...}

## Change Log

| Change | Date | Version | Description | Author |
| ------ | ---- | ------- | ----------- | ------ |
