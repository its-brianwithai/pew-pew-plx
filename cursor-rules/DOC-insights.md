---
description: How to create clear, concise insight content that explains concepts or processes
globs: insights/*.md
document_type: protocol
goal: Create structured insight content that delivers practical value
gpt_action: Follow these steps to create insight documentation
---

# How We Document Insights

## Purpose
Create clear, concise, and structured insight content that breaks down complex topics into digestible pieces while maintaining a professional yet approachable tone.

## Trigger Conditions
- Need to explain complex concepts
- Document best practices
- Share technical knowledge
- Create learning resources
- Document process insights

## Requirements
1. Clear Topic Definition
   - Subject to explain
   - Learning objectives
   - Target audience
   - Practical value

2. Content Structure
   - Professional tone
   - Clear sections
   - 3-7 key points
   - Practical examples

3. File Organization
   - Located in insights directory
   - Proper naming convention
   - Markdown format
   - Consistent structure

## Implementation Steps
1. Plan Content
   - Identify key learning points
   - Plan content structure
   - Define practical examples
   - Set clear objectives

2. Create Basic Structure
   - Title: "How We [Action] [Topic]"
   - One-line summary
   - Why This Matters section
   - Key Points section
   - Examples section
   - Key Takeaways section

3. Write Content
   - Use clear, direct language
   - Include practical examples
   - Start with benefits
   - Break into digestible points
   - End with actionable insights

4. Add Supporting Elements
   - Code snippets (if relevant)
   - Simple diagrams (if helpful)
   - Step numbers (if sequential)
   - Visual aids when beneficial

5. Review and Refine
   - Verify clear value proposition
   - Check professional tone
   - Ensure actionable steps
   - Validate examples
   - Confirm concise format

## Examples
### Good Example
```markdown
# How We Structure Dart Classes for Maximum Maintainability

> Learn our proven approach to creating clean, maintainable Dart classes that scale with your project.

## Why This Matters
- Reduces technical debt
- Makes code easier to test
- Improves team collaboration

## Key Points
1. Clear Responsibility
   - One class, one core purpose
   - Example: UserRepository handles only user data operations

2. Consistent Interface
   - Public methods tell a story
   - Example: fetchUser(), updateUser(), deleteUser()

## Example in Practice
```dart
class UserRepository {
  final Database db;
  
  UserRepository(this.db);
  
  Future<User> fetchUser(String id) async {
    // Implementation
  }
}
```

## Key Takeaways
- Single responsibility principle leads to maintainable code
- Consistent interfaces make code predictable
- Documentation is part of good design
```

### Bad Example
```markdown
# Dart Classes

Here's some stuff about classes in Dart.
They're pretty useful for organizing code.
You can put methods in them.

[No structure, missing value, unclear purpose]
```

## Validation Checklist
- [ ] Topic is clearly defined
- [ ] Learning objectives are set
- [ ] Structure follows template
- [ ] Language is professional
- [ ] Examples are practical
- [ ] Content is concise
- [ ] Value proposition is clear
- [ ] Supporting elements added
- [ ] Format is consistent
- [ ] Ready for use 