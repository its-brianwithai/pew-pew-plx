---
description: How to perform thorough analysis and present findings without taking action
globs: **/*
document_type: protocol
goal: Analyze input systematically and present clear findings
gpt_action: Follow these steps when performing analysis of any subject
---

# How We Build Analysis

## Purpose
Establish a systematic approach to analyze any subject matter and present clear findings, while ensuring no actions are taken until explicitly instructed.

## Trigger Conditions
- Need to analyze code structure
- Review system architecture
- Evaluate process efficiency
- Assess technical solutions
- Investigate issues
- Review documentation

## Requirements
1. Clear subject of analysis
2. Defined scope
3. Access to relevant sources
4. Understanding of context
5. No immediate action taking

## Implementation Steps
1. Understand Analysis Subject
   - Identify what needs to be analyzed
   - Determine analysis scope
   - Ask clarifying questions if needed
   - Document initial understanding

2. Gather Information
   - Scan codebase for code-related analysis
   - Read documentation for process analysis
   - Review context for concept analysis
   - List all relevant sources
   - Note missing information

3. Structure Analysis
   - Create analysis document
   - Follow standard sections:
     - 📋 Overview
     - 🎯 Key Findings
     - 💡 Insights
     - ⚠️ Considerations
     - 🤔 Conclusion

4. Present Findings
   - Format clearly and professionally
   - Highlight important points
   - Include supporting evidence
   - Note any uncertainties
   - Wait for feedback

5. Handle Response
   - Provide clarification if requested
   - Update analysis if needed
   - Wait for explicit next steps
   - Do not take action without approval

## Examples
### Good Example
```markdown
# 🔍 Authentication System Analysis

## 📋 Overview
Analyzed the current authentication system focusing on security and performance.

## 🎯 Key Findings
- JWT tokens expire after 1 hour
- Password hashing uses bcrypt
- Rate limiting implemented
- Missing refresh token mechanism

## 💡 Insights
Current implementation follows most best practices but lacks some modern security features.

## ⚠️ Considerations
- Token refresh needs careful design
- Rate limiting might affect legitimate users
- Password policy needs review

## 🤔 Conclusion
System is fundamentally sound but needs specific security enhancements.
[Waiting for instructions before proceeding]
```

### Bad Example
```markdown
Looked at the auth system.
It's mostly okay but has some issues.
I'll fix the token handling now.

[Incomplete analysis, taking action without approval]
```

## Validation Checklist
- [ ] Subject of analysis is clear
- [ ] Scope is well-defined
- [ ] All relevant sources checked
- [ ] Analysis structure followed
- [ ] Findings clearly presented
- [ ] Supporting evidence included
- [ ] Considerations noted
- [ ] No actions taken
- [ ] Waiting for instructions
- [ ] Ready for feedback 