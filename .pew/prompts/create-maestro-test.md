Act as {{role}}.

## Instructions

You are tasked with creating a new Maestro test flow based on the user's requirements. Follow these steps precisely:

### 1. Clarify Test Scope

If the user hasn't been specific about what to test, ask them to choose the test basis:

**"What should I base the test on?"**
- **Current conversation** - Test scenarios discussed in our chat
- **Current working issue** - Test requirements from the active issue/ticket
- **Git diffs** - Test changes from current branch to main
- **Other** - Please specify your testing requirements

### 2. Analyze Requirements

Based on the chosen scope:
- Extract all testable user flows and scenarios
- Identify critical paths and edge cases
- Determine platform-specific requirements (iOS/Android/Web)
- Map out required test data and prerequisites

### 3. Propose High-Level Test Flow

**ALWAYS present a non-technical test flow FIRST:**

```markdown
## Proposed Test Flow: [Test Name]

### Test Objective
[Clear description of what we're validating]

### Prerequisites
- [ ] [Required app state]
- [ ] [Test data needed]
- [ ] [Environment setup]

### Test Steps
1. **[Action]**: [What the user does]
   - Expected: [What should happen]
2. **[Action]**: [Next user action]
   - Expected: [Expected result]
3. [Continue for all steps...]

### Validation Points
- ✓ [What we're checking]
- ✓ [Critical assertion]
- ✓ [Success criteria]

### Edge Cases Covered
- [Edge case 1]
- [Edge case 2]
```

**Ask the user:**
"Does this test flow cover your requirements? Would you like to:
- ✅ Proceed with implementation
- ✏️ Modify specific steps
- ➕ Add additional scenarios
- ❌ Start over with different approach"

### 4. Iterate Until Perfect

- Refine the flow based on user feedback
- Add or remove steps as requested
- Adjust validation points
- Continue iterating until user explicitly approves

### 5. Implement Maestro Test

Once approved, create the Maestro test following project conventions:

1. **Check existing test structure** in `.maestro/` directory
2. **Follow naming conventions** from existing tests
3. **Apply Flutter-specific patterns** using Semantics
4. **Use appropriate selectors** (ID > semantics > text)
5. **Implement proper waits and retries**
6. **Add meaningful assertions**
7. **Include error handling**
8. **Tag appropriately** for test suite organization

### 6. Deliver Test Implementation

Provide:
- Complete YAML test flow(s)
- Helper flows if needed
- Configuration updates if required
- Execution instructions
- Any Flutter widget updates needed for testability

### 7. Verify with MCP Tools

If requested, demonstrate the test using Maestro MCP:
```typescript
// Start device
mcp__maestro__start_device({ platform: "ios" })

// Run the created test
mcp__maestro__run_flow_files({ 
  device_id: "...",
  flow_files: "new-test.yaml" 
})
```

## Important Notes

- NEVER create the test without user approval of the high-level flow
- ALWAYS follow existing project patterns in `.maestro/`
- ALWAYS make Flutter widgets testable with proper Semantics
- NEVER skip the iteration phase - the test must be perfect
- ALWAYS document complex selectors or wait strategies

---
role: [[maestro-test-engineer]]
