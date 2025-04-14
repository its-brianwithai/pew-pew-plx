# ⚡ Ultra Wide Turbo Workspace

[![Brought to you by ultrawideturbodevs.com](https://img.shields.io/badge/Brought%20to%20you%20by-ultrawideturbodevs.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://ultrawideturbodevs.com)

🎩  The ultra wide turbo workspace can serve as a virtual organization where the main folders represent different roles working for you. Each role has its own set of prompts, documents, and main activities. Each folder can thus function as an individual agent by opening it separately. However, real magic may happen when you use a single agent to orchestrate communication and collaboration between all of them.

💭 This might take some creative thinking and technical handiness, but once you get the hang of it there's some really cool stuff you can do with it. Especially when you learn to combine specific roles and their tools within your company with external tools like [Cursor AI](https://www.cursor.com/ai-chatbot), [Repo Prompt](https://www.repoprompt.com/) and a big context tool like [Google AI Studio](https://aistudio.google.com/).

The possibilities are endless. In any case, no matter how you decide to use it, or not. This repo has many prompts, templates, and all sorts of other things that I use on a daily base. May you at least find something useful 🤙.

> **💭 Little Disclaimer:** I use this repository to direct my life and company in a sort of custom agentic way. While I try to make what I add generic for anyone to use, there might be files and folders included that are specific to something I'm working on. I have left these in here to serve as examples of how you could use it. All these files can be found by grepping the `*.turbo.*` blob. You can remove all of them by running the `developer/scripts/remove-turbo-examples-script.sh` script, which will then also add the glob to .gitignore for you.

## 👥 Roles

A role represents a specialized team member in your virtual organization. Each role has its own expertise, responsibilities, and dedicated workspace structure.

Examples:

- [Developer](developer/)
- [Designer](designer/)
- [Marketeer](marketeer/)
- [Operator](operator/)
- Project Manager *(coming soon, hiring process in progress)*
- Data Analyst *(coming soon, hiring process in progress)*

### 📁 Folder Structure

Each role in the workspace has access to a standardized set of folders and document types to organize their work effectively. This is an example structure - as your work evolves, you'll likely add other folders to fit your specific needs. Feel free to explore the repository to see how we've extended this structure ourselves.

| Folder           | Purpose                         | Examples                                                  |
|------------------|---------------------------------|-----------------------------------------------------------|
| 🎨 outputs/      | Final deliverables and results  | Compiled reports, generated code, finalized documents     |
| 📦 resources/    | Reference materials and assets  | Images, fonts, datasets, reference files, sample files    |
| 📝 backlog/      | Pending tasks and future work   | Feature requests, ideas for evaluation                    |
| 🔑 credentials/  | Secure access information       | API keys, service accounts, access permissions            |
| 📚 docs/         | Comprehensive documentation     | Architecture docs, style guides, process documentation    |
| 🖋️ drafts/      | Work-in-progress content        | Partial documents, initial designs, active work           |
| 📥 inbox/        | Staging area for new requests   | Unprocessed tasks, items awaiting triage                  |
| 📘 instructions/ | Step-by-step guides             | How-to guides, tutorials, learning materials              |
| 💬 prompts/      | AI model instructions           | System prompts, activity prompts                          |
| 📝 refinements/  | Requirements and detailed plans | User stories, acceptance criteria, refined specifications |
| ✅ rubrics/       | Evaluation criteria             | Quality standards, assessment frameworks                  |
| 📜 scripts/      | Automated procedures            | Shell scripts, automation code                            |
| ⚙️ systems/      | Reusable workflows              | Standard procedures, process templates                    |
| ✓ tasks/         | Active work items               | In-progress tasks, current priorities                     |
| 📋 templates/    | Standardized formats            | Document templates, starter files                         |
| 🛠️ tools/       | Role-specific utilities         | Software tools, productivity enhancers                    |
| 📚 wiki/         | Knowledge base                  | Reference materials, domain knowledge                     |

## 💎 Credits

This workspace framework was enhanced with inspiration from:

- [bmadcode/cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) - Special thanks for the excellent markdown guide and comprehensive automatic rules creation documentation.

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.
