# Ultra Wide Turbo Workspace - Repository Structure

## Overview
This repository contains a comprehensive collection of AI prompts, agents, templates, and best practices organized by department and role. Each department contains specialized roles with their own resources.

## File Statistics
- **Total Files**: 199 markdown/code files (excluding build artifacts)
- **Departments**: 7 (AI, Communications, Innovation, Management, Marketing, Sales, Tech)
- **Roles**: 14 specialized roles across all departments

## Directory Structure

```
ultra-wide-turbo-workspace/
├── .claude/                    # Claude AI configuration
├── .github/                    # GitHub templates and workflows
├── ai/                         # AI Department (34 files)
│   ├── department/             # Department-wide resources (5 files)
│   │   ├── agents/             # 1 file
│   │   └── prompts/            # 4 files
│   └── prompt-engineer/        # Prompt Engineering Role (29 files)
│       ├── agents/             # 7 files
│       ├── prompts/            # 17 files
│       └── wows/               # 5 files
├── communications/             # Communications Department (1 file)
│   └── department/             # Department-wide resources (1 file)
│       └── templates/          # 1 file
├── innovation/                 # Innovation Department (18 files)
│   ├── brainstormer/          # Brainstorming Role (1 file)
│   │   └── prompts/           # 1 file
│   ├── business-analyst/      # Business Analysis Role (7 files)
│   │   ├── agents/            # 4 files
│   │   ├── best-practices/    # 1 file
│   │   └── prompts/           # 2 files
│   └── researcher/            # Research Role (10 files)
│       ├── prompts/           # 1 file
│       └── templates/         # 9 files
├── management/                # Management Department (30 files)
│   └── project-manager/       # Project Management Role (30 files)
│       ├── agents/            # 7 files
│       ├── prompts/           # 10 files
│       └── templates/         # 13 files
├── marketing/                 # Marketing Department (21 files)
│   ├── aso-expert/           # App Store Optimization Role (2 files)
│   │   ├── agents/           # 1 file
│   │   └── best-practices/   # 1 file
│   └── content-creator/      # Content Creation Role (19 files)
│       ├── agents/           # 4 files
│       ├── best-practices/   # 1 file
│       ├── collections/      # 6 files
│       ├── prompts/          # 3 files
│       ├── systems/          # 3 files
│       └── templates/        # 2 files
├── sales/                    # Sales Department (7 files)
│   └── proposal-manager/     # Proposal Management Role (7 files)
│       ├── agents/           # 2 files
│       ├── best-practices/   # 1 file
│       ├── prompts/          # 1 file
│       └── templates/        # 3 files
└── tech/                     # Technical Department (88 files)
    ├── architect/            # Architecture Role (11 files)
    │   ├── agents/           # 4 files
    │   ├── prompts/          # 5 files
    │   └── templates/        # 2 files
    ├── developer/            # Development Role (61 files)
    │   ├── agents/           # 18 files
    │   ├── best-practices/   # 7 files
    │   ├── checklists/       # 1 file
    │   ├── prompts/          # 27 files
    │   ├── rubrics/          # 1 file
    │   ├── systems/          # 1 file
    │   ├── templates/        # 5 files
    │   └── workflows/        # 1 file
    ├── tester/               # Testing Role (14 files)
    │   ├── agents/           # 2 files
    │   ├── prompts/          # 11 files
    │   └── templates/        # 1 file
    └── uiux-expert/          # UI/UX Role (2 files)
        ├── prompts/          # 1 file
        └── rubrics/          # 1 file
```

## Resource Types

### Agents (`agents/`)
AI persona definitions that embody specific expertise and behaviors for various tasks.

### Prompts (`prompts/`)
Reusable prompt templates prefixed with `plx-` for various AI-assisted tasks.

### Templates (`templates/`)
Structured document templates for consistent formatting across projects.

### Best Practices (`best-practices/`)
Curated wisdom and guidelines prefixed with `wow-` (Words of Wisdom).

### Systems (`systems/`)
Complete workflow systems for complex multi-step processes.

### Collections (`collections/`)
Curated lists and resource compilations for specific topics.

### Rubrics (`rubrics/`)
Evaluation criteria and standards for assessing quality.

### Workflows (`workflows/`)
Step-by-step process definitions for common tasks.

### Checklists (`checklists/`)
Action item lists for ensuring completeness.

## Department Summary

1. **AI Department** (34 files)
   - Focus: AI tooling and prompt engineering
   - Key roles: Prompt Engineer

2. **Communications Department** (1 file)
   - Focus: Team communication templates

3. **Innovation Department** (18 files)
   - Focus: Research, analysis, and ideation
   - Key roles: Business Analyst, Researcher, Brainstormer

4. **Management Department** (30 files)
   - Focus: Project planning and execution
   - Key roles: Project Manager

5. **Marketing Department** (21 files)
   - Focus: Content creation and app store optimization
   - Key roles: Content Creator, ASO Expert

6. **Sales Department** (7 files)
   - Focus: Proposal creation and management
   - Key roles: Proposal Manager

7. **Tech Department** (88 files)
   - Focus: Software development and quality assurance
   - Key roles: Developer, Architect, Tester, UI/UX Expert

## Naming Conventions

- **Agents**: `you-are-[role-name].md`
- **Prompts**: `plx-[action-description].md`
- **Templates**: `[type]-template.md`
- **Best Practices**: `wow-[topic]-best-practices.md`
- **Systems**: `[process]-system.md`

## Additional Files
- `CHANGELOG.md` - Version history and updates
- `CONTRIBUTING.md` - Contribution guidelines
- `README.md` - Main repository documentation