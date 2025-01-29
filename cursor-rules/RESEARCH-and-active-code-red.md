---
description: How to handle critical issues requiring immediate work stoppage and thorough research
globs: **/*
document_type: protocol
goal: Stop all work and perform thorough research before any action
gpt_action: Follow these steps when a critical issue needs deep research
---

# How We Research and Activate Code Red

## Purpose
Establish a systematic approach to handle critical issues by stopping all work and conducting thorough research before taking any action.

## Trigger Conditions
- A critical issue is identified that requires immediate attention
- Complex problems that need deep understanding before modification
- High-risk changes that require complete system understanding
- Situations where partial understanding could cause harm

## Requirements
1. Immediate work stoppage
2. Clear research methodology
3. Systematic file analysis
4. Comprehensive documentation of findings
5. User approval before any changes

## Implementation Steps
1. Stop All Work
   - Clear current tasks
   - Block any file modifications
   - Reset all assumptions and current understanding

2. Prepare Research Plan
   - Identify all related files
   - Create a list of files to check
   - Plan reading order based on dependencies
   - Set up documentation structure

3. Execute Systematic Research
   - Process files systematically
   - For large files:
     - Split into manageable chunks
     - Read chunk by chunk
     - Build complete understanding
   - Document all findings
   - Map connections and dependencies

4. Analyze Findings
   - Study code construction
   - Map data flow
   - Document dependencies
   - Build complete system picture
   - Verify all files are covered

5. Present Research
   - Document all findings
   - Prepare clear presentation
   - Present to user
   - Wait for approval before any changes

## Examples
### Good Example
```markdown
# Code Red Research: Authentication System
## Files to Research:
1. auth_service.dart
2. user_repository.dart
3. token_manager.dart

## Findings:
1. Authentication flow:
   - Login request → Token generation → Storage
2. Dependencies:
   - Requires secure storage
   - Uses external auth service

## Proposed Solution:
[Clear solution based on research]
```

### Bad Example
```markdown
# Quick Look
- Checked auth file
- Seems like token issue
- Will fix token generation
[Making changes without complete understanding]
```

## Validation Checklist
- [ ] All work is completely stopped
- [ ] Research plan is comprehensive
- [ ] All related files are identified
- [ ] Each file is thoroughly analyzed
- [ ] Dependencies are mapped
- [ ] Findings are well documented
- [ ] No changes made without approval 