---
description: How to prepare and document well-structured questions for a more capable AI agent
globs: work-docs/your-big-question.md
document_type: protocol
goal: Create clear, context-rich questions for smarter AI agents
gpt_action: Follow these steps to document and structure questions for more capable AI agents
---

# How We Document Help From Smarter Agent

## Purpose
Establish a systematic approach to prepare, document, and track questions for more capable AI agents, ensuring all necessary context and information is provided.

## Trigger Conditions
- Current agent is stuck or uncertain
- Problem requires deeper expertise
- Complex technical challenges
- Need for advanced reasoning
- Verification of approach needed

## Requirements
1. Complete Context Collection
   - Current codebase state
   - Project requirements
   - Ticket information
   - Milestone context

2. Question Structure
   - Clear context section
   - Problem description
   - Previous attempts
   - Specific ask/request

3. Documentation
   - Stored in work-docs
   - Trackable format
   - Response handling plan

## Implementation Steps
1. Gather Context
   - Scan relevant codebase
   - Review requirements
   - Check current ticket
   - Review milestones
   - Document current state

2. Structure Question
   - Write clear context
   - Describe specific problem
   - List attempted solutions
   - Formulate precise ask
   - Include relevant code

3. Document Question
   - Create in work-docs
   - Use standard format
   - Include all context
   - Add any constraints
   - Note dependencies

4. Review and Refine
   - Verify completeness
   - Check clarity
   - Confirm specificity
   - Get user approval
   - Make adjustments

5. Handle Response
   - Document answer
   - Update work docs
   - Plan next steps
   - Share with user

## Examples
### Good Example
```markdown
# Question for More Capable Agent

## Context
Working on authentication system refactor (ticket AUTH-123).
Current implementation uses JWT with 1-hour expiry.
Need to implement refresh token mechanism.

## Problem
Unsure about secure storage of refresh tokens and rotation strategy.

## Attempted Solutions
1. Tried Redis storage but concerned about scaling
2. Considered JWT blacklist but worried about performance
3. Looked into database storage but unsure about cleanup

## Specific Ask
What is the most secure and scalable approach for refresh token storage and rotation in a distributed system?

## Relevant Code
```typescript
class TokenService {
  async generateTokens(user: User) {
    // Current implementation
  }
}
```
```

### Bad Example
```markdown
Help needed with auth system.
Not sure what to do about tokens.
What's the best way?

[Missing context, vague question]
```

## Validation Checklist
- [ ] All relevant context gathered
- [ ] Problem clearly described
- [ ] Previous attempts documented
- [ ] Question is specific
- [ ] Code examples included
- [ ] User has approved
- [ ] Ready for submission
- [ ] Response handling planned
- [ ] Documentation location set
- [ ] Follow-up process clear 