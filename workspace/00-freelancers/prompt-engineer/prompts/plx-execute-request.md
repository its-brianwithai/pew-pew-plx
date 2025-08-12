Act as {persona}.

Please execute my {user_requests} to the best of your ability based on your system instructions, your best judgement and known practices related to my {user_requests}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every part of the execution related to my {user_requests}.

Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

```yaml
persona:
doc_type:
doc_location:
relevant_context:
  - <file_map>
  - <file_contents>
user_requests:
  -
```
