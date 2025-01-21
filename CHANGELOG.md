---
document_type: documentation
goal: track framework changes and updates
gpt_action: use as reference for framework version history
---

# 🔄 Changelog

## [0.33.0] - 2024-01-21

### Added
- Introduced use-cases directory for focused, single-purpose document sets
- Added first use-case `creating-the-perfect-plan`:
  - `plx-create-planning.md`: Protocol for creating atomic development plans
  - `plx-reflect.md`: Protocol for plan refinement and validation
  - `your-planning.md`: Single document template for planning and refinement
- Added `scripts/add_brick.sh` for easy use-case installation, check [Use Cases](#-use-cases) for more details

### Changed
- Simplified protocol approach to prevent information overload:
  - Reduced protocol complexity to improve agent understanding
  - Focused on minimal, essential documentation per task
  - Removed gherkin and wiki links as experiment
- Updated documentation structure to support focused use-cases

## [0.32.0] - 2024-01-17

### Changed
- Simplified Quick Start section to be more concise and narrative
- Updated Core Pillars section to use descriptive text instead of bullet points
- Reorganized PLX Commands section into clear categories
- Added all protocol files from protocols directory to PLX Commands section
- Fixed workspace creation instructions to clarify global brick usage
- Updated documentation links to point to correct paths
- Improved readability of installation instructions
- Added proper reference to BrickHub documentation

### Added
- New PLX Commands categories:
  - Documentation Commands (11 commands)
  - Task Management Commands (7 commands)
  - Testing Commands (6 commands)
  - Process Commands (7 commands)
  - Analysis Commands (5 commands)
  - Workflow Control Commands (8 commands)
  - Maintenance Commands (5 commands)
  - Context Management Commands (2 commands)

### Fixed
- Corrected Mason CLI installation instructions
- Fixed broken documentation links
- Updated workspace creation workflow
- Synchronized PLX commands with actual protocol files

## [0.31.1] - 2024-01-14

### Changed
- Enhanced `plx-ask-questions` protocol for thorough implementation preparation:
  - Added implementation requirements verification
  - Added resource and documentation checks
  - Enhanced information gathering process
  - Added implementation readiness confirmation
  - Improved guidance verification steps

## [0.31.0] - 2024-01-14

### Added
- New work document `your-backlog.md`:
  - Tracks future work items chronologically
  - Implements on-demand processing
  - Maintains original context
  - Added to core pillars in documentation
  - Integrated with existing work documents

## [0.30.1] - 2024-01-14

### Fixed
- Fixed workspace generation hook to handle file conflicts:
  - Added `--on-conflict overwrite` flag to mason commands
  - Prevents interactive prompts during generation
  - Ensures consistent file generation across machines

## [0.30.0] - 2024-03-XX

### Added
- New protocol `plx-stick-to-your-prompt.md` for ensuring strict adherence to system prompts:
  - Added structured steps for prompt compliance
  - Enforces systematic approach to request handling
  - Ensures consistent rule following
  - Maintains alignment with system instructions

## [0.29.0] - 2024-01-14

### Added
- New Objects concept for reusable entity definitions:
  - Added `objects/` directory
  - Created core objects (User.md, GPT Agent.md)
  - Introduced exact-match filename convention
  - Added frontmatter structure for objects
- Updated workspace creation script with Objects and APIs components
- Enhanced documentation with Objects section in README

### Changed
- Updated create_workspace.sh to include Objects and APIs
- Modified README structure to include Objects section
- Added exception to kebab-case naming for Object files

## [0.28.0] - 2024-01-11

### Changed
- Standardized API integration approach using curl and JSON files
- Simplified API documentation with consistent format
- Updated API folder structure requirements

### Added
- New `docs.md` format for API-specific documentation
- Ghost API documentation and configuration
- Typefully API documentation and configuration

### Removed
- Complex API client implementations
- Language-specific API wrappers
- Redundant API command protocols

## [0.27.0] - 2024-01-11

### Changed
- Simplified API interaction approach:
  - Standardized to use only curl and JSON files
  - Removed all API client implementations
  - Added clear documentation requirements
  - Enhanced user interaction for unclear documentation
- Removed specific API commands in favor of single standardized approach:
  - Removed plx-use-ghost-api
  - Removed plx-use-typefully-api
  - Removed plx-use-unsplash-api
  - Removed plx-use-giphy-api
  - Removed plx-use-pexels-api

### Added
- New `plx-use-api` protocol for standardized API usage
  - Enforces curl-only approach
  - Uses request.json for data
  - Requires proper documentation
  - Includes user interaction points
  - Handles all API interactions consistently

### Removed
- Complex API client implementations
- Programming language specific wrappers
- Helper classes and libraries
- Individual API-specific protocols

## [0.26.0] - 2024-01-11

### Changed
- Renamed wiki folder to code-of-conduct for better clarity
- Updated documentation to reflect new code of conduct terminology
- Simplified code of conduct section in README.md
- Added Scripts and Concepts to Quick Start section
- Updated table of contents for better organization
- Maintained user-populated sections in create_workspace.sh

### Added
- New Concepts folder for clear concept documentation
- Added plx-create-concept command for documenting concepts
- Added plx-create-use-case command for documenting use cases
- Added plx-create-tests command for generating BDD tests

### Fixed
- Corrected inconsistencies in documentation references
- Fixed broken links after folder renaming
- Aligned all documentation with new structure

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

All notable changes to the Ultra Wide Turbo framework will be documented in this file.

## [0.25.1] - 2024-01-11

### 🛠️ Improvements:
- Simplified concept file naming convention to only require "the-" prefix
- Removed "-concept" suffix requirement for cleaner file names
- Updated concept creation protocol with clearer naming examples

## [0.25.0] - 2024-01-11

### ✨ Features:
- Added new protocol `plx-create-concept.md` for creating focused concept explanations
- Added new `concepts/` directory for storing concept files
- Added new concept file format:
  - Standardized naming (the-*)
  - Simple frontmatter structure
  - Direct, clear explanations
  - Optional examples
- Added support for extracting concepts from existing documentation

### 🛠️ Improvements:
- Enhanced documentation organization with dedicated concepts directory
- Simplified concept explanations separate from process documentation
- Better knowledge sharing through focused concept files
- Clearer separation between concepts and processes

## [0.24.0] - 2024-01-11

### ✨ Features:
- Added new protocol `plx-create-use-case.md` for generating use case descriptions
- Added `use-cases/` directory for storing use case files
- Added structured use case format with sections for:
  - What it does
  - Why we do it this way
  - How to use it
- Added handling for code, workflow, and concept input

### 🛠️ Improvements:
- Enhanced documentation capabilities with use case generation
- Improved knowledge sharing and consistency through use cases
- Better organization with dedicated use case directory

## [0.23.0] - 2024-01-11

### ✨ Features:
- Added new protocol `plx-create-tests.md` for generating BDD test scenarios
- Added structured test creation workflow with:
  - Milestone-based organization
  - BDD Gherkin style formatting
  - Happy path and edge case coverage
  - Error handling scenarios
- Added automatic test task creation in todo list
- Added integration with existing testing workflow

### 🛠️ Improvements:
- Enhanced test organization in `your-tests.md`
- Improved milestone-test linking
- Better test scenario documentation
- Clearer test creation process

## [0.22.0] - 2024-01-11

### ✨ Features:
- Added new case studies system with dedicated `case-studies` directory
- Added new protocol `plx-create-case-study.md` for creating engaging case studies
- Added structured case study format with sections for:
  - Executive Summary
  - Challenge
  - Solution
  - Implementation
  - Results
  - Key Learnings
  - Testimonials
- Added platform-specific optimization for website and LinkedIn content

### 🛠️ Improvements:
- Enhanced workspace creation script with new directories:
  - Added `feature-breakdowns` directory
  - Added `tutorials` directory
  - Added `case-studies` directory
  - Added `insights` directory
  - Added `apis` directory
  - Added `scripts` directory
- Removed outdated `our-*.md` files from workspace creation

## [0.21.0] - 2024-01-11

### ✨ Features:
- Added new insights system with dedicated `insights` directory
- Added new protocol `plx-create-insight.md` for generating concise how-to content
- Added structured insight content format with clear sections and examples

### 🛠️ Improvements:
- Enhanced documentation with image placeholders and style guidelines
- Improved documentation structure and organization
- Added clear guidelines for insight content creation

## [0.20.0] - 2024-01-11

### ✨ Features:
- Added new API integrations in `apis` folder:
  - Typefully API for social media content management
  - Unsplash API for high-quality photo integration
  - Ghost API for blog content management
  - Giphy API for GIF content integration
  - Pexels API for stock photo integration
- Added new protocols for API usage:
  - `plx-use-typefully-api.md` for Typefully API interactions
  - `plx-use-unsplash-api.md` for Unsplash API interactions
  - `plx-use-ghost-api.md` for Ghost API interactions
  - `plx-use-giphy-api.md` for Giphy API interactions
  - `plx-use-pexels-api.md` for Pexels API interactions
- Added new protocols for content creation:
  - `plx-create-feature-breakdown.md` for feature documentation
  - `plx-create-tutorial.md` for tutorial creation
  - `plx-post-to-typefully.md` for social media posting
  - `plx-add-pexels.md` for adding stock photos
  - `plx-add-gifs.md` for adding GIF content

### 🛠️ Improvements:
- Updated wiki documentation with new guidelines:
  - Enhanced `how-we-create-tutorials.md` with image placeholders and style guidelines
  - Updated `how-we-create-feature-breakdowns.md` with improved structure
  - Added `how-we-create-docs.md` with documentation best practices
- Enhanced API integration structure with:
  - Standardized environment variable handling
  - Consistent error handling
  - Proper credential management
  - Comprehensive test coverage

## [0.19.0] - 2024-01-08

### ✨ Features:
- Added new `apis` folder for API configurations with Ghost API documentation
- Added new protocol `plx-update-translations.md` for managing project translations and string localization
- Added new protocol `plx-explain-yourself.md` for thorough issue explanation and solution proposal
- Added new protocol `plx-activate-code-red.md` for emergency research mode with work stoppage
- Added new protocol `plx-do.md` for executing high priority user tasks with perfect focus
- Added new protocol `plx-create-blog.md` for creating Ghost API compatible blog posts
- Added new protocol `plx-create-typefully.md` for creating Typefully API compatible social media content
- Added `content` folder structure for organizing posts and media
- Added new protocol `plx-create-milestone-gherkin-tests.md` for creating standardized Gherkin tests for milestones
- Added new protocol `plx-update-read-me-and-changelog.md` for managing documentation updates
- Added new protocol `plx-follow-development-workflow.md` for realigning with development workflow
- Added new protocol `plx-follow-planning-workflow.md` for realigning with planning workflow
- Added new protocol `plx-follow-test-workflow.md` for realigning with test workflow
- Added new protocol `plx-create-todo.md` for creating todo lists from user input
- Added new protocol `plx-test-live.md` for testing implementations live with users

### 🛠️ Improvements:
- Updated API documentation references in protocols for consistency
  - Changed `'@Ghost Docs' API documentation` to `@Ghost API documentation`
  - Changed `'@Typefully API'` to `@Typefully API`
- Renamed `our-hours.md` to `your-hours.md` for consistency with "your" document naming convention
- Updated all references to hours logging in protocols and documentation
- Updated `plx-log-hours.md` protocol to reflect new file name
- Enhanced changelog formatting with standardized emoticons and categories
- Enhanced test file organization with one focused file per milestone
- Improved test file guidelines emphasizing small, focused test files

## [0.18.0] - 2024-01-08

### ✨ Features:
- Added new protocol structure and organization
- Added new wiki documentation structure
- Enhanced documentation patterns
- Improved workflow organization

### 🛠️ Improvements:
- Restructured protocol files
- Unified naming conventions
- Enhanced protocol clarity
- Improved file organization
- Updated documentation patterns
- Enhanced cross-referencing
- 💥 Breaking: Removed redundant protocols
- 💥 Breaking: Cleaned up outdated protocols
- 💥 Breaking: Consolidated similar functionalities

## [0.17.0] - 2024-01-08

### 🛠️ Improvements:
- Split development workflow into separate files:
  - Moved planning phase to `the-planning-workflow.md`
  - Moved development phase to `the-development-workflow.md`
  - Improved workflow clarity and maintainability
- Introduced new wiki category:
  - Added `the-work-documents.md` as first wiki entry
  - Enhanced documentation structure
  - Better organization of framework knowledge

## [0.16.0] - 2024-01-08

### ✨ Features:
- Added new `plx-transfer` protocol for seamless agent handover
- Added new `your-transfer.md` template for context transfer between agents
- Added Transfer as fourth core pillar in framework
- Added seamless agent handover to framework features
- Added `scripts/create_workspace.sh` for automated workspace creation

### 🛠️ Improvements:
- Updated README.md with transfer protocol documentation
- Enhanced PLX Commands table with transfer protocol details
- Modified workspace creation script:
  - Now accepts user input for base name
  - Maintains date and sequential numbering format
  - Default base name remains "your-workspace"

## [0.15.0] - 2024-01-08

### ✨ Features:
- Added new templates in `/templates`:
  - `the-task-template.md`
  - `the-story-template.md`
  - `the-bug-template.md`
  - `the-requirements-template.md`
- Added new workspace creation script with interactive features

### 🛠️ Improvements:
- Enhanced development workflow documentation
- Improved agent work documents structure
- Restructured agent work documents with consistent format:
  - Clear metadata headers
  - Emoji-based section headers
  - Detailed section descriptions
  - Improved task organization
  - Better progress tracking

## [0.14.0] - 2024-01-08

### ✨ Features:
- Added new protocol structure following `how_we_create_docs.md` template
- Added actor/action syntax using double brackets
- Added hierarchical relationships between actions
- Added conditional flows with IF statements
- Added feedback loop integration in all protocols

### 🛠️ Improvements:
- Restructured all protocols with consistent format
- Updated all protocols with clear goals and actions
- Improved process flow visualization
- Enhanced error handling
- Added structured data templates
- 💥 Breaking: Removed outdated protocols:
  - plx-start-work
  - plx-document
  - plx-refine
  - plx-collect
  - plx-next
  - plx-optimise
  - plx-finish
  - plx-reset

## [0.13.0] - 2023-12-20

### ✨ Features:
- Added new `_plx-scan.md` protocol for comprehensive repository scanning
- Added context updating functionality

## [0.12.0] - 2023-12-20

### 🛠️ Improvements:
- Simplified all PLX protocol files
- Updated protocol formats with clear task lists
- Improved protocol readability and maintainability
- 💥 Breaking: Removed complex file structure references
- 💥 Breaking: Removed redundant verification sections
- 💥 Breaking: Removed `_plx-ask-other-agent.md` protocol
- 💥 Breaking: Removed `simple-todo-todo.md`

## [0.11.0] - 2023-12-20

### ✨ Features:
- Added new `plx-stick-to-the-process` protocol
- Added new task process workflow in system prompt

### 🛠️ Improvements:
- Updated documentation with correct project timeline
- Simplified system prompt to focus on core workflow
- Improved process adherence guidance
- Made task workflow more explicit

## [0.10.0] - 2023-12-19

### 🛠️ Improvements:
- Enhanced documentation patterns
- Improved workflow organization
- Better process adherence

## [0.9.0] - 2023-12-19

### ✨ Features:
- Added new milestone-based development flow
- Added clear milestone completion format
- Added structured blocker reporting format

### 🛠️ Improvements:
- Updated system prompt for milestone-based workflow
- Improved framework file organization
- Enhanced archive organization with timestamps

## [0.8.0] - 2023-12-19

### ✨ Features:
- Added framework copy script (copy-framework.sh)
- Added file structure preservation features

## [0.7.0] - 2023-12-19

### ✨ Features:
- Added complete archival system with archive.sh script
- Added full workspace history maintenance

## [0.6.0] - 2023-12-19

### ✨ Features:
- Added initial input tracking with your-initial-input.md
- Added project starting point documentation

## [0.5.0] - 2023-12-19

### 🛠️ Improvements:
- Integrated hours logging system
- Updated reset protocol for hours
- Enhanced workspace structure

## [0.4.0] - 2023-12-19

### ✨ Features:
- Added work hours logging system
- Added plx-log protocol
- Added your-hours.md template

## [0.3.0] - 2023-12-19

### 🛠️ Improvements:
- 💥 Breaking: Restricted file access in protocols to "your-" prefixed files
- 💥 Breaking: Removed process file modifications
- 💥 Breaking: Prevented new file creation

## [0.2.0] - 2023-12-19

### 🛠️ Improvements:
- Enhanced state management with updated protocols
- Added automatic optimization triggers
- Improved workflow clarity

## [0.1.0] - 2023-12-19

### ✨ Features:
- Initial framework setup with core documentation
- Added work hours logging system
- Added framework copy script
- Added complete archival system

### 🛠️ Improvements:
- Implemented basic system prompt
- Added simple workflow
- Added core protocols
- Added essential documentation 

## [0.22.0] - 2024-03-XX
### Added
- Updated code of conduct documentation with new guidelines:
  - Enhanced clarity and structure
  - Added new examples
  - Improved formatting

## [0.21.0] - 2024-03-XX
### Added
- Added new code of conduct documentation structure
- Enhanced documentation patterns
- Improved cross-referencing

## [0.20.0] - 2024-03-XX
### Added
- Introduced new code of conduct category:
- Added `the-work-documents.md` as first code of conduct entry 

## [0.30.0] - 2024-03-XX

### Added
- New `plx-create-plan-in-chat` command for interactive planning:
  - Present structured plans directly in chat
  - Get immediate user feedback
  - Flexible options for plan implementation
  - Integration with milestones and tasks

## [0.31.0] - 2024-03-XX

### Added
- New `plx-analyze` command for structured analysis:
  - Presents findings without taking action
  - Includes overview, key findings, insights, and considerations
  - Waits for user direction before proceeding
  - Supports iterative refinement based on feedback

## [0.32.0] - 2024-03-XX

### Added
- New code of conduct document `how-we-handle-secrets.md` detailing:
  - Secret management process using Firebase Functions secrets manager
  - Template structure and gitignore configuration
  - Update and clear scripts for managing secrets
  - Usage flow for developers
  - Comprehensive verification checklist
