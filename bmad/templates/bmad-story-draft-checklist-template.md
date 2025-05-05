# Story Draft Checklist

The Scrum Master should use this checklist to validate that each story contains sufficient context for a developer agent to implement it successfully, while assuming the dev agent has reasonable capabilities to figure things out.

## 1. GOAL & CONTEXT CLARITY

- [ ] Story goal/purpose is clearly stated
- [ ] Relationship to epic goals is evident
- [ ] How the story fits into overall system flow is explained
- [ ] Dependencies on previous stories are identified (if applicable)
- [ ] Business context and value are clear

## 2. TECHNICAL IMPLEMENTATION GUIDANCE

- [ ] Key files to create/modify are identified (not necessarily exhaustive)
- [ ] Technologies specifically needed for this story are mentioned
- [ ] Critical APIs or interfaces are sufficiently described
- [ ] Necessary data models or structures are referenced
- [ ] Required environment variables are listed (if applicable)
- [ ] Any exceptions to standard coding patterns are noted

## 3. REFERENCE EFFECTIVENESS

- [ ] References to external documents point to specific relevant sections
- [ ] Critical information from previous stories is summarized (not just referenced)
- [ ] Context is provided for why references are relevant
- [ ] References use consistent format (e.g., `docs/filename.md#section`)

## 4. SELF-CONTAINMENT ASSESSMENT

- [ ] Core information needed is included (not overly reliant on external docs)
- [ ] Implicit assumptions are made explicit
- [ ] Domain-specific terms or concepts are explained
- [ ] Edge cases or error scenarios are addressed

## 5. TESTING GUIDANCE

- [ ] Required testing approach is outlined
- [ ] Key test scenarios are identified
- [ ] Success criteria are defined
- [ ] Special testing considerations are noted (if applicable)

## VALIDATION RESULT

| Category                             | Status            | Issues |
| ------------------------------------ | ----------------- | ------ |
| 1. Goal & Context Clarity            | PASS/FAIL/PARTIAL |        |
| 2. Technical Implementation Guidance | PASS/FAIL/PARTIAL |        |
| 3. Reference Effectiveness           | PASS/FAIL/PARTIAL |        |
| 4. Self-Containment Assessment       | PASS/FAIL/PARTIAL |        |
| 5. Testing Guidance                  | PASS/FAIL/PARTIAL |        |

**Final Assessment:**

- READY: The story provides sufficient context for implementation
- NEEDS REVISION: The story requires updates (see issues)
- BLOCKED: External information required (specify what information)
