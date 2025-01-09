---
document_type: protocol
goal: transfer work context between agents using your-transfer.md
gpt_action: follow these steps when transferring work
---

CONTEXT: The [[User]] wants to transfer work context between agents to maintain continuity and ensure smooth handoffs between different GPT agents working on the same task.

1. GIVEN [[User]] RUNS plx-transfer command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY transfer type
      2. AND [[GPT Agent]] IDENTIFY transfer scope
   2. IF [[User]] input HAS specific agent
      1. THEN [[GPT Agent]] FOCUS on agent
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] REQUEST target agent

2. WHEN [[GPT Agent]] STARTS transfer
   1. THEN [[GPT Agent]] CREATE [[your-transfer.md]]
      1. AND [[GPT Agent]] ADD document header
      2. AND [[GPT Agent]] ADD timestamp
      3. AND [[GPT Agent]] PREPARE sections
   2. IF [[file]] EXISTS
      1. THEN [[GPT Agent]] ARCHIVE old transfer
      2. AND [[GPT Agent]] START new transfer

3. GIVEN [[transfer file]] IS created
   1. THEN [[GPT Agent]] COLLECT context
      1. AND [[GPT Agent]] CHECK conversation history
      2. AND [[GPT Agent]] CHECK work documents
      3. AND [[GPT Agent]] CHECK modified files
   2. IF [[work]] IS incomplete
      1. THEN [[GPT Agent]] DOCUMENT status
      2. AND [[GPT Agent]] LIST remaining tasks

4. WHEN [[context]] IS collected
   1. THEN [[GPT Agent]] WRITE transfer document
      1. AND [[GPT Agent]] ADD conversation summary
         ```markdown
         # 📝 Conversation Summary
         ## Key Decisions
         ## User Preferences
         ## Issues & Solutions
         ```
      2. AND [[GPT Agent]] ADD work state
         ```markdown
         # 📊 Current Work State
         ## Modified Files
         ## Requirements Progress
         ## Ticket Progress
         ## Todo Progress
         ## Open Issues
         ```
      3. AND [[GPT Agent]] ADD next steps
         ```markdown
         # ⏭️ Next Steps
         ## Next Actions
         ## Blockers
         ## Required User Input
         ## Time-Sensitive Items
         ```

5. GIVEN [[transfer document]] IS written
   1. THEN [[GPT Agent]] VERIFY completeness
      1. AND [[GPT Agent]] CHECK all sections
      2. AND [[GPT Agent]] CHECK links
      3. AND [[GPT Agent]] CHECK clarity
   2. IF [[document]] NEEDS improvement
      1. THEN [[GPT Agent]] ENHANCE content
      2. AND [[GPT Agent]] VERIFY again

6. WHEN [[document]] IS verified
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW transfer document
      2. AND [[GPT Agent]] EXPLAIN content
   2. IF [[User]] APPROVES document
      1. THEN [[GPT Agent]] SAVE document
      2. AND [[GPT Agent]] NOTIFY target agent
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] MODIFY document
      2. AND [[GPT Agent]] PRESENT again

7. GIVEN [[transfer]] IS complete
   1. THEN [[GPT Agent]] VERIFY handover
      1. AND [[GPT Agent]] CONFIRM receipt
      2. AND [[GPT Agent]] CHECK understanding
   2. IF [[issues]] ARE found
      1. THEN [[GPT Agent]] RESOLVE issues
      2. AND [[GPT Agent]] VERIFY again
   3. IF [[handover]] IS successful
      1. THEN [[GPT Agent]] UPDATE work status
      2. AND [[GPT Agent]] INFORM [[User]] 