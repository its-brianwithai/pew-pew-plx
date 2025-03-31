# ⚡ Ultra Wide Turbo Workspace

A comprehensive framework that transforms your workflow by creating a virtual organization where you're the CEO. This workspace allows you to delegate tasks to specialized AI roles, each with their own expertise, activities, and resources.

By structuring your work through roles, you gain clarity on where to store information, how to approach problems from different perspectives, and how to efficiently manage complex projects. Each role acts as a dedicated team member in your business or life, ready to execute tasks based on their specific capabilities.

## Last Update (March 31, 2025)

### ✨ Features:
- **Turbo Developer MCP Tool**: Added a custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE. This tool allows seamless integration with AI assistants like Claude, providing standardized interfaces for development workflows.
- **Developer Role**: Added the initial Developer role to the workspace, with a dedicated folder structure, prompts, instructions and documentation.

### 🛠️ Improvements:
- Updated folder structure to improve organization and clarity
- Enhanced documentation and README files
- Implemented standardized templates for various project documents

### 💔 Breaking:
- **Initial Workspace Refactor Release**: Released the first version of the new Ultra Wide Turbo Workspace (UWTW), featuring improved project structure, comprehensive roles documentation and development tools.

## 👥 Roles

A role represents a specialized team member in your virtual organization. Each role has its own expertise, responsibilities, and dedicated workspace structure.

Examples:

- Developer
- Designer
- Marketer
- Personal Assistant
- Project Manager
- Data Analyst

### 📁 Folder Structure

Each role in the workspace has access to a standardized set of folders and document types to organize their work effectively:

```
role/
├── 🎨 artifacts/
├── 🖼️ assets/
├── 📝 backlog/
├── 🔑 credentials/
├── 📚 docs/
├── 🖋️ drafts/
├── 📥 inbox/
├── 📘 instructions/
├── 📂 projects/
├── 💬 prompts/
├── ✅ rubrics/
├── 📜 scripts/
├── ⚙️ systems/
├── ✓ tasks/
├── 📋 templates/
├── 🛠️ tools/
└── 📔 wiki/
```
| Folder                  | Definition                                                                                             | Purpose                                                                                                             | Examples                                                                                                                                                                                                                                                                                                                                   |
|-------------------------|--------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **🎨 Artifacts**        | The tangible outputs and deliverables resulting from completed work.                                   | Preserves and organizes final products for reference, delivery, or implementation.                                  | - Completed designs<br>- Compiled reports<br>- Generated code<br>- Processed data<br>- Finalized documents                                                                                                                                                                                                                                 |
| **🖼️ Assets**          | Resources and files needed for role-specific work, including raw materials and external content.       | Centralizes storage for various media, client files, and resources required for projects and tasks.                 | - Images and graphics<br>- Project source files (PSD, AI, Figma)<br>- Client-provided materials<br>- Audio and video files<br>- Fonts and design resources<br>- Data files and raw content                                                                                                                                                 |
| **📝 Backlog**          | A collection of pending tasks, ideas, and future work items that are not yet scheduled or prioritized. | Serves as a repository for capturing potential work before it's ready to be acted upon.                             | - Feature requests waiting for evaluation<br>- Ideas that need further refinement<br>- Low-priority improvements<br>- Future phases of current projects                                                                                                                                                                                    |
| **🔑 Credentials**      | Secure access information and permissions needed for role-specific tasks.                              | Allow easy access to credentials for role-specific tasks.                                                           | - API keys and tokens<br>- Service account credentials<br>- Environment-specific configuration<br>- Access permissions documentation                                                                                                                                                                                                       |
| **📚 Docs**             | Comprehensive documentation related to the role's domain expertise and responsibilities.               | Provides reference materials, guidelines, and knowledge bases for consistent work.                                  | - Architecture documentation<br>- API references<br>- Style guides<br>- Best practices documents<br>- Process documentation                                                                                                                                                                                                                |
| **🖋️ Drafts**          | Work-in-progress documents and content that are not yet finalized.                                     | Provides a space for developing ideas, content, or documentation before they're ready for review or implementation. | - Partial documents awaiting completion<br>- Initial versions of designs or plans<br>- Content being prepared for review<br>- Active work documents<br>- Work requiring multiple sessions to complete                                                                                                                                      |
| **📥 Inbox**            | A staging area for new requests, information, and items requiring processing.                          | Serves as an entry point for incoming work before it's evaluated, categorized, and assigned.                        | - New task requests<br>- Information requiring review<br>- Unprocessed communications<br>- Items awaiting triage                                                                                                                                                                                                                           |
| **📘 Instructions**     | Step-by-step guides and learning materials for specific processes or technologies.                     | Facilitates knowledge transfer and skill development within the role's domain.                                      | - [`developer/instructions/how-to-create-a-local-role-based-mcp-server.md`](developer/instructions/how-to-create-a-local-role-based-mcp-server.md)<br>- [`developer/instructions/how-to-create-and-update-cursor-rules.md`](developer/instructions/how-to-create-and-update-cursor-rules.md)<br>- [`developer/instructions/how-to-develop-astro-websites.md`](developer/instructions/how-to-develop-astro-websites.md)<br>- [`developer/instructions/how-to-create-md-docs.md`](developer/instructions/how-to-create-md-docs.md)                                                                                                         |
| **📂 Projects**         | Organized collections of related files, folders, and resources focused on specific initiatives.        | Centralizes all materials related to a particular project or ongoing work area.                                     | - Website redesign project<br>- Product launch materials<br>- Research initiative<br>- Multi-phase development effort                                                                                                                                                                                                                      |
| **💬 Prompts**          | Role-specific instructions for AI models.                                                              | Provides guidance for AI interactions relevant to the role's responsibilities.                                      | System prompts define an AI role's expertise, responsibilities, and capabilities.<br>Activity prompts are direct requests for a role to fulfill specific tasks.                                                                                                                                                                            |
| **🤖 System Prompts**   | A detailed description that establishes an AI role's expertise and responsibilities.                   | Creates a specialized AI team member with defined capabilities and domain knowledge.                                | - [`developer/prompts/you-are-a-plan-act-developer.md`](developer/prompts/you-are-a-plan-act-developer.md)<br>- [`developer/prompts/you-are-a-requirements-expert.md`](developer/prompts/you-are-a-requirements-expert.md)<br>- [`operator/prompts/you-are-the-workspace-operator.md`](operator/prompts/you-are-the-workspace-operator.md) |
| **🎯 Activity Prompts** | A direct request with specific instructions for an AI role to fulfill.                                 | Provides detailed guidance on exactly what the AI role should deliver.                                              | - [`plx-develop.md`](developer/prompts/plx-develop.md)<br>- [`plx-create-requirements.md`](developer/prompts/plx-create-requirements.md)<br>- [`plx-fix-bug.md`](developer/prompts/plx-fix-bug.md)                                                                                                                                         |
| **✅ Rubrics**           | Evaluation criteria, standards, and assessment frameworks for measuring quality and completeness.      | Provides consistent benchmarks for evaluating work and ensuring quality standards are met.                          | - [`developer/rubrics/rubrik-for-mvvm-projects.md`](developer/rubrics/rubrik-for-mvvm-projects.md)<br>- Code review checklists<br>- Design evaluation criteria<br>- Quality assurance standards                                                                                                         |
| **📜 Scripts**          | Automated procedures, code snippets, and executable routines that perform specific tasks.              | Increases efficiency by automating repetitive processes and standardizing common operations.                        | - [`generate_raycast_snippets.py`](developer/scripts/generate_raycast_snippets.py)<br>- [`create-role.sh`](operator/scripts/create-role.sh)                                                                                                                                                                                                |
| **⚙️ Systems**          | Reusable workflows and processes within a role's domain.                                               | Provides standardized approaches to common tasks.                                                                   | - Role-specific workflows<br>- Standard operating procedures<br>- Process templates<br>- System for creating social media posts<br>- System for refining todo items<br>- System for publishing release notes                                                                                                                               |
| **✓ Tasks**             | Active tasks that require immediate attention and ongoing work.                                        | Tracks current priorities and work in progress to ensure timely completion.                                         | - Tasks in progress<br>- Items due this week<br>- Blocked work awaiting dependencies<br>- High-priority action items                                                                                                                                                                                                                       |
| **📋 Templates**        | Standardized formats for consistent outputs specific to the role.                                      | Ensures consistency in the role's deliverables.                                                                     | - [`developer/templates/template-for-research-results.md`](developer/templates/template-for-research-results.md)<br>- [`developer/templates/template-for-test-results.md`](developer/templates/template-for-test-results.md)<br>- [`developer/templates/template-for-plan.md`](developer/templates/template-for-plan.md)                                                                                                                                                                                                           |
| **🛠️ Tools**           | Role-specific utilities and resources.                                                                 | Provides specialized capabilities for the role's tasks.                                                             | - [`developer/tools/turbo-developer-mcp`](developer/tools/turbo-developer-mcp/)<br>- Specialized software tools<br>- Role-specific utilities<br>- Productivity enhancers                                                                                                                                                                      |
| **📚 Wiki**             | Knowledge base with interconnected information relevant to the role.                                   | Serves as a reference repository for domain knowledge.                                                              | - Role-specific reference materials<br>- Domain knowledge collections<br>- Interconnected information resources                                                                                                                                                                                                                            |

## 💎 Credits

This workspace framework was enhanced with inspiration from:

- [bmadcode/cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) - Special thanks for the excellent markdown guide and comprehensive automatic rules creation documentation.

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.

When using this template for your own projects:

1. The `.gitignore` is configured to ignore all files by default and only track the template structure
2. This means you can freely add your implementation files without worrying about them being committed
3. Your personal data, projects, and implementation details will remain private

This approach ensures that the template remains clean and focused on structure, while allowing you to use it for any purpose without accidentally exposing your work.
