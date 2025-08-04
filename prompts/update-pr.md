---
name: update-pr
description: "Update an existing pull request with new changes and updated documentation"
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
   - If uncommitted changes exist, suggest: "Please commit your changes first using [[commit]]"
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

3. **Verify GitHub Issue** (if linked to PR)
   - Check linked GitHub issue status
   - Update GitHub issue with latest changes if needed
   - Fetch available labels: `gh label list`
   - Update labels if requirements have changed

4. **Push Latest Changes**
   - Ensure all commits are pushed: `git push`
   - Verify branch is up to date with remote

5. **Update Pull Request Report**
   - Analyze ALL changes between target branch and current branch:
     - `git log {{target_branch}}..HEAD --oneline` to see all commits (including new ones)
     - `git diff {{target_branch}}...HEAD --stat` to see all changed files
     - `git diff {{target_branch}}...HEAD` to see complete detailed changes
   - Locate existing PR report in issue folder
   - Update the report to include:
     - New changes and commits added since last update
     - Updated implementation details
     - Any new architectural decisions
     - Updated test cases if applicable
   - Mark clearly what's new in this update vs original PR

6. **Update Pull Request**
   ```bash
   gh pr edit <pr-number> \
     --title "[<LOCAL-ISSUE-NUMBER>] Updated: Descriptive title" \
     --body "$(cat updated-pr-report.md)"
   ```
   
   After update:
   - Verify PR still links to GitHub issue (if applicable)
   - Update labels if scope has changed
   - Add comment summarizing what changed in this update
   - Update local issue with any new PR details
</process>

<documentation_guidelines>
- Clearly mark sections that are new or updated with "**UPDATE:**" prefix
- Include full diff of changes since original PR
- Update all code examples to reflect current state
- Add new test cases for new functionality
- Update architecture diagrams if structure changed
- Maintain history by keeping original content and adding updates
</documentation_guidelines>

<output_format>
1. All new changes committed (or user prompted to commit using [[commit]])
2. Existing PR identified and verified
3. Local issue updated with new implementation details
4. GitHub issue updated if linked
5. PR report updated with complete changes (original + new)
6. Pull request edited with updated title and body
7. Comment added to PR summarizing the update
8. Complete traceability maintained in local documentation
</output_format>

<requirements>
Target branch: `{{target_branch}}` (defaults to 'main' if not specified)
PR number: `{{pr_number}}` (optional - will auto-detect from current branch)
</requirements>

Begin by identifying the existing PR and analyzing what has changed since it was created.

---
target_branch: [Target branch - defaults to 'main' or PR's current target]
pr_number: [Optional: Specific PR number to update]