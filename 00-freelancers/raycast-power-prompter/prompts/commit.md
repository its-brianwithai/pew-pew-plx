Commit the current work following project conventions.  
Always show the exact commands being executed and their results.  
Follow these steps in order:

1. Run `git status` to review staged, modified, and untracked files.
2. Run `git log --oneline -5` to check recent commit patterns.
3. Prepare the commit message using the format:
   - Start with `[PROJECTKEY{-ISSUENR (if applicable)}]` prefix
   - Use imperative mood (e.g., "Add" not "Added")
   - Keep first line under 50 characters
   - No forbidden terms, signatures, or extra lines
4. Update relevant {project_docs} before committing.
5. Update relevant {release_docs} before committing.
   - Do not use emojis
   - Use simple english non-technical terms
6. Stage files:
   - If user specified: `git add <files>`
   - If not specified: `git add -A`
7. Commit with `git commit -m "[PROJECTKEY{-ISSUENR (if applicable)}] Commit message"`.
8. Verify remote with `git remote -v` and branch with `git branch --show-current`.
9. Push changes:
   - If branch exists remotely: `git push`
   - If new branch: `git push -u origin <branch>`
10. Confirm push success. If on a feature branch, suggest creating a PR.
11. If any step fails, show the exact error message, explain the issue, suggest a fix, and provide recovery steps.
---
<relevant_project_docs>
{snippet name="all-living-docs"}
</relevant_project_docs>

<relevant_release_docs>
{snippet name="all-release-docs"}
</relevant_release_docs>
