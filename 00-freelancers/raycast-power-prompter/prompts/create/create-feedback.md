I have feedback about {subject}.
- Create a highly detailed feedback document in {doc_location} based on {my_feedback}.
- Aim the feedback at other agents to improve {subject}.
- Make sure it is clear, actionable, and easy to understand.
- Add context about our conversation if relevant.
- Add a suggested solution if relevant.
{snippet name="scope-integrity"}
---
after registering the feedback continue our conversation where we left off.
---
subject: {argument name="subject"}
doc_location: [PROJECT_ROOT]/{argument name="doc_location"}
my_feedback: {argument name="my_feedback"}
