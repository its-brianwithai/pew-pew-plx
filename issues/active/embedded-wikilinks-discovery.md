# Discovery: Embedded WikiLinks Processing Feature

## Initial Request

The user wants to add a new script that replaces embedded WikiLinks `![[filename]]` in the pew-pew-plx framework. This script should:

1. Process embedded WikiLinks with the syntax `![[filename]]`
2. Run BEFORE the normal WikiLink replacement script
3. Handle recursive embedded WikiLinks (embedded content can contain more embedded WikiLinks)
4. Replace the entire line containing the embedded WikiLink with the document's content
5. Exclude front-matter when embedding content

## Context Research

### Current WikiLink Processing
- The existing `sync-claude-code-wikilinks.sh` script processes standard WikiLinks `[[filename]]`
- Converts them to absolute paths using `@path/to/file.md` format
- Searches in project directories first, then `.claude/` directories
- Runs as the last step in the sync workflow

### Sync Workflow Order
1. Agents sync
2. Prompts sync
3. Templates sync
4. Workflows sync
5. Instructions sync
6. WikiLinks processing (current - needs modification)

### Embedded WikiLinks Use Cases
- Including reusable content blocks in multiple documents
- Creating composite documents from smaller components
- Maintaining single source of truth for shared content
- Building complex documentation from modular pieces

## Actors & Components

### Human Actors
- **Developer**: Uses the CLI to sync framework components, expects embedded content to be resolved
- **Content Author**: Creates markdown files with embedded WikiLinks, needs transclusion support

### System Actors
- **Sync Script Orchestrator** (`sync-claude-code.sh`): Manages the overall sync workflow
- **Embedded WikiLink Processor** (new): Processes embedded WikiLinks recursively
- **Standard WikiLink Processor** (`sync-claude-code-wikilinks.sh`): Processes standard WikiLinks

### Components
- **Script Components**:
  - `sync-claude-code-embedded-wikilinks.sh` (new): Main embedded processing script
  - Modified `sync-claude-code.sh`: Updated to call embedded script before standard WikiLinks
  
- **Processing Components**:
  - File searcher: Locates files referenced in embedded WikiLinks
  - Content extractor: Reads file content excluding front-matter
  - Recursive processor: Handles nested embedded WikiLinks
  - Line replacer: Replaces lines containing embedded WikiLinks

## High-Level Requirements

### Embedded WikiLink Processor
**Abilities:**
- Process all markdown files in temp/final .claude directory
- Identify embedded WikiLinks with `![[filename]]` syntax
- Search for referenced files in project and .claude directories
- Extract content excluding YAML front-matter
- Process embedded WikiLinks recursively
- Replace entire lines containing embedded WikiLinks
- Handle multiple embedded WikiLinks per file
- Report processing statistics

**States:**
- Current file being processed
- Set of processed embedded links (to prevent infinite recursion)
- Processing depth level
- Count of files processed
- Count of embedded links resolved

### Sync Script Orchestrator
**Abilities (modified):**
- Call embedded WikiLink processor before standard WikiLink processor
- Pass temp directory environment variable to embedded processor

## Dependencies

### Need (External)
- Bash shell environment
- Standard Unix tools (find, grep, sed, awk)
- Temp directory for atomic operations

### Have (Internal)
- Existing WikiLink processing patterns to follow
- File search functions from current WikiLink processor
- Project directory structure knowledge
- Sync workflow framework

### Missing
- Script for processing embedded WikiLinks
- Front-matter extraction logic
- Recursive processing strategy
- Infinite recursion prevention

### Unknown
- ~~Maximum recursion depth to support~~ → Resolved: Use depth limit (10 levels default)
- ~~Performance impact with deeply nested embeds~~ → Resolved: Implement caching
- ~~Edge cases with circular references~~ → Resolved: Track and escape cycles
- ~~Behavior when embedded file not found~~ → Resolved: Log warning, preserve original

## Resolved Design Decisions

Based on requirements analysis:

1. **Recursion Depth**: Maximum depth of 10 levels (configurable via environment variable)
2. **Circular References**: Track processed files in chain, escape when cycle detected, log warning
3. **Missing Files**: Preserve original `![[filename]]` syntax, log warning to stderr
4. **Line Replacement**: Trim leading and trailing blank lines from embedded content
5. **Front-matter Detection**: Support YAML front-matter only (delimited by `---`)
6. **Performance**: Cache file contents during single execution to avoid re-reading

## Summary

This feature adds embedded WikiLink processing to the pew-pew-plx framework, enabling content transclusion in markdown documents. The implementation requires a new script that runs before the existing WikiLink processor, handles recursive embedding, and integrates seamlessly with the current sync workflow.
