# Story {EpicNum}.{StoryNum}: {Short Title Copied from Epic File}

**Status:** Draft | In-Progress | Complete

## Goal & Context

**User Story:** {As a [role], I want [action], so that [benefit] - Copied or derived from Epic file}

**Context:** {Briefly explain how this story fits into the Epic's goal and the overall workflow. Mention the previous story's outcome if relevant. Example: "This story builds upon the project setup (Story 1.1) by defining the S3 resource needed for state persistence..."}

## Detailed Requirements

{Copy the specific requirements/description for this story directly from the corresponding `docs/epicN.md` file.}

## Acceptance Criteria (ACs)

{Copy the Acceptance Criteria for this story directly from the corresponding `docs/epicN.md` file.}

- AC1: ...
- AC2: ...
- ACN: ...

## Technical Implementation Context

**Guidance:** Use the following details for implementation. Developer agent is expected to follow project standards in `docs/coding-standards.md` and understand the project structure in `docs/project-structure.md`. Only story-specific details are included below.

- **Relevant Files:**

  - Files to Create: {e.g., `src/services/s3-service.ts`, `test/unit/services/s3-service.test.ts`}
  - Files to Modify: {e.g., `lib/hacker-news-briefing-stack.ts`, `src/common/types.ts`}

- **Key Technologies:**

  - {Include only technologies directly used in this specific story, not the entire tech stack}
  - {If a UI story, mention specific frontend libraries/framework features needed for this story}

- **API Interactions / SDK Usage:**

  - {Include only the specific API endpoints or services relevant to this story}
  - {e.g., "Use `@aws-sdk/client-s3`: `S3Client`, `GetObjectCommand`, `PutObjectCommand`"}

- **UI/UX Notes:** {ONLY IF THIS IS A UI Focused Epic or Story - include only relevant mockups/flows}

- **Data Structures:**

  - {Include only the specific data models/entities used in this story, not all models}
  - {e.g., "Define/Use `AppState` interface: `{ processedStoryIds: string[] }`"}

- **Environment Variables:**

  - {Include only the specific environment variables needed for this story}
  - {e.g., `S3_BUCKET_NAME` (Read via `config.ts` or passed to CDK)}

- **Coding Standards Notes:**
  - {Include only story-specific exceptions or particularly relevant patterns}
  - {Reference general coding standards with "Follow standards in `docs/coding-standards.md`"}

## Tasks / Subtasks

{Copy the initial task breakdown from the corresponding `docs/epicN.md` file and expand or clarify as needed to ensure the agent can complete all AC. The agent can check these off as it proceeds.}

- [ ] Task 1
- [ ] Task 2
  - [ ] Subtask 2.1
- [ ] Task 3

## Testing Requirements

**Guidance:** Verify implementation against the ACs using the following tests. Follow general testing approach in `docs/testing-strategy.md`.

- **Unit Tests:** {Include only specific testing requirements for this story, not the general testing strategy}
- **Integration Tests:** {Only if needed for this specific story}
- **Manual/CLI Verification:** {Only if specific verification steps are needed for this story}

## Story Wrap Up (Agent Populates After Execution)

- **Agent Model Used:** `<Agent Model Name/Version>`
- **Completion Notes:** {Any notes about implementation choices, difficulties, or follow-up needed}
- **Change Log:** {Track changes _within this specific story file_ if iterations occur}
  - Initial Draft
  - ...
