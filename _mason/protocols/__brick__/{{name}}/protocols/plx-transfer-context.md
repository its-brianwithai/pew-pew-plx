---
document_type: protocol
goal: transfer work context between agents using your-transfer.md
gpt_action: follow these steps when transferring work
---

CONTEXT: The [[User]] wants to transfer work context between agents to maintain continuity and ensure smooth handoffs between different GPT agents working on the same task.

1. GIVEN [[User]] RUNS plx-transfer command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY transfer type
      2. AND [[You]] IDENTIFY transfer scope
   2. IF [[User]] input HAS specific agent
      1. THEN [[You]] FOCUS on agent
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] REQUEST target agent

2. WHEN [[You]] STARTS transfer
   1. THEN [[You]] CREATE [[your-transfer.md]]
      1. AND [[You]] ADD document header
      2. AND [[You]] ADD timestamp
      3. AND [[You]] PREPARE sections
   2. IF [[file]] EXISTS
      1. THEN [[You]] ARCHIVE old transfer
      2. AND [[You]] START new transfer

3. GIVEN [[transfer file]] IS created
   1. THEN [[You]] COLLECT context
      1. AND [[You]] CHECK conversation history
      2. AND [[You]] CHECK work documents
      3. AND [[You]] CHECK modified files
   2. IF [[work]] IS incomplete
      1. THEN [[You]] DOCUMENT status
      2. AND [[You]] LIST remaining tasks

4. WHEN [[context]] IS collected
   1. THEN [[You]] WRITE transfer document
      1. AND [[You]] ADD conversation summary
         ```markdown
         # 📝 Conversation Summary
         ## Key Decisions
         ## User Preferences
         ## Issues & Solutions
         ```
      2. AND [[You]] ADD work state
         ```markdown
         # 📊 Current Work State
         ## Modified Files
         ## Requirements Progress
         ## Ticket Progress
         ## Todo Progress
         ## Open Issues
         ```
      3. AND [[You]] ADD next steps
         ```markdown
         # ⏭️ Next Steps
         ## Next Actions
         ## Blockers
         ## Required User Input
         ## Time-Sensitive Items
         ```

5. GIVEN [[transfer document]] IS written
   1. THEN [[You]] VERIFY completeness
      1. AND [[You]] CHECK all sections
      2. AND [[You]] CHECK links
      3. AND [[You]] CHECK clarity
   2. IF [[document]] NEEDS improvement
      1. THEN [[You]] ENHANCE content
      2. AND [[You]] VERIFY again

6. WHEN [[document]] IS verified
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] SHOW transfer document
      2. AND [[You]] EXPLAIN content
   2. IF [[User]] APPROVES document
      1. THEN [[You]] SAVE document
      2. AND [[You]] NOTIFY target agent
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] MODIFY document
      2. AND [[You]] PRESENT again

7. GIVEN [[transfer]] IS complete
   1. THEN [[You]] VERIFY handover
      1. AND [[You]] CONFIRM receipt
      2. AND [[You]] CHECK understanding
   2. IF [[issues]] ARE found
      1. THEN [[You]] RESOLVE issues
      2. AND [[You]] VERIFY again
   3. IF [[handover]] IS successful
      1. THEN [[You]] UPDATE work status
      2. AND [[You]] INFORM [[User]] 
