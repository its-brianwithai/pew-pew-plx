# Refinement: Embedded WikiLinks Processing Feature

## Component Properties

### sync-claude-code-embedded-wikilinks.sh

**Identity Properties:**
- `SCRIPT_NAME`: "sync-claude-code-embedded-wikilinks.sh"
- `SCRIPT_PATH`: "/scripts/claude-code/"
- `VERSION`: "1.0.0"

**Configuration Properties:**
- `MAX_RECURSION_DEPTH`: integer (default: 10, from env var CLAUDE_EMBED_MAX_DEPTH)
- `CACHE_ENABLED`: boolean (default: true)
- `PROJECT_ROOT`: string (inherited from parent script)
- `CLAUDE_SYNC_TEMP_DIR`: string (environment variable)
- `SEARCH_DIRS`: array ("blocks" "prompts" "agents" "instructions" "templates" "context" "docs")

**State Properties:**
- `content_cache`: associative array (filename -> content)
- `processing_chain`: array (stack of files being processed)
- `current_depth`: integer (0 to MAX_RECURSION_DEPTH)
- `files_processed`: integer counter
- `embeds_resolved`: integer counter
- `warnings_count`: integer counter

### File Processing Functions

**find_file()**
- Input: `filename` (string without extension)
- Output: `filepath` (absolute path) or empty string
- Reuses logic from existing WikiLink processor

**extract_content()**
- Input: `filepath` (absolute path)
- Output: `content` (string with front-matter removed)
- Properties:
  - `has_frontmatter`: boolean
  - `content_lines`: array of strings
  - `frontmatter_end`: line number

**process_embedded_content()**
- Input: `content` (string), `depth` (integer), `chain` (array)
- Output: `expanded_content` (string)
- Properties:
  - `embed_pattern`: regex `!\[\[[^]]+\]\]`
  - `current_file`: string (from chain)
  - `is_recursive`: boolean

## Component Behaviours

### Script Behaviours

**UI/UX:**
- Display progress indicator: "🔗 Processing embedded wikilinks..."
- Show file counter: "Processing: X/Y files"
- Report completion: "✅ Processed embedded wikilinks in Y files (Z embeds resolved)"
- Warning format: "⚠️ [TYPE]: message" to stderr

**Rules & Limits:**
- Process only `.md` files in target directory
- Skip files without embedded WikiLinks
- Stop recursion at MAX_RECURSION_DEPTH
- Detect cycles by checking processing_chain
- Preserve original syntax when file not found
- Strip YAML front-matter between `---` markers
- Trim leading/trailing blank lines from embedded content

**Data & Analytics:**
- Track total files scanned
- Count files with embedded WikiLinks
- Count total embeds resolved
- Count warnings (missing files, cycles, depth limits)
- Log processing time if CLAUDE_DEBUG=1

**Security:**
- Validate file paths (no directory traversal)
- Read-only file operations
- Temp file creation with proper permissions
- No execution of embedded content

**Performance:**
- Cache file contents during execution
- Process files in single pass
- Use native bash string operations
- Reuse existing search functions
- Minimal regex usage

### Content Processing Behaviours

**Front-matter Detection:**
- Check if first line is exactly `---`
- Find next line that is exactly `---`
- Remove all lines between and including markers
- If no closing marker, treat as no front-matter

**Recursive Processing:**
- Track depth from 0
- Increment depth for each nested embed
- Add current file to processing chain
- Process embeds depth-first
- Remove from chain after processing
- Check chain for cycles before processing

**Line Replacement:**
- Identify complete line containing `![[...]]`
- Extract embed reference
- Replace entire line (not just the embed syntax)
- Preserve indentation of original line
- Join multi-line embedded content

## System Architecture

### Integration Flow
```
sync-claude-code.sh
    ├── Create temp directory
    ├── Export CLAUDE_SYNC_TEMP_DIR
    ├── Run component syncs...
    ├── sync-claude-code-embedded-wikilinks.sh (NEW)
    │   ├── Process files in temp dir
    │   ├── Expand embedded WikiLinks
    │   └── Update files in place
    ├── sync-claude-code-wikilinks.sh
    │   ├── Process remaining WikiLinks
    │   └── Convert to absolute paths
    └── Move to final location
```

### Data Flow
```
Input File → Read Content → Find Embeds → 
    ├── [Found] → Load File → Extract Content → 
    │   ├── Check Cache
    │   ├── Remove Frontmatter
    │   ├── Process Recursively
    │   └── Replace Line
    └── [Not Found] → Log Warning → Preserve Original
→ Write Output
```

### File Search Strategy
```
Search Order (same as WikiLink processor):
1. Project directories (/blocks, /prompts, etc.)
2. .claude directories (recursive)
3. Return first match or empty
```

### Caching Strategy
```bash
declare -A content_cache
# Key: absolute_filepath
# Value: processed_content (no frontmatter)
# Lifetime: single script execution
```

## Error Handling

### Error Types and Responses
- **File Not Found**: Log warning, preserve `![[filename]]`
- **Circular Reference**: Log warning, skip embedding
- **Max Depth Exceeded**: Log warning, preserve embed
- **Read Permission Denied**: Log error, preserve embed
- **Disk Full**: Exit with error code 1
- **Invalid Syntax**: Ignore (not an embed)

## Summary

This refinement document provides the complete technical specification for the embedded WikiLinks processor. The implementation is straightforward - a bash script that follows the existing patterns from the WikiLink processor, adds recursive content embedding with simple safeguards, and integrates cleanly into the sync workflow. Total complexity: 3 story points.