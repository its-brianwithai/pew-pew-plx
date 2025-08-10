---
name: issue-creation-conventions
description: "Standard instructions for creating and organizing issues in the project. Defines folder structure, naming conventions, and document organization for all issue types."
---
# 📋 Issue Creation Instructions

> 💡 *Standard guidelines for creating and organizing issues across all workflows*

## 📁 Issue Organization

Issues follow this structure:
```
issues/{core-concept}/{next-chronological-issue-nr}-{core-concept-code}-{descriptive-title}/{descriptive-description}-{type}.md
```

Example:
```
issues/configuration/001-CFG-yaml-config-system/yaml-config-system-issue.md
```

## 📝 Naming Components

- `{core-concept}` - Directory for grouping related issues (e.g., configuration, authentication, ui)
- `{next-chronological-issue-nr}` - Three-digit sequential number (001, 002, 003)
- `{core-concept-code}` - Three-letter uppercase code for the concept (CFG, AUTH, UI)
- `{descriptive-title}` - Kebab-case short title for the folder
- `{descriptive-description}` - Kebab-case full description for the file
- `{type}` - Issue type: issue, bug, enhancement, chore, feedback
