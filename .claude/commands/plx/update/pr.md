---
name: update-pr
description: "Update an existing pull request with new changes and updated documentation"
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

# Update Pull Request

Your task is to update an existing pull request with new changes, ensuring all documentation is updated and the PR report reflects the complete implementation.

<instruction>
Execute the pull request update workflow, synchronizing new changes, updating documentation, and ensuring the PR reflects all commits and changes.
</instruction>

<prerequisites>
Before updating the PR, verify:
1. We are on the same feature branch that has an open PR
2. Check if all changes are committed: `git status`
   - If uncommitted changes exist, execute the commit workflow using @prompts/commit.md
   - Only proceed after all changes are committed
3. Existing PR can be identified via `gh pr list --head <current-branch>`
</prerequisites>

<process>
1. **Verify Existing Pull Request**
   - Find the existing PR: `gh pr list --head $(git branch --show-current)`
   - Get PR details: `gh pr view <pr-number>`
   - Note the current PR number and target branch

2. **Update Local Issue Documentation** (if local issue exists)
   - Read the current issue in `issues/`
   - Update it to reflect any new implementation details
   - Ensure GitHub issue and PR references are current
   - Add notes about what changed in this update

3. **Update GitHub Issue** 
   - Get linked issue from PR: `gh pr view <pr-number> --json url,body | grep "Closes #"`
   - Fetch available labels: `gh label list`
   
   - **If NO GitHub issue is linked, CREATE one:**
     - Read ALL local issue documentation
     - Analyze all work completed by reading changed files
     - Create comprehensive issue:
       ```bash
       gh issue create \
         --title "[<LOCAL-ISSUE-NUMBER>] <Title matching PR>" \
         --body "<comprehensive-description-from-local-docs-and-implementation>" \
         --label "<appropriate-labels>" \
         --assignee @me
       ```
     - Link the new issue to the PR by editing PR body to include "Closes #<issue-number>"
   
   - **If GitHub issue exists, UPDATE it:**
     - Update with latest changes and implementation details
     - Update labels based on expanded scope:
       ```bash
       gh issue edit #<github-issue-number> \
         --add-label "enhancement,backend,frontend,documentation" \
         --remove-label "needs-triage"
       ```
     - Add comment noting PR has been updated

4. **Push Latest Changes**
   - Ensure all commits are pushed: `git push`
   - Verify branch is up to date with remote

5. **Update Pull Request Report**
   - First, get the complete list of ALL changed files since target branch:
     ```bash
     git diff {{target_branch}}...HEAD --name-only > all_changed_files.txt
     ```
   - Identify what's new since the original PR:
     ```bash
     git log <original-pr-commit>..HEAD --oneline
     git diff <original-pr-commit>..HEAD --name-only > new_changed_files.txt
     ```
   
   - **Read EVERY changed file without exception:**
     - For each file in all_changed_files.txt:
       - Read the current version of the file
       - Use `git diff {{target_branch}}...HEAD -- <file>` to see exact changes
       - Document what changed and why
       - Mark if this is a new change or update to existing change
     - If too many files (>50), use [[Task]] tool with specialized agents:
       - One agent for analyzing agent files
       - One agent for analyzing template files  
       - One agent for analyzing prompt files
       - One agent for analyzing other files
   
   - **Analyze all commits (original + new):**
     - `git log {{target_branch}}..HEAD --oneline` to see all commits
     - `git log {{target_branch}}..HEAD --format=fuller` for detailed commit info
     - Clearly separate original commits from new commits
   
   - **Update the comprehensive PR report:**
     - Locate existing PR report: `[issue-folder-name]-pull-request.md`
     - Update using @templates/review/pull-request-template.md structure
     - Update to include:
       - Complete table of ALL changed files (original + new)
       - Mark new/updated files with **[NEW]** or **[UPDATED]** tags
       - Detailed implementation for EVERY file
       - New architectural decisions
       - Updated test cases
       - Clear separation of original PR content vs updates
     - When documenting file changes, use wikilinks: [[agent-name]] not `agents/agent-name.md`

6. **Update Pull Request**
   - Update the PR with the comprehensive updated report:
   ```bash
   gh pr edit <pr-number> \
     --title "[<LOCAL-ISSUE-NUMBER>] Updated: Descriptive title" \
     --body "$(cat [issue-folder-name]-pull-request.md)"
   ```
   
   - **Update PR labels based on changes:**
   ```bash
   # Fetch current labels
   gh pr view <pr-number> --json labels
   
   # Add new labels based on what changed
   gh pr edit <pr-number> --add-label "enhancement,feature,documentation"
   
   # Remove outdated labels if needed
   gh pr edit <pr-number> --remove-label "WIP,needs-review"
   
   # Label guidelines:
   # - Add labels for all affected areas (agents, templates, docs, etc.)
   # - Update size label if scope increased
   # - Add "updated" label to indicate PR has new changes
   ```
   
   - **After update:**
   - Verify PR still links to GitHub issue
   - Add PR comment summarizing what changed:
     ```bash
     gh pr comment <pr-number> --body "## Update Summary
     
     This PR has been updated with:
     - [List key changes]
     - [New files added]
     - [Issues addressed]
     
     See updated PR description for full details."
     ```
   - Update local issue with any new details

7. **Commit and Push Local Issue Updates**
   - After PR update, commit the updated local issue and PR documentation:
   ```bash
   git add issues/
   git commit -m "[<LOCAL-ISSUE-NUMBER>] Update issue and PR documentation for PR #<pr-number>"
   git push
   ```
   - This ensures all documentation updates are preserved in the repository
</process>

<documentation_guidelines>
- **CRITICAL**: Read and document EVERY single changed file - NO EXCEPTIONS
- If there are too many files to handle directly, use sub-agents to analyze groups
- When referencing project files in the PR report, use wikilinks: [[filename]] not paths
- In the changes table, use actual file paths for clickable GitHub links
- Clearly mark sections with "**[NEW]**" or "**[UPDATED]**" tags
- For EVERY file in the PR, explain:
  - What the file does
  - What changed in the file (original + any updates)
  - Why the change was made
  - Impact of the change
  - Whether this is part of original PR or new update
- Include full diff of changes since original PR
- Update all code examples to reflect current state
- Add new test cases for new functionality
- Update architecture diagrams if structure changed
- Maintain complete history - preserve original content and clearly mark updates
- A reviewer should understand 100% of ALL changes from the updated PR report
- Group related changes but ensure every single file is documented
- Follow @templates/review/pull-request-template.md structure exactly for updates
</documentation_guidelines>

<output_format>
1. All new changes committed (or commit executed using @prompts/commit.md)
2. Existing PR identified and verified
3. Local issue updated with new implementation details
4. GitHub issue created (if missing) or updated with:
   - Latest implementation details
   - Appropriate labels applied
   - Comment about PR update
5. PR report updated documenting ALL changed files (original + new)
6. Pull request updated with:
   - Updated title if needed
   - Complete updated PR report as body
   - Updated labels based on changes
   - Comment summarizing updates
7. Complete traceability maintained:
   - Local issue → GitHub issue → Pull request
8. All documentation updates committed and pushed
</output_format>

<requirements>
Target branch: `{{target_branch}}` (defaults to 'main' if not specified)
PR number: `{{pr_number}}` (optional - will auto-detect from current branch)
</requirements>

Begin by identifying the existing PR and analyzing what has changed since it was created.

---
target_branch: [Target branch - defaults to 'main' or PR's current target]
pr_number: [Optional: Specific PR number to update]
