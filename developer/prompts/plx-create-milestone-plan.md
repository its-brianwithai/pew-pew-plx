Please create a comprehensive milestone plan based on the following user request and project context. Your task is to break down the request into a series of well-defined milestones that can be easily understood and executed by other AI agents.

This is my request:

<user_request>
{{USER_REQUEST}}
</user_request>

This request needs to be broken down into milestones.

To create the milestone plan, follow these steps:

1. Carefully analyze my user's instructions and any additional context provided.
2. Break down the request into a series of distinct milestones, each building upon the previous one and working towards the end goals.
3. For each milestone, create a detailed plan that includes:
   a. A clear description of the milestone's objectives
   b. Specific activities required to achieve the milestone
   c. Results or deliverables to be produced
   d. Acceptance criteria for the milestone
   e. A carefully crafted prompt (called the "milestone prompt plan") with EXACTLY all details needed to achieve the outcomes, deliverables, results, and acceptance criteria
   f. A high-level plan outlining the steps to complete the milestone

Remember that each milestone will be executed by AI agents with less context and abilities than yourself. Therefore, make the instructions and prompts as clear and executable as possible.

Output your milestone plan in the following format:

# Milestone Plan

## Milestone 1

### Description
[Detailed description of the milestone]

### Objectives
[List of specific objectives for this milestone]

### Activities
[List of activities required to complete the milestone]

### Results
[List of deliverables or results to be produced]

### Acceptance Criteria
[Clear and measurable acceptance criteria for the milestone]

### Prompt
[Carefully crafted prompt with all necessary details for achieving the milestone's outcomes]

### High Level Plan
[Step-by-step plan for completing the milestone]

## [Repeat the above structure for each additional milestone]

Ensure that each milestone is presented in a separate code block, allowing the user to easily copy and paste individual milestones for planning or execution purposes.

In your final output, include only the Milestone Plan section with its contents. Do not include any additional explanations or notes outside of the milestone plan structure.

IMPORTANT: If the full plan needs more than 5,000 tokens in context output, then split your output into multiple answers with a token output of 5,000 max each, where each part builds on the previous one. The user will manually copy and paste all the parts into a unified file. All you need to provide is the output, divided into answers of max 5,000 tokens. Each answer should be a markdown code block containing ONLY that part of the plan.

Upon the user saying 'next', you can output the next part of the plan.

Never use phrases like "or similar" or "something like that". Ensure all agents make the same decisions and build on the same information after each other.

Adhere to this workflow:
1. Start by researching the current codebase to get a proper understanding of the project.
2. Ask the user numbered questions to ensure 100% certainty about each part of the implementation.
3. Upon reaching 100% certainty, present the user with a global outline of milestones.
4. Process feedback from the user.
5. Output the plan according to the instructions and response template provided.

Remember:
- Split the plan up if needed.
- Start with researching the codebase.
- Ask questions to achieve 100% certainty.
- Process feedback.
- Output the plan in markdown codeblock(s).
- End your answer with a numbered list of all parts of the plan.
- Adhere to the instructions and response template provided.

Your final output should consist of only the Milestone Plan section with its contents, formatted as described above. Do not include any additional explanations or notes outside of the milestone plan structure.
