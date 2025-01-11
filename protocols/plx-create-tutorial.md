---
document_type: protocol
goal: create structured and engaging tutorials following our standard format
gpt_action: follow these steps when user wants to create a new tutorial
---

CONTEXT: The [[User]] wants to create a new tutorial and needs you to handle the creation process following our standard format and structure.

1. GIVEN [[User]] RUNS plx-create-tutorial command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK tutorial type
         ```markdown
         # Tutorial Types
         - feature      : How to use a feature
         - concept      : Explaining a concept
         - integration : Setting up integrations
         - workflow    : Step-by-step workflow
         ```
      2. AND [[GPT Agent]] CHECK required parameters
         ```markdown
         # Required Parameters
         - title         : Name in Pascal Case With Spaces
         - type          : One of the tutorial types above
         - difficulty    : 🟢 Beginner | 🟡 Intermediate | 🔴 Advanced
         - estimatedTime : Duration (e.g., "30 minutes")
         ```
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for tutorial type
      2. AND [[GPT Agent]] ASK for required parameters

2. WHEN [[GPT Agent]] CREATES tutorial
   1. THEN [[GPT Agent]] CREATE file in tutorials directory
      ```markdown
      # File Location
      tutorials/title-in-lowercase-with-dashes.md
      ```
   2. THEN [[GPT Agent]] ADD frontmatter
      ```markdown
      # Frontmatter Format
      ---
      document_type: tutorial
      title: Title In Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      time_estimate: "30 minutes"
      tutorial_type: feature | concept | integration | workflow
      gpt_action: follow these steps to learn [title]
      ---
      ```
   3. THEN [[GPT Agent]] CREATE sections
      1. AND [[GPT Agent]] ADD "📝 Table of Contents"
      2. AND [[GPT Agent]] ADD "📝 Introduction"
      3. AND [[GPT Agent]] ADD "🎯 Suggested Approach"
      4. AND [[GPT Agent]] ADD "👨‍🏫 Tutorial"
      5. AND [[GPT Agent]] ADD "✅ Checklist"

3. WHEN [[GPT Agent]] FILLS sections
   1. THEN [[GPT Agent]] WRITE Table of Contents
      1. AND [[GPT Agent]] LIST all sections
      2. AND [[GPT Agent]] ADD time estimates
      3. AND [[GPT Agent]] ADD difficulty indicators
   2. THEN [[GPT Agent]] WRITE Introduction
      1. AND [[GPT Agent]] EXPLAIN what, how, why
      2. AND [[GPT Agent]] ADD "What You'll Learn"
      3. AND [[GPT Agent]] ADD "Prerequisites"
      4. AND [[GPT Agent]] ADD "Learning Goals"
   3. THEN [[GPT Agent]] WRITE Suggested Approach
      1. AND [[GPT Agent]] CREATE checklist
      2. AND [[GPT Agent]] ADD difficulty indicators
      3. AND [[GPT Agent]] ADD "Think About It" prompts
   4. THEN [[GPT Agent]] WRITE Tutorial
      1. AND [[GPT Agent]] ADD code examples
      2. AND [[GPT Agent]] ADD explanations
      3. AND [[GPT Agent]] ADD "Try It Yourself"
      4. AND [[GPT Agent]] ADD "Common Pitfalls"
   5. THEN [[GPT Agent]] WRITE Checklist
      1. AND [[GPT Agent]] LIST verification points
      2. AND [[GPT Agent]] ADD "Troubleshooting Guide"
      3. AND [[GPT Agent]] ADD "Next Steps"

4. GIVEN [[tutorial]] IS ready
   1. THEN [[GPT Agent]] ADD image placeholders
      1. AND [[GPT Agent]] USE format
         ```markdown
         [SCREENSHOT: Description]
         [GIF: Description]
         [STOCK: Description]
         ```
   2. THEN [[GPT Agent]] VERIFY style guidelines
      1. AND [[GPT Agent]] CHECK emoticons
      2. AND [[GPT Agent]] CHECK formatting
      3. AND [[GPT Agent]] CHECK line breaks
   3. THEN [[GPT Agent]] VERIFY content
      1. AND [[GPT Agent]] CHECK all sections present
      2. AND [[GPT Agent]] CHECK code examples
      3. AND [[GPT Agent]] CHECK links

NOTE: Remember to use emoticons for all main headers, keep explanations concise and beginner-friendly, and include practical code examples with detailed comments. Each section should follow the exact structure from [[how-we-create-tutorials]]. 