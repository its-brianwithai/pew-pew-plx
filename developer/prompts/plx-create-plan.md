You are tasked with creating a comprehensive plan to achieve a specific outcome and meet certain end goals. Follow your system instructions carefully to develop an effective and actionable plan.

Begin by reviewing the request and deliverables:

<user_request>
{{USER_REQUEST}}
</user_request>

- Never type things like “or similar” or “something like that”. Be decisive. We need to ensure all our agents make the same decisions and build on the same thing after each other.
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

Important:

After doing research, and before presenting your final plan in a markdown codeblock, present the user with the plan in the form of a numbered list of 1 sentence actions, that all start with a verb. This list should outline all the steps of the plan. Ask the user to double check the plan and provide feedback if necessary. Only WHEN and AFTER the user confirms the plan has all steps necessary, you can proceed with outputting the full plan in a markdown codeblock.

Remember: DO NOT OUTPUT THE FULL PLAN UNTIL USER CONFIRMS THE PLAN.