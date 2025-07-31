Please commit everything:

- [ ] Run `git add -A`.
- [ ] Understand the context of the changes by running `git status`.
- [ ] Always start with a project key in square brackets (e.g., [XXX-123]), look at previous commits if you are unsure.
- [ ] Use the imperative mood ("Add" not "Added")
- [ ] Keep the first line under 50 characters
- [ ] Provide a detailed description in subsequent lines when needed
- [ ] Do not include "Claude" in the commit message
- [ ] Do not add Claude signature or co-authored-by line
- [ ] Do not add the "Generated with Claude Code" text
- [ ] Follow git commit message best practices

Before you commit:

Documentation:
- [ ] Update the @CHANGELOG.md following project conventions
- [ ] Update the @release_notes.json (if present) with mention of work you just done as a release note item (if that makes sense to do so in terms of valuable information for the end user, these are user facing so do not write about technicalaties. Do not use emoji's here because this file is sent to apple in CI/CD pipeline and emoji's are not supported.
- [ ] Update @assets/md/changelog_nl.md and @assets/md/changelog_en.md (if present) with short end-user facing message (if that makes sense to do so in terms of valuable information for the end user)
- [ ] Update the @README.md, ensure information is up to date and correct (if needed, relative to work done)
- [ ] Update the @prompts/start.md command (if needed)
- [ ] Update any other relevant project documentation, ensure information is up to date and correct (if needed, relative to work done)
- [ ] Keep updates as clear, short and concise as possible without sacrificing meaning.

Issue management:
- [ ] If there is an active local markdown issue mentioned in this conversation, update it
- [ ] If there is an active GitHub issue mentioned in this conversation, update it
- [ ] Ignore the issue instructions if none have been mentioned
