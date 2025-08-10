# Slash Command

When this command is used, execute the following instructions.

---

<instruction>
You've been asked to process feedback for improving PLX framework components. Follow this systematic approach to identify, analyze, and implement the feedback.

## Feedback Discovery

1. **Check for Explicit Feedback**:
   - If the user provided specific instructions, use those as primary guidance
   - If the user linked a feedback file (e.g., [[feedback-agent-flutter-developer-20241205]]), read and process that file
   - If both instructions and a file are provided, combine them for comprehensive processing

2. **Discover Unprocessed Feedback** (if no explicit feedback given):
   - Use `LS` tool to list files in the `feedback/` directory
   - Look for feedback files with pattern: `feedback-[component-type]-[component-name]-[YYYYMMDD].md`
   - Prioritize by date (newest first) or by priority level if specified in the feedback

## Meta Agent Role Assumption

3. **Determine the Appropriate Meta Agent**:
   - Read the feedback to identify the component type and recommended meta agent
   - Component type mapping:
     - Agents → [[meta-sub-agent-architect]]
     - Templates → [[meta-template-expert]]
     - Workflows → [[meta-workflow-specialist]]
     - Prompts → [[meta-prompt-engineer]]

4. **Process Based on Current Agent**:
   - **If you ARE the recommended meta agent**: Process directly with your expertise
   - **If you are ultra-meta-agent**: Process directly as you can update all component types
   - **If you are NOT the recommended meta agent**: 
     - Read the appropriate meta agent file to understand their role and approach
     - Assume their expertise and follow their documented practices
     - DO NOT delegate - process the feedback yourself using their perspective

## Feedback Processing

5. **Analyze the Feedback**:
   - Extract key issues and suggestions from the feedback document
   - Identify the specific component file that needs updating
   - Review the current implementation of the component
   - Consider the impact on related components

6. **Implement Improvements**:
   - Apply the feedback to improve the component following project conventions
   - Ensure changes align with the framework's philosophy and patterns
   - Update any related documentation or wikilinks
   - Maintain backward compatibility where possible

7. **Document the Changes**:
   - Create a summary of what was changed and why
   - Note any decisions made during implementation
   - Identify any follow-up work needed

## Post-Processing

8. **Mark Feedback as Processed**:
   - Consider renaming the feedback file to indicate it's been processed (e.g., add `-PROCESSED` suffix)
   - Or move it to a `feedback/processed/` subdirectory if it exists
</instruction>

<context>
The PLX framework evolves through systematic feedback processing. Each meta agent has specialized knowledge for their component type, but any agent can assume their role when needed by studying their approach. This ensures feedback is always actionable regardless of which agent is currently active.
</context>

<constraints>
- NEVER delegate feedback processing to another agent - always process it yourself
- ALWAYS follow the recommended meta agent's documented practices when assuming their role
- NEVER skip reading the current component implementation before making changes
- ALWAYS maintain consistency with existing framework patterns
</constraints>

<output_format>
1. Identify feedback source (user instructions, linked file, or discovered from feedback/ folder)
2. Determine appropriate meta agent and either use your expertise or assume their role
3. Analyze the feedback and current component implementation
4. Implement improvements following framework conventions
5. Provide a summary of changes made and their rationale
6. Mark feedback as processed
</output_format>
