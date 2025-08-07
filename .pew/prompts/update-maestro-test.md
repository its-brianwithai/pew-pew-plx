Act as {{role}}.

## Instructions

You are tasked with updating an existing Maestro test flow. Follow these steps precisely:

### 1. Identify Test to Update

First, locate the test that needs updating:
- Search `.maestro/` directory for relevant test files
- Read the existing test flow(s) to understand current implementation
- Identify related helper flows or shared components

### 2. Clarify Update Requirements

If the user hasn't specified what to update, ask:

**"What changes are needed for this test?"**
- **Current conversation** - Updates based on our discussion
- **Current working issue** - Changes from active issue/ticket
- **Git diffs** - Adapt test for code changes from current branch to main
- **Bug fix** - Test is failing and needs correction
- **Enhancement** - Add new scenarios or validations
- **Refactor** - Improve test structure or performance
- **Other** - Please specify the changes needed

### 3. Analyze Current Test

Review the existing test to understand:
- Current test objective and coverage
- Selectors and interaction patterns used
- Assertions and validation points
- Dependencies on helper flows
- Tags and organization
- Known issues or flaky behavior

### 4. Propose Test Updates

**ALWAYS present the changes as a high-level flow FIRST:**

```markdown
## Proposed Updates: [Test Name]

### Current Test Coverage
[Brief summary of what the test currently does]

### Proposed Changes

#### 1. [Change Category]
**Current behavior:**
- [What it does now]

**Updated behavior:**
- [What it will do after update]

**Reason:**
- [Why this change is needed]

#### 2. [Next Change Category]
[Continue for all changes...]

### Updated Test Flow
1. [Step 1] → [Any changes]
2. [Step 2] → [Any changes]
3. **[NEW]** [New step if added]
4. ~~[REMOVED]~~ [Removed step if applicable]
5. [Continue...]

### Impact Analysis
- **Dependencies:** [Other tests affected]
- **Test duration:** [Faster/Slower/Same]
- **Stability:** [More/Less/Same reliable]
- **Coverage:** [What's added/removed]
```

**Ask the user:**
"Do these updates meet your requirements? Would you like to:
- ✅ Proceed with implementation
- ✏️ Modify specific changes
- ➕ Add additional updates
- 🔄 See current test first
- ❌ Start over"

### 5. Iterate Until Perfect

- Refine changes based on user feedback
- Show diffs for complex changes
- Explain impact on test suite
- Continue until user explicitly approves

### 6. Implement Test Updates

Once approved:

1. **Backup consideration**: Note if keeping old version is needed
2. **Update test flow**: Modify YAML with approved changes
3. **Update selectors**: Improve element targeting if needed
4. **Enhance stability**: Add retries/waits where appropriate
5. **Update assertions**: Strengthen validation points
6. **Refactor if needed**: Extract common patterns to helpers
7. **Update tags**: Adjust test categorization if needed
8. **Document changes**: Add comments explaining updates

### 7. Validate Updates

Ensure the updated test:
- Maintains backward compatibility (unless breaking change intended)
- Follows current project conventions
- Doesn't break dependent tests
- Improves or maintains execution speed
- Handles new edge cases

### 8. Deliver Updated Test

Provide:
- Updated YAML test flow(s)
- Diff showing changes clearly
- Migration notes if breaking changes
- Updated execution instructions
- Any required Flutter widget updates
- Recommendations for related test updates

### 9. Verify with MCP Tools

If requested, validate the updated test:
```typescript
// Inspect current app state
mcp__maestro__inspect_view_hierarchy({ device_id: "..." })

// Run updated test
mcp__maestro__run_flow_files({ 
  device_id: "...",
  flow_files: "updated-test.yaml" 
})

// Compare with old behavior if needed
```

## Important Notes

- NEVER update without user approval of changes
- ALWAYS maintain test isolation and independence
- ALWAYS consider impact on CI/CD pipelines
- NEVER break existing test contracts without documentation
- ALWAYS test the updates before finalizing
- PRESERVE existing test patterns unless explicitly changing them

---
role: [[maestro-test-engineer]]
