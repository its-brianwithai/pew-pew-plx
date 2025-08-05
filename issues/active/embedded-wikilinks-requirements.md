# Requirements: Embedded WikiLinks Processing Feature

## Activity Flows

### 1. Main Sync Workflow Integration

**Happy Path:**
1. [Developer] executes `plx sync claude` command
2. [Sync Orchestrator] creates temp directory structure
3. [Sync Orchestrator] exports CLAUDE_SYNC_TEMP_DIR variable
4. [Sync Orchestrator] executes agent sync
5. [Sync Orchestrator] executes prompt sync
6. [Sync Orchestrator] executes template sync
7. [Sync Orchestrator] executes workflow sync
8. [Sync Orchestrator] executes instruction sync
9. [Sync Orchestrator] executes embedded WikiLink processing (NEW)
10. [Embedded Processor] processes all files with embedded links
11. [Sync Orchestrator] executes standard WikiLink processing
12. [Standard Processor] processes remaining WikiLinks
13. [Sync Orchestrator] moves files from temp to final location
14. [System] reports success to developer

**Error Flow - Embedded Processing Fails:**
1. [Developer] executes `plx sync claude` command
2-8. [System] performs steps 2-8 as abo
2. ve
9. [Sync Orchestrator] executes embedded WikiLink processing
10. [Embedded Processor] encounters error (e.g., disk full)
11. [Embedded Processor] logs error to stderr
12. [Embedded Processor] exits with non-zero code
13. [Sync Orchestrator] detects failure
14. [Sync Orchestrator] cleans up temp directory
15. [System] reports error to developer

### 2. Embedded WikiLink Processing

**Happy Path - Simple Embed:**
1. [Embedded Processor] reads markdown file
2. [Embedded Processor] identifies line with `![[filename]]`
3. [Embedded Processor] searches for filename in project directories
4. [File Searcher] finds file in `/blocks/` directory
5. [Content Extractor] reads file content
6. [Content Extractor] strips YAML front-matter
7. [Content Extractor] trims leading/trailing blank lines
8. [Line Replacer] replaces entire line with content
9. [Embedded Processor] writes updated file
10. [Embedded Processor] increments processed counter

**Happy Path - Recursive Embed:**
1. [Embedded Processor] reads markdown file with `![[parent]]`
2. [Embedded Processor] searches and finds parent.md
3. [Content Extractor] reads parent.md content
4. [Embedded Processor] detects `![[child]]` in parent content
5. [Embedded Processor] adds parent to processing chain
6. [Embedded Processor] searches and finds child.md
7. [Content Extractor] reads child.md content
8. [Embedded Processor] replaces `![[child]]` in parent content
9. [Embedded Processor] replaces `![[parent]]` with expanded content
10. [Embedded Processor] writes final result

**Error Flow - Circular Reference:**
1. [Embedded Processor] processes file A with `![[B]]`
2. [Embedded Processor] adds A to processing chain
3. [Embedded Processor] reads file B content
4. [Embedded Processor] detects `![[A]]` in B content
5. [Embedded Processor] checks processing chain
6. [Embedded Processor] detects A already in chain
7. [Embedded Processor] logs warning about circular reference
8. [Embedded Processor] preserves `![[A]]` in B content
9. [Embedded Processor] continues processing
10. [Embedded Processor] completes with warning logged

**Error Flow - File Not Found:**
1. [Embedded Processor] identifies `![[missing-file]]`
2. [File Searcher] searches project directories
3. [File Searcher] searches .claude directories
4. [File Searcher] returns not found
5. [Embedded Processor] logs warning to stderr
6. [Embedded Processor] preserves original `![[missing-file]]`
7. [Embedded Processor] continues processing other embeds
8. [Embedded Processor] completes with warnings

**Error Flow - Max Depth Exceeded:**
1. [Embedded Processor] processes deeply nested embeds
2. [Embedded Processor] tracks current depth level
3. [Embedded Processor] reaches depth 10
4. [Embedded Processor] encounters another embed
5. [Embedded Processor] checks depth against limit
6. [Embedded Processor] logs warning about depth limit
7. [Embedded Processor] preserves embed at depth 11
8. [Embedded Processor] continues at current depth
9. [Embedded Processor] completes processing

### 3. Content Extraction

**Happy Path - YAML Front-matter:**
1. [Content Extractor] reads file content
2. [Content Extractor] checks for `---` at start
3. [Content Extractor] finds closing `---`
4. [Content Extractor] removes front-matter section
5. [Content Extractor] trims blank lines
6. [Content Extractor] returns clean content

**Happy Path - No Front-matter:**
1. [Content Extractor] reads file content
2. [Content Extractor] checks for `---` at start
3. [Content Extractor] finds no front-matter
4. [Content Extractor] trims blank lines
5. [Content Extractor] returns full content

## Deliverables

### Script Development (Dev Team)
- **sync-claude-code-embedded-wikilinks.sh** (2.5 story points total)
  - Core script with file processing loop
  - Reuse file search functions from existing WikiLink script
  - Simple front-matter removal (check for `---` delimiters)
  - Recursive content expansion with depth tracking
  - Basic circular reference detection (track chain)
  - Simple content caching (associative array)

### Integration (Dev Team)  
- **Modified sync-claude-code.sh** (0.5 story points)
  - Add single line to call embedded script before WikiLinks script

### Documentation (Dev Team)
- **Updated CLAUDE.md** (included in development)
  - Add brief note about embedded WikiLink support

## Dependencies Between Deliverables

```
sync-claude-code-embedded-wikilinks.sh
├── File search functions → Content extraction
├── Content extraction → Recursive processing
├── Recursive processing → Circular reference detection
└── All components → Cache implementation

Modified sync-claude-code.sh
└── Depends on: sync-claude-code-embedded-wikilinks.sh

Test scenarios
└── Depends on: Complete script implementation

Documentation
└── Depends on: Final implementation details
```

## Summary

This requirements document details all activity flows for the embedded WikiLinks processing feature. The implementation is a straightforward 3 story point task - essentially adding one new script that preprocesses embedded WikiLinks before the existing WikiLink processor runs. The script will reuse existing patterns and functions from the current WikiLink processor, making this a simple extension rather than a complex new feature.
