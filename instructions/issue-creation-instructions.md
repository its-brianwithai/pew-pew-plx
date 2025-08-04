---
name: issue-creation-instructions
description: "Standard instructions for creating and organizing issues in the project. Defines folder structure, naming conventions, and document organization for all issue types."
---
# 📋 Issue Creation Instructions

> 💡 *Standard guidelines for creating and organizing issues across all workflows*

## 📁 Issue Organization

All issues go in `issues/[concept]/[issue-folder]/`

## 📝 Naming Pattern

```
000-[CODE]-[descriptive-name]-[type]
```

- `000` - Sequential number
- `[CODE]` - 3-letter concept code
- `[descriptive-name]` - Kebab-case name
- `[type]` - Issue type (feature, bug, chore, enhancement, feedback, backlog)

## 📄 Document Naming

Inside the issue folder, name documents:
```
[issue-folder-name]-[document-type].md
```

For multiple documents of same type:
```
[issue-folder-name]-[document-type]-[number]-[descriptor].md
```
