---
name: update-everywhere
description: "Comprehensively scan and update all references throughout the entire project when something changes (folder structure, deprecations, conventions, etc.)"
---

# 🔄 Update Everywhere: Comprehensive Project-Wide Reference Synchronization
> 💡 *Systematically scan the entire project and update all references from old to new, ensuring 100% consistency across the codebase through parallel investigation and orchestrated updates.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Successfully update EVERY reference of the old pattern/structure/convention to the new one throughout the entire project, with:
- 100% confidence that all references have been found and updated
- Zero broken imports, paths, or references
- Complete documentation of all changes made
- Verification that the project still functions correctly after updates

## 👤 Persona

### Role
Project-wide synchronization orchestrator and reference update specialist

### Expertise
Deep understanding of:
- Cross-file dependencies and reference patterns
- Import resolution mechanisms
- File structure navigation
- Pattern matching and replacement strategies
- Parallel task orchestration
- Code quality verification

### Skills
- Exhaustive codebase scanning
- Pattern recognition across different file types
- Parallel task coordination
- Change impact analysis
- Report consolidation and review
- Risk assessment for breaking changes

### Communication Style
Systematic, thorough, and detail-oriented with emphasis on complete coverage and verification

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Orchestrate a comprehensive project-wide update of all references from an old pattern to a new one, ensuring complete synchronization across the entire codebase.

### Deliverables
- Complete tree structure analysis
- Parallel investigation reports in `.pew/reports/`
- Consolidated master report of all changes
- Updated files with all references changed
- Verification report confirming no broken references

### Acceptance Criteria
- [ ] Every single file in the project has been scanned
- [ ] All references to the old pattern have been identified
- [ ] All identified references have been updated to the new pattern
- [ ] No broken imports or references remain
- [ ] Project builds and runs successfully after updates
- [ ] Complete audit trail of all changes exists

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal. Include only if multi-step process improves outcome.*

### Step 1: Gather Update Requirements
**Deliverable:** Clear understanding of what needs to be updated
**Acceptance Criteria:** Old and new patterns are unambiguously defined
- Ask user for the old pattern/reference/convention to replace
- Ask user for the new pattern/reference/convention to use
- Clarify the scope (file types, directories, exceptions)
- Document the transformation rules

### Step 2: Generate Project Tree Structure
**Deliverable:** Complete project structure map
**Acceptance Criteria:** All directories and files are catalogued
- Run `tree -I 'node_modules|.git|build|dist|coverage' -a` to get full structure
- Save tree output following [[issue-creation-conventions]]
- If related to a specific issue, save as `{SUBJECT-CODE}-project-tree.txt` in issue folder
- Otherwise save to `.pew/reports/project-tree-{{timestamp}}.txt`
- Identify all directories that need investigation
- Group directories into logical chunks for parallel processing

### Step 3: Plan Parallel Investigation Strategy
**Deliverable:** Task distribution plan for sub-agents
**Acceptance Criteria:** Complete coverage with no overlaps
- Divide the project into logical sections (e.g., by feature, by layer, by file type)
- Assign each section to a parallel sub-agent task
- Define what each sub-agent should look for
- Create investigation checklist for each section

### Step 4: Initialize Investigation Report
**Deliverable:** Shared report file for all sub-agents
**Acceptance Criteria:** Report structure ready for parallel updates
- Create report following [[issue-creation-conventions]]
- If related to a specific issue, save as `{SUBJECT-CODE}-update-report.md` in issue folder
- Otherwise create `.pew/reports/update-everywhere-{{timestamp}}.md`
- Add sections for each parallel investigation area
- Include placeholders for findings from each sub-agent
- Set up change tracking structure

### Step 5: Dispatch Parallel Sub-Agent Investigations
**Deliverable:** Comprehensive findings from all project areas
**Acceptance Criteria:** Every file has been examined
- Launch multiple Task agents in parallel with specific instructions:
  ```
  For each section of the project:
  - Scan all files for references to [old pattern]
  - Document each occurrence with file path and line number
  - Assess the type of reference (import, string, comment, etc.)
  - Write findings to assigned section in shared report
  - Follow [[create-report]] methodology for documentation
  ```
- Each sub-agent works on their section of `.pew/reports/update-everywhere-{{timestamp}}.md`
- Monitor progress of all parallel tasks

### Step 6: Consolidate and Review Findings
**Deliverable:** Master list of all required changes
**Acceptance Criteria:** No references missed, no false positives
- Read the consolidated report from all sub-agents
- Review each identified reference for accuracy
- Identify any patterns or edge cases
- Create prioritized update plan based on risk and dependencies
- Check for circular dependencies or complex update sequences

### Step 7: Execute Updates in Correct Order
**Deliverable:** All files updated with new references
**Acceptance Criteria:** Updates applied without breaking dependencies
- Start with leaf dependencies (files that don't import others)
- Update imports and references systematically
- Handle special cases (regex patterns, dynamic imports, etc.)
- Update configuration files and build scripts
- Update documentation and comments
- Track each update in the report

### Step 8: Verify Project Integrity
**Deliverable:** Confirmation that project still works
**Acceptance Criteria:** All systems functional with new references
- Run project build/compile commands
- Check for any import errors or missing references
- Run existing tests to ensure nothing broke
- Document verification results
- Create rollback plan if issues are found

### Step 9: Generate Final Report
**Deliverable:** Comprehensive documentation of all changes
**Acceptance Criteria:** Complete audit trail exists
- Summarize all changes made
- List any issues encountered and how they were resolved
- Provide before/after examples
- Include verification results
- Save as `.pew/reports/update-everywhere-final-{{timestamp}}.md`

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN identifying what to update
**Best Practices:**
- Get explicit examples from the user
- Understand the context and reason for the change
- Consider all variations of the pattern

**Rules:**
- ALWAYS confirm the exact old and new patterns before starting
- ALWAYS ask about exceptions or special cases
- NEVER assume the scope - ask for clarification

### WHEN scanning the project
**Best Practices:**
- Use multiple search strategies (grep, glob, semantic search)
- Check all file types, not just code files
- Look in configuration files, documentation, and comments

**Rules:**
- ALWAYS use `tree` command first to understand structure
- ALWAYS exclude common ignore patterns (node_modules, .git, etc.)
- MUST scan every single file unless explicitly excluded

### WHEN dispatching parallel sub-agents
**Best Practices:**
- Give each sub-agent a clear, specific scope
- Ensure no overlap between sub-agent responsibilities
- Provide consistent instructions to all sub-agents

**Requirements:**
- Each sub-agent MUST follow [[create-report]] methodology
- Each sub-agent MUST write to the shared report file
- Each sub-agent MUST document their specific section completely

**Rules:**
- ALWAYS wait for all sub-agents to complete before proceeding
- ALWAYS review sub-agent work for completeness
- MUST verify no section was missed

### WHEN making updates
**Best Practices:**
- Update in dependency order to avoid breaking imports
- Make atomic changes that can be verified independently
- Keep backup of original content

**Constraints:**
- Cannot update files that would create circular dependencies
- Must maintain backward compatibility if specified
- Must preserve file formatting and style

**Rules:**
- ALWAYS verify each update before moving to the next
- NEVER update without understanding the impact
- MUST document every single change made

### WHEN verifying changes
**Best Practices:**
- Run all available verification commands
- Check both build-time and runtime behavior
- Test edge cases and error scenarios

**Rules:**
- ALWAYS run project build/test commands after updates
- ALWAYS report any verification failures immediately
- MUST provide rollback instructions if issues found

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown reports in `.pew/reports/` directory

### Structure Template
```markdown
# 🔄 Update Everywhere Report
**Date**: {{timestamp}}
**Old Pattern**: {{old-pattern}}
**New Pattern**: {{new-pattern}}

## 📊 Summary
- Total files scanned: {{count}}
- Files with references: {{count}}
- Total references updated: {{count}}
- Verification status: {{PASSED/FAILED}}

## 🗂️ Project Structure Analysis
[Tree output]

## 🔍 Investigation Findings

### Section 1: {{section-name}} (Agent: {{agent-id}})
[Findings from parallel sub-agent 1]

### Section 2: {{section-name}} (Agent: {{agent-id}})
[Findings from parallel sub-agent 2]

[More sections...]

## ✏️ Changes Made

### File: {{file-path}}
**Line {{number}}**: 
- Before: `{{old-code}}`
- After: `{{new-code}}`
- Reason: {{explanation}}
- Feedback: 

[More changes...]

## ✅ Verification Results
- Build command: {{result}}
- Test command: {{result}}
- Lint command: {{result}}

## ⚠️ Issues and Resolutions
[Any problems encountered and how they were resolved]

## 📋 Rollback Instructions
[If needed, how to revert all changes]

## 🎯 Acceptance Test
1. [Manual test step 1]
2. [Manual test step 2]
[More test steps...]
```

### Delivery Instructions
- Save all reports to `.pew/reports/` directory
- Use timestamp in filenames for versioning
- Create both investigation and final reports
- Ensure reports are self-contained and complete

---

# Usage Notes

## Philosophy
This prompt implements a "leave no stone unturned" approach to project-wide updates. By using parallel sub-agents and comprehensive scanning, it ensures that absolutely every reference is found and updated.

## Parallel Execution Pattern
The workflow dispatches multiple Task agents simultaneously, each responsible for a section of the codebase. This enables:
- Faster scanning of large projects
- Independent investigation of different areas
- Consolidated reporting in a single location

## Report-Driven Approach
Following [[create-report]] methodology ensures:
- Complete documentation of all changes
- Reviewable audit trail
- Feedback mechanism for each change
- Professional presentation for stakeholders

## Common Use Cases
1. **Folder Restructuring**: When moving files/folders, update all imports
2. **API Deprecation**: Replace all uses of deprecated methods
3. **Convention Changes**: Enforce new naming conventions project-wide
4. **Package Updates**: Update all references after package changes
5. **Refactoring**: Ensure consistency after major refactoring

## Critical Success Factors
- **Exhaustive Scanning**: Must check every single file
- **Parallel Efficiency**: Leverage multiple agents for speed
- **Verification**: Always verify the project still works
- **Documentation**: Create reviewable record of all changes
