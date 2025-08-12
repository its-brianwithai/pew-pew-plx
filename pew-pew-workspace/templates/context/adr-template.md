---
name: adr-template
description: Use this template to document architectural decision records (ADRs) that capture important technical decisions and their rationale.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🧭 ADR-[Number]: [Decision Title]
> 💡 *[One-line summary of the architectural decision]*

**Date:** [YYYY-MM-DD]  
**Status:** [Proposed | Accepted | Superseded by [[ADR-xxx]] | Deprecated]  
**Deciders:** [List decision makers or team]

## Context
[Why are we making this decision? What problem are we solving? Include relevant constraints, requirements, and goals.]

## Decision
[The change we're proposing or have decided to implement. Be specific and actionable.]

## Options Considered
1. **[Option Name]** — [Brief description and key characteristics]
2. **[Option Name]** — [Brief description and key characteristics]
3. **[Option Name]** — [Brief description and key characteristics]

## Rationale
[Why was this option chosen over the others? Include trade-offs, priorities, and deciding factors.]

## Consequences

### Positive
- [Benefit or improvement]
- [Another positive outcome]

### Negative
- [Drawback or risk]
- [Technical debt or limitation]

### Neutral
- [Change that is neither good nor bad]
- [Side effect to be aware of]

## Implementation
- [Key implementation step or consideration]
- [Migration strategy if applicable]
- [Rollback plan if needed]

## Related
- [[Related ADR or document]]
- [[Another related decision or context]]