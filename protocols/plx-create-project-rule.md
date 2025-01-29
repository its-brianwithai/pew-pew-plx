---
document_type: protocol
goal: ensure consistent and clear creation of project-specific rules that AI can understand and follow
gpt_action: follow these steps when creating new .cursor.rules files to maintain project conventions
---

# Project Rule (.mdc) Creation Protocol

This protocol guides the creation of project-specific rules in called cursor rules files (*.md).

## Rule Naming Convention
- Use kebab-case format
- File extension is `.md`
- Directory is root (user will move it to the correct location)
- Start with `how-we-` prefix 
- Follow with the specific action or pattern (e.g., `how-we-create-views`, `how-we-inject-dependencies`)
- Name should clearly indicate what the rule explains (e.g., `how-we-handle-errors`, `how-we-structure-widgets`)
- Must be descriptive and self-explanatory

## Rule Template
```markdown
---
description: Clear description of when and why this rule applies
globs: lib/**/*.dart, test/**/*.dart # Comma-separated patterns
---

# {{Rule Title}}

## Purpose
[Clear statement of what this rule achieves]

## Trigger Conditions
- When to apply this rule
- Specific scenarios or file types

## Requirements
1. [Requirement 1]
2. [Requirement 2]
...

## Implementation Steps
1. [Step 1 with clear action]
2. [Step 2 with clear action]
...

## Examples
### Good Example
```[language]
[Good implementation example]
```

### Bad Example
```[language]
[What to avoid]
```

## Validation Checklist
- [ ] Rule name is clear and follows convention
- [ ] Description clearly states when rule applies
- [ ] Globs correctly target relevant files
- [ ] Steps are atomic and clear
- [ ] Examples demonstrate correct usage
```

## Rule Components
1. **Description**: Single sentence that clearly defines when the rule applies
2. **Globs**: File patterns that trigger this rule
3. **Purpose**: Clear objective of the rule
4. **Requirements**: Specific conditions that must be met
5. **Implementation**: Step-by-step guide
6. **Examples**: Good and bad implementations
7. **Validation**: Checklist for rule completeness

## Example Rule
```markdown
---
description: How to name and structure our widget files
globs: lib/**/*_widget.dart, lib/**/*_view.dart
---

# How We Structure Widgets

## Purpose
Keep widget files consistent and maintainable.

## Trigger Conditions
- Creating/modifying widget files

## Requirements
1. Use snake_case for files
2. Add documentation
3. Follow widget structure

## Implementation Steps
1. Name file `widget_name_widget.dart`
2. Add imports
3. Create documented widget class
4. Implement required methods

## Examples
### Good Example
```dart
import 'package:flutter/material.dart';

/// User profile display widget.
class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) => Container();
}
```

### Bad Example
```dart
class userprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container();
}
```

Remember: Rules should be clear enough that any AI agent can understand and implement them consistently.
