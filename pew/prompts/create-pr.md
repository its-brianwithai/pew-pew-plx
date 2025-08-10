---
name: create-pr
description: "Create a comprehensive pull request with detailed technical documentation"
---
# Create Pull Request

Your task is to create a comprehensive pull request towards the target branch, ensuring all documentation is updated and a detailed technical report is generated.

<instruction>
Execute the pull request creation workflow, ensuring local and remote synchronization, proper branch management, and comprehensive technical documentation.
</instruction>

<prerequisites>
Before creating the PR, verify:
1. We are on a feature branch following project conventions: `{category}/{ticket-number}-{descriptive-name}`
2. Check if all changes are committed: `git status`
   - If uncommitted changes exist, execute the commit workflow using [[commit]]
   - Only proceed after all changes are committed
3. Local issue in `issues/` reflects the exact implementation (if it exists)
</prerequisites>

<process>
1. **Update Local Issue Documentation** (if local issue exists)
   - Read the current issue in `issues/`
   - Update it to reflect the EXACT implementation completed
   - Include all technical decisions and changes made
   - If GitHub issue exists, add reference: `GitHub Issue: #<github-issue-number>`
   - If PR will be created, prepare to add: `Pull Request: #<pr-number>` after creation

2. **Create or Update GitHub Issue**
   - Check if a related GitHub issue exists: `gh issue list --search "<local-issue-number>"`
   - Fetch available labels first: `gh label list`
   
   - **If NO GitHub issue exists, CREATE one:**
     - Read ALL local issue documentation in the issue folder
     - Analyze all work completed by reading changed files
     - Create comprehensive issue description including:
       - Summary of the feature/fix being implemented
       - Context from local issue documentation
       - List of deliverables based on actual implementation
       - Technical approach taken
     - Create the issue:
       ```bash
       gh issue create \
         --title "[<LOCAL-ISSUE-NUMBER>] <Descriptive title from local issue>" \
         --body "<comprehensive-description>" \
         --label "<appropriate-labels>" \
         --assignee @me
       ```
     - Note the created GitHub issue number for PR linking
   
   - **If GitHub issue exists, UPDATE it:**
     - Use `gh issue view #<github-issue-number>` to verify current state
     - Update with latest information from local docs and actual implementation
     - Apply appropriate labels based on work done:
       ```bash
       gh issue edit #<github-issue-number> \
         --add-label "enhancement,backend,frontend,documentation" \
         --remove-label "needs-triage"
       ```
     - Update issue body if needed to reflect actual implementation

3. **Verify Branch and Changes**
   - Confirm branch naming follows conventions: `{category}/{local-issue-number}-{descriptive-name}`
   - Branch uses local chronological issue number, not GitHub issue number
   - Run `git status` to ensure clean working directory
   - Push any remaining changes with `git push -u origin <branch-name>`

4. **Generate Pull Request Report**
   - First, get the complete list of ALL changed files:
     ```bash
     git diff {{target_branch}}...HEAD --name-only > changed_files.txt
     ```
   - Count the number of changed files to determine approach:
     - If < 50 files: Read and analyze each file directly
     - If >= 50 files: Use [[Task]] tool with specialized agents to analyze groups of files
   
   - **Read EVERY changed file without exception:**
     - For each file in changed_files.txt:
       - Read the current version of the file
       - Use `git diff {{target_branch}}...HEAD -- <file>` to see exact changes
       - Document what changed and why
     - Group related files together (e.g., all agents, all templates, etc.)
     - If too many files, delegate to sub-agents:
       - One agent for analyzing agent files
       - One agent for analyzing template files
       - One agent for analyzing prompt files
       - One agent for analyzing other files
   
   - **Analyze all commits:**
     - `git log {{target_branch}}..HEAD --oneline` to see all commits
     - `git log {{target_branch}}..HEAD --format=fuller` for detailed commit info
   
   - **Create comprehensive PR report:**
     - Identify the issue folder in `issues/[concept]/[issue-folder]/`
     - Create PR report using [[pull-request-template]] 
     - Save as: `[issue-folder-name]-pull-request.md`
     - Example: For issue folder `000-WFL-plan-workflow`, save as `000-WFL-plan-workflow-pull-request.md`
     - When documenting file changes, use wikilinks for referencing: [[agent-name]] not `agents/agent-name.md`
   
   - **MANDATORY content for the report:**
     - Complete table of ALL changed files with clickable links (no exceptions)
     - Detailed technical implementation for EVERY file changed
     - Full code examples showing changes for significant modifications
     - Reasoning for every technical decision made
     - Architecture diagrams showing system changes
     - Business logic changes documented
     - Complete manual acceptance testing steps
     - Feedback fields after each major section

5. **Create Pull Request**
   - Create the PR with comprehensive body from the report:
   ```bash
   gh pr create \
     --title "[<LOCAL-ISSUE-NUMBER>] Descriptive title" \
     --body "$(cat [issue-folder-name]-pull-request.md)" \
     --base {{target_branch}} \
     --assignee @me
   ```
   
   - **After creation, apply appropriate labels:**
   ```bash
   # Get PR number from creation output
   PR_NUMBER=<created-pr-number>
   
   # Apply labels based on changed files and work done
   gh pr edit $PR_NUMBER --add-label "enhancement,feature,documentation"
   
   # Examples of label selection:
   # - If agents changed: add "agents"
   # - If templates changed: add "templates"  
   # - If docs changed: add "documentation"
   # - If bug fix: add "bug"
   # - If new feature: add "enhancement" or "feature"
   # - Based on size: "size/S", "size/M", "size/L", "size/XL"
   ```
   
   - **Link to GitHub issue:**
   - If GitHub issue was created/exists, ensure PR body includes "Closes #<github-issue-number>"
   - Verify PR shows as linked in the GitHub issue
   - Set milestone and project if applicable
   - Update local issue to include both references:
     - `GitHub Issue: #<github-issue-number>`
     - `Pull Request: #<pr-number> (URL)`

6. **Commit and Push Local Issue Updates**
   - After PR creation, commit the updated local issue documentation:
   ```bash
   git add issues/
   git commit -m "[<LOCAL-ISSUE-NUMBER>] Update issue with PR reference #<pr-number>"
   git push
   ```
   - This ensures the PR reference is preserved in the repository
</process>

<documentation_guidelines>
- **CRITICAL**: Read and document EVERY single changed file - NO EXCEPTIONS
- If there are too many files to handle directly, use sub-agents to analyze groups
- When referencing project files in the PR report, use wikilinks: [[filename]] not paths
- In the changes table, use actual file paths for clickable GitHub links
- For EVERY file, explain:
  - What the file does
  - What changed in the file
  - Why the change was made
  - Impact of the change
- Include full code examples for significant changes
- Leave no file or change undocumented
- A reviewer should understand 100% of changes from the PR report alone
- Add "Feedback:" fields after each major section
- Use mermaid diagrams for architectural changes:
  ```mermaid
  graph TD
    A[Start] --> B[Process]
    B --> C[End]
  ```
- Group related changes together but ensure every file is covered
- Follow [[pull-request-template]] structure exactly
</documentation_guidelines>

<output_format>
1. All changes committed (or commit executed using [[commit]])
2. Local issue in `issues/` updated with:
   - Implementation details
   - GitHub issue reference
   - Pull request reference (after creation)
3. GitHub issue created (if needed) or updated with:
   - Comprehensive description from local docs and implementation
   - Appropriate labels based on work done
   - Assignee and milestone set
4. Branch properly named with local issue number
5. Comprehensive PR report saved documenting ALL changed files
6. Pull request created with:
   - Local issue number in title
   - Complete PR report as body
   - Appropriate labels applied
   - Link to GitHub issue (Closes #X)
7. Complete traceability established:
   - Local issue → GitHub issue → Pull request
8. All documentation updates committed and pushed
</output_format>

<requirements>
Target branch: `{{target_branch}}` (defaults to 'main' if not specified)
</requirements>

Begin by identifying the current issue and branch, then proceed with the PR creation workflow.

---
target_branch: [Target branch for the pull request - defaults to 'main']
