# Issue Checklist

## Orchestration
- [ ] Act as orchestrator of multiple parallel agents to execute tasks

## Planning Phase
- [ ] Issue Creation/Location
  - [ ] Create/find issue using appropriate template from `.github/ISSUE_TEMPLATES`
  - [ ] Place in correct `issues/{active,next,backlog,done}` folder

- [ ] Requirements Analysis 
  - [ ] Research project context via parallel agents
  - [ ] Achieve 100% clarity on implementation approach
  - [ ] Use advanced agent tools if needed for deeper understanding
  - [ ] Ask questions rather than making assumptions
  - [ ] Update issue based on clarifications

- [ ] Progress Tracking
  - [ ] Create progress file in `progress/*.md`
  - [ ] Keep progress file updated frequently
  - [ ] Include detailed instructions for context preservation

## Implementation Phase
- [ ] Development
  - [ ] Build solution following:
    - Issue acceptance criteria
    - System instructions
    - Project rules
    - Best practices
    - Known preferences

- [ ] Quality Checks
  - [ ] Run project linting
  - [ ] Run analyzers
  - [ ] Verify build succeeds

## Quality Assurance Phase
- [ ] Validation
  - [ ] Verify all acceptance criteria met
  - [ ] Ensure alignment with issue requirements
  - [ ] Gather user feedback
  - [ ] Iterate until user fully satisfied

## Release Phase
- [ ] Release Preparation
  - [ ] Confirm release version and date
  - [ ] Move issue to `issues/done/v{version}/`
  - [ ] Update changelog
  - [ ] Update release notes
  - [ ] Review/update documentation:
    - README
    - Instructions
    - Rules
    - Related docs
  - [ ] Create commit
  - [ ] Push changes
  - [ ] Create PR/release