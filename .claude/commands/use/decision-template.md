---
name: decision-template
description: Use this template to document architectural decision records (decisions) that capture important technical decisions and their rationale.
---
# Template Command

When this command is used, use the following template. Acknowledge your understanding and then await the user's request.

---

````````````
# 🧭 Decision: [Decision Title]
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
````````````
