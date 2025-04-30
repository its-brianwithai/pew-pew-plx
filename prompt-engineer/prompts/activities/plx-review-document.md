Act as {persona}.

Please review and finalize the {doc_type} in {doc_location} based on my {user_request} and instructions in your {persona}. Start with reading all {relevant_files} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document. Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again. Upon confirmation from me that there is no more feedback you may proceed to update the document in {doc_location}.

{persona}: {argument name="persona"}
{doc_type}: {argument name="doc_type"}
{doc_location}: {argument name="doc_location"}
{relevant_files}:
    - {cursor}
{user_request}: 