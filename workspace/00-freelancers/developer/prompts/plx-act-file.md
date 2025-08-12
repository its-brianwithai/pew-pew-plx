Your primary task is to execute the work defined in the document located at `{doc_path}`. You must ensure your work aligns with your defined persona, the provided document, and all supporting information.

Please follow these steps meticulously:

1.  **Understand Your Role:** Begin by thoroughly reviewing your own system instructions and persona definition. This is crucial as it will guide your approach, standards, decisions, and overall quality of work.
2.  **Analyze the Task Document:** Carefully read and fully comprehend the work defined in the document specified by `{doc_path}`. Focus on understanding the primary goals, explicit requirements, any specified deliverables, and the overall scope of the task.
3.  **Review Supporting Information:** Examine all additional information provided through `{relevant_context}` (which includes the project's file structure and the content of other relevant files) and the original `{user_requests}`. This is to ensure you grasp the broader project landscape, interdependencies, and any overarching constraints or objectives that might influence the execution of the task outlined in `{doc_path}`.
4.  **Seek Absolute Clarity:** Based on your comprehensive understanding from steps 1-3, formulate and ask any clarifying questions necessary to resolve all ambiguities. You must reach 100% certainty regarding every aspect of the task's requirements, its expected outcomes, and the method of execution before proceeding.
5.  **Propose Execution Strategy:** Once all uncertainties are resolved, present a high-level strategy for completing the work. This strategy should outline your intended approach, key actions or phases, and any significant considerations or potential challenges. Request feedback on this strategy.
6.  **Incorporate Feedback and Refine:** Thoroughly review any feedback received on your proposed strategy. If adjustments are needed, incorporate them and, if the changes are substantial, present the revised strategy for another round of feedback. Repeat this cycle until your execution strategy is confirmed.
7.  **Execute the Defined Work:** Upon receiving confirmation of your execution strategy, proceed to perform the tasks as detailed in `{doc_path}` and your agreed-upon plan. Ensure your execution strictly adheres to your persona's operational guidelines (e.g., quality standards, specific methodologies, technical best practices).
8.  **Update Task Document and Log Changes:** After completing the work, revisit the document at `{doc_path}`.
*   Update the document's main content as necessary to reflect the completion of the task, including any outputs, results, or modifications made.
*   Locate a "Change Log" section within this document, typically found towards the end. If this section does not exist, create it using a Markdown heading (e.g., `## Change Log`).
*   This section should contain a Markdown table. Add a new row to this table detailing the work you've just completed. Ensure your entry includes the current date, a brief description of the changes, and your designated author name/identifier. Follow the established table structure, similar to this example:

    ```markdown
    ## Change Log

    | Change        | Date       | Version | Description             | Author         |
    | ------------- | ---------- | ------- | ----------------------- | -------------- |
    | Initial draft | YYYY-MM-DD | 0.1     | Initial document creation | Previous Author|
    | Implemented X | YYYY-MM-DD | 0.2     | Completed task details  | {my_author_name}  |
    ```
    Adapt the "Change", "Version", and "Description" fields as appropriate for the work performed.

```yaml
my_author_name: 
doc_path:
relevant_context: <file_map>, <file_contents>
```

<user_requests>

</user_requests>
