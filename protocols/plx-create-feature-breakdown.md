---
document_type: protocol
goal: create structured and engaging feature breakdowns following our standard format
gpt_action: follow these steps when user wants to create a new feature breakdown
---

CONTEXT: The [[User]] wants to create a new feature breakdown and needs you to handle the creation process following our standard format and structure.

1. GIVEN [[User]] RUNS plx-create-feature-breakdown command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK feature type
         ```markdown
         # Feature Types
         - ui          : User interface components
         - api         : API implementations
         - integration : Third-party integrations
         - core        : Core functionality
         ```
      2. AND [[GPT Agent]] CHECK required parameters
         ```markdown
         # Required Parameters
         - title        : Name in Pascal Case With Spaces
         - type         : One of the feature types above
         - difficulty   : 🟢 Easy | 🟡 Medium | 🔴 Hard
         - readingTime  : Duration (e.g., "15 minutes")
         ```
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for feature type
      2. AND [[GPT Agent]] ASK for required parameters

2. WHEN [[GPT Agent]] CREATES breakdown
   1. THEN [[GPT Agent]] CREATE file in features directory
      ```markdown
      # File Location
      feature-breakdowns/title-in-lowercase-with-dashes.md
      ```
   2. THEN [[GPT Agent]] ADD frontmatter
      ```markdown
      # Frontmatter Format
      ---
      document_type: feature-breakdown
      title: Title In Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      reading_time: "15 minutes"
      feature_type: ui | api | integration | core
      gpt_action: follow these steps to understand [title]
      ---
      ```
   3. THEN [[GPT Agent]] CREATE sections
      1. AND [[GPT Agent]] ADD "📝 Table of Contents"
      2. AND [[GPT Agent]] ADD "📝 Introduction"
      3. AND [[GPT Agent]] ADD "🎯 The Plan"
      4. AND [[GPT Agent]] ADD "💻 Implementation"
      5. AND [[GPT Agent]] ADD "🧪 Testing"
      6. AND [[GPT Agent]] ADD "🤔 Reflection"

3. WHEN [[GPT Agent]] FILLS sections
   1. THEN [[GPT Agent]] WRITE Table of Contents
      1. AND [[GPT Agent]] LIST all sections
      2. AND [[GPT Agent]] ADD reading time estimates
      3. AND [[GPT Agent]] ADD difficulty indicators
   2. THEN [[GPT Agent]] WRITE Introduction
      1. AND [[GPT Agent]] EXPLAIN what and why
      2. AND [[GPT Agent]] ADD feature overview screenshot
      3. AND [[GPT Agent]] ADD "Prerequisites"
      4. AND [[GPT Agent]] ADD "What You'll Learn"
      5. AND [[GPT Agent]] ADD real-world use cases
   3. THEN [[GPT Agent]] WRITE The Plan
      1. AND [[GPT Agent]] CREATE numbered steps
      2. AND [[GPT Agent]] ADD concept visualizations
      3. AND [[GPT Agent]] ADD "Think About It" questions
      4. AND [[GPT Agent]] ADD alternative approaches
   4. THEN [[GPT Agent]] WRITE Implementation
      1. AND [[GPT Agent]] ADD code snippets with comments
      2. AND [[GPT Agent]] ADD implementation screenshots
      3. AND [[GPT Agent]] ADD interaction GIFs
      4. AND [[GPT Agent]] ADD "Code Breakdown" boxes
      5. AND [[GPT Agent]] ADD "Common Errors"
   5. THEN [[GPT Agent]] WRITE Testing
      1. AND [[GPT Agent]] CREATE test scenarios
      2. AND [[GPT Agent]] ADD test results screenshots
      3. AND [[GPT Agent]] ADD "Test Writing Tips"
      4. AND [[GPT Agent]] ADD debugging strategies
   6. THEN [[GPT Agent]] WRITE Reflection
      1. AND [[GPT Agent]] DISCUSS pros and cons
      2. AND [[GPT Agent]] ADD performance notes
      3. AND [[GPT Agent]] ADD security considerations
      4. AND [[GPT Agent]] ADD future improvements

4. GIVEN [[breakdown]] IS ready
   1. THEN [[GPT Agent]] ADD image placeholders
      1. AND [[GPT Agent]] USE format
         ```markdown
         [SCREENSHOT: Feature overview showing final result]
         [GIF: Key user interactions with the feature]
         [STOCK: Concept visualization for complex parts]
         ```
   2. THEN [[GPT Agent]] VERIFY style guidelines
      1. AND [[GPT Agent]] CHECK emoticons
      2. AND [[GPT Agent]] CHECK formatting
      3. AND [[GPT Agent]] CHECK line breaks
   3. THEN [[GPT Agent]] VERIFY content
      1. AND [[GPT Agent]] CHECK all sections present
      2. AND [[GPT Agent]] CHECK code examples
      3. AND [[GPT Agent]] CHECK links
      4. AND [[GPT Agent]] CHECK flowcharts

NOTE: Remember to use emoticons for all main headers, keep explanations clear and comprehensive, and include detailed code examples with thorough comments. Each section should follow the exact structure from [[how-we-create-feature-breakdowns]]. 
