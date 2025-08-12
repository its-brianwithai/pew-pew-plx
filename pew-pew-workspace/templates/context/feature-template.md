---
name: feature-template
description: Use this template to document features with their user stories, scenarios, and acceptance criteria.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🎯 Feature: [Feature Name]
> 💡 *[One-line description of what this feature enables]*

[Brief description of the feature's purpose and value to users]

## User Story
As a [[actor-role]]  
I want to [action/goal]  
So that [benefit/value]

## Scenarios

### Scenario 1: [Happy Path Name]
**Given** [initial context or precondition]  
**When** [action or event occurs]  
**Then** [expected outcome]  
**And** [additional outcome if needed]

### Scenario 2: [Alternative Path Name]
**Given** [different context]  
**When** [different action]  
**Then** [different outcome]

### Scenario 3: [Error/Edge Case Name]
**Given** [edge case setup]  
**When** [problematic action]  
**Then** [error handling or fallback]

## Acceptance Criteria
- [ ] [Specific measurable criterion]
- [ ] [Another criterion]
- [ ] [Performance or quality criterion]
- [ ] [Edge case handling]

## Dependencies
- [[Component or feature this depends on]]
- [[External service or platform required]]

## Technical Notes
[Implementation considerations, constraints, or architectural decisions]

## Related
- [[Related feature or epic]]
- [[ADR if applicable]]