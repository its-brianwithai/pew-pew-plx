# ⚡ Ultra Wide Turbo Workspace 0.0.8

[![Brought to you by ultrawideturbodevs.com](https://img.shields.io/badge/Brought%20to%20you%20by-ultrawideturbodevs.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://ultrawideturbodevs.com)

🎩 A virtual organization where you are the CEO. This workspace is structured around distinct **Roles**, each represented by a top-level folder acting as their dedicated "office".

## 👥 Roles

A role represents a specialized team member in your virtual organization with its own expertise, responsibilities, and dedicated workspace folder.

Current Roles:

- [architect](architect/)
- [aso-expert](aso-expert/)
- [business-analyst](business-analyst/)
- [content-creator](content-creator/)
- [developer](developer/)
- [operator](operator/)
- [project-manager](project-manager/)
- [prompt-engineer](prompt-engineer/)
- [proposal-manager](proposal-manager/)
- [tester](tester/)
- [uiux-expert](uiux-expert/)

### 📁 Role Office Structure

Each role's top-level folder serves as their office. Inside, you can optionally organize resources into standardized subfolders to maintain consistency:

| Folder                 | Purpose                                    | Examples                                                                                                       |
|------------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 💬 prompts/agents/     | AI agent persona definitions               | Files defining agent roles (e.g., `you-are-{persona}.md`)                                                      |
| 💬 prompts/activities/ | AI agent task instructions                 | Files defining specific tasks (e.g., `plx-{activity}.md`)                                                      |
| 📋 templates/          | Standardized formats                       | Document templates, starter files (`*-template.md`)                                                            |
| ✨ wows/                | Way of Workings (Best Practices/Guides)    | How-to guides, tutorials, best practice docs (`wow-for-*.md`)                                                  |
| ✅ rubrics/             | Evaluation criteria                        | Quality standards, assessment frameworks (`*-rubric.md`)                                                       |
| 📜 scripts/            | Automated procedures                       | Shell scripts, Python scripts (`*-script.*`)                                                                   |
| ⚙️ systems/            | Repeatable workflows & standard procedures | Process templates, defined workflows (`*-system.md`)                                                           |
| 📦 resources/          | Reusable assets & reference materials      | Collections of some kind, locations of specific tools, any other misc reusable inputs (`the-*.md`, `all-*.md`) |

## 💎 Credits

This workspace framework is deeply integrated with the methodology and tools created by **[bmadcode](https://github.com/bmadcode)**. We've not only adapted concepts but have incorporated the full suite of BMAD persona agents throughout our workspace structure as key components:

-   **[BMAD-METHOD](https://github.com/bmadcode/BMAD-METHOD):** The B.M.A.D. Method (Breakthrough Method Agile-AI Driven-Development) fundamentally shapes our role-based agentic workflow and persona structure. This comprehensive methodology transforms product ideas into fully implemented applications through AI-driven processes.

-   **[cursor-custom-agents-rules-generator](https://github.com/bmadcode/cursor-custom-agents-rules-generator):** We've integrated the rules generation approach and agent prompts from this project throughout our workspace.

### BMAD Persona Agents

We extensively utilize the following BMAD persona agents throughout our workspace:

| Persona File | Role | Location | Purpose |
|--------------|------|----------|---------|
| `you-are-a-bmad-architect.md` | Architect | architect/prompts/agents/ | Creates detailed, opinionated Architecture Documents that serve as technical blueprints based on PRDs, handling technology selection, standards definition, and architectural decisions |
| `you-are-a-bmad-business-analyst.md` | Business Analyst | business-analyst/prompts/agents/ | Performs market research and project definition, analyzing market opportunities, competitors, and user demographics while guiding structured Project Brief creation |
| `you-are-a-bmad-developer.md` | Developer | developer/prompts/agents/ | Works through Agile user stories sequentially, implementing features while following technical standards and maintaining test coverage |
| `you-are-a-bmad-prd-expert.md` | Project Manager | project-manager/prompts/agents/ | Creates Product Requirements Documents and manages the Agile workflow of stories and tasks |
| `you-are-a-bmad-product-manager.md` | Project Manager | project-manager/prompts/agents/ | Translates Agile user stories into detailed specifications with technical details from PRDs and Architecture Documents |
| `you-are-a-bmad-product-owner.md` | Project Manager | project-manager/prompts/agents/ | Creates logically ordered backlogs of Epics and User Stories for the MVP based on PRD and Architecture Documents |
| `you-are-a-bmad-rules-agent.md` | Prompt Engineer | prompt-engineer/prompts/agents/ | Manages and generates consistent rule formats for maintaining development standards and AI agent behaviors |
| `you-are-a-bmad-vercel-engineer.md` | UI/UX Expert | uiux-expert/prompts/agents/ | Translates UI/UX specifications into optimized prompts for Vercel's V0 AI UI generation tool |

### Additional BMAD Resources

We've also incorporated other valuable BMAD resources:

- `bmad-story-template.md` - Template for creating standardized Agile stories
- `bmad-architecture-template.md` - Template for creating Architecture Documents
- `bmad-prd-template.md` - Template for creating Product Requirements Documents
- `wow-for-the-bmad-code-method.md` - A comprehensive guide explaining the entire methodology
- `wow-for-bmad-agile-workflow.md` - Guide for implementing BMAD Agile workflow practices

Check out [bmadcode's GitHub](https://github.com/bmadcode) and [YouTube channel](https://www.youtube.com/@BMadCode) for more insights into agentic development workflows.

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.
