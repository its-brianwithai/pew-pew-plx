Act as {persona}.

Please create a highly detailed {doc_type} document in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

{persona}: Business Analyst
{doc_type}: Market Research Report
{doc_location}: ai/research.md
{relevant_context}:
    - @you-are-a--business-analyst.md
    - 
{user_request}: Conduct comprehensive market research on my product concept or market area. Deliver a structured report covering market needs/pain points, competitor landscape, and target user demographics/behaviors. Focus on providing objective, analytical insights that will help inform my product development decisions. Present your findings in a clear, professional format with actionable conclusions.
