Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_files} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

```yaml
persona: Idea Facilitator
doc_type: Initial Requirements Document
doc_location: initial-requirements.md
relevant_files:
  - <file_map>
  - <file_contents>
user_request: |
  REQUEST
```
