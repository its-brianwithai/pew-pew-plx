# 🔍 Issue Documents Conformance Investigation Report
**Date**: 2025-08-10
**Pattern/Convention**: Issue document location and naming convention
**Investigation Scope**: All issue-related documents in the project

## 📊 Executive Summary
- Total issue documents found: 24
- Documents in correct root location (issues/): 24 (100%)
- Documents in incorrect .pew location: 0 (0%)
- Conformance violations found: 20 (83%)
- Corrections needed: 20

## 🔬 Required Naming Convention
```
issues/{department}/{team}/{subject}/{SUBJECT-CODE}-{PRIORITY-NUMBER}-{descriptive-ticket-name}/{SUBJECT-CODE}-{ticket-type}.md

Example:
issues/tech/app/essentials/ESS-001-set-up-template/ESS-001-issue.md
issues/tech/app/essentials/ESS-000-backlog/  (for unrefined drafts)
```

## 📈 Conformance Analysis

### ✅ Partially Conforming Instances
| File | Current Path | Conformance Issue |
|:-----|:-------------|:------------------|
| issues/configuration/001-PPP-config-yaml-implementation/issue.md | Missing department/team structure | Needs tech/framework prefix |
| issues/configuration/002-CFG-modes-concept/modes-concept-issue.md | Missing department/team, wrong filename | Should be CFG-002-issue.md |
| issues/workflows/000-WFL-plan-workflow/*.md | Missing department/team structure | Needs reorganization |

### ❌ Major Violations Discovered

#### 1. Missing Department/Team Structure
All current issues lack the {department}/{team} hierarchy:
- `issues/cli/*` should be `issues/tech/framework/cli/*`
- `issues/configuration/*` should be `issues/tech/framework/configuration/*`
- `issues/templates/*` should be `issues/tech/framework/templates/*`
- `issues/workflows/*` should be `issues/tech/framework/workflows/*`

#### 2. Incorrect Backlog Structure
Current: `issues/backlog/*.md` (flat structure)
Required: Subject-specific backlog folders like `issues/tech/framework/cli/CLI-000-backlog/`

#### 3. Non-conforming File Names
| Current File | Required Format |
|:------------|:----------------|
| issues/cli/001-create-plx-cli.md | CLI-001-issue.md |
| issues/cli/002-sync-repo-command.md | CLI-002-issue.md |
| issues/cli/003-sync-refactor.md | CLI-003-issue.md |
| issues/configuration/002-CFG-modes-concept/modes-concept-issue.md | CFG-002-issue.md |
| issues/workflows/000-WFL-plan-workflow/000-WFL-feature-workflow-initial-draft.md | WFL-000-issue.md |
| issues/workflows/000-WFL-plan-workflow/000-WFL-plan-workflow-pull-request.md | WFL-000-pull-request.md |

#### 4. Todo Subfolder Issues
`issues/cli/todo/` contains improperly formatted issues that should be in backlog:
- Should move to `issues/tech/framework/cli/CLI-000-backlog/`

## 🎯 Correction Plan

### Phase 1: Create Proper Directory Structure
```bash
issues/
├── tech/
│   └── framework/
│       ├── cli/
│       │   ├── CLI-000-backlog/
│       │   ├── CLI-001-create-plx-cli/
│       │   ├── CLI-002-sync-repo-command/
│       │   └── CLI-003-sync-refactor/
│       ├── configuration/
│       │   ├── CFG-000-backlog/
│       │   ├── CFG-001-config-yaml-implementation/
│       │   └── CFG-002-modes-concept/
│       ├── templates/
│       │   ├── TEM-000-backlog/
│       │   └── TEM-001-templates-not-syncing/
│       └── workflows/
│           ├── WFL-000-backlog/
│           └── WFL-001-plan-workflow/
```

### Phase 2: File Relocations and Renames

1. **CLI Issues**:
   - Move `issues/cli/001-create-plx-cli.md` → `issues/tech/framework/cli/CLI-001-create-plx-cli/CLI-001-issue.md`
   - Move `issues/cli/002-sync-repo-command.md` → `issues/tech/framework/cli/CLI-002-sync-repo-command/CLI-002-issue.md`
   - Move `issues/cli/003-sync-refactor.md` → `issues/tech/framework/cli/CLI-003-sync-refactor/CLI-003-issue.md`
   - Move `issues/cli/003-sync-refactor-dev-plan.md` → `issues/tech/framework/cli/CLI-003-sync-refactor/CLI-003-story.md`
   - Move `issues/cli/todo/*` → `issues/tech/framework/cli/CLI-000-backlog/`

2. **Configuration Issues**:
   - Move `issues/configuration/001-PPP-config-yaml-implementation/issue.md` → `issues/tech/framework/configuration/CFG-001-config-yaml-implementation/CFG-001-issue.md`
   - Move `issues/configuration/002-CFG-modes-concept/modes-concept-issue.md` → `issues/tech/framework/configuration/CFG-002-modes-concept/CFG-002-issue.md`

3. **Template Issues**:
   - Move `issues/templates/000-TEM-templates-not-syncing-to-claude-commands.md` → `issues/tech/framework/templates/TEM-001-templates-not-syncing/TEM-001-issue.md`

4. **Workflow Issues**:
   - Move workflow files to proper structure with WFL prefix

5. **Backlog**:
   - Move general backlog items to appropriate subject-specific backlog folders

## 📊 Conformance Improvement Metrics
| Metric | Before | After (Projected) |
|:-------|:-------|:------------------|
| Conformance Rate | 17% | 100% |
| Proper Directory Structure | 0% | 100% |
| Correct File Names | 4% | 100% |
| Subject Code Usage | 25% | 100% |