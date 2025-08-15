---
name: sync-to-ppw
description: "Copy user requested files from current project's .pew/ folder to the main pew-pew-workspace repository without the .pew prefix"
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🔄 Sync to Pew: Copy Artifacts to Main Repository

> 💡 *Transfer useful artifacts from current project back to the main pew-pew-workspace repository*

## 🎯 End Goal

Successfully copy specified files or folders from the current project's `.pew/` directory to `~/Repos/pew-pew-workspace/` with proper path transformation, making artifacts available for reuse across all projects.

### Deliverables
- Files/folders copied to correct location in main repository
- Directory structure preserved (minus `.pew/` prefix)
- Confirmation of successful transfer

### Acceptance Criteria
- [ ] Source files identified and validated
- [ ] Destination paths calculated correctly
- [ ] All specified artifacts copied successfully
- [ ] Directory structure maintained in destination

## 📋 Request

Copy the user-specified files or directories from the current project's `.pew/` folder to the main pew-pew-workspace repository, transforming paths by removing the `.pew/` prefix. If user did not specify any files or request is unclear, ask user for clarification. Do not assume which files to copy unless 100% clear and indicated by the user.

## 🔄 Workflow

### Step 1: Analyze Request
**Deliverable:** Clear understanding of what to copy
**Acceptance Criteria:** User input parsed and validated
- Identify the files/folders the user wants to sync
- Validate that source paths exist in current project
- Calculate destination paths in main repository

### Step 2: Show Transfer Plan
**Deliverable:** Preview of what will be copied where
**Acceptance Criteria:** User can see exactly what will happen
- Display source → destination mappings
- Show any directories that will be created
- Confirm paths are correct before proceeding

### Step 3: Execute Copy Operations
**Deliverable:** Files transferred to main repository
**Acceptance Criteria:** All specified content copied successfully
- Create destination directories if they don't exist
- Copy files preserving content and structure
- Report on successful transfers

## 📏 Instructions

### WHEN processing user requests
**Best Practices:**
- Always validate source paths exist before attempting copy
- Show clear preview of what will be copied where
- Create destination directories as needed

**Rules:**
- ALWAYS remove `.pew/` prefix when calculating destination paths
- ALWAYS use full absolute paths for reliability
- MUST confirm source files exist before copying

### WHEN transforming paths
**Examples:**
- `.pew/prompts/example.md` → `~/Repos/pew-pew-workspace/prompts/example.md`
- `.pew/templates/meta/template.md` → `~/Repos/pew-pew-workspace/templates/meta/template.md`
- `.pew/agents/agent.md` → `~/Repos/pew-pew-workspace/agents/agent.md`

**Rules:**
- ALWAYS strip the `.pew/` prefix from the beginning of paths
- ALWAYS preserve the remaining folder structure
- MUST handle both files and directories

### WHEN copying files
**Requirements:**
- Use Read tool to get source content
- Use Write tool to create destination files
- Use LS tool to verify directory structure

**Rules:**
- ALWAYS create parent directories if they don't exist
- ALWAYS preserve file content exactly
- MUST report successful completion

## 📊 Output Format

### Format Type
Terminal-style status updates

### Structure Template
```
🔄 Sync Plan:
Source: [current-project-path]
Destination: [pew-pew-workspace-path]

📁 Directories to create:
- [directory-path]

📄 Files to copy:
- [file-name] → [destination-path]

✅ Sync completed:
- [number] files copied
- [number] directories created
- All artifacts available in main repository
```
