Act as {persona}.

Please create a highly detailed {output_doc_type} document in {output_doc_location}. This document will be the result of transforming the provided {input_doc_location} (which is a {input_doc_type} related to Subject A) into the same document archetype but adapted for Subject B, based on your system instructions, your best judgement, known practices for the archetype, and my {user_requests}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every aspect of the required transformation and the final document structure.

Upon reaching 100% certainty, present me with a high-level overview of the planned transformation (including abstracted source structure, transferable elements, adaptation logic for Subject B, adapted goal, and planned output structure) and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback on the plan, you may proceed to create the final transformed document in {output_doc_location}.yaml

```yaml
persona:
input_doc_location:
input_doc_type:
output_doc_location:
output_doc_type:
relevant_context:
  - <file_map>
  - <file_contents>
user_requests:
  -
```
