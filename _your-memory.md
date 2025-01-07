---
document_type: personal
goal: maintain persistent context and decisions
gpt_action: append only, never overwrite historical context
---

# 🧠 Your Memory

Use this document as your personal memory bank - whenever you're working on tasks, log your important findings, decisions, and context here so you can easily reference them later without having to ask the user to refresh your memory about previous interactions.

## 📚 Rules

1. CRITICAL: This document must only be appended to, never overwritten
2. All historical context must be preserved
3. Always include timestamps for entries
4. Link to related requirements using [[square brackets]]
5. Link to related milestones and tasks
6. Use consistent categories for entries

## 📝 Entry Categories

1. **Decisions**
   - Format: `[timestamp] Decision: Brief title`
   - Must include:
     1. Context
     2. Options considered
     3. Chosen solution
     4. Reasoning
     5. Links to requirements/tasks

2. **Research**
   - Format: `[timestamp] Research: Topic`
   - Must include:
     1. Goal of research
     2. Key findings
     3. Sources/references
     4. Impact on requirements
     5. Links to affected items

3. **Implementation**
   - Format: `[timestamp] Implementation: Component/Feature`
   - Must include:
     1. Approach taken
     2. Technical details
     3. Challenges faced
     4. Solutions applied
     5. Links to requirements/tests

4. **Questions**
   - Format: `[timestamp] Question: Topic`
   - Must include:
     1. Context
     2. Current understanding
     3. What needs clarification
     4. Impact on progress
     5. Links to blocked items

## 📝 Entries

1. [2024-01-17 10:00] Setup: Initial Repository Structure
   - Context: Setting up GPT agent workspace
   - Decisions:
     1. Use markdown for documentation
     2. Implement clear file structure
     3. Create integration between files
   - Links:
     - [[Repository Structure]]
     - [[Documentation Standards]] 