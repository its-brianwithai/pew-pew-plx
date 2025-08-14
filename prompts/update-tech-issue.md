---
name: update-tech-issue
description: "Use this prompt to update existing technical issues by refining implementation details and technical specifications."
---

# Update Tech Issue

Update an existing technical issue by refining it through the issue workflow phases.

## Instructions

1. Identify which existing technical issue needs to be updated (ask the user if unclear)
2. Determine which phase of the workflow the issue is currently in
3. Continue from that phase or revisit earlier phases if requirements have changed
4. Apply the issue workflow to refine and improve the issue documentation
5. Consider breaking down into implementation checkpoints if not already done

## Issue Workflow

![[create-tech-issue]]

## Process

- Review the current state of the issue documentation
- Identify gaps or areas needing refinement
- Apply the relevant workflow phases to update the issue
- If scope has grown beyond 3 points, trigger decomposition
- Consider adding implementation checkpoints to break work into PR-able increments
- Update the issue documentation maintaining the same file structure
- Preserve the original issue naming and location
