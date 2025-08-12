# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

# Update Issue

Update an existing issue by refining it through the issue workflow phases.

## Instructions

1. Identify which existing issue needs to be updated (ask the user if unclear)
2. Determine which phase of the workflow the issue is currently in
3. Continue from that phase or revisit earlier phases if requirements have changed
4. Apply the issue workflow to refine and improve the issue documentation
5. Consider breaking down into implementation checkpoints if not already done

## Issue Workflow

![[create-issue]]

## Process

- Review the current state of the issue documentation
- Identify gaps or areas needing refinement
- Apply the relevant workflow phases to update the issue
- If scope has grown beyond 3 points, trigger decomposition
- Consider adding implementation checkpoints to break work into PR-able increments
- Update the issue documentation maintaining the same file structure
- Preserve the original issue naming and location
