---
document_type: protocol
goal: create structured and engaging tutorials following our standard format
gpt_action: follow these steps when user wants to create a new tutorial
---

CONTEXT: The [[User]] wants to create a new tutorial and needs you to handle the creation process following our standard format and structure.

1. GIVEN [[User]] RUNS plx-create-tutorial command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] CHECK tutorial type
         ```markdown
         # Tutorial Types
         - feature      : How to use a feature
         - concept      : Explaining a concept
         - integration : Setting up integrations
         - workflow    : Step-by-step process
         ```
      2. AND [[You]] CHECK required parameters
         ```markdown
         # Required Parameters
         - title         : Name in Pascal Case With Spaces
         - type          : One of the tutorial types above
         - difficulty    : 🟢 Beginner | 🟡 Intermediate | 🔴 Advanced
         - estimatedTime : Duration (e.g., "30 minutes")
         ```
   2. IF [[input]] IS empty
      1. THEN [[You]] ASK [[User]] for tutorial type
      2. AND [[You]] ASK for required parameters

2. WHEN [[You]] CREATES tutorial
   1. THEN [[You]] CREATE file in tutorials directory
      ```markdown
      # File Location
      tutorials/title-in-lowercase-with-dashes.md
      ```
   2. THEN [[You]] ADD frontmatter
      ```markdown
      # Frontmatter Format
      ---
      document_type: tutorial
      title: Title In Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      time_estimate: "30 minutes"
      tutorial_type: feature | concept | integration | process
      gpt_action: follow these steps to learn [title]
      ---
      ```
   3. THEN [[You]] CREATE sections
      1. AND [[You]] ADD "📝 Table of Contents"
      2. AND [[You]] ADD "📝 Introduction"
      3. AND [[You]] ADD "🎯 Suggested Approach"
      4. AND [[You]] ADD "👨‍🏫 Tutorial"
      5. AND [[You]] ADD "✅ Checklist"

3. WHEN [[You]] FILLS sections
   1. THEN [[You]] WRITE Table of Contents
      1. AND [[You]] LIST all sections
      2. AND [[You]] ADD time estimates
      3. AND [[You]] ADD difficulty indicators
   2. THEN [[You]] WRITE Introduction
      1. AND [[You]] EXPLAIN what, how, why
      2. AND [[You]] ADD "What You'll Learn"
      3. AND [[You]] ADD "Prerequisites"
      4. AND [[You]] ADD "Learning Goals"
   3. THEN [[You]] WRITE Suggested Approach
      1. AND [[You]] CREATE checklist
      2. AND [[You]] ADD difficulty indicators
      3. AND [[You]] ADD "Think About It" prompts
   4. THEN [[You]] WRITE Tutorial
      1. AND [[You]] ADD code examples
      2. AND [[You]] ADD explanations
      3. AND [[You]] ADD "Try It Yourself"
      4. AND [[You]] ADD "Common Pitfalls"
   5. THEN [[You]] WRITE Checklist
      1. AND [[You]] LIST verification points
      2. AND [[You]] ADD "Troubleshooting Guide"
      3. AND [[You]] ADD "Next Steps"

4. GIVEN [[tutorial]] IS ready
   1. THEN [[You]] ADD image placeholders
      1. AND [[You]] USE format
         ```markdown
         [SCREENSHOT: Description]
         [GIF: Description]
         [STOCK: Description]
         ```
   2. THEN [[You]] VERIFY style guidelines
      1. AND [[You]] CHECK emoticons
      2. AND [[You]] CHECK formatting
      3. AND [[You]] CHECK line breaks
   3. THEN [[You]] VERIFY content
      1. AND [[You]] CHECK all sections present
      2. AND [[You]] CHECK code examples
      3. AND [[You]] CHECK links

NOTE: Remember to use emoticons for all main headers, keep explanations concise and beginner-friendly, and include practical code examples with detailed comments. Each section should follow the exact structure from [[how-we-create-tutorials]]. 
