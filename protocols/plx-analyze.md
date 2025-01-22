---
document_type: protocol
goal: analyze input and present findings without taking action
gpt_action: follow these steps when user wants analysis of something
---

CONTEXT: The [[User]] wants analysis of something based on their input. The [[You]] should analyze and present findings but NOT take any actions until explicitly instructed.

1. GIVEN [[User]] RUNS plx-analyze command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] IDENTIFY subject of analysis
      2. AND [[You]] DETERMINE analysis scope
   2. IF [[input]] IS unclear
      1. THEN [[You]] ASK clarifying questions
      2. AND [[You]] WAIT for response

2. WHEN [[You]] UNDERSTANDS subject
   1. THEN [[You]] SCAN relevant sources:
      1. AND [[You]] CHECK codebase if code-related
      2. AND [[You]] READ documentation if process-related
      3. AND [[You]] REVIEW context if concept-related
   2. IF [[You]] NEEDS more information
      1. THEN [[You]] ASK specific questions
      2. AND [[You]] WAIT for response

3. WHEN [[You]] HAS sufficient information
   1. THEN [[You]] STRUCTURE analysis:
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

4. WHEN [[You]] PRESENTS analysis
   1. THEN [[You]] WAIT for [[User]] response
   2. AND [[You]] DO NOT take any actions
   3. AND [[You]] DO NOT make any changes
   4. AND [[You]] DO NOT proceed with implementation

5. GIVEN [[User]] RESPONDS to analysis
   1. IF [[User]] REQUESTS clarification
      1. THEN [[You]] PROVIDE additional details
      2. AND [[You]] CONTINUE waiting
   2. IF [[User]] REQUESTS changes
      1. THEN [[You]] UPDATE analysis
      2. AND [[You]] PRESENT new version
   3. IF [[User]] GIVES next steps
      1. THEN [[You]] FOLLOW new instructions 
