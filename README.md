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
├── ✓ todos/
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
- **✓ todos**: Active tasks requiring attention
- **🛠️ tools**: Role-specific utilities and resources
- **📘 tutorials**: Step-by-step guides and learning materials

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
- Docs (API Reference, Package Documentation)

## 📝 Naming Conventions

Consistent naming helps organize and locate files within your workspace:

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
- **Todo items**:
    - `todo-{{DESCRIPTION}}.md`
- **Drafts**:
    - `draft-{{DESCRIPTION}}.md`
- **Wiki objects**:
    - `all-{{COMPONENTS_OR_CONCEPTS}}.md`
    - `the-{{NOUN_OR_CONCEPT}}.md`
- **Docs**:
    - `{{SUBJECT}}-docs.md` (reference documentation)
- **Tutorials**:
    - `how-to-{{TASK}}.md` (step-by-step instructions)
