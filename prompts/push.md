---
name: push
description: "Commit and push changes to remote repository in one workflow"
---
# Push Changes

You are about to commit and push file changes to the remote repository.

You have two options:
1.  **Push Staged Changes**: Commits only the files you have added to the staging area (`git add`), then pushes. This is for precise commits. I will run `git commit` then `git push`.
2.  **Push All Changes**: Stages all tracked and new files (`git add -A`), commits them, then pushes. This is to commit and push all your work at once. I will run `git add -A`, then `git commit`, then `git push`.

If the user provided `all` as an argument, perform **Push All Changes**.
Otherwise, ask the user to choose between "staged" and "all".

Once the push type is determined, delegate to the git expert:

Act as [[git-expert]] and handle this commit and push operation following all project conventions.

---
all: [Optional: Include "all" to stage all changes before committing and pushing]