Act as {persona}.

Please create a highly detailed System Workflow document in {doc_location} based on your system instructions, your best judgement and known practices related to my {user_requests}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document.

Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

1.  **Understand Your Inputs:**
    *   `{persona}`: This defines your role as the System Workflow Document Generator.
    *   `{doc_type}`: The type of document you are creating (e.g., "System Workflow"). Use this for context.
    *   `{doc_location}`: The suggested location or path where the generated document might be saved. Use this for context.
    *   `{user_requests}`: This is the **primary source of content** for populating the template sections (e.g., Goals, Rules, Scope, Steps, Insights). It may be a single string or a list of strings; if a list, combine them to form the main input text. Parse this combined content carefully as it may contain structured information or direct text for various sections of the workflow document.
    *   `{relevant_context}`: This input is a collection (e.g., a list of file paths, text content, or structured data blocks) providing additional context.
        *   Identify and use general descriptive text from `{relevant_context}` to primarily inform the `# 🔖 Description` section of the System Workflow Template. This corresponds to how the `relevant_context` field would be used if you were directly processing `workflow_specifications` as detailed in your core persona instructions. Use this information unless overridden by more specific instructions found within `{user_requests}`.
        *   Identify and extract supplemental information from `{relevant_context}`, which might be structured (e.g., XML). This corresponds to how the `extra_context` field would be used from `workflow_specifications`. Use this to fill in details not covered by `{user_requests}`.
    *   `{author_name}`: The name of the author to be used in the Changelog section of the document. If this is not provided or is empty, use the default placeholder (e.g., `{author_name_placeholder}`) as specified in your core persona instructions for initializing the changelog.

2.  **Generation Process:**
    *   Consult your core persona instructions for the exact System Workflow Template structure, detailed section descriptions, placeholder conventions (like using `{author_name_placeholder}` for the changelog if `{author_name}` is not provided), and specific output format requirements.
    *   Populate each section of the System Workflow Template. Prioritize content from `{user_requests}`. Supplement with information interpreted from `{relevant_context}` (for the Description section and any other supplemental details) as appropriate.
    *   If `{user_requests}` (after combination, if it was a list) provides specific content for a section (e.g., a list of goals, rules), use that content directly.
    *   If the content derived from `{user_requests}` includes placeholders (e.g., `{some_variable_in_workflow}`), these placeholders MUST be preserved in the generated Markdown output. This ensures the reusability of the generated workflow document.
    *   Replace instructional placeholder comments within the template (e.g., `<!-- Goal 1: e.g., To streamline the process of X. -->`) with actual content derived from the inputs.
    *   If the inputs do not provide specific content for all items in a list within the template (e.g., only one goal is provided, but the template has space for two), generate the provided item(s) and retain the template's placeholder comments for the remaining, unfulfilled items.
    *   If the inputs do not provide content for an entire optional section (e.g., Insights), the section heading and its main instructional placeholder comment(s) should still be included in the output to maintain the template's structural integrity.
    *   Initialize the `# 📜 Changelog` section with a first entry as specified in the System Workflow Template. Use the provided `{author_name}`. If `{author_name}` is empty or not provided, use the appropriate placeholder (e.g., `{author_name_placeholder}`) as per your core persona instructions.

3.  **Output Requirements:**
    *   The final output MUST be a single Markdown text document.
    *   Strictly adhere to the section order, headings, and formatting (including Markdown syntax like bullet points, numbered lists, blockquotes, and code blocks) of the System Workflow Template as defined in your core persona instructions.

```yaml
persona: System Workflow Expert
relevant_context: <file_map>, <file_contents>, <extra_context>
doc_type: System Workflow
doc_location:
user_requests:
author_name:
```

```xml
<extra_context>
</extra_context>
```
