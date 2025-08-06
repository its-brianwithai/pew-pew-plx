# /create-workflow-step

When this command is invoked, document the current work session into a structured workflow step that serves as input for future workflow creation.

<instruction>
You are to create comprehensive workflow documentation that captures work done in the current session. This documentation will be saved as a step file to be processed later by workflow creation tools.

Follow this exact process:

1. **SCAN EXISTING WORKFLOWS**
    - Check `drafts/workflows/` directory for existing workflow folders
    - If user hasn't specified a workflow name, list available workflows or suggest creating a new one
    - Scan the specified workflow folder for existing step files
    - Auto-determine the next step number (zero-padded: 01, 02, 03...)

2. **PRESENT DOCUMENTATION OPTIONS**
   Always present the user with these choices:

   ```
   What would you like to document?
   
   1. All work done up until now (comprehensive)
   2. [Context-specific option based on recent work]
   3. [Another specific aspect if applicable]
   4. Custom scope (you specify)
   ```

   Generate smart suggestions for options 2 and 3 based on work context:
    - If package renaming was done: "Package Renaming Process"
    - If features were removed: "Remove [Feature Name]"
    - If debugging occurred: "Debug and Fix [Issue]"
    - If refactoring was done: "Refactor [Component]"

3. **GATHER DOCUMENTATION SCOPE**
   Based on user's choice, determine:
    - Start point of documentation
    - End point of documentation
    - Key steps to emphasize
    - Commands and changes to capture

4. **CREATE WORKFLOW DOCUMENTATION**
   Generate a markdown file with this structure focused on STEPS ONLY:
   </instruction>

<output_format>
# Step [NUMBER]: [Action Title]

## Purpose
[One sentence describing what this step accomplishes]

## Prerequisites
- [Required condition or completion before this step]
- [Another prerequisite if applicable]

## Steps

### 1. [Action Title]
```bash
# [Optional comment if command needs context]
[exact command executed]
```
**Result:** [What happened or what was produced]

### 2. [Action Title]
```[language]
[code block if applicable]
```
**Result:** [Outcome or changes made]

### 3. [Action Title]
[Description of manual action if not a command]
**Result:** [What was accomplished]

[Continue numbering for all steps...]

## Verification
- [ ] [Specific check to confirm step success]
- [ ] [Another verification point]
- [ ] [Final validation]

## Output
- [What was produced or changed by this step]
- [Files created/modified with paths]
- [State changes achieved]
  </output_format>

<constraints>
- File naming: `drafts/workflows/{workflow-name}/step-{number}-{description}.md`
  - {number}: Zero-padded 2 digits (01, 02, 03...)
  - {description}: Kebab-case description matching the action (e.g., rename-package, remove-features)
- Focus ONLY on concrete steps and actions taken
- NO agent assignments, NO orchestration details, NO prompt references
- Use action-focused titles in Title Case (e.g., "Rename Package", "Remove Task Feature")
- Capture actual commands exactly as executed
- Document results and outcomes for each step
- Keep steps atomic and reproducible
- Include verification criteria that can be checked
</constraints>

<example>
User: /create-workflow-step
</example>
