---
name: issue-creation-conventions
description: "Standard instructions for creating and organizing issues in the project. Defines folder structure, naming conventions, and document organization for all issue types."
---
# 📋 Issue Creation Instructions

> 💡 *Standard guidelines for creating and organizing issues across all workflows*

## 📁 Issue Organization

All project documents related to issues MUST follow this structure:
```
issues/{department}/{team}/{subject}/{SUBJECT-CODE}-{PRIORITY-NUMBER}-{descriptive-ticket-name}/{SUBJECT-CODE}-{document-type}.md
```

Example:
```
issues/tech/app/essentials/ESS-001-set-up-template/ESS-001-issue.md
issues/tech/app/essentials/ESS-001-set-up-template/ESS-001-story.md
issues/tech/app/essentials/ESS-001-set-up-template/ESS-001-pull-request.md
```

Backlog Example:
```
issues/tech/framework/cli/CLI-000-backlog/draft-idea.md
```

## 📝 Naming Components

### Structure Elements
- `{department}` - Top-level organizational unit
  - `tech` - Technical/development work
  - `business` - Business requirements
  - `design` - Design system work
  - `ops` - Operations and infrastructure

- `{team}` - Team within department
  - For tech: `app`, `framework`, `backend`, `frontend`, `infrastructure`
  - For business: `product`, `analytics`, `strategy`
  - For design: `ux`, `ui`, `brand`

- `{subject}` - Feature area or domain
  - Examples: `essentials`, `authentication`, `payments`, `templates`, `workflows`
  - Use lowercase, descriptive names

- `{SUBJECT-CODE}` - Three-letter uppercase code
  - Must be unique per subject
  - Examples: `ESS` (essentials), `AUTH` (authentication), `PAY` (payments)
  - `CLI` (command-line), `CFG` (configuration), `TEM` (templates), `WFL` (workflows)

- `{PRIORITY-NUMBER}` - Three-digit priority
  - `000` - Backlog items (unrefined, drafts)
  - `001-999` - Active items in priority order

- `{descriptive-ticket-name}` - Kebab-case description
  - Short, clear description of the issue
  - Example: `set-up-template`, `add-user-auth`, `fix-payment-bug`

- `{document-type}` - Type of document
  - `issue` - Main issue document
  - `story` - User story or development plan
  - `bug` - Bug report
  - `pull-request` - PR documentation
  - `epic` - Epic documentation
  - `feedback` - Feedback documents
  - `report` - Analysis or investigation reports
  - Any other relevant document type

## 📂 Special Folders

### Backlog Folders
Each subject MUST have a backlog folder for unrefined items:
```
{SUBJECT-CODE}-000-backlog/
```
- Contains drafts, ideas, and unrefined issues
- No strict naming convention for files inside
- Items graduate to numbered folders when refined

### General Backlog
For cross-cutting or unassigned items:
```
issues/tech/framework/general/GEN-000-backlog/
```

## ✅ Rules

1. **ALL** issue-related documents MUST be in the same issue folder
2. **NEVER** create issue documents in:
   - `.pew/issues/` (doesn't exist and shouldn't)
   - `issues/active/`, `issues/done/`, `issues/backlog/` (old structure)
   - Root-level directories
3. **ALWAYS** create the full path structure
4. **ALWAYS** use the subject code in both folder and filename
5. Feedback, reports, and any supporting documents for an issue go in the SAME folder as the issue

## 📊 Report Location Rules

### For Issue-Related Reports
If a report, analysis, or any output is related to a specific issue:
- **SAVE IN THE ISSUE FOLDER** with the issue
- Use naming: `{SUBJECT-CODE}-{report-type}.md`
- Examples:
  - `ESS-001-analysis-report.md`
  - `ESS-001-conformance-report.md`
  - `ESS-001-investigation-report.md`

### For General Reports
If a report is NOT related to a specific issue:
- Save in `.pew/reports/` directory
- Use descriptive naming with timestamps
- Examples:
  - `.pew/reports/conformance-investigation-2025-01-10.md`
  - `.pew/reports/project-analysis-2025-01-10.md`

### Critical Rule
**ALWAYS save reports as files** - Never just display in chat. Every analysis, investigation, or report should be persisted to disk.
