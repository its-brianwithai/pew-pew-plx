Please release a new version of this repo:

1. Ensure all unstaged changes are staged.
2. Scan all files and get a good understanding of what has been modified, deleted and/or created.
3. Update the @CHANGELOG.md based on scanned files and {version_increment}.
4. Update the @README.md based on scanned files and {version_increment}, ensure everything is up to date.
5. Ask the user if you can commit and push the commit. After confirmation, commit and push the commit.
6. If {create_github_release} is true, create a new github release with the github CLI.

{version_increment} = patch
{create_github_release} = false