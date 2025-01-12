---
document_type: protocol
goal: create and present a structured plan in chat for user feedback
gpt_action: follow these steps when user wants a plan presented in chat
---

CONTEXT: The [[User]] wants to see a structured plan with milestones and atomic tasks presented directly in chat for review and feedback before proceeding with implementation.

1. GIVEN [[User]] RUNS plx-create-plan-in-chat command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] IDENTIFY project scope
      2. AND [[GPT Agent]] IDENTIFY key deliverables
   2. IF [[input]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]] for clarification
      2. AND [[GPT Agent]] WAIT for response

2. WHEN [[GPT Agent]] CREATES plan
   1. THEN [[GPT Agent]] STRUCTURE plan in chat:
      ```markdown
      # 📋 Implementation Plan

      # 🚀 [M1] First Milestone Name
      > - Key task or deliverable
      > - Another important task
      > - Technical requirement
      > - BDD tests for this milestone are defined in [[your-tests.md]]

      # 🚀 [M2] Second Milestone Name
      > - Key task or deliverable
      > - Another important task
      > - Technical requirement
      > - BDD tests for this milestone are defined in [[your-tests.md]]
      ```
   2. AND [[GPT Agent]] ENSURE each milestone
      1. HAS clear, focused purpose
      2. LISTS key deliverables
      3. REFERENCES test requirements

3. WHEN [[GPT Agent]] PRESENTS plan
   1. THEN [[GPT Agent]] SHOW plan in chat
   2. AND [[GPT Agent]] ASK [[User]] for feedback:
      ```markdown
      Please review this plan and let me know if you'd like:
      1. 🔄 Adjustments to milestones
      2. ➕ Additional tasks
      3. 🗑️ Tasks to remove
      4. ✅ Proceed with implementation
      ```

4. GIVEN [[User]] PROVIDES feedback
   1. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] UPDATE plan
      2. AND [[GPT Agent]] PRESENT updated version
      3. AND [[GPT Agent]] REPEAT until approved
   2. IF [[User]] APPROVES plan
      1. THEN [[GPT Agent]] ASK how to proceed:
         ```markdown
         Would you like me to:
         1. 📝 Create this plan in your-milestones.md
         2. ✅ Start implementing the first milestone
         3. 📋 Keep as reference only
         ```

5. WHEN [[User]] CHOOSES action
   1. IF [[User]] WANTS plan saved
      1. THEN [[GPT Agent]] USE @plx-create-milestone
   2. IF [[User]] WANTS implementation
      1. THEN [[GPT Agent]] START first milestone
   3. IF [[User]] WANTS reference only
      1. THEN [[GPT Agent]] KEEP plan in chat
      2. AND [[GPT Agent]] WAIT for further instructions 