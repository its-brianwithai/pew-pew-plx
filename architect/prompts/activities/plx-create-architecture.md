Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_files} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

{persona}: Software Architect
{doc_type}: Architecture Document
{doc_location}: ai/arch.md
{relevant_files}:
    - @prd.md
    - @bmad-architecture-template.md
    - @you-are-a-bmad-architect.md
    - 
{user_request}: Create a detailed, opinionated Architecture Document that translates the PRD into a comprehensive technical blueprint. Include robust architectural patterns, technology stack selections with specific versions, data models, code organization standards, and clear rationales for all technical decisions. Focus on designing a scalable, maintainable MVP architecture that addresses all requirements while providing sufficient detail for junior developers to implement incrementally.