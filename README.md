# ⚡ Ultra Wide Turbo Workspace v0.0.17

[![Brought to you by ultrawideturbodevs.com](https://img.shields.io/badge/Brought%20to%20you%20by-ultrawideturbodevs.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://ultrawideturbodevs.com)

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

## 🏢 Departments & Roles

Your virtual organization is structured into departments, each containing specialized roles. A role represents a team member with specific expertise, responsibilities, and a dedicated workspace folder.

### 🤖 AI Department
**Focused on artificial intelligence, automation, and intelligent system design**

#### 📖 [Doc Expert](ai/doc-expert/)
Specializes in creating, reviewing, and transforming documentation, ensuring clarity, accuracy, and adherence to standards. Manages document templates and expert systems for documentation.

```
ai/doc-expert/
└── prompts/ (5)
    ├── activities/ (3)
    └── agents/ (2)
```

#### 🤖 [Prompt Engineer](ai/prompt-engineer/)
Designs and optimizes prompts for AI interactions, creating standard formats for maintaining consistent development practices and agent behaviors.

```
ai/prompt-engineer/
├── prompts/ (23)
│   ├── activities/ (16)
│   └── agents/ (7)
├── snippets/ (1)
└── wows/ (5)
```

### 📢 Communications Department
**Managing internal and external communications, documentation, and team coordination**

#### 📢 [Communications Officer](communications/core/)
Manages internal and external communications, preparing meeting agendas, summaries, and other communication artifacts.

```
communications/core/
└── templates/ (1)
```

### 💡 Innovation Department
**Research, analysis, and creative problem-solving for business growth**

#### 💡 [Brainstormer](innovation/brainstormer/)
Facilitates idea generation and creative problem-solving sessions, utilizing prompts and activities to explore new concepts and solutions.

```
innovation/brainstormer/
└── prompts/ (1)
    └── activities/ (1)
```

#### 📊 [Business Analyst](innovation/business-analyst/)
Performs market research and project definition, analyzing opportunities, competitors, and user demographics while creating structured project requirements.

```
innovation/business-analyst/
├── prompts/ (6)
│   ├── activities/ (2)
│   └── agents/ (4)
└── wows/ (1)
    └── best-practices/ (1)
```

#### 🔬 [Researcher](innovation/researcher/)
Defines research questions and methodologies, conducts studies, analyzes data, and synthesizes findings into actionable insights and comprehensive reports.

```
innovation/researcher/
├── prompts/ (1)
│   └── activities/ (1)
└── templates/ (9)
```

### 📋 Management Department
**Project planning, coordination, and delivery management**

#### 📋 [Project Manager](management/project-manager/)
Creates product requirements documents and manages the Agile workflow of epics, stories, and tasks while coordinating development priorities.

```
management/project-manager/
├── prompts/ (17)
│   ├── activities/ (10)
│   └── agents/ (7)
├── templates/ (13)
└── wows/ (0)
```

### 📣 Marketing Department
**Content creation, optimization, and market presence**

#### 📱 [ASO Expert](marketing/aso-expert/)
Specializes in App Store Optimization strategies to improve mobile application visibility, conversion rates, and ranking in app stores.

```
marketing/aso-expert/
├── prompts/ (1)
│   └── agents/ (1)
└── wows/ (1)
    └── best-practices/ (1)
```

#### 📝 [Content Creator](marketing/content-creator/)
Develops optimized content for various platforms and channels, combining writing expertise with SEO knowledge to maximize engagement and reach.

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

### 💼 Sales Department
**Business development, proposals, and client relationships**

#### 📑 [Proposal Manager](sales/proposal-manager/)
Creates milestone proposals and project proposals that outline scope, requirements, and deliverables for stakeholder approval.

```
sales/proposal-manager/
├── prompts/ (3)
│   ├── activities/ (1)
│   └── agents/ (2)
├── templates/ (3)
└── wows/ (1)
```

### 💻 Tech Department
**Technical implementation, architecture, and quality assurance**

#### 🏛️ [Architect](tech/architect/)
Creates detailed technical blueprints and architectural designs based on product requirements. Responsible for technology selection, standards definition, and making high-level design decisions.

```
tech/architect/
├── prompts/ (8)
│   ├── activities/ (5)
│   └── agents/ (3)
└── templates/ (2)
```

#### 💻 [Developer](tech/developer/)
Implements features according to technical specifications, following coding standards and best practices while maintaining test coverage and documentation.

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

#### ✅ [Tester](tech/tester/)
Designs and executes acceptance tests to validate functionality, ensure quality, and verify that requirements have been properly implemented.

```
tech/tester/
├── prompts/ (11)
│   ├── activites/ (9)
│   └── agents/ (2)
├── snippets/ (2)
└── templates/ (1)
```

#### 🎨 [UIUX Expert](tech/uiux-expert/)
Translates UI/UX specifications into optimized designs and components, with expertise in creating intuitive user experiences and interfaces.

```
tech/uiux-expert/
├── prompts/ (1)
│   └── activities/ (1)
└── rubrics/ (1)
```

---

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.
