# ⚡ Ultra Wide Turbo Workspace

A comprehensive framework that transforms your workflow by creating a virtual organization where you're the CEO. This workspace allows you to delegate tasks to specialized AI roles, each with their own expertise, activities, and resources.

By structuring your work through roles, you gain clarity on where to store information, how to approach problems from different perspectives, and how to efficiently manage complex projects. Each role acts as a dedicated team member in your business or life, ready to execute tasks based on their specific capabilities.

## Last Update (March 31, 2025)

### ✨ Features:
- **Turbo Developer MCP Tool**: Added a custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE. This tool allows seamless integration with AI assistants like Claude, providing standardized interfaces for development workflows.
- **Developer Role**: Added the initial Developer role to the workspace, with a dedicated folder structure, prompts, instructions and documentation.
- **New Templates**: Added specialized templates for different ticket types (bug, task, story, systems)
- **Marketeer Role**: Enhanced with wiki resources for blog sites, community channels, forums, and social media
- **Resources Folder**: Added a dedicated resources folder to the standard structure for all roles
- **Ghost Blog Integration**: Added complete Ghost Blog API integration with the MCP tool supporting:
  - Retrieving posts and content (GET)
  - Creating draft posts with markdown support (POST)
  - Updating existing posts (PUT)
  - Deleting posts (DELETE)
- **Typefully Integration**: Added Typefully social media management integration with MCP tool supporting:
  - Creating drafts with scheduling and threadify options
  - Retrieving scheduled drafts
  - Retrieving published drafts

### 🛠️ Improvements:
- Updated folder structure to improve organization and clarity
- Enhanced documentation and README files
- Implemented standardized templates for various project documents
- Updated roles in README with proper links to respective directories
- Enhanced workspace operator script and prompts
- Added cursor rules file for better IDE integration
- Improved Ghost API integration with better token handling and content formatting
- Improved Typefully MCP server implementation by replacing Axios with native fetch API for better reliability

### 💔 Breaking:
- **Initial Workspace Refactor Release**: Released the first version of the new Ultra Wide Turbo Workspace (UWTW), featuring improved project structure, comprehensive roles documentation and development tools.

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
├── 📦 resources/
├── ✅ rubrics/
├── 📜 scripts/
├── ⚙️ systems/
├── ✓ tasks/
├── 📋 templates/
├── 🛠️ tools/
└── 📔 wiki/
```

#### 🎨 Artifacts
The tangible outputs and deliverables resulting from completed work.

**Purpose:** Preserves and organizes final products for reference, delivery, or implementation.

**Examples:**
- Completed designs
- Compiled reports
- Generated code
- Processed data
- Finalized documents

#### 🖼️ Assets
Resources and files needed for role-specific work, including raw materials and external content.

**Purpose:** Centralizes storage for various media, client files, and resources required for projects and tasks.

**Examples:**
- Images and graphics
- Project source files (PSD, AI, Figma)
- Client-provided materials
- Audio and video files
- Fonts and design resources
- Data files and raw content

#### 📝 Backlog
A collection of pending tasks, ideas, and future work items that are not yet scheduled or prioritized.

**Purpose:** Serves as a repository for capturing potential work before it's ready to be acted upon.

**Examples:**
- Feature requests waiting for evaluation
- Ideas that need further refinement
- Low-priority improvements
- Future phases of current projects

#### 🔑 Credentials
Secure access information and permissions needed for role-specific tasks.

**Purpose:** Allow easy access to credentials for role-specific tasks.

**Examples:**
- API keys and tokens
- Service account credentials
- Environment-specific configuration
- Access permissions documentation

#### 📚 Docs
Comprehensive documentation related to the role's domain expertise and responsibilities.

**Purpose:** Provides reference materials, guidelines, and knowledge bases for consistent work.

**Examples:**
- Architecture documentation
- API references
- Style guides
- Best practices documents
- Process documentation

#### 🖋️ Drafts
Work-in-progress documents and content that are not yet finalized.

**Purpose:** Provides a space for developing ideas, content, or documentation before they're ready for review or implementation.

**Examples:**
- Partial documents awaiting completion
- Initial versions of designs or plans
- Content being prepared for review
- Active work documents
- Work requiring multiple sessions to complete

#### 📥 Inbox
A staging area for new requests, information, and items requiring processing.

**Purpose:** Serves as an entry point for incoming work before it's evaluated, categorized, and assigned.

**Examples:**
- New task requests
- Information requiring review
- Unprocessed communications
- Items awaiting triage

#### 📘 Instructions
Step-by-step guides and learning materials for specific processes or technologies.

**Purpose:** Facilitates knowledge transfer and skill development within the role's domain.

**Examples:**
- [`developer/instructions/how-to-create-a-local-role-based-mcp-server.md`](developer/instructions/how-to-create-a-local-role-based-mcp-server.md)
- [`developer/instructions/how-to-create-and-update-cursor-rules.md`](developer/instructions/how-to-create-and-update-cursor-rules.md)
- [`developer/instructions/how-to-develop-astro-websites.md`](developer/instructions/how-to-develop-astro-websites.md)
- [`developer/instructions/how-to-create-md-docs.md`](developer/instructions/how-to-create-md-docs.md)

#### 📂 Projects
Organized collections of related files, folders, and resources focused on specific initiatives.

**Purpose:** Centralizes all materials related to a particular project or ongoing work area.

**Examples:**
- Website redesign project
- Product launch materials
- Research initiative
- Multi-phase development effort

#### 💬 Prompts
Role-specific instructions for AI models.

**Purpose:** Provides guidance for AI interactions relevant to the role's responsibilities.

**Examples:**
System prompts define an AI role's expertise, responsibilities, and capabilities.
Activity prompts are direct requests for a role to fulfill specific tasks.

#### 🤖 System Prompts
A detailed description that establishes an AI role's expertise and responsibilities.

**Purpose:** Creates a specialized AI team member with defined capabilities and domain knowledge.

**Examples:**
- [`developer/prompts/you-are-a-plan-act-developer.md`](developer/prompts/you-are-a-plan-act-developer.md)
- [`developer/prompts/you-are-a-requirements-expert.md`](developer/prompts/you-are-a-requirements-expert.md)
- [`operator/prompts/you-are-the-workspace-operator.md`](operator/prompts/you-are-the-workspace-operator.md)

#### 🎯 Activity Prompts
A direct request with specific instructions for an AI role to fulfill.

**Purpose:** Provides detailed guidance on exactly what the AI role should deliver.

**Examples:**
- [`plx-develop.md`](developer/prompts/plx-develop.md)
- [`plx-create-requirements.md`](developer/prompts/plx-create-requirements.md)
- [`plx-fix-bug.md`](developer/prompts/plx-fix-bug.md)

#### 📦 Resources
Reusable assets and materials that support role-specific activities.

**Purpose:** Provides centralized storage for reference materials and shared resources that support the role's work.

**Examples:**
- Reference documents
- Datasets
- Sample files
- External libraries
- Shared utilities
- Research papers

#### ✅ Rubrics
Evaluation criteria, standards, and assessment frameworks for measuring quality and completeness.

**Purpose:** Provides consistent benchmarks for evaluating work and ensuring quality standards are met.

**Examples:**
- [`developer/rubrics/rubrik-for-mvvm-projects.md`](developer/rubrics/rubrik-for-mvvm-projects.md)
- Code review checklists
- Design evaluation criteria
- Quality assurance standards

#### 📜 Scripts
Automated procedures, code snippets, and executable routines that perform specific tasks.

**Purpose:** Increases efficiency by automating repetitive processes and standardizing common operations.

**Examples:**
- [`generate_raycast_snippets.py`](developer/scripts/generate_raycast_snippets.py)
- [`create-role.sh`](operator/scripts/create-role.sh)

#### ⚙️ Systems
Reusable workflows and processes within a role's domain.

**Purpose:** Provides standardized approaches to common tasks.

**Examples:**
- Role-specific workflows
- Standard operating procedures
- Process templates
- System for creating social media posts
- System for refining todo items
- System for publishing release notes

#### ✓ Tasks
Active tasks that require immediate attention and ongoing work.

**Purpose:** Tracks current priorities and work in progress to ensure timely completion.

**Examples:**
- Tasks in progress
- Items due this week
- Blocked work awaiting dependencies
- High-priority action items

#### 📋 Templates
Standardized formats for consistent outputs specific to the role.

**Purpose:** Ensures consistency in the role's deliverables.

**Examples:**
- [`developer/templates/template-for-research-results.md`](developer/templates/template-for-research-results.md)
- [`developer/templates/template-for-test-results.md`](developer/templates/template-for-test-results.md)
- [`developer/templates/template-for-project-plans.md`](developer/templates/template-for-project-plans.md)

#### 🛠️ Tools
Role-specific utilities and resources.

**Purpose:** Provides specialized capabilities for the role's tasks.

**Examples:**
- [`developer/tools/turbo-developer-mcp`](developer/tools/turbo-developer-mcp/)
- Specialized software tools
- Role-specific utilities
- Productivity enhancers

#### 📚 Wiki
Knowledge base with interconnected information relevant to the role.

**Purpose:** Serves as a reference repository for domain knowledge.

**Examples:**
- Role-specific reference materials
- Domain knowledge collections
- Interconnected information resources

## 💎 Credits

This workspace framework was enhanced with inspiration from:

- [bmadcode/cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) - Special thanks for the excellent markdown guide and comprehensive automatic rules creation documentation.

## 🤝 Contributing

For detailed information on how to contribute to this project, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## 💬 About
My name == Brian. App developer, entrepenerd & undercover AI agent. Nowadays, I do somewhere between 70% to 90% of all my work with the help of AI. I have found that this is a lot lower for most people I talk too, which is why I created ultrawideturbodevs.com. Here I share everything I discover & use on a daily basis:

- 💬 Prompts
    - 🤖 System Prompts (You are a..)
    - 🦾 Activity Prompts (Please do..)
- 🔧 Tools
- 🏗️ Systems
- 📝 Templates
- 💡 Hacks
- 🧠 Tutorials

My primary focus always lies on efficiency, quality and immediate practicality without unnecessary fuss 🗣️. Everything I share comes straight out of my personal toolbox and is 100% free. If you find it useful you can register an account on ultrawideturbodevs.com and you'll be among the first to receive an email as soon I have a new 🧊 cool 🧊 thing to share.

Stay turbo 🤙