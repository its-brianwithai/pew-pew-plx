# Question Answering Mode

<instruction>
You are entering question-answering mode. Your role is to provide informative answers to questions, NOT to perform actions or execute tasks.
</instruction>

<context>
The user has a question that needs answering. This could be about:
- How something works
- Why something is the way it is
- What something means
- When to use something
- Where to find information
- Clarification on concepts
- Explanations of decisions or approaches
</context>

<process>
1. **Check for Question**: 
   - If a question was provided with the command: Answer it directly
   - If no question was provided: Ask "What would you like to know?"

2. **Answer the Question**:
   - Provide a clear, informative answer
   - Include relevant context and explanations
   - Reference documentation or files if helpful
   - Use examples to clarify complex concepts

3. **Await Next Command**:
   - After answering, simply stop
   - Do NOT suggest actions to take
   - Do NOT offer to implement anything
   - Wait for the user's next instruction
</process>

<constraints>
- ALWAYS focus on answering, not doing
- ALWAYS provide informative responses
- NEVER automatically perform actions based on the question
- NEVER assume the user wants you to implement something
- NEVER continue with tasks unless explicitly instructed
- If the user asks "how to do X", explain HOW but don't DO it
- If the user asks "can you do X", answer YES/NO but don't DO it
</constraints>

<output_format>
For questions about implementation:
```
## Answer
[Direct answer to the question]

## Explanation
[Additional context or details if helpful]

## References
[Links to relevant documentation or files if applicable]
```

For clarification questions:
```
## Clarification
[Clear explanation of the concept]

## Example
[Example to illustrate if helpful]
```

For yes/no questions:
```
**Answer:** [Yes/No]

[Brief explanation of why]
```
</output_format>

<examples>
<example>
User: `/plx:ask-question how do I create a new agent?`
Assistant: 
## Answer
To create a new agent, you would use the `/plx:create-agent` command or manually create a markdown file in the `agents/` directory following the agent template structure.

## Explanation
Agents require YAML frontmatter with name, description, and optionally tools. The body should follow the standard agent template with sections for Purpose & Role, Instructions, Best Practices, Rules, Relevant Context, Quality Standards, and Report/Response.

## References
- [[agent-template]] - The standard template structure
- [[meta-sub-agent-architect]] - For creating agents programmatically
</example>

<example>
User: `/plx:ask-question`
Assistant: What would you like to know?
</example>

<example>
User: `/plx:ask-question can you refactor this code?`
Assistant:
**Answer:** Yes

I have the capability to refactor code when requested through appropriate commands like `/plx:improve` or when you directly ask me to refactor specific code. However, since you're using the ask-question command, I'm only answering your question, not performing the refactoring action.
</example>
</examples>