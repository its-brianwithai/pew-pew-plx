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

2. **Verify GitHub Issue** (optional - single PR without issue is acceptable)
   - Check if a related GitHub issue exists (note: GitHub issue number is usually different from local issue number)
   - If a GitHub issue exists:
     - Use `gh issue view #<github-issue-number>` to verify current state
     - Update GitHub issue with latest information from local docs and work completed
     - Fetch available labels: `gh label list`
     - Ensure issue has appropriate labels: `gh issue edit #<github-issue-number> --add-label "type,status,priority"`
     - Verify issue milestone and assignee are set correctly
     - The GitHub issue can have different formatting than local markdown per [[issue-creation-instructions]]
     - Use `gh issue edit` to update title/body if needed to reflect current implementation
   - If no GitHub issue exists, proceed with a standalone PR

3. **Verify Branch and Changes**
   - Confirm branch naming follows conventions: `{category}/{local-issue-number}-{descriptive-name}`
   - Branch uses local chronological issue number, not GitHub issue number
   - Run `git status` to ensure clean working directory
   - Push any remaining changes with `git push -u origin <branch-name>`

4. **Generate Pull Request Report**
   - Analyze all changes between current branch and target branch:
     - `git log {{target_branch}}..HEAD --oneline` to see all commits
     - `git diff {{target_branch}}...HEAD --stat` to see all changed files
     - `git diff {{target_branch}}...HEAD` to see detailed changes
   - Identify the issue folder in `issues/[concept]/[issue-folder]/`
   - Count existing documents to determine next sequential number
   - Create PR report using [[pull-request-template]] 
   - Save as: `[issue-folder-name]-pull-request-[number]-[descriptor].md`
   - Example: If 5 docs exist, save as `006-[issue-folder-name]-pull-request.md`
   - Include in the report:
     - Summary of all changed files with clickable links
     - Detailed technical implementation for each component
     - Full code examples showing changes
     - Reasoning for every technical decision
     - Architecture diagrams (mermaid or ASCII)
     - Business logic and UI change documentation
     - Manual acceptance testing steps
     - Feedback fields for reviewers throughout

5. **Create Pull Request**
   ```bash
   gh pr create \
     --title "[<LOCAL-ISSUE-NUMBER>] Descriptive title" \
     --body "$(cat pr-report.md)" \
     --base {{target_branch}} \
     --assignee @me
   ```
   
   After creation:
   - If GitHub issue exists: PR body should include "Closes #<github-issue-number>"
   - Verify PR shows as linked in the GitHub issue (if applicable)
   - Add appropriate labels to PR
   - Set milestone and project if applicable
   - Update local issue to include PR reference: `Pull Request: #<pr-number> (URL)`
</process>

<documentation_guidelines>
- Use full code examples showing before/after where relevant
- Create clickable markdown links to actual files: `[ClassName](path/to/file.ts#L123)`
- Include reasoning for EVERY technical choice
- Leave no implementation detail undocumented
- Ensure a reviewer needs only this document to understand 100% of changes
- Add "Feedback:" fields after each major section for reviewer input
- Use mermaid diagrams for complex flows:
  ```mermaid
  graph TD
    A[Start] --> B[Process]
    B --> C[End]
  ```
</documentation_guidelines>

<output_format>
1. All changes committed (or commit executed using [[commit]])
2. Local issue in `issues/` updated with:
   - Implementation details
   - GitHub issue reference (if exists)
   - Pull request reference (after creation)
3. GitHub issue updated with latest information and proper labels (if exists)
4. Branch properly named with local issue number
5. Comprehensive PR report saved in issue folder following sequential numbering
6. Pull request created with local issue number in title
7. PR linked to GitHub issue if applicable (via "Closes #" syntax)
8. Local issue contains complete traceability with GitHub issue and PR numbers
</output_format>

<requirements>
Target branch: `{{target_branch}}` (defaults to 'main' if not specified)
</requirements>

Begin by identifying the current issue and branch, then proceed with the PR creation workflow.

---
target_branch: [Target branch for the pull request - defaults to 'main']