# ⚡ Ultra Wide Turbo Workspace

## 🚀 Your Personal AI-Powered Organizational Framework

Welcome to the Ultra Wide Turbo Workspace - a comprehensive framework that transforms your workflow by creating a virtual organization where you're the CEO. This workspace allows you to delegate tasks to specialized AI roles, each with their own expertise, activities, and resources.

By structuring your work through these roles, you gain clarity on where to store information, how to approach problems from different perspectives, and how to efficiently manage complex projects. Each role acts as a dedicated team member in your business or life, ready to execute tasks based on their specific capabilities.

## 👥 Roles

A role represents a specialized team member in your virtual organization. Each role has its own expertise, responsibilities, and dedicated workspace structure.

Examples:

- Developer
- Designer
- Marketer
- Personal Assistant
- Project Manager
- Data Analyst

### 📁 Document and Folder Structure by Role

Each role in the workspace has access to a standardized set of folders and document types to organize their work effectively:

```
role/
├── 📝 backlog/
├── 🔑 credentials/
├── 📚 docs/
├── 🖋️ drafts/
├── 📥 inbox/
├── 📂 projects/
├── 💬 prompts/
├── 🎨 artifacts/
├── ✅ rubriks/
├── 📜 scripts/
├── ⚙️ systems/
├── 📋 templates/
├── ✓ tasks/
├── 🛠️ tools/
└── 📘 tutorials/
```

- **📝 backlog**: Pending tasks and future work items
- **🔑 credentials**: Access information and permissions
- **📚 docs**: Documentation related to the role's domain expertise
- **🖋️ drafts**: Work-in-progress documents
- **📥 inbox**: New requests and information for processing
- **📂 projects**: Organized collections of related files and folders
- **💬 prompts**: Role-specific instructions for AI models
- **🎨 artifacts**: Completed deliverables and outputs from activities
- **✅ rubriks**: Evaluation criteria and standards
- **📜 scripts**: Automated procedures and code snippets
- **⚙️ systems**: Reusable workflows and processes
- **📋 templates**: Standardized formats for consistent outputs
- **✓ tasks**: Active tasks requiring attention
- **🛠️ tools**: Role-specific utilities and resources
- **📘 tutorials**: Step-by-step guides and learning materials

## 📝 Backlog

- **Definition**: A collection of pending tasks, ideas, and future work items that are not yet scheduled or prioritized.
- **Purpose**: Serves as a repository for capturing potential work before it's ready to be acted upon.

Examples:
- Feature requests waiting for evaluation
- Ideas that need further refinement
- Low-priority improvements
- Future phases of current projects

## 🔑 Credentials (fill at own risk)

- **Definition**: Secure access information and permissions needed for role-specific tasks.
- **Purpose**: Allow easy access to credentials for role-specific tasks.
- **Disclaimer**: Always try to use cloud based credentials over local files. If you need to use local files, make sure to not commit them to version control and possibly encrypt them.

Examples:
- API keys and tokens
- Service account credentials
- Environment-specific configuration
- Access permissions documentation

## 📚 Docs

- **Definition**: Comprehensive documentation related to the role's domain expertise and responsibilities.
- **Purpose**: Provides reference materials, guidelines, and knowledge bases for consistent work.
- **Organization**: Typically structured by subject area, technology, or specific processes.

Examples:
- Architecture documentation
- API references
- Style guides
- Best practices documents
- Process documentation

## 🖋️ Drafts

- **Definition**: Work-in-progress documents and content that are not yet finalized.
- **Purpose**: Provides a space for developing ideas, content, or documentation before they're ready for review or implementation.
- **Workflow**: Items typically move from drafts to their final destination folders once completed.

Examples:
- Partial documents awaiting completion
- Initial versions of designs or plans
- Content being prepared for review
- Active work documents
- Work requiring multiple sessions to complete

## 📥 Inbox

- **Definition**: A staging area for new requests, information, and items requiring processing.
- **Purpose**: Serves as an entry point for incoming work before it's evaluated, categorized, and assigned.
- **Workflow**: Items typically move from inbox to appropriate destinations based on evaluation.

Examples:
- New task requests
- Information requiring review
- Unprocessed communications
- Items awaiting triage

## 📂 Projects

- **Definition**: Organized collections of related files, folders, and resources focused on specific initiatives.
- **Purpose**: Centralizes all materials related to a particular project or ongoing work area.
- **Structure**: Typically contains sub-folders for different aspects of the project (planning, implementation, deliverables).

Examples:
- Website redesign project
- Product launch materials
- Research initiative
- Multi-phase development effort

## 🎨 Artifacts

- **Definition**: The tangible outputs and deliverables resulting from completed work.
- **Purpose**: Preserves and organizes final products for reference, delivery, or implementation.
- **Characteristics**: Typically represents polished, reviewed, and approved items ready for use.

Examples:
- Completed designs
- Compiled reports
- Generated code
- Processed data
- Finalized documents

## ✅ Rubriks

- **Definition**: Evaluation criteria, standards, and assessment frameworks for measuring quality and completeness.
- **Purpose**: Provides consistent benchmarks for evaluating work and ensuring quality standards are met.
- **Implementation**: Often structured as checklists, scoring systems, or requirement sets.

Examples:
- Code review checklists
- Design evaluation criteria
- Quality assurance standards
- Performance measurement frameworks

## 📜 Scripts

- **Definition**: Automated procedures, code snippets, and executable routines that perform specific tasks.
- **Purpose**: Increases efficiency by automating repetitive processes and standardizing common operations.
- **Types**: May include shell scripts, programming code, or automation routines.

Examples:
- Build and deployment scripts
- Data processing routines
- Environment setup scripts
- Automation tools
- Utility functions

## ✓ Tasks

- **Definition**: Active tasks that require immediate attention and ongoing work.
- **Purpose**: Tracks current priorities and work in progress to ensure timely completion.
- **Organization**: Typically sorted by priority, deadline, or project association.

Examples:
- Tasks in progress
- Items due this week
- Blocked work awaiting dependencies
- High-priority action items

## 📘 Tutorials

- **Definition**: Step-by-step guides and learning materials for specific processes or technologies.
- **Purpose**: Facilitates knowledge transfer and skill development within the role's domain.
- **Structure**: Typically organized in sequential steps with clear instructions and examples.

Examples:
- Process walkthroughs
- Technical how-to guides
- Onboarding materials
- Training resources
- Best practices guides

## 💬 Prompts

System prompts and activity prompts serve different functions in your AI organization:

- **System prompts** define an AI role's expertise, responsibilities, and capabilities within your organization.
- **Activity prompts** are direct requests for a role to fulfill specific tasks with detailed instructions.

Think of system prompts as defining job descriptions for each specialized AI role (Developer, Designer, etc.), while activity prompts are like giving detailed work instructions to these roles.

### 🤖 System Prompts

- **Definition**: A detailed description that establishes an AI role's expertise and responsibilities.
- **Format**: Always starts with 'you-are-...'
- **Purpose**: Creates a specialized AI team member with defined capabilities and domain knowledge.

Examples:

- You are now a software tester tasked with creating and running tests for the business logic of a specific feature. Your goal is .. (continues with a detailed description of the role)
- You are a requirements expert with expertise in understanding complex codebases and project planning. Your task is to .. (continues with a detailed description of the role)
- You are an expert project management AI specializing in planning and delegating tasks for large-scale projects. Your primary function is .. (continues with a detailed description of the role)

### 🎯 Activity Prompts

- **Definition**: A direct request with specific instructions for an AI role to fulfill.
- **Format**: Always starts with 'plx-..' (please-..)
- **Purpose**: Provides detailed guidance on exactly what the AI role should deliver.

Examples:

- Please review the work done by developer based on..
- Please help me break down a complex request into manageable artifacts and providing detailed instructions for..
- Please create a comprehensive plan to achieve a specific outcome and meet certain end goals. Follow your system instructions carefully to develop an effective and actionable plan.

## ⚙️ Systems

- **Definition**: A reusable collection of activities that produces one or more results.
- **Purpose**: Provides standardized processes for common workflows in your organization.
- **Structure**: Typically contains multiple activities organized in a logical sequence.

Examples:

- System for creating social media posts
- System for refining todo items
- System for publishing release notes

### 🏃 Activities

- **Definition**: A single action that starts with a verb and produces a result.
- **Purpose**: Represents a specific task that an AI role performs to achieve a goal.
- **Structure**: Consists of one or more atomic steps working toward a defined outcome.

Examples:

- Scan the codebase for relevant files
- Create a new document with the results
- Go to this website and scrape the content

#### 🔍 Atomic Steps

- **Definition**: A single step inside an activity that works towards the result of the activity.
- **Purpose**: Breaks down complex activities into simple, executable actions.
- **Characteristic**: Small, discrete actions that can be completed in a single operation.

Examples:

- Open the website
- Click the button
- Create a new file

### 🎨 Artifacts

- **Definition**: The output of an atomic step, activity, or system.
- **Purpose**: Represents the tangible results of completed work.
- **Characteristic**: Can be documents, code, designs, or any other deliverable.

Examples:

- Deep research report
- Refined ticket with technical requirements
- Implemented feature

## 🛠️ Tools

- **Definition**: Specialized utilities that extend the capabilities of your AI organization.
- **Purpose**: Provides AI roles with the necessary resources to perform their tasks effectively.
- **Implementation**: Usually involves integration with external services or software.

Examples:

- pewPewCLI (command line task management)
- Jira MCP (project management)
- Firecrawl MCP (web scraping)
- Notion MCP (project management)

### 📋 Templates

- **Definition**: A predefined structure or format used as a starting point to easily create new documents, designs, code, or content consistently.
- **Purpose**: Ensures consistency and efficiency in creating similar types of items.
- **Implementation**: Standardized formats with placeholders that can be customized as needed.

Examples:

- Template for a LinkedIn post
- Template for a requirements document
- Template for a changelog
- Template for a ticket
- Template for code structure

### 📚 Wiki Objects

- **Definition**: Documents containing information about specific subjects for reference.
- **Purpose**: Provide context and knowledge to support decision-making.
- **Connectivity**: Can be linked to each other using [wiki links](https://en.wikipedia.org/wiki/Wiki#Linking), creating a network of interconnected knowledge that makes it easy to reference and reuse information across your workspace.

Examples:

- Components (App, Database, Website, Button)
- Concepts (Dependency Injection, Requirements, Single Responsibility Principle)
- Actors (User, Agent, System)
- Clients (Customer 1, Customer 2, Customer 3)
- People (John Doe, Jane Smith, Jack Bauer)
- Docs (API Reference, Package Documentation)

## 📝 Optional Naming Conventions

We use this to make it easier to create and find files by typing the first few letters of a recurring pattern. You can of course use your own way to organise the files properly if you like.

- **Templates**:
    - `template-for-{{RESULT_OR_CONCEPT}}.md`
    - `template-{{RESULT_OR_CONCEPT}}.md`
- **Systems**:
    - `system-for-{{RESULT_OR_CONCEPT}}.md`
    - `system-{{RESULT_OR_CONCEPT}}.md`
- **System Prompts**:
    - `you-are-a-{{IDENTITY}}.md`
    - `you-are-an-{{IDENTITY}}.md`
- **Activity Prompts**:
    - `plx-{{VERB}}-{{RESULT_OR_CONCEPT}}.md`
- **Tasks**:
    - `todo-{{DESCRIPTION}}.md`
- **Drafts**:
    - `draft-{{DESCRIPTION}}.md`
- **Wiki objects**:
    - `all-{{COMPONENTS_OR_CONCEPTS}}.md`
    - `the-{{NOUN_OR_CONCEPT}}.md`
    - `a-{{NOUN_OR_CONCEPT}}.md`
    - `an-{{NOUN_OR_CONCEPT}}.md`
    - `{{NOUN_OR_CONCEPT}}.md`
    - `{{NAME}}.md`
- **Docs**:
    - `doc-{{SUBJECT}}.md` (reference documentation)
- **Tutorials**:
    - `how-to-{{TASK}}.md` (step-by-step instructions)
