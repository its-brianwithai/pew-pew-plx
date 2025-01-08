---
document_type: protocol
goal: execute testing process and handle test failures according to development workflow
gpt_action: follow these steps when running tests and fixing failures
---

# 🔍 Test Analysis

1. [[GPT Agent]] starts [[analyze tests]]
   1. [[analyze tests]]
      1. Run test suite
      2. Collect results
      3. Identify failures
      4. Map dependencies
      5. IF [[test results unclear]]
         1. [[GPT Agent]] asks [[User]] for clarification

2. [[GPT Agent]] starts [[review coverage]]
   1. [[review coverage]]
      1. Check test status:
```markdown
# Test Coverage
- Implemented tests
- Pending tests
- Skipped tests
- Missing tests
```
      2. Verify quality:
```markdown
# Test Quality
- Assertion coverage
- Edge cases
- Error handling
- Test dependencies
```

# 🛠� Test Report

1. [[GPT Agent]] starts [[prepare report]]
   1. [[prepare report]]
      1. Document test state:
```markdown
# Test Status Report
- Failed tests: [list]
- Incomplete tests: [list]
- Missing tests: [list]
- Test dependencies: [list]
```
      2. Propose actions:
```markdown
# Proposed Actions
- Tests to implement
- Fixes needed
- Coverage improvements
- Quality enhancements
```

2. [[GPT Agent]] presents report to [[User]]

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves

4. IF [[User approves changes]]
   1. [[GPT Agent]] proceeds to test resolution
2. ELSE
   1. [[GPT Agent]] awaits further instructions

# 🛠️ Test Resolution

1. [[GPT Agent]] starts [[handle failures]]
   1. [[handle failures]]
      1. Process first failure:
```markdown
# Failure Analysis
- Test description
- Expected behavior
- Actual behavior
- Error details
```
      2. Research solution:
```markdown
# Solution Research
- Code investigation
- Documentation review
- Similar issues
- Possible fixes
```

2. [[GPT Agent]] starts [[implement fix]]
   1. [[implement fix]]
      1. Create solution
      2. Apply changes
      3. Run tests again
      4. IF [[tests still fail]]
         1. [[GPT Agent]] returns to failure analysis

# ✅ Test Verification

1. [[GPT Agent]] starts [[verify tests]]
   1. [[verify tests]]
      1. Final check:
```markdown
# Test Status
- All tests passing
- Coverage complete
- No skipped tests
- No pending tests
```
      2. Quality check:
```markdown
# Quality Verification
- Implementation complete
- Edge cases covered
- Error paths tested
- Dependencies resolved
```

2. [[GPT Agent]] presents results to [[User]]

3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] processes feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves

4. IF [[all tests pass]]
   1. [[GPT Agent]] continues with development workflow
2. ELSE
   1. [[GPT Agent]] returns to test resolution