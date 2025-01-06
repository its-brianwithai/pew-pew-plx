---
document_type: process
goal: define testing workflow
gpt_action: follow these steps when writing and running tests
---

# 🧪 The Testing Process

Use this document to guide you through the testing process. This structured approach helps ensure you can properly test your code and verify [your-requirements](your-requirements.md) work as expected.

## 📚 Rules

1. Every test must link to a requirement
2. Follow AAA pattern (Arrange, Act, Assert)
3. Document test decisions in [your-memory](your-memory.md)
4. Update test status in [your-requirements](your-requirements.md)
5. Track progress in [your-todo-list](your-todo-list.md)

## 🎯 Test Categories

1. **Unit Tests**
   1. Test individual components
   2. Mock dependencies
   3. Focus on behavior verification
   4. Quick execution

2. **Integration Tests**
   1. Test component interactions
   2. Limited mocking
   3. Focus on communication
   4. Slower execution

3. **End-to-End Tests**
   1. Test complete flows
   2. No mocking
   3. Focus on user scenarios
   4. Slowest execution

## 👣 Test Creation Steps

1. **Preparation**
   1. Review requirement in [your-requirements](your-requirements.md)
   2. Identify test category needed
   3. List scenarios to test
   4. Document approach in [your-memory](your-memory.md)

2. **Implementation**
   1. Create test file
   2. Write failing test
   3. Implement minimum code
   4. Verify test passes
   5. Document decisions in [your-memory](your-memory.md)

3. **Review & Refactor**
   1. Check test coverage
   2. Optimize test code
   3. Update documentation
   4. Update status in [your-requirements](your-requirements.md)

## 🔄 Test Maintenance

1. **When Tests Fail**
   1. Document failure in [your-memory](your-memory.md)
   2. Analyze root cause
   3. Create fix plan
   4. Update [your-todo-list](your-todo-list.md)
   5. Implement fix
   6. Verify all tests pass

2. **When Requirements Change**
   1. Review affected tests
   2. Update test cases
   3. Document changes in [your-memory](your-memory.md)
   4. Update status in [your-requirements](your-requirements.md)

## ✅ Test Structure

1. **File Organization**
   1. Mirror source code structure
   2. Clear naming convention (e.g., `*_test.*, *.test.*, test_*.*`)
   3. Group by category
   4. Include README

2. **Test Case Structure**
   ```
   Test Suite: "[[Requirement Name]]"
     Test Case: "should [expected behavior]"
       # Arrange
       - Set up test data
       - Configure mocks
       - Prepare environment

       # Act
       - Execute the code being tested
       - Capture results

       # Assert
       - Verify expected outcomes
       - Check state changes
       - Validate side effects
   ```

3. **Documentation Format**
   ```
   /*
    * Requirement: [[Requirement Link]]
    * Category: [Unit|Integration|E2E]
    * Scenario: [Description]
    * 
    * Example languages:
    * Python: test_feature.py
    * JavaScript: feature.test.js
    * TypeScript: feature.spec.ts
    * Dart: feature_test.dart
    * Java: FeatureTest.java
    * Go: feature_test.go
    * Rust: feature_test.rs
    */
   ```

4. **Common Test Patterns**
   1. Given/When/Then
      ```
      Given [initial state]
      When [action occurs]
      Then [expected outcome]
      ```
   
   2. Setup/Exercise/Verify
      ```
      Setup: [prepare test environment]
      Exercise: [execute test]
      Verify: [check results]
      ```
   
   3. Arrange/Act/Assert
      ```
      Arrange: [prepare test]
      Act: [execute test]
      Assert: [verify results]
      ```