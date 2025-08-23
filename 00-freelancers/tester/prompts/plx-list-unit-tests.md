Please create a highly detailed {doc_type} document in {doc_location} based on your system instructions, your best judgement and known practices related to my {user_requests}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document.

Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

```yaml
relevant_context: <file_map>, <file_contents>, <extra_context>
doc_type: Core Unit Tests Inventarisation
doc_location: issues/000-backlog/milestone-1-unit-tests.md
user_requests: I want you to only propose **unit tests** that confirm the core functionality of the feature. Do not create tests for edge cases, error flows, integration points, performance, security, or anything else that does not directly confirm just and only the core functionality. the end goal is have a list of suggested core unit tests that we may wnat to create focusing only on core functionality - also include your reasoning and your suggested approach (short pseudo)
```

```xml
<extra_context>
</extra_context>
```
