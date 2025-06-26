For the following task you must act as the orchestrator of
multiple agents that act in parallel to execute the {task_at_hand}.

<task_at_hand>
Please go over the following checklist to ensure all necessary steps are completed
before submitting a pull request (PR) for review.
</task_at_hand>

Your main task and responsibility is to act as leading agent
that makes sure the {task_at_hand} is executed exactly as requested.
You give multiple agents in parallel specific tasks, monitor their progress,
and ensure they are working towards the common goal of completing the task efficiently and effectively.
Always making sure the agents in parallel do not interfere with each other
and that they are all aligned with the overall goal.

Start this process by making sure you have 100% clarity and confidence
about the perfect way to implement this in this project
following its way of working and best practices.
Research the project in parallel and encourage yourself to use your more advanced available agent tools
to increase your percentage where needed.

After initial research and during the process you must ALWAYS prefer to
ask questions over deciding unspecified requirements yourself when you encounter ambiguities or uncertainties.
Anything that is not explicitly specified in the project
or the task description should be clarified with the user.

```xml
<task_at_hand>
- [ ] [1] All errors and warnings related to files modified in [this_issue] have been identified using the available analyze, build and/or linting commands specific to this project.
- [ ] [2] All files related to [this_issue] have been properly reviewed following {code_review_standards}.
- [ ] [3] A local markdown issue exists in {issues_path} with appropriate template from {issue_templates_path}.
- [ ] [4] Local issue is updated with the latest state and progress.
- [ ] [5] Current version of project has been properly incremented to [new_version] since last release.
- [ ] [6] Local issue is moved to {issues_path}/done/[new_version]/.
- [ ] [7] If local progress document was made: Local progress document in {progress_path} is updated with latest progress.
- [ ] [8] Remote issue exists on {project_management_tool} and has synced with the latest content update from local issue.
- [ ] [9] Local markdown issue has a direct url link to the remote issue in {project_management_tool}.
- [ ] [10] All relevant {project_documentation} was updated to avoid outdated, missing, or invalid information.
- [ ] [11] Content drafts about the new release were made in {content_drafts_path}/[new_version]/ following {content_drafts_instructions}.

```xml
<code_review_standards>
    - All code follows project established coding standards and best practices as documented in {project_rules_paths}.
    - There is logging in places where it makes sense to have logging for debugging purposes.
    - There is documentation added on class, method and variable level following language / framework best practices.
    - There is proper user feedback where a UI/UX expert would expect feedback given to the user in the form toasts, notifications or dialogs.
    - Any user facing strings are properly translated per localization standards of this project (if applicable).
    - Recurring hard coded strings are either a constant or an extension method of an enum or translated for user feedback.
    - Try catch clauses (only) exist in the places where catching the error makes sense.
    - Classes and methods are kept sensibly small and follow the 1 responsibility principle as much as practically possible.
    - Files, classes, methods and variables follow a consistent naming pattern and have sensible naming following project conventions.
    - The code is practically optimized for performance (Big O) where an experienced senior software developer would deem it necessary to do so.
    - The has been reviewed for security vulnerabilities and follows security best practices.
    - The code is free of unused variables and methods.
    - Disposable resources are disposed when they can and should be.
    - All acceptance criteria of [this_issue] are met.
    - Any business logic that can be tested in isolation WITHOUT mocks has been discussed or written.
    - No workarounds are present in the code that are not documented in the issue.
    - No inline comments in the code are present.
    - Classes and methods are kept sensibly small and follow the 1 responsibility principle as much as practically possible.
    - Methods are private when they are only used inside the class.
    - Enums are used where possible and sensible to do so (certain states, types, collections, outcomes, keys, flows, etc). Switch statements are then used to handle the enum scenarios.
</code_review_standards>
```
```xml
<content_drafts_instructions>
    - Content drafts should be created in the format `draft-[new_version]-[issue_title].md`.
    - Each draft should include a summary of the changes, key features, and any relevant links to documentation or resources.
    - Drafts should be stored in the `content/drafts/[new_version]/` directory.
</content_drafts_instructions>
```
```xml
<project_rules_paths>
    - CLAUDE.md
    - README.md
    - docs/architecture.md
</project_rules_paths>
```
```xml
<project_documentation>
    - {project_rules_paths}
    - CHANGELOG.md
    - release_notes.json (if applicable)
</project_documentation>
```

```xml
<content_drafts_instructions>
    - Create a document that outlines ideas, context and usable instruction to create content about the work that has just been done.
    - Consider all relevant (social) media platforms
    - The goal is not to create the content, but rather provide enough information and context so that a content creator can easily create the content.
    - If there is nothing interesting to post about the release, then do not create a draft.
</content_drafts_instructions>
```

```yaml
project_rules_paths: CLAUDE.md, README.md, docs/architecture.md
issues_path: issues/
issues_templates_path: .github/ISSUE_TEMPLATES/
progress_path: logs/
project_management_tool: GitHub Issues
content_drafts_path: content/drafts/
```
</task_at_hand>
```
