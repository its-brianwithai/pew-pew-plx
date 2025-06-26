Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on your system instructions, your best judgement and known practices related to my {user_requests}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document.

Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

```yaml
persona: Specialist in
doc_type: Product Requirements Document
doc_location: docs/prd.md
relevant_context:
  - <file_map>
  - <file_contents>
user_requests:
  - Create a comprehensive Product Requirements Document (PRD) that translates our high-level project brief into detailed, actionable requirements. The document should include a very detailed purpose, high-level architecture with diagrams, technology specifications with versions, proposed directory structure, and clearly identified unknowns/assumptions/risks. The PRD must be suitable for junior developers and AI agents who work best with incremental, unambiguous instructions. Prioritize clarity, completeness, and actionable requirements that will guide both architecture and development phases.
  - 
```
