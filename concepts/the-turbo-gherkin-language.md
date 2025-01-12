---
document_type: concept
goal: explain the Turbo Gherkin language and its usage in our framework
gpt_action: reference this when you need to understand or use Turbo Gherkin-style instructions
---

The Turbo Gherkin language provides structured steps for clear, consistent documentation using specific keywords.

# Core Keywords and Rules

- Primary: `GIVEN` (precondition), `WHEN` (action), `THEN` (result)
- Flow: `AND` (additional step), `OR` (alternative)
- Conditionals: `IF`/`ELSE` (branching), `BUT` (exception)
- Combinations: `BUT IF`, `ELSE IF`, `OR IF`

Rules:
1. UPPERCASE keywords
2. Use [[Actor]] or [[Component]] in double brackets
3. Follow with ONE uppercase VERB/STATE
4. Indent sub-steps properly

# Examples

✅ Correct Structure:
```markdown
1. GIVEN [[User]] SENDS request
   1. WHEN [[GPT Agent]] PROCESSES data
      1. IF [[data]] IS valid
         1. THEN [[GPT Agent]] SAVES data
      2. ELSE [[GPT Agent]] REPORTS error
   2. BUT [[error]] OCCURS
      1. THEN [[GPT Agent]] RETRIES later
```

❌ Common Mistakes:
```markdown
Given user sends request                    # Lowercase keywords
WHEN [[GPT Agent]] PROCESSES THE DATA       # Multiple verbs
Then gpt agent returns response            # Missing brackets
IF response is empty                       # Incorrect format
```

# Code Integration

1. Inline Code (use backticks):
```markdown
WHEN [[GPT Agent]] RUNS `./scripts/deploy.sh`
THEN [[GPT Agent]] CHECKS `config.json`
```

2. Code Blocks (indent under step):
```markdown
1. WHEN [[GPT Agent]] WRITES function
   1. THEN [[GPT Agent]] ADDS code:
      ```dart
      void example() {
        print('Hello');
      }
      ```
   2. AND [[GPT Agent]] TESTS function
```

Remember:
- Maintain proper indentation
- Use language-specific syntax highlighting
- Keep inline code elements short
- Continue Gherkin flow after code blocks