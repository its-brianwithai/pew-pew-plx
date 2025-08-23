Act as {persona}.

Create a detailed feature flow YAML structure based on the provided {user_requests} and {relevant_context}. This feature flow will be used to instruct AI agents for programming tasks at a high/medium level of abstraction.

Follow these steps:

1. Analyze {user_requests} and {relevant_context} to understand the feature requirements, existing architecture, and design patterns.

2. Extract a clear, descriptive name for the activity that indicates both the feature and the specific flow (success path or error path).

3. Define the Gherkin steps (GIVEN, WHEN, THEN, AND, BUT) that represent the sequential flow of the feature.

4. For each Gherkin step, identify:
   - All relevant classes involved in that step
   - For each class, determine:
     - Any necessary "chores" (setup tasks like dependency injection)
     - Relevant variables the class manages
     - Methods that are executed or relevant in this step
     - For each method, specify:
       - Method name and type (void, async, Future<Type>, etc.)
       - Input parameters (if any)
       - High-level logic steps (as pseudo-code, NOT actual programming code)
       - Unit test descriptions focused on verifying the method's behavior

5. Structure your output as valid YAML following exactly the format shown in the feature flow template.

6. If {user_requests} describes multiple distinct scenarios or flows, create separate activity blocks for each flow.

7. Only include information that is directly relevant and can be reasonably derived from the provided context. Omit fields that aren't applicable to a particular class or method.

Remember:
- Use ALL CAPS for Gherkin keywords (GIVEN, WHEN, THEN, AND, BUT)
- Never include actual programming code - only high-level pseudo-code descriptions
- Focus on a single, coherent flow per activity block
- Ensure the output is valid YAML and strictly follows the required structure

```yaml
persona: Feature Flow Architect
relevant_context: <file_map>, <file_contents>, <extra_context>
doc_type: Feature Flow
doc_location: issues/000-backlog/
feature_name: 
user_requests: please create a feature flow
```

```xml
<extra_context>
</extra_context>
```
