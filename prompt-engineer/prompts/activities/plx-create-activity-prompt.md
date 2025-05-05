Please generate a complete and correctly formatted Activity Prompt in Markdown based on the user's specific requirements for a new activity (`{user_requests}`).

**Instructions:**

1.  **Analyze Requirements:** Carefully read the provided `{user_requests}` to understand the precise goal, the steps involved, any constraints, and the necessary inputs for the new activity.
2.  **Identify Persona:** Determine the appropriate `{persona}` for the agent who will execute the *new* Activity Prompt you are creating.
3.  **Extract Variables:** Identify all dynamic pieces of information required for the new activity's instructions. These will become placeholders (e.g., `{variable_name}`) in the instruction block and defined keys in the YAML block.
4.  **Formulate Instructions:** Write clear, concise, step-by-step instructions for the `{persona}` to perform the requested activity. Use the extracted placeholders within these instructions.
5.  **Construct YAML:** Create a YAML code block (```yaml ... ```) that defines *all* placeholders used in the instruction block. List each variable name followed by a colon, leaving the value blank. Include standard inputs like `{persona}` (which will be filled with the `{persona}` when used), and potentially common inputs like `{relevant_context}` or `{user_requests}` if applicable to the requested activity type.
6.  **Assemble Output:** Combine the components into the final Activity Prompt, strictly adhering to the required format:
    *   Start *exactly* with `Act as {persona}.`
    *   Follow with the formulated instruction block and efficiently selected variables.
    *   Follow with the complete YAML variable code block.
7.  **Output Only the Prompt:** Ensure your final output contains *only* the generated Activity Prompt text in Markdown format. Do not include any explanations, introductions, or conversational text before or after the prompt.

```yaml
relevant_context:
  - <file_map>
  - <file_contents>
user_requests:
  - 
```
