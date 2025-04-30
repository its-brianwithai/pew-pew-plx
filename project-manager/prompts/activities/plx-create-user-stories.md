Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_files} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

{persona}: Technical Product Manager
{doc_type}: Backlog of Epics & User Stories
{doc_location}: ai/stories.md
{relevant_files}:
    - @prd.md
    - @arch.md
    - @bmad-story-template.md
    - @you-are-a-bmad-product-manager.md
    - 
{user_request}: Create a comprehensive, prioritized product backlog with clearly defined epics and user stories that follow a logical implementation sequence. Each story should be granular, actionable, and include detailed acceptance criteria that junior developers can implement incrementally. Ensure complete coverage of all requirements in the PRD, including technical setup tasks, data models, UI components, and integration points. Structure the backlog to support step-by-step development that builds functionality progressively while maintaining alignment with the architectural decisions documented in the architecture document.