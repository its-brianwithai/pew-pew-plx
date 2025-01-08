---
document_type: protocol
goal: transfer current conversation context and work state to a new agent
gpt_action: follow these steps to create a transfer document for a new agent
---

# 🔄 Context Transfer Protocol

1. [[GPT Agent]] [[create transfer document]]
   1. [[create transfer document]]
      1. Create new file `your-transfer.md` in workspace root
      2. Add document header with metadata
      3. Add current timestamp
      4. Add conversation summary section
      5. Add work state section
      6. Add next steps section

2. [[GPT Agent]] [[summarize conversation]]
   1. [[summarize conversation]]
      1. Review all previous messages
      2. Extract key decisions and changes
      3. Document important user preferences
      4. Note any specific instructions or requirements
      5. List any errors or issues encountered
      6. Document solutions attempted

3. [[GPT Agent]] [[document work state]]
   1. [[document work state]]
      1. List all files created or modified
      2. Document current progress in `your-requirements.md`
      3. Document current progress in `your-ticket.md`
      4. Document current progress in `your-todo-list.md`
      5. Note any incomplete tasks or open issues
      6. List any pending user decisions

4. [[GPT Agent]] [[define next steps]]
   1. [[define next steps]]
      1. List immediate next actions
      2. Note any blockers or dependencies
      3. Document expected outcomes
      4. List any required user input
      5. Note any time-sensitive items

5. [[GPT Agent]] [[create transfer file]]
   1. [[create transfer file]]
      1. Use template:
         ```markdown
         ---
         document_type: agent work document
         goal: transfer current context and work state to new agent
         gpt_action: read this document to quickly understand current context and continue work
         created_at: <timestamp>
         ---

         # 📝 Conversation Summary
         > Key points and decisions from the conversation so far

         ## Key Decisions
         - Decision 1
         - Decision 2

         ## User Preferences
         - Preference 1
         - Preference 2

         ## Issues & Solutions
         - Issue 1: Solution 1
         - Issue 2: Solution 2

         # 📊 Current Work State
         > Status of work documents and tasks

         ## Modified Files
         - File 1: Changes made
         - File 2: Changes made

         ## Requirements Progress
         > Status from your-requirements.md
         - [ ] Requirement 1
         - [ ] Requirement 2

         ## Ticket Progress
         > Status from your-ticket.md
         - [ ] Task 1
         - [ ] Task 2

         ## Todo Progress
         > Status from your-todo-list.md
         - [ ] Todo 1
         - [ ] Todo 2

         ## Open Issues
         - Issue 1
         - Issue 2

         # ⏭️ Next Steps
         > Immediate actions for the new agent

         ## Next Actions
         1. Action 1
         2. Action 2

         ## Blockers
         - Blocker 1
         - Blocker 2

         ## Required User Input
         - Input needed 1
         - Input needed 2

         ## Time-Sensitive Items
         - Item 1
         - Item 2
         ```

6. [[GPT Agent]] [[verify transfer document]]
   1. [[verify transfer document]]
      1. Check all sections are complete
      2. Verify all links to other documents
      3. Ensure next steps are clear
      4. Confirm all critical context is included

7. [[GPT Agent]] [[notify completion]]
   1. [[notify completion]]
      1. Inform user that transfer document is ready
      2. Provide location of `your-transfer.md`
      3. Ask if any additional context is needed 