---
document_type: protocol
goal: create clear, concise insight content that explains concepts or processes in a digestible format
gpt_action: follow these steps to create structured insight content
---

# 📖 Context

This protocol helps create clear, concise insight content that breaks down complex topics into digestible pieces. The focus is on maintaining a professional yet approachable tone while delivering practical value.

# 🎯 Command Types

1. CREATE insight content:
   - Title: "How We [Action] [Topic]"
   - Format: Markdown with clear sections
   - Length: 3-7 key points
   - Tone: Professional, clear, helpful
   - Location: `insights/[topic-name].md`

2. STRUCTURE insight content:
   - Introduction (what & why)
   - Key points (how)
   - Examples (show)
   - Key takeaways

# ⚙️ Parameters

Required:
- topic: The subject to explain
- format: Markdown sections
- goal: What the reader should learn

Optional:
- code_examples: Relevant code snippets
- diagrams: Visual explanations
- references: Related documentation

# 📝 Process

1. WHEN [[User]] REQUESTS insight content
   1. THEN [[GPT Agent]] ANALYZES topic requirements
      1. AND [[GPT Agent]] IDENTIFIES key learning points
      2. AND [[GPT Agent]] PLANS content structure
      3. AND [[GPT Agent]] CREATES insights directory if not exists

2. THEN [[GPT Agent]] CREATES content in `insights/[topic-name].md`:
   ```markdown
   # How We [Action] [Topic]
   > Quick one-line summary of what we'll learn

   ## Why This Matters
   - Clear benefit statement
   - Practical application

   ## Key Points
   1. First important concept
      - Clear explanation
      - Practical example

   2. Second important concept
      - Clear explanation
      - Practical example

   ## Example in Practice
   ```code or step-by-step```

   ## Key Takeaways
   - Practical insights
   - Next steps
   ```

3. WHEN [[GPT Agent]] COMPLETES content
   1. THEN [[GPT Agent]] VERIFIES:
      - Clear value proposition
      - Professional tone
      - Actionable steps
      - Practical examples
      - Concise format

4. IF content needs visuals
   1. THEN [[GPT Agent]] ADDS:
      - Code snippets (if relevant)
      - Simple diagrams (if helpful)
      - Step numbers (if sequential)

# ✅ Verification

Content should:
- Maintain professional tone
- Focus on practical value
- Include clear examples
- Be concise and focused
- Follow consistent structure
- Use proper formatting

# 🎨 Style Guide

DO:
- Use clear, direct language
- Include practical examples
- Start with the benefit
- Break into digestible points
- End with practical insights

DON'T:
- Use overly casual language
- Include unnecessary details
- Make assumptions about knowledge
- Skip practical examples
- Use complex jargon

# 📋 Example Structure

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

# 🎯 Success Criteria

Content is successful when it:
- Clearly explains the concept
- Provides practical value
- Uses consistent structure
- Maintains professional tone
- Includes actionable examples 