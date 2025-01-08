---
document_type: protocol
goal: create todos following test-driven workflow
gpt_action: follow these steps when tagged with this protocol
---

# ✅ Create Todo

When starting a new project or task, create a structured todo list in [your-todo-list](your-todo-list.md). Break down work into milestones, and milestones into tasks. Always end milestones with tests.

## 1️⃣ Check User Tasks in [your-todo-list](your-todo-list.md)
- Always handle user-added tasks immediately
- Clear the user tasks section before continuing

## 2️⃣ Structure Your Todos

1. Break Down Into Milestones
   ```markdown
   - [ ] 🎯 Setup Project
       - [ ] Create basic structure
       - [ ] Add dependencies
       - [ ] Run setup tests

   - [ ] 🚀 Core Features
       - [ ] Implement X
       - [ ] Implement Y
       - [ ] Run feature tests
   ```

2. Add Tasks Under Milestones
   ```markdown
   - [ ] 🎯 Milestone Name
       - [ ] Small, specific task
       - [ ] Another clear task
       - [ ] Run milestone tests
   ```

3. Track Blocked Tasks
   ```markdown
   - [ ] ⏸️ Blocked
       - [ ] Task (reason for block)
   ```

## 3️⃣ Follow Test-Driven Workflow
1. Run tests
2. Find first fail
3. Research solution
4. Present plan
5. Get feedback
6. Update todo
7. Fix
8. Repeat 