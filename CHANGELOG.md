---
document_type: documentation
goal: track framework changes and updates
gpt_action: use as reference for framework version history
---

# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

All notable changes to the Ultra Wide Turbo framework will be documented in this file.

## [0.16.0] - 2024-01-08

### Added
- New `plx-transfer` protocol for seamless agent handover
- New `your-transfer.md` template for context transfer between agents
- Added Transfer as fourth core pillar in framework
- Added seamless agent handover to framework features
- Added `scripts/create_workspace.sh` for automated workspace creation
  - Interactive component selection
  - Smart workspace naming with date-based suffixes
  - Kebab case conversion for user input
  - Selective component copying based on user choice

### Changed
- Updated README.md with transfer protocol documentation
- Enhanced PLX Commands table with transfer protocol details
- Modified workspace creation script to use custom base names
  - Now accepts user input for base name (e.g., "my-project-0801-wed-01")
  - Maintains date and sequential numbering format
  - Default base name remains "turbo-workspace"

## [0.15.0] - 2024-01-08

### Added
- New templates in `/templates`:
  - `the-task-template.md`
  - `the-story-template.md`
  - `the-bug-template.md`
  - `the-requirements-template.md`
- Enhanced development workflow documentation:
  - Updated `the-development-workflow.md` with clear phases
  - Improved agent work documents:
    - `your-requirements.md` with comprehensive structure
    - `your-ticket.md` with detailed sections
    - `your-todo-list.md` with milestone tracking
- New workspace creation script:
  - Added `scripts/create_workspace.sh`
  - Interactive component selection
  - Automatic kebab-case folder naming
  - Copies framework files to new workspace
  - Creates workspace in parent directory
  - Visual feedback during creation

### Changed
- Restructured agent work documents to follow consistent format:
  - Clear metadata headers
  - Emoji-based section headers
  - Detailed section descriptions
  - Improved task organization
  - Better progress tracking

## [0.14.0] - 2024-01-08

### Added
- New protocol structure following `how_we_create_docs.md` template
- Actor/action syntax using double brackets
- Hierarchical relationships between actions
- Conditional flows with IF statements
- Feedback loop integration in all protocols
- Markdown code blocks for structured data

### Changed
- Restructured all protocols to follow consistent format:
  - Clear goal and gpt_action in metadata
  - Emoji-based section headers
  - Hierarchical action structure
  - Structured data templates
  - User feedback integration

### Removed
- Outdated protocols:
  - plx-start
  - plx-document
  - plx-refine
  - plx-collect
  - plx-next
  - plx-optimise
  - plx-finish
  - plx-reset

### Updated Protocols
- `plx-add`: Content addition workflow
- `plx-ask`: Self-check information process
- `plx-ask-smarter-agent`: Smarter agent interaction
- `plx-commit`: Git commit handling
- `plx-config`: Framework configuration
- `plx-content`: Content creation process
- `plx-context`: Conversation context building
- `plx-dart-document`: Dart documentation creation
- `plx-focus`: Task evaluation
- `plx-log`: Work activity recording
- `plx-pause`: State preservation
- `plx-release`: Release execution
- `plx-resume`: Work continuation
- `plx-stick-to-the-process`: Workflow realignment
- `plx-sync`: Work alignment verification
- `plx-test`: Testing process execution

### Improved
- Clear separation of concerns in protocols
- Consistent documentation patterns
- Better process flow visualization
- Enhanced error handling
- Structured data templates
- User interaction patterns

### Development Workflow
- Implemented clear planning phase
- Structured development process
- Defined release procedures
- Added test-driven development support
- Integrated continuous feedback loops 

## [0.13.0] - 2023-12-20

### Added
- New `_plx-scan.md` protocol for comprehensive repository scanning and context updating
- Protocol includes steps for analyzing repository structure, core files, and updating all context files

## [0.12.0] - 2023-12-20

### Changed
- Simplified all PLX protocol files to be more concise and task-focused
- Removed redundant sections and complex status indicators
- Updated protocol formats to use clear task lists with checkboxes
- Improved protocol readability and maintainability

### Removed
- Removed complex file structure references (*.context.md, *.history.md)
- Removed redundant verification sections
- Removed `_plx-ask-other-agent.md` protocol
- Removed `simple-todo-todo.md`

## [0.11.0] - 2023-12-20

### Added
- Added creation date to README.md
- Fixed historical dates in CHANGELOG.md to reflect actual project creation

### Changed
- Updated documentation to reflect correct project timeline
- Improved version history accuracy

### Added
- New `plx-stick-to-the-process` protocol to help agent stay focused
- New task process workflow in system prompt
- Updated README to reflect new workflow

### Changed
- Simplified system prompt to focus on core workflow
- Updated README's system prompt section
- Made PLX commands clearer in documentation

### Fixed
- Clarified that PLX commands are user tools
- Improved process adherence guidance
- Made task workflow more explicit

## [0.10.0] - 2023-12-19

### Added
- Content collection protocol:
  - Added plx-content command
  - Structured content package template
  - Social media content preparation
  - Educational content focus
  - Technical documentation integration

## [0.9.0] - 2023-12-19

### Changed
- Updated system prompt to focus on milestone-based workflow
- Simplified protocol usage section in README
- Updated response formats to focus on milestone completion and blockers
- Clarified interaction points at milestone boundaries
- Improved framework file organization:
  - Added underscore prefix to framework files
  - Updated copy-framework.sh to handle underscore transformation
  - Enhanced archive.sh to use parent directory as default
  - Improved archive organization with timestamps

### Added
- New milestone-based development flow in system prompt
- Clear milestone completion format
- Structured blocker reporting format
- Better framework file handling:
  - Easier @tag completion in IDEs
  - Cleaner framework file copying
  - Improved archive structure
  - Better default paths

## [0.8.0] - 2023-12-19

### Added
- Framework copy script:
  - Added copy-framework.sh
  - Copy all framework files to target
  - Default to parent directory
  - Preserve file structure

## [0.7.0] - 2023-12-19

### Added
- Complete archival system:
  - Added archive.sh script
  - Archive all files, not just personal ones
  - Preserve file frontmatter on reset
  - Maintain full workspace history

## [0.6.0] - 2023-12-19

### Added
- Initial input tracking:
  - Added your-initial-input.md
  - Store project starting point
  - Track original requirements
  - Document initial analysis

## [0.5.0] - 2023-12-19

### Changed
- Integrated hours logging:
  - Added our-hours.md to archive process
  - Updated reset protocol for hours
  - Streamlined file management
  - Enhanced workspace structure

## [0.4.0] - 2023-12-19

### Added
- Work hours logging system:
  - Added plx-log protocol
  - Created our-hours.md template
  - Structured time tracking
  - Progress monitoring

## [0.3.0] - 2023-12-19

### Changed
- Restricted file access in protocols:
  - Limited to "your-" prefixed files only
  - Removed process file modifications
  - Prevented new file creation
  - Clarified file access rules

## [0.2.0] - 2023-12-19

### Changed
- Enhanced state management:
  - Updated plx-pause protocol to focus on file updates
  - Updated plx-resume protocol to focus on file reading
  - Removed redundant context handling
  - Improved workflow clarity 

### Added
- Automatic optimization triggers:
  - Added file size monitoring
  - Set 100-line threshold for optimization
  - Added pre/post milestone triggers
  - Integrated with core workflows 

## [0.1.0] - 2023-12-19

### Added
- Initial framework setup:
  - Core documentation structure
  - Basic workflow protocols
  - File templates
  - Utility scripts
- Work hours logging system:
  - Added plx-log protocol
  - Created our-hours.md template
  - Structured time tracking
  - Progress monitoring
- Framework copy script:
  - Added copy-framework.sh
  - Copy all framework files to target
  - Default to parent directory
  - Preserve file structure
- Complete archival system:
  - Added archive.sh script
  - Archive all files
  - Preserve file frontmatter
  - Maintain workspace history

### Changed
- First implementation:
  - Basic system prompt
  - Simple workflow
  - Core protocols
  - Essential documentation 