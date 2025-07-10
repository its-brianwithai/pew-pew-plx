# Changelog
All notable changes to Calude Code Context Teams will be documented in this file.

## [v0.1.0] - 2025-07-10

### 🚀 Major Release: Team-Based Workflow & Freelancer Hub

This release marks a complete reorganization of the repository, transforming it from a simple agent structure to a comprehensive, team-based workflow designed for end-to-end software development with AI.

### ✨ Features:
- **Complete Repository Restructuring**: 
  - Introduced 7-team workflow structure (`01-research-team` through `07-review-team`) for managing the entire software development lifecycle
  - Created `00-freelancers` directory as a central hub for all individual specialist agents
  - Added top-level `you-are-team-orchestrator-agent.md` for managing the entire project lifecycle
  
- **Standalone Team Agents**: 
  - New `100-all-teams` directory provides single-file versions of each team's complete prompt set
  - Enables easy creation of powerful specialized agents on platforms like ChatGPT and Gemini
  
- **Enhanced Claude Integration**: 
  - Optimized for Claude's `@` file-linking feature for superior context management
  - Team-specific context files for automatic loading of relevant project files
  - Reduces context loss through persistent file access

### 🔄 Reorganization:
- **Freelancer Migration**: Moved all specialist agents from domain-specific folders to unified `00-freelancers` hub:
  - `tech/` → `00-freelancers/` (architect, developer, project-manager, tester, uiux-expert)
  - `innovation/` → `00-freelancers/` (brainstormer, business-analyst, researcher)
  - `marketing/` → `00-freelancers/` (aso-expert → mvp-expert, content-creator)
  - `ai/` → `00-freelancers/` (prompt-engineer)
  - `sales/` → `00-freelancers/` (proposal-manager → proposal-magician)
  
- **Team Structure**: Each team includes:
  - Dedicated orchestrator agent for team management
  - Specialist agents for specific tasks
  - Context files for project-specific configuration
  - Templates for consistent output formats

### 🛠️ Improvements:
- **Hierarchical Orchestration Model**: Clear delegation from CEO (user) → Team Orchestrator → Team-specific Orchestrators → Specialist Agents
- **Structured Project Lifecycle**: Seven distinct phases ensure systematic progression from concept to completion
- **Context Persistence**: Team context files maintain project knowledge across conversations
- **Naming Standardization**: 
  - Renamed `proposal-manager` to `proposal-magician`
  - Renamed `aso-expert` to `mvp-expert`

### 📚 Documentation:
- Added comprehensive RELEASE.md documenting the v0.1 release
- Updated README.md with new framework structure and usage instructions
- Added acknowledgements to BMAD-METHOD for inspiration

## [v0.0.20] - 2025-07-07

### ✨ Features:
- **New Idea-Context-Refine-Plan-Act-Review Framework**: Complete project management team structure with 7 specialized teams for end-to-end development workflow
- **Enhanced Act Team Capabilities**: Added three new specialist agents:
  - Lead Developer Agent for expert code implementation with dependency injection principles
  - Unit Tester Agent for isolated business logic testing without mocks or stubs
  - Acceptance Test Agent for creating UAT plans in Markdown or CSV formats
- **Code Review Integration**: Added Code Review Agent to the Review Team for comprehensive code quality assessment
- **Comprehensive Team Overviews**: Added all-teams overview files in `00-all-teams/` directory providing complete visibility across all team structures and capabilities

### 🛠️ Improvements:
- **Agent Role Definitions**: Enhanced all agent role definitions with clearer responsibilities, workflows, and output specifications
- **Template Enhancements**: Improved templates with better formatting, guidance, and cross-references between teams using `@team/file.md` pattern
- **Testing Standards**: Established strict unit testing standards focusing on pure business logic testing with fake implementations instead of mocks
- **UAT Process**: Standardized User Acceptance Testing with dual format support (Markdown tables and CSV files for stakeholder use)
- **Development Workflow**: Comprehensive workflow from idea clarification through research, context gathering, requirements, refinement, planning, acting, and review

## [v0.0.19] - 2025-07-07

### Added
- **Complete Project Management Team Structure**: Added comprehensive 7-team organizational structure with over 60 new files
  - **Research Team**: Initial discovery phase with brainstorming and research capabilities
  - **Context Team**: Contextual documentation including best practices, examples, and preferences
  - **Requirements Team**: Detailed requirements analysis with actors, behaviors, and scenarios
  - **Refinement Team**: Architecture and PRD development capabilities
  - **Plan Team**: Development planning with epics, stories, and roadmaps
  - **Act Team**: Implementation execution and result reporting
  - **Review Team**: Quality assurance with acceptance criteria and feedback mechanisms
- **Team Orchestration**: Added central team orchestrator for managing cross-team workflows
- **DNA Prompt Engineering**: Added specialized prompts for creating DNA templates and prompts
- **Enhanced Requirements**: Added condensed requirements template for streamlined documentation

### Enhanced
- **Research Team Workflow**: Improved research orchestration with three-stage process
  - Added Idea Agent for clarifying raw ideas into actionable requests
  - Added focused `idea-template.md` for capturing core problems and outcomes
  - Enhanced workflow from vague ideas → clarification → brainstorming → research
- **Prompt Engineering**: Moved and organized jsonify prompt within prompt engineer structure
- **Requirements Structure**: Improved requirements template organization and condensed format

### Fixed
- **Template Organization**: Cleaned up requirements template structure and removed redundant content
- **File Structure**: Proper organization of prompt engineering resources

## [v0.0.18] - 2025-07-05

### Added
- **New Jsonify Prompts**: Added comprehensive set of jsonify prompts for structured data extraction and analysis
  - Added `plx-jsonify.md` - Core jsonify prompt for general data structuring
  - Added `plx-jsonify-data-models.md` - Data model structuring prompt
  - Added `plx-jsonify-deployment.md` - Deployment configuration structuring
  - Added `plx-jsonify-design-system.md` - Design system documentation structuring
  - Added `plx-jsonify-features.md` - Feature documentation structuring
  - Added `plx-jsonify-firebase.md` - Firebase configuration structuring
  - Added `plx-jsonify-network-requests.md` - Network request documentation structuring
  - Added `plx-jsonify-project.md` - Project structure documentation
  - Added `plx-jsonify-routes.md` - Route configuration structuring
  - Added `plx-jsonify-services.md` - Service layer documentation structuring
  - Added `plx-jsonify-supabase.md` - Supabase configuration structuring
  - Added `plx-jsonify-ui-components.md` - UI component documentation structuring
  - Added `plx-jsonify-user-stories.md` - User story structuring prompt

### Enhanced
- **Expert Prompts**: Enhanced existing expert prompts with improved capabilities
  - Updated requirements expert with enhanced analysis capabilities
  - Added JSON image profile expert for image analysis and profiling
  - Improved development plan expert with better template integration

### Improved
- **Template Organization**: Enhanced template structure and organization
  - Updated development plan template with requirements components
  - Improved user story template integration
  - Enhanced requirements template with better formatting
  - Added PLX-fix documentation for troubleshooting

### Fixed
- **Repository Structure**: Clean up and organizational improvements
  - Moved tech project manager to appropriate tech folder
  - Improved folder structure consistency
  - Enhanced documentation and template accessibility

## [v0.0.17] - 2025-05-21
### Added
- **Template Enhancements**:
  - Enhanced all relevant templates across multiple roles with AI agent context sections
  - Added structured AI guidance to improve automated workflow consistency and effectiveness
  - Updated 20+ templates spanning architect, communications, content creator, developer, project manager, and tester roles

### Improved
- **Template Structure**: Standardized AI agent context integration across the workspace
- **Workflow Automation**: Enhanced template usability for AI-driven processes
- **Documentation**: Improved template clarity and guidance for automated workflows

## [v0.0.16] - 2025-05-20

### Added
- **Testing Framework Enhancements**:
  - Added comprehensive Flutter testing documentation (`developer/wows/flutter/wow-flutter-testing-2025.md`)
  - Added new testing activity prompts:
    - `tester/prompts/activites/plx-create-flutter-unit-tests.md`
    - `tester/prompts/activites/plx-list-unit-tests.md`
    - `tester/prompts/activites/plx-prepare-for-flutter-tests.md`
    - `tester/prompts/activites/plx-qa-work-done.md`
    - `tester/prompts/activites/plx-review-tests.md`

- **Developer Tools**:
  - Added project context priming activity (`developer/prompts/activities/plx-prime-project-context.md`)
  - Added pseudocode generator agent (`developer/prompts/agents/you-are-pseudo-coder.md`)
  
- **Documentation and Rules**:
  - Added Claude rules creation prompt (`prompt-engineer/prompts/activities/plx-create-claude-rules.md`)
  - Renamed and enhanced technical documentation expert prompt (`doc-expert/prompts/agents/you-are-tech-doc-expert.md`)

### Updated
- Updated README.md with improved project information
- Updated documentation around development workflows

## [v0.0.15] 2025-05-20

### Added
- **New Developer Agent Prompt**: Added `developer/prompts/agents/you-are-pseudo-coder.md` to assist with generating pseudocode.
- **New Prompt Engineer Activity**: Added `prompt-engineer/prompts/activities/plx-create-claude-rules.md` for generating Claude-specific rules.
- **Documentation**: Updated `README.md` and `CHANGELOG.md` to reflect the v0.0.15 release.

## [v0.0.14] - 2025-05-15
d
### Added
- **New Researcher Profile Questionnaire Templates**: Introduced a suite of 8 new questionnaire templates within the `researcher/templates/` directory. These templates are designed to create central repositories of detailed information for various profiles (Client, Company, Other People, Overall Goals, Personal, Product, Project, and Service), facilitating AI-assisted tracking, planning, and analysis.
    - `researcher/templates/client-profile-questions-template.md`
    - `researcher/templates/company-profile-questions-template.md`
    - `researcher/templates/other-people-profile-questions-template.md`
    - `researcher/templates/overall-goals-profile-questions-template.md`
    - `researcher/templates/personal-profile-questions-template.md`
    - `researcher/templates/product-profile-questions-template.md`
    - `researcher/templates/project-profile-questions-template.md`
    - `researcher/templates/service-profile-questions-template.md`
- **Documentation**: Updated `README.md` and `CHANGELOG.md` to reflect the v0.0.14 release and ensure accuracy.

## 0.0.12 (2025-05-12)

### ✨ New Features
- **New Activity Prompts**:
  - Added system workflow creation activity prompt
  - Added file-level action prompt
  - Added milestone splitting functionality
  - Added feature flow creation capability
  - Added prompt improvement activities
  - Added plan transfer and custom context transfer utilities

### 👤 New Agent Roles
- **Workflow & System Experts**:
  - Added System Workflow Expert agent
  - Added WOW Expert agent
  - Added Feature Flow Expert agent
  - Added Design Pattern Expert agent
  - Added Agent Prompt Improver
  - Added QA Specialist agent
  - Added Content Creator agents (Content Drafter, Tutorial Expert)
  - Added Freelance Developer PA agent

### 📝 New Templates
- **System & Documentation Templates**:
  - Added system template
  - Added meeting template
  - Added tutorial template
  - Added feature flow template
  - Added tasks template
  - Added research template

### 💻 Developer Resources
- **Snippets & Tools**:
  - Added numerous code and command snippets
  - Added repo prompt templates
  - Enhanced raycast snippets functionality
  - Added Workflow Automation research documents

### 🔄 Renamed & Reorganized
- Renamed systems-template.md to system-template.md
- Renamed you-are-doc-expert.md to you-are-template-expert.md
- Renamed you-are-mvp-expert.md to you-are-mobile-mvp-expert.md
- Renamed milestone-template.md to epic-template.md
- Various file structure improvements

### 🛠️ Improvements
- **Template Updates**:
  - Enhanced API reference template
  - Updated plan creation templates
  - Refined PRD templates
  - Improved user story templates
  - Enhanced multiple agent prompts with clearer instructions

## 0.0.11 (2025-05-05)

### ✨ Major Features
- **BMAD Framework Reorganization**: 
  - Moved BMAD-related content to its own dedicated folder with specialized templates and agent prompts
  - Created specialized BMAD agent roles (Analyst, Architect, Developer, PM, PO, SM)
  - Added comprehensive set of BMAD-specific templates for different project aspects

### 🏗️ Structural Changes
- **File Organization Improvements**:
  - Standardized naming conventions across files (removing "for" in WOW files)
  - Renamed agent prompts to follow consistent pattern
  - Created new Doc Expert role with dedicated prompts and activities

### 🛠️ New Templates & Snippets
- **Developer Resources**:
  - Added Flutter-specific UI component templates in developer/snippets
  - Added various Markdown snippet shortcuts for common patterns
  - Added new templates for development planning

### 👤 Role Enhancements
- **Updated Agent Prompts**:
  - Added new specialized agent roles across multiple domains
  - Refined existing agent prompts with improved instructions
  - Created new activity prompts for document creation and transformation

### 🧹 Maintenance
- **Cleanup & Reorganization**:
  - Removed deprecated .cursorrules file
  - Reorganized multiple templates into more appropriate locations
  - Updated file paths and references for better organization

## 0.0.10 (2025-04-30)

### 🛠️ Improvements:
- **Developer Scripts:**
  - Enhanced `generate_raycast_snippets-script.py` to run from the project root directory
  - Updated script to correctly process only files in folders named "prompts", "templates", "systems", and "wows"
  - Fixed file extension filtering to properly handle `.md` and `.mdc` files
  - Improved logging with more detailed information about found files

### 🏗️ Infrastructure:
- **Developer Artifacts:**
  - Added initial `raycast_snippets.json` containing snippets from project markdown files
  - Generated snippets automatically transform variables in format `{{VARIABLE}}` to Raycast's `{argument name="{{VARIABLE}}"}` format

## 0.0.9 (2025-04-30)

#### ✨ Features: New Role-Specific Activity Prompts

- **Architect:**
  - Added `architect/prompts/activities/plx-create-architecture.md`: Guides the creation of detailed Architecture Documents based on PRDs.
- **Business Analyst:**
  - Added `business-analyst/prompts/activities/plx-conduct-market-research.md`: Structures the process for conducting market research.
  - Added `business-analyst/prompts/activities/plx-create-project-brief.md`: Facilitates the creation of comprehensive Project Briefs.
- **Project Manager:**
  - Added `project-manager/prompts/activities/plx-create-backlog.md`: Guides the generation of epics and user stories from PRD/Architecture.
  - Added `project-manager/prompts/activities/plx-create-new-release.md`: Defines the process for creating a new release (tagging, changelog, etc.).
  - Added `project-manager/prompts/activities/plx-create-prd.md`: Guides the creation of detailed Product Requirements Documents from project briefs.
  - Added `project-manager/prompts/activities/plx-create-user-stories.md`: (Duplicate of `plx-create-backlog.md`, standardizing task name).
  - Added `project-manager/prompts/activities/plx-review-prd.md`: Structures the review and finalization of PRDs against backlogs/architecture.
- **Prompt Engineer:**
  - Added `prompt-engineer/prompts/activities/plx-create-document.md`: Generic prompt for creating documents based on user requests and personas.
  - Added `prompt-engineer/prompts/activities/plx-review-document.md`: Generic prompt for reviewing documents based on user requests and personas.

#### 🛠️ Improvements

- **Project Manager:**
  - Refined `project-manager/prompts/agents/you-are-a-bmad-prd-expert.md`: Updated the Technical Product Manager persona with clearer instructions, interaction model, and a detailed PRD template structure.
- **Documentation:**
  - Updated `README.md` to reflect version 0.0.9, new file counts, and summarize recent changes.
  - Minor formatting correction in `project-manager/wows/wow-bmad-agile-workflow.md`.

## 0.0.8 (2025-04-30)

#### 🔄 Reorganization & Refinement
- Restructured the project around top-level **Roles**, each with its own dedicated folder ("office").
- Standardized optional subfolders within roles: `prompts`, `templates`, `wows`, `rubrics`, `documentation`, `scripts`, `systems`.

#### 📚 Documentation
- Rewritten `README.md` to accurately describe the new role-based structure and optional subfolders.
- Added a "Credits" section to `README.md` acknowledging `bmadcode` for influential repositories (`cursor-custom-agents-rules-generator`, `BMAD-METHOD`) and linking to their GitHub/YouTube.
- Updated `CONTRIBUTING.md` to reflect the current file structure and remove outdated naming conventions.

## 0.0.7 (2025-04-17)

#### 📚 Documentation
- Added comprehensive best practices guide for App Store Optimization (`aso-best-practices-2025.md`).
- Added comprehensive best practices guide for MVP Roadmap Planning (`mvp-roadmap-best-practices-2025.md`).
- Corrected minor formatting issues in ASO and MVP roadmap documentation links.

#### 🛠️ Developer Resources
- Added new expert planner persona and workflow prompt (`you-are-an-expert-planner.md`).
- Enhanced the `plx-create-plan.md` prompt to include initial context review and suggested approach sections.

#### ✨ Features
- Introduced the "App Boy" narrative series with the first installment (`writer/app-boy/20250416-not-your-typical-superhero.md`).

#### 🧹 Housekeeping
- Removed outdated example image files from researcher resources.

## 0.0.6 (2025-04-17)

#### 📚 Documentation:
- **ASO & MVP Roadmap Best Practices**:
  - Updated ASO and MVP roadmap documents with improved clarity and structure.
  - Enhanced visual engagement with emoji-based headings.
  - Refined introductory sections to emphasize core concepts.
  - Streamlined language throughout the documents.
  - Adjusted feature prioritization frameworks for consistency and clarity in the MVP roadmap.

#### 🛠️ Developer Resources:
- **New Expert Developer Prompts**:
  - Added `you-are-an-expert-developer.md` detailing the role and workflow of the Expert AI Developer Assistant.
  - Created `publish-markdown-cursor-article-system.md` for streamlined article publishing across multiple platforms.
- **Updated Existing Prompts**:
  - Enhanced `plx-create-plan.md` to include context and suggested approach in the initial review section.
- **Best Practices Guides**:
  - Added `aso-best-practices-2025.md` providing comprehensive guidelines for App Store Optimization.
  - Added `mvp-roadmap-best-practices-2025.md` with detailed guidance for MVP planning and execution.

## 0.0.5 (2025-04-16)

#### ✨ Features:
- **New Developer Prompts**: Added several new developer prompts focused on specific roles and tasks:
  - `plx-create-system.md`: For converting process descriptions into structured system documentation.
  - `you-are-a-cursor-rule-agent.md`: Defines the standard for creating and managing `.cursor/rules/*.mdc` files.
  - `you-are-a-front-end-developer.md`: Detailed persona for front-end development following MVVM/Microservice conventions.
  - `you-are-expert-ts-cli-developer.md`: Persona for expert TypeScript CLI development, including Jest testing standards.
  - `you-are-an-expert-planner.md`: Persona for creating detailed, user-confirmed project plans.

#### 🛠️ Improvements:
- **Prompt Enhancements**:
  - Updated `you-are-a-plan-act-mvvm-developer.md` to align with stricter Plan/Act mode conventions, MVVM/Microservice design, and standardized response format.
  - Minor formatting adjustment in `plx-develop-tasks.md`.
- **Template Updates**:
  - Refined icons in `operator/templates/systems-template.md`.

## 0.0.4 (2025-04-14)

### ✨ Features:
- **New Developer Prompts**: Added several new developer prompts:
  - Prompt engineering prompts (plx-analyze-and-improve-our-prompt, plx-create-prompt)
  - Gist creation prompt (plx-create-gist)
  - Updated project management prompts (plx-create-plan, plx-develop-tasks)
  - Documentation prompts (plx-update-changelog, plx-update-changelogs)
  - Role-specific prompts (you-are-an-expert-prompt-engineer, you-are-a-requirements-expert-v2)
- **New Developer Resources**: Added resources for prompt engineering:
  - ChatGPT best practices for prompt engineering
  - Comprehensive prompt engineering paper by Lee Boonstra
- **New Developer Documentation**: Added documentation for various tools:
  - Pew-pew CLI tool documentation
  - Roomy documentation
- **New Marketeer Prompts**: Added several new marketeer prompts:
  - Article creation prompts (plx-write-an-article, plx-submit-draft-article)
  - Role-specific prompts (you-are-an-article-writer)
- **New Marketeer Templates**: Added template for release posts (release-post-template.md)
- **New Marketeer Research**: Added AI writing style guide to avoid AI writing indicators
- **Enhanced Marketeer Artifacts**: Added new article drafts:
  - RepoPrompt article explaining contextual prompt creation
  - Firebase Studio article for app development
- **Workspace Operator Improvements**: Completely revised workspace operator prompt with clearer responsibilities and instructions

### 🛠️ Improvements:
- **Documentation Enhancements**:
  - Better example thought process for the workspace operator
  - Clearer instructions for task delegation
  - Enhanced role definition for the workspace operator
- **Workspace Coordination**:
  - Improved action summary format for better user feedback
  - Enhanced delegation mechanisms with clearer file naming conventions
  - Better clarification steps for ambiguous requests

## 0.0.3 (2025-04-09)

### ✨ Features:
- **New Developer Prompts**: Added several new developer prompts:
  - Research-focused prompts (plx-do-proper-research, plx-research-best-practices)
  - Project planning prompts (plx-create-a-proposal, plx-create-milestone-plan)
  - Help and documentation prompts (plx-ask-help, plx-create-copy-prompt)
  - Role-specific prompts (you-are-a-next-js-developer, you-are-a-milestone-expert, you-are-a-proposal-expert)
- **New Documentation Resources**: Added comprehensive documentation in developer/docs:
  - Effective Dart documentation
  - Project management API docs
  - Reorganized Typefully documentation
- **New Developer Tutorials**: Added tutorials for:
  - Launching and growing CLI tools
  - Preparing open-source project launches
  - Using markdown task management tools
- **Extended Marketeer Resources**: Added extensive marketing channel resources:
  - Developer channels documentation (community, carousel, long/short text, long/short video)
  - New systems for content management (posting articles, repurposing content)
- **Design Resources**: Added multiple design resources:
  - App store screenshot examples
  - Hero images for various sections
  - Reference images for Ultra Wide Turbo Developer
- **New Researcher Resources**: Added example resources for laptopkap

### 🛠️ Improvements:
- **File Structure Standardization**: Renamed many files to follow a consistent naming convention:
  - Updated template files to use the pattern `[concept]-template.md`
  - Updated rubric files to use the pattern `[concept]-rubric.md`
  - Updated script files to use the pattern `[verb]-[concept]-script.[ext]`
  - Updated documentation files to use the pattern `[concept]-docs.md`
- **Documentation Enhancements**:
  - Updated CONTRIBUTING.md with detailed guidelines for file naming and structure
  - Updated README.md with additional information
  - Improved developer wiki documentation
  - Enhanced Cursor rules instructions
- **Repository Organization**:
  - Reorganized file structure across multiple directories
  - Added script for removing example turbo files (remove-turbo-examples-script.sh)
  - Updated .gitignore for better file management
- **Workspace Operations**:
  - Enhanced workspace operator prompt
  - Renamed operator scripts for clarity

### 🔄 Reorganization:
- Moved and renamed multiple files to conform to the naming conventions in CONTRIBUTING.md
- Restructured Typefully documentation
- Relocated developer artifacts to artifacts directory
- Consolidated marketeer wiki resources into dedicated resource directories

## 0.0.2 (2025-04-02)

### ✨ Features:
- **New Templates**: Added specialized templates for different ticket types:
  - Bug tickets template
  - Task tickets template
  - Story tickets template
  - Systems template
- **Marketeer Role**: Enhanced the Marketeer role with wiki resources:
  - Blog sites documentation
  - Community channels (Discord and Slack)
  - Forums (general and Reddit)
  - Social media accounts
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
- Renamed `template-for-plan.md` to `template-for-project-plans.md` for clarity
- Updated roles in README with proper links to respective directories
- Enhanced workspace operator script and prompts
- Added cursor rules file for better IDE integration
- Fixed JWT token generation for Ghost Admin API to properly include the key ID in the header
- Improved documentation for the Ghost blog integration with clear examples using the markdown card in mobiledoc format

### 🐛 Bug fixes:
- Fixed issue with Ghost Admin API authentication by properly handling the API key format
- Fixed content display issues in Ghost posts by using the markdown card instead of HTML content
- Fixed JSON parsing issues in the MCP server by removing console.log statements that interfered with the output
- Fixed 405 Method Not Allowed error in Typefully MCP by adding trailing slash to draft creation endpoint URL

## 0.0.1 (2025-03-31)

### ✨ Features:
- **Turbo Developer MCP Tool**: Added a custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE. This tool allows seamless integration with AI assistants like Claude, providing standardized interfaces for development workflows.
- **Developer Role**: Added the initial Developer role to the workspace, with a dedicated folder structure, prompts, instructions and documentation.
- **Developer Wiki**: Added a wiki section with comprehensive documentation of available prompts for easy reference.

### 🛠️ Improvements:
- Updated folder structure to improve organization and clarity
- Enhanced documentation and README files
- Implemented standardized templates for various project documents
- Added developer/wiki/all-developer-prompts.md with detailed descriptions of each prompt
- Updated README with a link to the developer prompts documentation

### 💔 Breaking:
- **Initial Workspace Refactor Release**: Released the first version of the new Claude Code Context Teams (UWTW), featuring improved project structure, comprehensive roles documentation and development tools.
