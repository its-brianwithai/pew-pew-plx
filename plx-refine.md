---
document_type: protocol
goal: refine requirements based on user input following the refinement process
gpt_action: follow these steps when tagged with this protocol
---

# 🔄 Refine Requirements

When you receive this protocol, analyze user input and refine requirements following [the-refinement-process](the-refinement-process.md).

## 1️⃣ Input Analysis

1. Process User Input
   1. Extract key concepts
   2. Identify starting point:
      - User-focused (Actors)
      - Feature-focused (Activities)
      - Data-focused (Properties)
      - Rules-focused (Behaviors)
   3. List initial relationships
   4. Note constraints

2. Review Current State
   1. Check [your-requirements](your-requirements.md)
   2. Identify affected items
   3. Note existing relationships
   4. List impacted areas

## 2️⃣ Refinement Process

1. Map Relationships
   1. Follow relationship guide:
      - Actor → performs → Activity
      - Component → supports → Activity
      - Activity → uses → Component
      - Activity → has → Properties
      - Activity → follows → Behaviour
   2. Use [[square brackets]] for links
   3. Document connections
   4. Verify completeness

2. Define Properties
   1. List characteristics
   2. Set constraints
   3. Define validations
   4. Document behaviors

## 3️⃣ Implementation Planning

1. Create Todo Items
   1. Add to [your-todo-list](your-todo-list.md)
   2. Link to requirements
   3. Set dependencies
   4. Define milestones

2. Document Context
   1. Update [your-memory](your-memory.md)
   2. Note key decisions
   3. Record assumptions
   4. List open questions

## ✅ Validation

1. Check Requirements
   - [ ] All items properly linked
   - [ ] Properties defined
   - [ ] Behaviors documented
   - [ ] Relationships mapped

2. Verify Process
   - [ ] Starting point clear
   - [ ] Sub-items complete
   - [ ] Todos created
   - [ ] Tests identified

3. Review Completeness
   - [ ] No orphaned items
   - [ ] All relationships defined
   - [ ] Implementation path clear
   - [ ] Documentation updated

Remember:
- Only check off parent items when ALL children are complete
- Always use [[square brackets]] for relationships
- Create implementation todos for each item
- Document all decisions and assumptions 