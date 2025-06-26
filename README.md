# ⚡ Ultra Wide Turbo Workspace v0.0.17

[![Brought to you by brianwithai.com](https://img.shields.io/badge/Brought%20to%20you%20by-brianwithai.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://brianwithai.com)
[![Mede mogelijk gemaakt door brianmetai.nl](https://img.shields.io/badge/Mede%20mogelijk%20gemaakt%20door-brianmetai.nl-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://brianmetai.nl)

🎩 A virtual organization where you are the CEO. This workspace is structured around **Departments**, each containing specialized **Roles** with their own dedicated workspace folders.

---

## 📁 Role Folder Structure

Each role's top-level folder serves as their office. Inside, you can optionally organize resources into standardized subfolders to maintain consistency:

| Folder                 | Purpose                                                                                                                                                                                                                                                                                                                                                                                                        | Examples                                                                                                       |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 💬 prompts/agents/     | An Agent Prompt is a structured instruction file (typically named you-are-{persona}.md) stored in a role's prompts/agents/ directory that defines an AI persona with specific expertise, responsibilities, and behaviors to guide AI interactions when assuming that role, providing the character traits, knowledge base, and workflow patterns needed to fulfill specialized functions within the workspace. | Files defining agent roles (e.g., `you-are-{persona}.md`)                                                      |
| 💬 prompts/activities/ | An Activity Prompt is a structured instruction file (typically named plx-*.md) that guides AI agents to perform specific, well-defined tasks within a role's domain, providing standardized formats and steps for completing discrete activities.                                                                                                                                                              | Files defining specific tasks (e.g., `plx-{activity}.md`)                                                      |
| ✨ snippets/            | Reusable text fragments or code blocks designed for quick insertion into prompts or documents, often triggered by abbreviations, to ensure consistency and speed up repetitive writing tasks.                                                                                                                                                                                                                  | Short text files, often with `.md` or `.txt` extensions (e.g., `;given.md`, `;ai.md`)                          |
| 📋 templates/          | Standardized formats                                                                                                                                                                                                                                                                                                                                                                                           | Document templates, starter files (`*-template.md`)                                                            |
| ✨ wows/                | Way of Workings (Best Practices/Guides)                                                                                                                                                                                                                                                                                                                                                                        | How-to guides, tutorials, best practice docs (`wow-*.md`)                                                      |
| ✅ rubrics/             | Evaluation criteria                                                                                                                                                                                                                                                                                                                                                                                            | Quality standards, assessment frameworks (`*-rubric.md`)                                                       |
| 📜 scripts/            | Automated procedures                                                                                                                                                                                                                                                                                                                                                                                           | Shell scripts, Python scripts (`*-script.*`)                                                                   |
| ⚙️ systems/            | Repeatable workflows & standard procedures                                                                                                                                                                                                                                                                                                                                                                     | Process templates, defined workflows (`*-system.md`)                                                           |
| 📦 resources/          | Reusable assets & reference materials                                                                                                                                                                                                                                                                                                                                                                          | Collections of some kind, locations of specific tools, any other misc reusable inputs (`the-*.md`, `all-*.md`) |

---

## 🏢 Organizational Structure

Your virtual organization is structured into **7 departments**, each containing specialized roles. Each role represents a team member with specific expertise and a dedicated workspace.

### 📊 Department Overview

| Department | Purpose | Roles |
|------------|---------|--------|
| 🤖 **AI** | Artificial intelligence, automation, and intelligent system design | Doc Expert, Prompt Engineer |
| 📢 **Communications** | Internal/external communications and team coordination | Communications Officer |
| 💡 **Innovation** | Research, analysis, and creative problem-solving | Brainstormer, Business Analyst, Researcher |
| 📋 **Management** | Project planning, coordination, and delivery | Project Manager |
| 📣 **Marketing** | Content creation, optimization, and market presence | ASO Expert, Content Creator |
| 💼 **Sales** | Business development, proposals, and client relationships | Proposal Manager |
| 💻 **Tech** | Technical implementation, architecture, and quality assurance | Architect, Developer, Tester, UIUX Expert |

---

## 🤖 AI Department
> *Focused on artificial intelligence, automation, and intelligent system design*

### 📖 Doc Expert
**Location:** `ai/doc-expert/`  
**Responsibility:** Creating, reviewing, and transforming documentation with AI-powered systems

<details>
<summary>View Structure</summary>

```
ai/doc-expert/
└── prompts/ (5)
    ├── activities/ (3)
    └── agents/ (2)
```
</details>

### 🤖 Prompt Engineer
**Location:** `ai/prompt-engineer/`  
**Responsibility:** Designing and optimizing prompts for consistent AI interactions

<details>
<summary>View Structure</summary>

```
ai/prompt-engineer/
├── prompts/ (23)
│   ├── activities/ (16)
│   └── agents/ (7)
├── snippets/ (1)
└── wows/ (5)
```
</details>

---

## 📢 Communications Department
> *Managing internal and external communications, documentation, and team coordination*

### 📢 Communications Officer
**Location:** `communications/core/`  
**Responsibility:** Managing communication artifacts, meeting agendas, and summaries

<details>
<summary>View Structure</summary>

```
communications/core/
└── templates/ (1)
```
</details>

---

## 💡 Innovation Department
> *Research, analysis, and creative problem-solving for business growth*

### 💡 Brainstormer
**Location:** `innovation/brainstormer/`  
**Responsibility:** Facilitating idea generation and creative problem-solving sessions

<details>
<summary>View Structure</summary>

```
innovation/brainstormer/
└── prompts/ (1)
    └── activities/ (1)
```
</details>

### 📊 Business Analyst
**Location:** `innovation/business-analyst/`  
**Responsibility:** Market research, competitor analysis, and project requirements

<details>
<summary>View Structure</summary>

```
innovation/business-analyst/
├── prompts/ (6)
│   ├── activities/ (2)
│   └── agents/ (4)
└── wows/ (1)
    └── best-practices/ (1)
```
</details>

### 🔬 Researcher
**Location:** `innovation/researcher/`  
**Responsibility:** Research methodologies, data analysis, and insights synthesis

<details>
<summary>View Structure</summary>

```
innovation/researcher/
├── prompts/ (1)
│   └── activities/ (1)
└── templates/ (9)
```
</details>

---

## 📋 Management Department
> *Project planning, coordination, and delivery management*

### 📋 Project Manager
**Location:** `management/project-manager/`  
**Responsibility:** Product requirements, Agile workflow, and development priorities

<details>
<summary>View Structure</summary>

```
management/project-manager/
├── prompts/ (17)
│   ├── activities/ (10)
│   └── agents/ (7)
├── templates/ (13)
└── wows/ (0)
```
</details>

---

## 📣 Marketing Department
> *Content creation, optimization, and market presence*

### 📱 ASO Expert
**Location:** `marketing/aso-expert/`  
**Responsibility:** App Store Optimization strategies and mobile app visibility

<details>
<summary>View Structure</summary>

```
marketing/aso-expert/
├── prompts/ (1)
│   └── agents/ (1)
└── wows/ (1)
    └── best-practices/ (1)
```
</details>

### 📝 Content Creator
**Location:** `marketing/content-creator/`  
**Responsibility:** Content development with SEO optimization for engagement

<details>
<summary>View Structure</summary>

```
marketing/content-creator/
├── prompts/ (7)
│   ├── activities/ (3)
│   └── agents/ (4)
├── resources/ (6)
│   └── dev-channels/ (6)
├── systems/ (3)
├── templates/ (2)
└── wows/ (1)
    └── best-practices/ (1)
```
</details>

---

## 💼 Sales Department
> *Business development, proposals, and client relationships*

### 📑 Proposal Manager
**Location:** `sales/proposal-manager/`  
**Responsibility:** Creating milestone and project proposals for stakeholder approval

<details>
<summary>View Structure</summary>

```
sales/proposal-manager/
├── prompts/ (3)
│   ├── activities/ (1)
│   └── agents/ (2)
├── templates/ (3)
└── wows/ (1)
```
</details>

---

## 💻 Tech Department
> *Technical implementation, architecture, and quality assurance*

### 🏛️ Architect
**Location:** `tech/architect/`  
**Responsibility:** Technical blueprints, technology selection, and high-level design

<details>
<summary>View Structure</summary>

```
tech/architect/
├── prompts/ (8)
│   ├── activities/ (5)
│   └── agents/ (3)
└── templates/ (2)
```
</details>

### 💻 Developer
**Location:** `tech/developer/`  
**Responsibility:** Feature implementation following coding standards and best practices

<details>
<summary>View Structure</summary>

```
tech/developer/
├── artifacts/ (0)
├── checklists/ (1)
├── develop-features/ (0)
│   └── wows/ (0)
│       └── supabase/ (0)
├── issues/ (1)
│   └── stories/ (1)
├── prompts/ (47)
│   ├── activities/ (29)
│   ├── agents/ (17)
│   └── rules/ (1)
├── rubrics/ (1)
├── scripts/ (2)
├── snippets/ (42)
│   └── flutter/ (14)
├── systems/ (1)
├── templates/ (6)
├── workflows/ (1)
└── wows/ (35)
    ├── astro/ (1)
    ├── cli-tools/ (2)
    ├── flutter/ (2)
    ├── markdown/ (1)
    ├── mcp-servers/ (2)
    ├── next-js/ (1)
    ├── open-source/ (1)
    └── supabase/ (26)
        ├── database/ (6)
        └── flutter/ (20)
```
</details>

### ✅ Tester
**Location:** `tech/tester/`  
**Responsibility:** Acceptance testing, quality assurance, and requirement validation

<details>
<summary>View Structure</summary>

```
tech/tester/
├── prompts/ (11)
│   ├── activites/ (9)
│   └── agents/ (2)
├── snippets/ (2)
└── templates/ (1)
```
</details>

### 🎨 UIUX Expert
**Location:** `tech/uiux-expert/`  
**Responsibility:** UI/UX design and intuitive user experience creation

<details>
<summary>View Structure</summary>

```
tech/uiux-expert/
├── prompts/ (1)
│   └── activities/ (1)
└── rubrics/ (1)
```
</details>

---

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.
