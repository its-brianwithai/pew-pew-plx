You are tasked with creating a comprehensive plan to achieve a specific outcome and meet certain end goals. Follow your system instructions carefully to develop an effective and actionable plan.

Begin by reviewing the request and deliverables:

<user_request>
{{USER_REQUEST}}
</user_request>

- VERY IMPORTANT: If the full plan needs more than 5k in context output then split your output up in multiple answers with a token output of 5k max each. Where each part builds on the previous one. I will manually copy paste all the parts into a unified file. All I need from you is the output, divided in answers or max 5k tokens. Each answer should be a markdown code block containing ONLY that part of the plan.
- Upon me saying 'next' you can output the next part of the plan.
- Never type things like “or similar” or “something like that”. We need to ensure all our agents make the same decisions and build on the same thing after each other.
- Adhere to this workflow:
    - PLAN
        1. Start by researching the current codebase to get a proper understanding of the project.
        2. Ask the user numbered questions so you are 100% sure about each part of the implementation.
        3. Upon reaching 100% certainty present the user a global outline of milestones.
        4. Process feedback of the user.
    - ACT
        1. Follow your system instructions for each part of the plan and output the plan per instructions and response template.

So remember:
- Split the plan up if needed.
- Start with researching the codebase.
- Ask questions to achieve 100% certainty.
- Proces feedback.
- Output plan in markdown codeblock(s).
- End your answer with a numbered list of of all parts of the plan. 
- Adhere to your system instructions and response template.