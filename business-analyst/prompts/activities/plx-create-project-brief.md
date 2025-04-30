Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_files} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

{persona}: Business Analyst
{doc_type}: Project Brief
{doc_location}: ai/pb.md
{relevant_files}:
    - @you-are-a-bmad-business-analyst.md
    - 
{user_request}: Create a comprehensive Project Brief document that clearly defines the problem, goals, target audience, core concept, and MVP scope for my product idea. Guide me through a structured brainstorming process to ensure all essential elements are captured, with special focus on distinguishing between the full vision and the essential MVP features. Include any relevant technical considerations that might impact development.