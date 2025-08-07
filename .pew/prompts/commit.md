You are about to commit file changes.

You have two options:
1.  **Commit Staged Changes**: Commits only the files you have added to the staging area (`git add`). This is for precise commits. I will run `git commit`.
2.  **Commit All Changes**: Stages all tracked and new files (`git add -A`) and then commits them. This is to commit all your work at once. I will run `git add -A` and then `git commit`.

If the user provided `all` as an argument, perform **Commit All Changes**.
Otherwise, ask the user to choose between "staged" and "all".

Once the commit type is determined, delegate to the git expert:

Act as [[git-expert]] and handle this commit operation following all project conventions.