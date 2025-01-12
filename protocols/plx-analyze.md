---
document_type: protocol
goal: analyze input and present findings without taking action
gpt_action: follow these steps when user wants analysis of something
---

CONTEXT: The [[User]] wants analysis of something based on their input. The [[GPT Agent]] should analyze and present findings but NOT take any actions until explicitly instructed.

1. GIVEN [[User]] RUNS plx-analyze command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] IDENTIFY subject of analysis
      2. AND [[GPT Agent]] DETERMINE analysis scope
   2. IF [[input]] IS unclear
      1. THEN [[GPT Agent]] ASK clarifying questions
      2. AND [[GPT Agent]] WAIT for response

2. WHEN [[GPT Agent]] UNDERSTANDS subject
   1. THEN [[GPT Agent]] SCAN relevant sources:
      1. AND [[GPT Agent]] CHECK codebase if code-related
      2. AND [[GPT Agent]] READ documentation if process-related
      3. AND [[GPT Agent]] REVIEW context if concept-related
   2. IF [[GPT Agent]] NEEDS more information
      1. THEN [[GPT Agent]] ASK specific questions
      2. AND [[GPT Agent]] WAIT for response

3. WHEN [[GPT Agent]] HAS sufficient information
   1. THEN [[GPT Agent]] STRUCTURE analysis:
      ```markdown
      # 🔍 Analysis Results

      ## 📋 Overview
      > Brief summary of what was analyzed

      ## 🎯 Key Findings
      > - Important point 1
      > - Important point 2
      > - Important point 3

      ## 💡 Insights
      > Deeper observations and patterns

      ## ⚠️ Considerations
      > Important factors to consider

      ## 🤔 Conclusion
      > Final assessment
      ```

4. WHEN [[GPT Agent]] PRESENTS analysis
   1. THEN [[GPT Agent]] WAIT for [[User]] response
   2. AND [[GPT Agent]] DO NOT take any actions
   3. AND [[GPT Agent]] DO NOT make any changes
   4. AND [[GPT Agent]] DO NOT proceed with implementation

5. GIVEN [[User]] RESPONDS to analysis
   1. IF [[User]] REQUESTS clarification
      1. THEN [[GPT Agent]] PROVIDE additional details
      2. AND [[GPT Agent]] CONTINUE waiting
   2. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE analysis
      2. AND [[GPT Agent]] PRESENT new version
   3. IF [[User]] GIVES next steps
      1. THEN [[GPT Agent]] FOLLOW new instructions 