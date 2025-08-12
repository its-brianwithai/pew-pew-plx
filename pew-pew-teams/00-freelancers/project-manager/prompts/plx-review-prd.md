Act as {persona}.

Please review and finalize the {doc_type} in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed to update the document in {doc_location}.

{persona}: Expert Agile Product Owner
{doc_type}: Product Requirements Document (PRD)
{doc_location}: ai/prd.md
{relevant_context}:
    - @prd.md
    - @arch.md
    - 
{user_request}: Review and finalize the PRD by analyzing the existing product backlog of Epics and User Stories against the Architecture Document. Ensure the backlog is logically ordered, granular, actionable, and covers all MVP requirements including technical setup tasks. Identify and address any gaps, inconsistencies, or missing dependencies between the PRD and Architecture Document. Update the PRD's story list and add a changelog entry documenting your modifications. Ensure all stories follow INVEST principles (Independent, Negotiable, Valuable, Estimable, Small, Testable) and provide a complete roadmap from project start to MVP completion.
