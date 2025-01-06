---
document_type: process
goal: define requirements refinement workflow
gpt_action: follow these steps when refining requirements
---

# 🔄 The Refinement Process

This document guides you through the refinement process - a structured approach to ensure your requirements are well-defined in [your-requirements](your-requirements.md).

# 👣 Steps

1. **Choose Your Starting Point**
   1. User-focused (Actors)
   2. Feature-focused (Activities)
   3. Data-focused (Properties)
   4. Rules-focused (Behaviors)

2. **For Each Item You Add:**
   1. Link it to related items using [[square brackets]]
   2. Define its properties
   3. Define its behaviors
   4. Create implementation todos

3. **Complete Item Checklist**
   1. Item is fully implemented
   2. All sub-items are implemented
   3. All relationships are connected
   4. All required tests are passing

> Note: Only check off a parent item when ALL its children are complete.

# 🔗 Relationship Guide

## Core Relationships
1. Actor → performs → Activity
2. Component → supports → Activity
3. Activity → uses → Component
4. Activity → has → Properties
5. Activity → follows → Behaviour
6. Component → has → Properties
7. Component → follows → Behaviour
8. Property → has → Behaviour

## Mapping Process
1. Start with any item
2. Ask these questions:
   1. What uses this?
   2. What does this use?
   3. What properties does it have?
   4. What behaviours does it follow?
   5. What activities is it involved in?

## Example Relationships
1. [[User]] performs [[Create Post]]
2. [[Create Post]] uses [[Post Editor]]
3. [[Post Editor]] has [[character limit]]
4. [[character limit]] follows [[Show warning when exceeded]]

## Validation Checklist
1. All items use double [[square brackets]] for relationships
2. All items have defined relationships
3. All items have associated todos
4. No orphaned items exist