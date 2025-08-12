# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Process the user's answers from the current questions document and continue the iterative refinement cycle.

<instructions>
1. Read through all answered questions (marked with [X])
2. Analyze the responses comprehensively to understand user preferences and requirements
3. Update the relevant project documents based on these answers
4. Present a brief summary of what was learned and what was updated
5. Update the questions document:
   - Move all answered questions to the "Answered Questions Archive" section
   - Add the current date and iteration number to the archived section
   - Create new questions in the "Current Questions" section based on:
     - Clarifications needed from the answers
     - Next logical steps in the refinement process
     - Any ambiguities or edge cases discovered
6. Ask the user to review and answer the new questions
</instructions>

<process>
## Step 1: Analyze Answers
- Extract all checked [X] responses
- Note any custom answers in "Other" fields
- Review additional context provided

## Step 2: Update Documents
- Apply learnings to relevant project documents
- Make concrete changes based on user choices
- Ensure consistency across all updates

## Step 3: Archive & Create
- Move answered questions to archive with:
  ```
  ### Iteration [N] - Completed [Today's Date]
  [All questions with [X] marked answers]
  ```
- Add new questions following the same format
- Group related questions together

## Step 4: Present Update
- Summarize what was understood
- List what was changed
- Show the new questions
- Wait for user to answer and say "done"
</process>

<constraints>
- ALWAYS preserve the complete history of Q&A
- ALWAYS analyze ALL answers before creating new questions
- ALWAYS make new questions build upon previous answers
- NEVER skip archiving answered questions
- NEVER create a new document - update the existing one
- ALWAYS maintain the document structure and formatting
</constraints>

Begin by analyzing the current answered questions and proceeding with the update cycle.
