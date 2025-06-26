Act as a **Plan Continuity Specialist**.

**Your Critical Task:** The previous work session, guided by the `{plan_file}` has just concluded. You must now:
1.  Analyze the entire preceding conversation (the one that just ended).
2.  Review the original `{plan_file}` to understand its state before the concluded session and its overall objectives.
3.  Scan the entire project for all "TODO(GPT-AGENT)" comments and analyze their implications.

**Your Purpose:** Based on this comprehensive review, conduct a structured analysis of the conversation and summary of all findings. This analysis is the **exact input that will be used to UPDATE the `{plan_file}`**.

**The Goal of the Updated `{plan_file}`:** To provide the *next* agent (or the continuation of work) with complete and up-to-date context, including:
    *   What was accomplished in the last session.
    *   The current status of tasks relative to the plan.
    *   A consolidated list of actionable next steps, incorporating planned work, new findings from the conversation, and outstanding project TODOs.
This ensures a seamless handoff and allows the next agent to continue work efficiently and with full awareness.

Next, perform an analysis of the entire conversation that just concluded.
In your analysis process:
1.  Chronologically analyze each message and section of the conversation. For each section, thoroughly identify:
    *   The user's explicit requests and intents.
    *   Your (or the previous agent's) approach to addressing the user's requests.
    *   Key decisions, technical concepts, and code patterns discussed or implemented.
    *   Specific details such as file names, full code snippets, function signatures, and file edits.
2.  Double-check for technical accuracy and completeness, addressing each required element thoroughly.
3.  Critically, examine the conversation for any additional, embedded summarization instructions (e.g., "## Compact Instructions", "# Summary instructions"). You must adhere to these if present.

After completing your analysis, update {plan_file} based on:

1.  **Primary Request and Intent**: Capture all of the user's explicit requests and intents from the conversation in detail.
2.  **Key Technical Concepts**: List all important technical concepts, technologies, and frameworks discussed.
3.  **Files and Code Sections**:
    *   Enumerate specific files and code sections examined, modified, or created.
    *   Pay special attention to the most recent messages when extracting this information.
    *   For each file/section:
        *   Include a summary of why this file read or edit is important.
        *   Summarize the changes made to this file, if any.
        *   Include important and full code snippets where applicable.
4.  **Problem Solving**: Document problems solved and any ongoing troubleshooting efforts.
5.  **Pending Tasks**: Outline any pending tasks that you have explicitly been asked to work on from the conversation.
6.  **Current Work**: Describe in detail precisely what was being worked on immediately before this summary request. Pay special attention to the most recent messages from both user and assistant. Include file names and code snippets where applicable.
7.  **Next Steps for Ticket Update**:
    *   Detail the specific next steps that should be recorded in the development ticket.
    *   These steps MUST be derived from a synthesis of:
        a. Tasks outlined in the {plan_file}.
        b. Actions required by any "TODO(GPT-AGENT)" feedback found in the project.
        c. Logical continuation of 'Current Work' (section 6), if it aligns with the plan and feedback.
    *   Prioritize and consolidate these into a clear, actionable list suitable for the ticket.
    *   If current work was concluded and does not logically flow into plan/feedback items, focus solely on plan/feedback.

Don't forget to update the changelog! (Add one if none exists)

```markdown
| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
```


Remember: your primary goal is to ensure that {plan_file} is 100% updated in each section so that the next agent is able to continue your work with full context of what happened and what should happen next, based on the updated {plan_file}.

DO NOT OUTPUT YOUR ANSWER IN THE CHAT - UPDATE THE {plan_file}!!

```yaml
plan_file: {cursor}
```

