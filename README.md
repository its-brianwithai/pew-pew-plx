# ⚡ Ultra Wide Turbo Workspace v0.0.17

[![Brought to you by ultrawideturbodevs.com](https://img.shields.io/badge/Brought%20to%20you%20by-ultrawideturbodevs.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://ultrawideturbodevs.com)

🎩 A virtual organization where you are the CEO. This workspace is structured around distinct **Roles**, each represented by a top-level folder acting as their dedicated "office".

---

## ✨ Latest Release: v0.0.17 (2025-05-21)

### Added
- **Template Enhancements**: Enhanced all relevant templates across multiple roles with AI agent context sections to improve automated workflow consistency and effectiveness.
- **AI Agent Context Integration**: Updated 20+ templates spanning architect, communications, content creator, developer, project manager, and tester roles.
- **Workflow Automation**: Enhanced template usability for AI-driven processes with standardized guidance.

#### ✨ New
- **New Researcher Profile Questionnaire Templates**: Introduced a suite of 9 new questionnaire templates within the `researcher/templates/` directory. These templates are designed to create central repositories of detailed information for various profiles (Client, Company, Other People, Overall Goals, Personal, Product, Project, Research, and Service), facilitating AI-assisted tracking, planning, and analysis.
    - `researcher/templates/client-profile-questions-template.md`
    - `researcher/templates/company-profile-questions-template.md`
    - `researcher/templates/other-people-profile-questions-template.md`
    - `researcher/templates/overall-goals-profile-questions-template.md`
    - `researcher/templates/personal-profile-questions-template.md`
    - `researcher/templates/product-profile-questions-template.md`
    - `researcher/templates/project-profile-questions-template.md`
    - `researcher/templates/research-template.md`
    - `researcher/templates/service-profile-questions-template.md`

#### 🛠️ Modified
- `README.md`: Updated to accurately reflect the v0.0.15 release, adjust previous release notes, and ensure overall project structure and file counts are correct.

## 📁 Role Folder Structure

Each role's top-level folder serves as their office. Inside, you can optionally organize resources into standardized subfolders to maintain consistency:

| Folder                 | Purpose                                                                                                                                                                                                                                                                                                                                                                                                        | Examples                                                                                                       |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 💬 prompts/agents/     | An Agent Prompt is a structured instruction file (typically named you-are-{persona}.md) stored in a role's prompts/agents/ directory that defines an AI persona with specific expertise, responsibilities, and behaviors to guide AI interactions when assuming that role, providing the character traits, knowledge base, and workflow patterns needed to fulfill specialized functions within the workspace. | Files defining agent roles (e.g., `you-are-{persona}.md`)                                                      |
| 💬 prompts/activities/ | An Activity Prompt is a structured instruction file (typically named plx-*.md) that guides AI agents to perform specific, well-defined tasks within a role's domain, providing standardized formats and steps for completing discrete activities.                                                                                                                                                              | Files defining specific tasks (e.g., `plx-{activity}.md`)                                                      |
| ✨ snippets/           | Reusable text fragments or code blocks designed for quick insertion into prompts or documents, often triggered by abbreviations, to ensure consistency and speed up repetitive writing tasks.                                                                                                                                                                                                                | Short text files, often with `.md` or `.txt` extensions (e.g., `;given.md`, `;ai.md`)                          |
| 📋 templates/          | Standardized formats                                                                                                                                                                                                                                                                                                                                                                                           | Document templates, starter files (`*-template.md`)                                                            |
| ✨ wows/                | Way of Workings (Best Practices/Guides)                                                                                                                                                                                                                                                                                                                                                                        | How-to guides, tutorials, best practice docs (`wow-*.md`)                                                  |
| ✅ rubrics/             | Evaluation criteria                                                                                                                                                                                                                                                                                                                                                                                            | Quality standards, assessment frameworks (`*-rubric.md`)                                                       |
| 📜 scripts/            | Automated procedures                                                                                                                                                                                                                                                                                                                                                                                           | Shell scripts, Python scripts (`*-script.*`)                                                                   |
| ⚙️ systems/            | Repeatable workflows & standard procedures                                                                                                                                                                                                                                                                                                                                                                     | Process templates, defined workflows (`*-system.md`)                                                           |
| 📦 resources/          | Reusable assets & reference materials                                                                                                                                                                                                                                                                                                                                                                          | Collections of some kind, locations of specific tools, any other misc reusable inputs (`the-*.md`, `all-*.md`) |

---

## 👥 Roles

A role represents a specialized team member in your virtual organization with its own expertise, responsibilities, and dedicated workspace folder.

### 🏛️ [Architect](architect/) 
Creates detailed technical blueprints and architectural designs based on product requirements. Responsible for technology selection, standards definition, and making high-level design decisions.

```
architect/
├── prompts/ (8)
│   ├── activities/ (5)
│   └── agents/ (3)
└── templates/ (2)
```

### 📱 [ASO Expert](aso-expert/)
Specializes in App Store Optimization strategies to improve mobile application visibility, conversion rates, and ranking in app stores.

```
aso-expert/
├── prompts/ (1)
│   └── agents/ (1)
└── wows/ (1)
    └── best-practices/ (1)
```

###  automating [Automation Alchemist](automation-alchemist/)
Specializes in automating complex tasks and research processes, including the development and implementation of advanced automation solutions like Retrieval Augmented Generation (RAG) systems.

```
automation-alchemist/
└── deep-research/ (2)
```

### 🧱 [BMAD](bmad/)
Dedicated to exploring and implementing BMad (Build, Measure, Adapt, Develop) methodologies, focusing on agentic development workflows and structured project management artifacts.

```
bmad/
├── prompts/ (6)
│   └── agents/ (6)
└── templates/ (18)
```

### 💡 [Brainstormer](brainstormer/)
Facilitates idea generation and creative problem-solving sessions, utilizing prompts and activities to explore new concepts and solutions.

```
brainstormer/
└── prompts/ (1)
    └── activities/ (1)
```

### 📊 [Business Analyst](business-analyst/)
Performs market research and project definition, analyzing opportunities, competitors, and user demographics while creating structured project requirements.

```
business-analyst/
├── prompts/ (6)
│   ├── activities/ (2)
│   └── agents/ (4)
└── wows/ (1)
    └── best-practices/ (1)
```

### 📢 [Communications Officer](communications-officer/)
Manages internal and external communications, preparing meeting agendas, summaries, and other communication artifacts.

```
communications-officer/
└── templates/ (1)
```

### 📝 [Content Creator](content-creator/)
Develops optimized content for various platforms and channels, combining writing expertise with SEO knowledge to maximize engagement and reach.

```
content-creator/
├── prompts/ (7)
│   ├── activities/ (3)
│   └── agents/ (4)
├── resources/ (6)
│   └── dev-channels/ (6)
├── systems/ (3)
├── templates/ (1)
└── wows/ (1)
    └── best-practices/ (1)
```

### 💻 [Developer](developer/)
Implements features according to technical specifications, following coding standards and best practices while maintaining test coverage and documentation.

```
developer/
├── artifacts/ (2)
├── prompts/ (31)
│   ├── activities/ (16)
│   └── agents/ (15)
├── rubrics/ (1)
├── scripts/ (2)
├── snippets/ (42)
│   └── flutter/ (14)
├── templates/ (5)
└── wows/ (35)
    ├── astro/ (1)
    ├── cli-tools/ (2)
    ├── flutter/ (1)
    ├── markdown/ (1)
    ├── mcp-servers/ (2)
    ├── next-js/ (1)
    ├── open-source/ (1)
    └── supabase/ (26)
        ├── database/ (6)
        └── flutter/ (20)
```

### 📖 [Doc Expert](doc-expert/)
Specializes in creating, reviewing, and transforming documentation, ensuring clarity, accuracy, and adherence to standards. Manages document templates and expert systems for documentation.

```
doc-expert/
└── prompts/ (5)
    ├── activities/ (3)
    └── agents/ (2)
```

### 📋 [Project Manager](project-manager/)
Creates product requirements documents and manages the Agile workflow of epics, stories, and tasks while coordinating development priorities.

```
project-manager/
├── prompts/ (18)
│   ├── activities/ (11)
│   └── agents/ (7)
└── templates/ (12)
```

### 🤖 [Prompt Engineer](prompt-engineer/)
Designs and optimizes prompts for AI interactions, creating standard formats for maintaining consistent development practices and agent behaviors.

```
prompt-engineer/
├── prompts/ (21)
│   ├── activities/ (14)
│   └── agents/ (7)
├── snippets/ (1)
└── wows/ (5)
```

### 📑 [Proposal Manager](proposal-manager/)
Creates milestone proposals and project proposals that outline scope, requirements, and deliverables for stakeholder approval.

```
proposal-manager/
├── prompts/ (3)
│   ├── activities/ (1)
│   └── agents/ (2)
├── templates/ (3)
└── wows/ (1)
```

### 🔬 [Researcher](researcher/)
Defines research questions and methodologies, conducts studies, analyzes data, and synthesizes findings into actionable insights and comprehensive reports.

```
researcher/
├── prompts/ (1)
│   └── activities/ (1)
├── questionnaires/ (0) 
└── templates/ (9)
```

### ✅ [Tester](tester/)
Designs and executes acceptance tests to validate functionality, ensure quality, and verify that requirements have been properly implemented.

```
tester/
├── prompts/ (8)
│   ├── activites/ (6) 
│   └── agents/ (2)
├── snippets/ (2)
└── templates/ (1)
```

### 🎨 [UIUX Expert](uiux-expert/)
Translates UI/UX specifications into optimized designs and components, with expertise in creating intuitive user experiences and interfaces.

```
uiux-expert/
├── prompts/ (0)
└── rubrics/ (1)
```

### 🧑‍💼 [Virtual Assistent](virtual-assistent/)
Provides personal assistance for development-related tasks, managing resources and leveraging prompts for efficient support.

```
virtual-assistent/
├── prompts/ (1)
│   └── agents/ (1)
└── resources/ (1)
```

---

## 💎 Credits

We've organized BMAD-related agents and templates into their own dedicated folder as they have inspired us and proven extremely helpful in many cases. 

Check out [bmadcode's GitHub](https://github.com/bmadcode) and [YouTube channel](https://www.youtube.com/@BMadCode) for more insights into agentic development workflows.

---

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.
