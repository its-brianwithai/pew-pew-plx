# Contributing to Ultra Wide Turbo Workspace

Thank you for your interest in contributing to the Ultra Wide Turbo Workspace! This document provides guidelines for contributing to this project.

## What to Contribute

We welcome contributions that enhance the template structure and provide general utility, such as:

- New role templates with clear domain focus
- System documentation and instructions
- Prompt templates for common activities
- Scripts that enhance workspace functionality
- Templates for recurring tasks or documents
- Guidelines for specific workflows

## What Not to Contribute

This repository is meant to be a template that others can use as a starting point. Please avoid:

- Personal implementation files or specific project code
- Credentials or sensitive information
- Large binary files or media assets specific to your use case
- Implementation-specific files that would not benefit other users
- Files with hardcoded personal references or organization-specific details

## File Structure and Naming Conventions

When contributing, please follow these conventions:

### Naming Patterns

- **System Prompts**:
    - `you-are-an-{{IDENTITY}}.md`
- **Activity Prompts**:
    - `plx-{{VERB}}-{{RESULT_OR_CONCEPT}}.md`
- **Backlog**:
    - `backlog-{{DESCRIPTION}}.md`
    - `story-{{DESCRIPTION}}.md`
    - `bug-{{DESCRIPTION}}.md`
- **Tasks**:
    - `todo-{{DESCRIPTION}}.md`
    - `story-{{DESCRIPTION}}.md`
    - `bug-{{DESCRIPTION}}.md`
    - `task-{{DESCRIPTION}}.md`
- **Inbox**:
    - `inbox-{{DESCRIPTION}}.md`
- **Rubrics**:
    - `rubric-{{RESULT_OR_CONCEPT}}.md`
    - `rubric-for-{{RESULT_OR_CONCEPT}}.md`
- **Scripts**:
    - `{{VERB}}-{{RESULT_OR_CONCEPT}}.*`
- **Drafts**:
    - `draft-{{DESCRIPTION}}.md`
- **Wiki objects**:
    - `all-{{COMPONENTS_OR_CONCEPTS}}.md`
    - `the-{{NOUN_OR_CONCEPT}}.md`
    - `a-{{NOUN_OR_CONCEPT}}.md`
    - `an-{{NOUN_OR_CONCEPT}}.md`
    - `{{NAME}}.md`
- **Docs**:
    - `doc-{{SUBJECT}}.md` (reference documentation)
- **Instructions**:
    - `how-to-{{TASK}}.md` (step-by-step instructions)

## Contribution Guidelines

When contributing to this workspace framework, please follow these guidelines to ensure consistency and usability for all:

1. **Adhere to naming conventions** - Follow the patterns outlined above to maintain consistency.

2. **Ensure general usability** - Contributions should be usable by other developers without requiring knowledge of your personal projects or context. Create files and structures that are self-explanatory and broadly applicable.

3. **Specify domain context** - When creating content related to specific domains, professions, or tools:
   - Include the context in the filename (e.g., `template-for-marketing-campaign.md`, `system-for-content-calendar.md`, `rubric-for-design-review.md`)
   - For technical content, specify the technology (e.g., `template-for-python-projects.md`, `system-for-react-components.md`)

4. **Role specificity** - When creating new roles, be specific about their domain expertise when a role already exists, otherwise be general:
   - Technical roles: `python-developer`, `react-frontend-developer`, `data-scientist`
   - Non-technical roles: `content-marketer`, `product-manager`, `ux-researcher`, `social-media-strategist`

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Ensure your changes follow the guidelines
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin feature/your-feature-name`)
7. Create a new Pull Request

## Using the Template

When using this template for your own projects:

1. Clone or fork the repository
2. Add your implementation-specific files freely without worry about accidentally committing them
3. Only files explicitly listed in the `.gitignore` will be tracked
4. If you want to commit specific implementation files, you'll need to explicitly add them to the `.gitignore` whitelist

Thank you for contributing to making this workspace better for everyone! 
