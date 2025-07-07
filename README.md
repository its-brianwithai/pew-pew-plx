# ⚡ Ultra Wide Turbo Workspace v0.0.20

[![Brought to you by brianwithai.com](https://img.shields.io/badge/Brought%20to%20you%20by-brianwithai.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://brianwithai.com)
[![Mede mogelijk gemaakt door brianmetai.nl](https://img.shields.io/badge/Mede%20mogelijk%20gemaakt%20door-brianmetai.nl-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://brianmetai.nl)

🎩 A virtual organization where you are the CEO. This workspace includes an AI-driven software development lifecycle framework plus specialized departments and roles.

---

## 🎯 Idea-Context-Refine-Plan-Act-Review Framework

An AI-driven software development lifecycle framework that takes projects from initial idea to completion through a structured sequence of phases.

### 📋 Framework Overview

**Location:** `idea-context-refine-plan-act-review/`

Each phase is managed by dedicated teams of AI agents for systematic project development.

### 🚀 Project Lifecycle

The framework follows a sequence of phases, each managed by a dedicated team:

| Phase | Team | Purpose | Key Output |
|-------|------|---------|------------|
| **🌀 Idea** | **01-Research** | Clarifies initial idea, brainstorms solutions, conducts research | Clear, actionable concept |
| **📚 Context** | **02-Context** | Gathers best practices, examples, preferences, ways of working | Comprehensive contextual foundation |
| **💎 Refine** | **03-Requirements & 04-Refinement** | Creates detailed requirements and formal documents (PRDs, Architecture) | Complete specifications |
| **🗺️ Plan** | **05-Plan** | Creates actionable plans (roadmaps, epics, stories, tasks) | Implementation roadmap |
| **🚀 Act** | **06-Act** | Executes the plan, simulates work, produces detailed reports | Working implementation with tests |
| **🔍 Review** | **07-Review** | Reviews work against criteria, provides feedback until perfect | Quality-assured deliverable |

### 🤖 Orchestration System

The entire process is coordinated by multiple layers of orchestration:

- **Master Orchestrator**: `you-are-team-orchestrator-agent.md` delegates tasks to appropriate teams
- **Team Orchestrators**: Each team has its own orchestrator managing internal workflow
- **Specialist Agents**: Focused experts within each team handling specific tasks
- **All-Teams Resources**: `00-all-teams/` provides complete visibility across all teams

### 📂 Framework Directory Structure

- **`/00-all-teams`**: Combined prompts and overviews for all teams
- **`/01-research-team`**: Idea clarification, brainstorming, and research
- **`/02-context-team`**: Project context, best practices, and preferences  
- **`/03-requirements-team`**: Granular, testable requirements definition
- **`/04-refinement-team`**: Formal PRDs and Architecture documents
- **`/05-plan-team`**: Actionable plans breakdown
- **`/06-act-team`**: Plan execution and comprehensive reporting
- **`/07-review-team`**: Quality standards definition and enforcement

Each team includes orchestrators, agents, and templates for their specific phase.

---

## 🏢 Department-Based Organization

In addition to the framework above, this workspace provides 7 departments with 14 roles containing resources for specific domains and expertise areas.

### 📊 Department Overview

Total of over 300 resources across departments and framework:

| Department            | Files | Purpose                                             | Roles                                      |
|-----------------------|-------|-----------------------------------------------------|--------------------------------------------|
| 🎯 **Project Framework** | 78    | End-to-end project management from idea to delivery | 7 specialized teams with orchestrators    |
| 💻 **Tech**           | 89    | Technical implementation, architecture, and quality | Architect, Developer, Tester, UIUX Expert  |
| 🤖 **AI**             | 34    | Artificial intelligence and automation              | Department Resources, Prompt Engineer      |
| 📋 **Management**     | 30    | Project planning and coordination                   | Project Manager                            |
| 📣 **Marketing**      | 21    | Content creation and market presence                | ASO Expert, Content Creator                |
| 💡 **Innovation**     | 18    | Research and creative problem-solving               | Brainstormer, Business Analyst, Researcher |
| 💼 **Sales**          | 7     | Business development and proposals                  | Proposal Manager                           |
| 📢 **Communications** | 1     | Internal/external communications                    | Department Resources                       |

---

## 💻 Tech Department
> *Technical implementation, architecture, and quality assurance*

### 🏛️ Architect
**Location:** `tech/architect/`  
**Responsibility:** Technical blueprints, technology selection, and high-level design

<details>
<summary>View Structure (10 files)</summary>

```
tech/architect/
├── agents/ (3)
│   ├── you-are-codebase-expert.md
│   ├── you-are-system-workflow-expert.md
│   └── you-are-wow-expert.md
├── prompts/ (5)
│   ├── plx-analyze-codebase.md
│   ├── plx-create-system-workflow.md
│   ├── plx-create-system.md
│   ├── plx-research-before-you-continue.md
│   └── plx-research-solution.md
└── templates/ (2)
    ├── architecture-template.md
    └── system-template.md
```
</details>

### 💻 Developer
**Location:** `tech/developer/`  
**Responsibility:** Feature implementation, coding standards, and best practices

<details>
<summary>View Structure (61 files)</summary>

```
tech/developer/
├── agents/ (17)
├── prompts/ (29)
├── best-practices/ (35)
│   ├── astro/ (1)
│   ├── cli-tools/ (2)
│   ├── flutter/ (2)
│   ├── markdown/ (1)
│   ├── mcp-servers/ (2)
│   ├── next-js/ (1)
│   ├── open-source/ (1)
│   └── supabase/ (25)
├── templates/ (6)
├── systems/ (1)
├── workflows/ (1)
├── rubrics/ (1)
├── scripts/ (2)
└── checklists/ (1)
```
</details>

### ✅ Tester
**Location:** `tech/tester/`  
**Responsibility:** Quality assurance, testing, and validation

<details>
<summary>View Structure (14 files)</summary>

```
tech/tester/
├── agents/ (2)
│   ├── you-are-acceptance-test-expert.md
│   └── you-are-qa-specialist.md
├── prompts/ (11)
│   ├── plx-create-core-tests.md
│   ├── plx-create-flutter-unit-tests.md
│   ├── plx-create-qa-report.md
│   └── ... (8 more)
└── templates/ (1)
    └── test-results-template.md
```
</details>

### 🎨 UIUX Expert
**Location:** `tech/uiux-expert/`  
**Responsibility:** User interface and experience design

<details>
<summary>View Structure (2 files)</summary>

```
tech/uiux-expert/
├── prompts/ (1)
│   └── plx-suggest-ui-ux-improvements.md
└── rubrics/ (1)
    └── ui-components-rubric.md
```
</details>

---

## 🤖 AI Department
> *Focused on artificial intelligence, automation, and intelligent system design*

### 📚 Department Resources
**Location:** `ai/department/`  
**Responsibility:** Shared AI resources and documentation tools

<details>
<summary>View Structure (5 files)</summary>

```
ai/department/
├── agents/ (1)
│   └── you-are-doc-transformer.md
└── prompts/ (4)
    ├── plx-create-anything.md
    ├── plx-create-doc.md
    ├── plx-review-doc.md
    └── plx-update-doc.md
```
</details>

### 🤖 Prompt Engineer
**Location:** `ai/prompt-engineer/`  
**Responsibility:** Prompt design and optimization for AI interactions

<details>
<summary>View Structure (29 files)</summary>

```
ai/prompt-engineer/
├── agents/ (7)
├── prompts/ (17)
├── wows/ (5)
│   ├── wow-chat-gpt-prompt-engineering.md
│   ├── wow-creating-cursor-rules.md
│   ├── wow-prompt-engineering-by-lee-boonstra.md
│   ├── wow-prompting-with-gpt-4-1.md
│   └── wow-windsurf-workflow-best-practices.md
└── snippets/ (1)
    └── ;dvars.md
```
</details>

---

## 📋 Management Department
> *Project planning, coordination, and delivery management*

### 📋 Project Manager
**Location:** `management/project-manager/`  
**Responsibility:** Requirements, Agile workflow, and development priorities

<details>
<summary>View Structure (30 files)</summary>

```
management/project-manager/
├── agents/ (7)
├── prompts/ (10)
└── templates/ (13)
    ├── brief-template.md
    ├── bug-template.md
    ├── chore-template.md
    ├── crash-report-template.md
    ├── enhancement-template.md
    ├── epic-template.md
    ├── feedback-template.md
    ├── prd-template.md
    ├── project-plans-template.md
    ├── requirements-template.md
    ├── roadmap-template.md
    ├── story-template.md
    └── work-log-template.md
```
</details>

---

## 📣 Marketing Department
> *Content creation, optimization, and market presence*

### 📱 ASO Expert
**Location:** `marketing/aso-expert/`  
**Responsibility:** App Store Optimization strategies

<details>
<summary>View Structure (2 files)</summary>

```
marketing/aso-expert/
├── agents/ (1)
│   └── you-are-aso-expert.md
└── best-practices/ (1)
    └── wow-aso-best-practices.md
```
</details>

### 📝 Content Creator
**Location:** `marketing/content-creator/`  
**Responsibility:** Content development with SEO optimization

<details>
<summary>View Structure (19 files)</summary>

```
marketing/content-creator/
├── agents/ (4)
├── prompts/ (3)
├── collections/ (6)
│   ├── all-dev-carousel-channels.md
│   ├── all-dev-community-channels.md
│   ├── all-dev-long-text-channels.md
│   ├── all-dev-long-video-channels.md
│   ├── all-dev-short-text-channels.md
│   └── all-dev-short-video-channels.md
├── systems/ (3)
├── templates/ (2)
└── best-practices/ (1)
    └── wow-ai-writing-indicators.md
```
</details>

---

## 💡 Innovation Department
> *Research, analysis, and creative problem-solving*

### 💡 Brainstormer
**Location:** `innovation/brainstormer/`  
**Responsibility:** Idea generation and creative sessions

<details>
<summary>View Structure (1 file)</summary>

```
innovation/brainstormer/
└── prompts/ (1)
    └── plx-brainstorm.md
```
</details>

### 📊 Business Analyst
**Location:** `innovation/business-analyst/`  
**Responsibility:** Market research and requirements analysis

<details>
<summary>View Structure (7 files)</summary>

```
innovation/business-analyst/
├── agents/ (4)
│   ├── you-are-business-analyst.md
│   ├── you-are-market-researcher.md
│   ├── you-are-mobile-mvp-expert.md
│   └── you-are-researcher.md
├── prompts/ (2)
│   ├── plx-conduct-market-research.md
│   └── plx-research-best-practices.md
└── best-practices/ (1)
    └── wow-mvp-roadmap-best-practices.md
```
</details>

### 🔬 Researcher
**Location:** `innovation/researcher/`  
**Responsibility:** Research methodologies and data synthesis

<details>
<summary>View Structure (10 files)</summary>

```
innovation/researcher/
├── prompts/ (1)
│   └── plx-research.md
└── templates/ (9)
    ├── client-profile-questions-template.md
    ├── company-profile-questions-template.md
    ├── other-people-profile-questions-template.md
    ├── overall-goals-profile-questions-template.md
    ├── personal-profile-questions-template.md
    ├── product-profile-questions-template.md
    ├── project-profile-questions-template.md
    ├── research-template.md
    └── service-profile-questions-template.md
```
</details>

---

## 💼 Sales Department
> *Business development, proposals, and client relationships*

### 📑 Proposal Manager
**Location:** `sales/proposal-manager/`  
**Responsibility:** Creating proposals for stakeholder approval

<details>
<summary>View Structure (7 files)</summary>

```
sales/proposal-manager/
├── agents/ (2)
│   ├── you-are-a-milestone-proposal-expert.md
│   └── you-are-a-proposal-expert.md
├── prompts/ (1)
│   └── plx-create-proposal.md
├── templates/ (3)
│   ├── epic-proposal-template.md
│   ├── roadmap-proposal-template.md
│   └── story-proposal-template.md
└── best-practices/ (1)
    └── wow-business-proposal-best-practices.md
```
</details>

---

## 📢 Communications Department
> *Managing internal and external communications*

### 📢 Department Resources
**Location:** `communications/deptartment/`  
**Responsibility:** Communication templates and resources

<details>
<summary>View Structure (1 file)</summary>

```
communications/deptartment/
└── templates/ (1)
    └── meeting-template.md
```
</details>

---

## 📁 Resource Types

Both the framework and departments organize resources into standardized categories:

| Resource              | Purpose                                                      | Naming Convention           |
|-----------------------|--------------------------------------------------------------|-----------------------------|
| 🤖 **agents/**        | AI persona definitions with specific expertise and behaviors | `you-are-{persona}.md`      |
| 📝 **prompts/**       | Task-specific instructions for AI agents                     | `plx-{activity}.md`         |
| 📋 **templates/**     | Standardized document formats                                | `{type}-template.md`        |
| ✨ **best-practices/** | Guidelines and methodologies                                 | `{topic}-best-practices.md` |
| ⚙️ **systems/**       | Repeatable workflows and procedures                          | `{name}-system.md`          |
| 📚 **collections/**   | Curated resource lists                                       | `all-{category}.md`         |
| ✅ **rubrics/**        | Evaluation criteria                                          | `{subject}-rubric.md`       |
| 📜 **scripts/**       | Automation tools                                             | `{name}-script.{ext}`       |
| 🔄 **workflows/**     | Process documentation                                        | `{name}-workflow.md`        |
| ✏️ **snippets/**      | Reusable text fragments                                      | `;{abbreviation}.md`        |

---

## 🚀 Getting Started

### For Project Management Workflow:
1. **Start with Research**: Use the `idea-context-refine-plan-act-review/01-research-team/` to clarify your idea
2. **Follow the Framework**: Progress through each team sequentially (Research → Context → Requirements → Refinement → Plan → Act → Review)
3. **Use Team Orchestrators**: Each team has an orchestrator agent to coordinate the workflow

### For Department-Based Resources:
1. **Choose a Department**: Navigate to the department that aligns with your current needs
2. **Select a Role**: Pick the specialized role within that department
3. **Use Resources**: Leverage the agents, prompts, templates, and best practices
4. **Follow Conventions**: Use the naming conventions and folder structure consistently

---

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.