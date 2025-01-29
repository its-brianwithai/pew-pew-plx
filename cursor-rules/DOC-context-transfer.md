---
description: How to document and transfer work context between AI agents effectively
globs: work-docs/your-transfer.md
document_type: protocol
goal: Ensure smooth context handoffs between different AI agents
gpt_action: Follow these steps when documenting and transferring work context
---

# How We Document Context Transfer

## Purpose
Establish a systematic approach to document and transfer work context between AI agents, ensuring continuity and smooth handoffs for ongoing tasks.

## Trigger Conditions
- Switching between AI agents
- Handoff of work in progress
- Task continuation needed
- Complex context sharing required
- Work documentation needed

## Requirements
1. Clear Transfer Scope
   - Target agent identified
   - Work scope defined
   - Time context noted
   - Handoff goals clear

2. Context Collection
   - Conversation history
   - Work documents
   - Modified files
   - Current status

3. Documentation Structure
   - Standard format
   - All sections complete
   - Clear next steps
   - Verification process

## Implementation Steps
1. Initialize Transfer Document
   - Create your-transfer.md
   - Add document header
   - Include timestamp
   - Set up sections
   - Archive old transfers if needed

2. Collect Context Information
   - Review conversation history
   - Check work documents
   - List modified files
   - Document current status
   - Note incomplete items

3. Document Current State
   - Write conversation summary
   - Document work state
   - List requirements progress
   - Note open issues
   - Include todo status

4. Define Next Steps
   - List next actions
   - Document blockers
   - Note required user input
   - Flag time-sensitive items
   - Include dependencies

5. Verify and Handoff
   - Check completeness
   - Verify all links
   - Ensure clarity
   - Get user approval
   - Confirm receipt

## Examples
### Good Example
```markdown
# Context Transfer Document

## 📝 Conversation Summary
### Key Decisions
- Chose JWT for authentication
- Redis for token storage
- Rate limiting implementation approved

### User Preferences
- Prefers TypeScript
- Wants detailed comments
- Requires test coverage

## 📊 Current Work State
### Modified Files
1. auth_service.ts
2. token_manager.ts
3. rate_limiter.ts

### Progress
- Authentication flow: 80%
- Test coverage: 60%
- Documentation: 40%

## ⏭️ Next Steps
### Next Actions
1. Implement refresh token
2. Add rate limiting
3. Complete unit tests

### Blockers
- Waiting for Redis credentials
- Need user decision on token expiry

[Clear, structured, actionable]
```

### Bad Example
```markdown
# Handoff

Working on auth stuff.
Changed some files.
Need to do more work.

[Vague, missing details, no structure]
```

## Validation Checklist
- [ ] Transfer scope defined
- [ ] Target agent identified
- [ ] Context fully collected
- [ ] Conversation summarized
- [ ] Work state documented
- [ ] Next steps clear
- [ ] Blockers identified
- [ ] User input noted
- [ ] Time-sensitive items flagged
- [ ] Document structure complete
- [ ] Links verified
- [ ] User approved
- [ ] Receipt confirmed 