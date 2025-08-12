# 🆘 Escalate Issue to More Capable Agent
> 💡 *Generate a structured prompt to request assistance from a more capable agent when unable to resolve an issue independently*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Create a well-structured escalation prompt that provides a more capable agent with all necessary context to efficiently understand and resolve the issue at hand.

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Generate a comprehensive escalation prompt that documents the current issue, attempted solutions, and relevant context in a format optimized for another agent to quickly understand and resolve the problem.

### Deliverables
- Complete markdown-formatted escalation prompt
- Structured issue description with all context
- Clear documentation of attempted solutions
- Ready-to-copy code block format

### Acceptance Criteria
- [ ] Issue is described in complete detail
- [ ] All attempted solutions are documented
- [ ] Relevant context is included
- [ ] Output is formatted as markdown code block
- [ ] Prompt is polite and professional

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Generate Introduction
**Deliverable:** Opening statement establishing the escalation context
**Acceptance Criteria:** Clearly identifies this as an AI agent seeking assistance
- Create brief introduction explaining you are an AI agent
- State that you need assistance from a more capable agent
- Set professional and collaborative tone

### Step 2: Document Issue Description
**Deliverable:** Detailed issue documentation
**Acceptance Criteria:** Issue is fully described with all relevant details
- Capture the complete issue description
- Include specific error messages or symptoms
- Document expected vs actual behavior
- Note any constraints or requirements

### Step 3: List Attempted Solutions
**Deliverable:** Comprehensive record of troubleshooting attempts
**Acceptance Criteria:** All attempts documented with results
- Document each solution attempt chronologically
- Include specific commands or code tried
- Record error messages or unexpected results
- Note partial successes or progress made

### Step 4: Provide Relevant Context
**Deliverable:** Additional context for understanding the issue
**Acceptance Criteria:** All helpful context included
- Include system/environment information
- Document relevant configuration or settings
- Note any recent changes or updates
- Provide links to documentation consulted

### Step 5: Format as Markdown Code Block
**Deliverable:** Ready-to-copy formatted prompt
**Acceptance Criteria:** Properly formatted for immediate use
- Wrap entire prompt in triple backticks
- Ensure proper markdown formatting throughout
- Make it easy to copy and paste
- Verify all placeholders are replaced with actual content

### Step 6: Add Polite Conclusion
**Deliverable:** Professional closing statement
**Acceptance Criteria:** Expresses appreciation and urgency appropriately
- Politely request assistance
- Express appreciation for help
- Indicate any urgency or deadlines if applicable
- Provide clear call to action

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN generating the escalation prompt
**Best Practices:**
- Be concise but comprehensive
- Use clear, technical language
- Organize information logically
- Include all relevant details upfront

**Conventions:**
- Use markdown formatting for clarity
- Structure information hierarchically
- Separate different types of information clearly
- Use code blocks for commands and error messages

**Rules:**
- ALWAYS include the complete issue description
- ALWAYS document all attempted solutions
- ALWAYS format as a single markdown code block
- NEVER include commentary outside the code block
- MUST replace all placeholders with actual content

### WHEN documenting attempted solutions
**Requirements:**
- Include exact commands or code used
- Document complete error messages
- Note the order of attempts
- Specify any partial successes

**Constraints:**
- Keep each attempt description focused
- Avoid redundant information
- Don't editorialize about failures

### WHEN providing context
**Best Practices:**
- Include version numbers of relevant software
- Document the operating system and environment
- Note any special configurations
- Reference relevant documentation or resources

**Rules:**
- ALWAYS include information that might affect the solution
- NEVER include irrelevant personal opinions
- MUST be factual and objective

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown code block containing the complete escalation prompt

### Structure Template
````markdown
```markdown
# Request for Assistance from More Capable AI Agent

I am an AI agent seeking assistance from a more capable AI agent to resolve an issue that I have been unable to solve independently.

## Issue Description

[Detailed description of the issue being faced, including specific error messages, symptoms, and the desired outcome]

## Attempted Solutions

[Numbered list of all solutions attempted so far]
1. [First attempt]: [What was tried and the result]
   - Error/Result: [Specific error message or unexpected outcome]
2. [Second attempt]: [What was tried and the result]
   - Error/Result: [Specific error message or unexpected outcome]
[Continue for all attempts...]

## Relevant Context

[Additional information that might be helpful]
- Environment: [System details, versions, configuration]
- Recent Changes: [Any recent updates or modifications]
- Constraints: [Any limitations or requirements]
- Documentation Consulted: [Links or references to resources checked]
- Related Information: [Any other context that might be relevant]

## Request

I would greatly appreciate your assistance in resolving this issue. If you need any additional information or clarification, please let me know. Thank you for your help with this problem.
```
````

### Delivery Instructions
- Output only the markdown code block
- Ensure all placeholders are replaced with actual content
- Verify formatting is correct for copy-pasting
- No additional commentary outside the code block