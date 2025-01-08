# Changelog

All notable changes to this workspace will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
