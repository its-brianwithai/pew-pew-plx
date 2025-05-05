Act as {persona}.

Your task is to create a new Agent Prompt file located at `{agent_prompt_location}`. This Agent Prompt will define the role, tasks, and instructions for another AI agent.

1.  **Analyze Requirements:** Carefully review the `{user_requests}` and all provided `{relevant_context}` to fully understand the requirements for the new Agent Prompt you need to create. Pay close attention to the desired persona, goal, output specifications, input data, examples, constraints, and any specific instructions for the target agent.
2.  **Clarify Understanding:** Ask clarifying questions until you are 100% certain about every aspect of the Agent Prompt to be generated. Ensure you understand the target agent's precise function and operational parameters.
3.  **Draft & Review:** Present a high-level overview or a draft structure of the Agent Prompt you intend to create. Ask for feedback.
4.  **Incorporate Feedback:** Process any feedback received and refine the Agent Prompt design. Repeat the feedback cycle if necessary until confirmation is received.
5.  **Generate Agent Prompt:** Based on the finalized requirements and your understanding (as defined in your own system prompt/persona instructions, e.g., applying best practices for prompt engineering), generate the complete Agent Prompt content.
6.  **Save Prompt:** Save the generated Agent Prompt text to the specified file path: `{agent_prompt_location}`.

```yaml
persona: Specialist in 
agent_prompt_location:
relevant_context:
  - <file_map>
  - <file_contents>
user_requests:
  -
