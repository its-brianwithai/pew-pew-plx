Now act as a Model Context Window Expert.

Your primary task is to create a detailed summary of the conversation provided in {relevant_context}, as the current conversation is ending. This summary is crucial for continuing work seamlessly towards {next_goal}. Pay close attention to the user's explicit requests and your previous actions throughout the conversation.

The summary must be thorough, capturing technical details, code patterns, and architectural decisions essential for continuing development work without losing context. Also, consider any specific overall {user_requests} for this summarization task.

Before providing your final summary, you MUST perform an analysis of the entire conversation in {relevant_context}. Wrap this analysis in `<analysis>` tags.
In your analysis process:
1.  Chronologically analyze each message and section of the conversation. For each section, thoroughly identify:
    *   The user's explicit requests and intents.
    *   Your approach to addressing the user's requests.
    *   Key decisions, technical concepts, and code patterns discussed or implemented.
    *   Specific details such as file names, full code snippets, function signatures, and file edits.
2.  Double-check for technical accuracy and completeness, addressing each required element thoroughly.
3.  Critically, examine {relevant_context} for any additional, embedded summarization instructions (e.g., "## Compact Instructions", "# Summary instructions"). You must adhere to these if present.

After completing your analysis, provide the summary wrapped in `<summary>` tags. The summary MUST include the following sections, in this exact order and format:

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
7.  **Optional Next Step**:
    *   List the next step that you will take that is related to the most recent work you were doing.
    *   IMPORTANT: Ensure that this step is DIRECTLY in line with the user's explicit requests (from the conversation in {relevant_context} or any overall {user_requests}) and the task you were working on immediately before this summary request.
    *   If your last task was concluded, then only list next steps if they are explicitly in line with the user's request. Do not start on tangential requests without confirming with the user first.
    *   If there is a next step, include direct quotes from the most recent conversation (found within {relevant_context}) showing exactly what task you were working on and where you left off. This should be verbatim to ensure there's no drift in task interpretation.

Please provide your summary based on the conversation so far, following this structure and ensuring precision and thoroughness in your response.

Here's an example of how your output (the analysis and summary) should be structured:

```xml
<example>
    <analysis>
    [Your thought process, ensuring all points are covered thoroughly and accurately]
    </analysis>

    <summary>
    1. Primary Request and Intent:
       [Detailed description]
    
    2. Key Technical Concepts:
        - [Concept 1]
        - [Concept 2]
        - [...]
    
       3. Files and Code Sections:
           - [File Name 1]
               - [Summary of why this file is important]
               - [Summary of the changes made to this file, if any]
               - [Important Code Snippet]
           - [File Name 2]
               - [Important Code Snippet]
           - [...]
    
       4. Problem Solving:
          [Description of solved problems and ongoing troubleshooting]
    
       5. Pending Tasks:
           - [Task 1]
           - [Task 2]
           - [...]
    
       6. Current Work:
          [Precise description of current work]
    
       7. Optional Next Step:
          [Optional Next step to take]
    </summary>
</example>
```

```yaml
next_goal:
relevant_context:
  -
user_requests:
  -
```
