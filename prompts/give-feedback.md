# Slash Command

When this command is used, execute the following instructions.

---

<instruction>
You've been asked to capture feedback about a PLX framework component (agent, template, workflow, or prompt) to help improve the framework. This feedback will be processed by the appropriate meta agent.

Follow these steps:

1. **Gather Feedback Context**: Ask the user about:
   - Which component they want to provide feedback on (name and type)
   - What they were trying to accomplish
   - What worked well and what could be improved
   - Any specific suggestions they have

2. **Create Feedback Document**: Use the [[feedback-template]] to create a comprehensive feedback document in the `feedback/` directory with the filename pattern: `feedback-[component-type]-[component-name]-[YYYYMMDD].md`

3. **Determine Meta Agent**: Based on the component type, identify which meta agent should process this feedback:
   - Agents → [[meta-sub-agent-architect]]
   - Templates → [[meta-template-expert]]
   - Workflows → [[meta-workflow-specialist]]
   - Prompts → [[meta-prompt-engineer]]

4. **Continue Conversation**: After creating the feedback document, continue the conversation normally. If the feedback relates to the current task or interaction, adjust your approach based on the feedback provided.

Remember:
- Be thorough in capturing all feedback details
- Focus on constructive suggestions that can improve the framework
- Include specific examples where possible
- Ensure the feedback is actionable for the meta agent who will process it
</instruction>

<context>
The PLX framework is continuously evolving based on user feedback. Each component type has a specialized meta agent who understands the best practices and conventions for that component type. This feedback system ensures that improvements are systematically captured and processed by the right expert.
</context>

<output_format>
1. Create a feedback document using [[feedback-template]] in `feedback/` directory
2. Confirm the feedback has been captured with a brief summary
3. Continue with the conversation, applying any immediate learnings from the feedback
</output_format>
