# 📋 Development Plan: Pew-Pew-Plx Sync Refactor
> 💡 *A comprehensive refactoring of the sync system to implement new directory structures, command patterns, and wiki link processing for Claude Code integration.*

## 🎯 Project Overview

This project refactors the existing sync system to implement a new organizational structure for Claude Code commands. The sync will reorganize content from multiple source directories into a hierarchical command structure, process wiki links to absolute paths, and inject appropriate command blocks for each file type.

## 🤖 AI Agent Context

### 📚 Relevant Project Files & Code
*   [[issues/cli/003-sync-refactor]] - (Relevance: Complete requirements specification)
*   [[scripts/claude-code/sync-claude-code.sh]] - (Relevance: Main sync orchestrator script)
*   [[scripts/claude-code/sync-claude-code-agents.sh]] - (Relevance: Current agent sync implementation)
*   [[scripts/claude-code/sync-claude-code-prompts.sh]] - (Relevance: Current prompts sync implementation)
*   [[scripts/claude-code/sync-claude-code-templates.sh]] - (Relevance: Current templates sync implementation)
*   [[scripts/claude-code/sync-claude-code-workflows.sh]] - (Relevance: Current workflows sync implementation)
*   [[scripts/claude-code/sync-claude-code-wikilinks.sh]] - (Relevance: Wiki links processing logic)

### 🌐 Relevant Documentation & Links
*   [[CLAUDE.md]] - (Relevance: Project documentation for Claude Code integration)
*   [[Makefile]] - (Relevance: Build system that calls sync scripts)

### 💡 Other Key Information
*   The sync system must maintain backward compatibility with existing Claude Code commands
*   Wiki links must be resolved in a specific order: project locations first (prompts, agents, instructions, templates, context, docs), then .claude folder recursively
*   All command files need appropriate meta-command blocks injected based on their type

## 📋 Requirements

### 🧩 Actors & Components

*   **Sync Scripts**
    *   sync-claude-code.sh (Orchestrator)
    *   sync-claude-code-agents.sh
    *   sync-claude-code-prompts.sh
    *   sync-claude-code-templates.sh
    *   sync-claude-code-workflows.sh
    *   sync-claude-code-instructions.sh (New)
    *   sync-claude-code-wikilinks.sh
*   **Source Directories**
    *   agents/
    *   prompts/
    *   templates/
    *   workflows/
    *   instructions/ (New)
*   **Target Directories**
    *   .claude/agents/
    *   .claude/commands/act/
    *   .claude/commands/plx/{verb}/
    *   .claude/commands/use/
    *   .claude/commands/start/
    *   .claude/follow/ (New)
*   **Command Block Templates**
    *   blocks/meta/agent-command-block.md
    *   blocks/meta/prompt-command-block.md
    *   blocks/meta/template-command-block.md
    *   blocks/meta/workflow-command-block.md
    *   blocks/meta/instruction-command-block.md

### 🎬 Activities

*   **Sync Scripts**
    *   Process source files
    *   Transform filenames based on rules
    *   Inject command blocks
    *   Copy to target directories
*   **Wiki Link Processor**
    *   Find wiki links in files
    *   Resolve to absolute paths
    *   Replace in-place

#### 🌊 Activity Flows & Scenarios

*   **Prompt Sync Flow**
    *   **Happy Flow:**
        *   GIVEN a prompt file with pattern `{verb}-{object}.md`
        *   WHEN sync-claude-code-prompts.sh runs
        *   THEN file is copied to `.claude/commands/plx/{verb}/{object}.md` with prompt command block injected
    *   **Single Word Flow:**
        *   GIVEN a prompt file with single word name
        *   WHEN sync-claude-code-prompts.sh runs
        *   THEN file is copied to `.claude/commands/plx/` root with prompt command block injected

*   **Wiki Link Resolution Flow**
    *   **Happy Flow:**
        *   GIVEN a file containing `[[filename]]` wiki link
        *   WHEN wiki link processor runs
        *   THEN link is replaced with `@.claude/path/to/filename.md` based on search order

### 📝 Properties

*   **Sync Configuration**
    *   source_directory : string
    *   target_directory : string
    *   filename_transform : function
    *   command_block_type : string
*   **Wiki Link Search Order**
    *   project_locations : array[prompts, agents, instructions, templates, context, docs]
    *   claude_recursive : boolean

### 🛠️ Behaviours

*   **Filename Transformations**
    *   Prompts: `{verb}-{object}.md` → `.claude/commands/plx/{verb}/{object}.md`
    *   Prompts: `{single-word}.md` → `.claude/commands/plx/{single-word}.md`
    *   Agents: `{name}.md` → `.claude/commands/act/{name}.md` (no as- prefix)
    *   Instructions: `{name}.md` → `.claude/follow/{name}.md`
*   **Command Block Injection**
    *   Blocks must be inserted after frontmatter if present
    *   Each file type gets its specific command block
    *   Command blocks should instruct to greet user and take on persona

## 🛣️ Phases and Tasks

### Phase 1: Create Command Block Templates
> 💡 *Create the missing command block templates that will be injected into synced files.*

#### Task 1.1: Create Command Block Templates
- **Description:** Create template files for each command type
- **Files to Change:**
    - Create: `blocks/meta/agent-command-block.md`
    - Create: `blocks/meta/prompt-command-block.md`
    - Create: `blocks/meta/template-command-block.md`
    - Create: `blocks/meta/workflow-command-block.md`
    - Create: `blocks/meta/instruction-command-block.md`
- **Instructions:**
    1. Each block should contain instructions for Claude to greet the user
    2. Include instructions to take on the appropriate persona
    3. Include instructions to wait for user input

### Phase 2: Refactor Individual Sync Scripts
> 💡 *Update each sync script to implement new directory structures and filename transformations.*

#### Task 2.1: Refactor Prompts Sync Script
- **Description:** Update prompts sync to handle verb/object pattern and inject command blocks
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-prompts.sh`
- **Methods to Change:**
    - Create: Function to parse verb/object from filename
    - Create: Function to inject command block from template
- **Instructions:**
    1. Parse prompt filenames for verb-object pattern
    2. Create subdirectories for verbs under `.claude/commands/plx/`
    3. Transform filenames removing verb prefix for multi-word prompts
    4. Inject prompt command block after frontmatter

#### Task 2.2: Update Agents Sync Script
- **Description:** Ensure agents sync without as- prefix and inject command blocks
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-agents.sh`
- **Instructions:**
    1. Verify removal of as- prefix is working
    2. Update command block injection to use new template

#### Task 2.3: Create Instructions Sync Script
- **Description:** Create new script to sync instructions to follow directory
- **Files to Change:**
    - Create: `scripts/claude-code/sync-claude-code-instructions.sh`
- **Instructions:**
    1. Copy structure from existing sync scripts
    2. Source from `instructions/` directory
    3. Target `.claude/follow/` directory
    4. Inject instruction command block

#### Task 2.4: Update Templates Sync Script
- **Description:** Update templates sync to use new command block
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-templates.sh`
- **Instructions:**
    1. Update to use new template command block
    2. Ensure proper frontmatter handling

#### Task 2.5: Update Workflows Sync Script
- **Description:** Update workflows sync to use new command block
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-workflows.sh`
- **Instructions:**
    1. Update to use new workflow command block
    2. Ensure proper frontmatter handling

### Phase 3: Enhance Wiki Links Processing
> 💡 *Update wiki links processor to handle new search order and all directories.*

#### Task 3.1: Refactor Wiki Links Search Logic
- **Description:** Implement proper search order for wiki link resolution
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-wikilinks.sh`
- **Methods to Change:**
    - Create: Function to search project directories in order
    - Create: Function to search .claude recursively
- **Instructions:**
    1. Implement search in project directories first: prompts, agents, instructions, templates, context, docs
    2. If not found in project, search .claude recursively
    3. Update replacement logic to handle all command directories including new ones

#### Task 3.2: Add Instructions Directory to Wiki Links
- **Description:** Ensure wiki links processor checks instructions and follow directories
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code-wikilinks.sh`
- **Instructions:**
    1. Add instructions/ to project search paths
    2. Add .claude/follow/ to command directory checks

### Phase 4: Update Main Sync Orchestrator
> 💡 *Update the main sync script to include new scripts and ensure proper execution order.*

#### Task 4.1: Add Instructions Sync to Main Script
- **Description:** Include instructions sync in main orchestration
- **Files to Change:**
    - Update: `scripts/claude-code/sync-claude-code.sh`
- **Instructions:**
    1. Add call to sync-claude-code-instructions.sh
    2. Ensure it runs before wiki links processing

### Phase 5: Testing and Validation
> 💡 *Implement tests to ensure all sync functionality works correctly.*

#### Task 5.1: Create Test Structure
- **Description:** Create test files to validate sync behavior
- **Files to Change:**
    - Create: `test/sync/test-prompts/create-issue.md`
    - Create: `test/sync/test-agents/test-agent.md`
    - Create: `test/sync/test-instructions/conventions.md`
- **Instructions:**
    1. Create sample files with wiki links
    2. Include various filename patterns
    3. Test frontmatter and no-frontmatter cases

#### Task 5.2: Create Validation Script
- **Description:** Create script to validate sync output
- **Files to Change:**
    - Create: `scripts/claude-code/validate-sync.sh`
- **Instructions:**
    1. Check all expected directories exist
    2. Verify filename transformations
    3. Confirm wiki links are resolved
    4. Validate command blocks are injected
