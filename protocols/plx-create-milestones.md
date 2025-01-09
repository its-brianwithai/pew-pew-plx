---
document_type: protocol
goal: create clear testable milestones with BDD Gherkin style tests
gpt_action: follow these steps when creating milestones
---

CONTEXT: The [[User]] notices we need clear checkpoints in the form of milestones and wants you to create clear testable milestones with BDD Gherkin style tests following the framework's standards.

1. GIVEN [[User]] RUNS plx-create-milestone command
   1. THEN [[GPT Agent]] SCAN input
      1. AND [[GPT Agent]] FIND [[milestone]] scope
      2. AND [[GPT Agent]] FIND [[milestone]] requirements
   2. IF [[input]] HAS [[milestone]]
      1. THEN [[GPT Agent]] FOCUS [[milestone]]
   3. IF [[input]] IS empty
      1. THEN [[GPT Agent]] READ [[your-requirements]]
      2. AND [[GPT Agent]] READ [[your-ticket]]

2. WHEN [[GPT Agent]] STARTS creation
   1. THEN [[GPT Agent]] READ [[requirements]]
      1. AND [[GPT Agent]] FIND criteria
      2. AND [[GPT Agent]] FIND specs
      3. AND [[GPT Agent]] FIND [[dependencies]]
   2. IF [[requirements]] IS unclear
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

3. GIVEN [[requirements]] IS clear
   1. THEN [[GPT Agent]] CREATE section
      1. AND [[GPT Agent]] ADD emoji
      2. AND [[GPT Agent]] WRITE title
      3. AND [[GPT Agent]] WRITE description
   2. IF [[milestone]] NEEDS details
      1. THEN [[GPT Agent]] ADD specs
      2. AND [[GPT Agent]] ADD [[dependencies]]

4. WHEN [[milestone]] IS ready
   1. THEN [[GPT Agent]] WRITE [[tests]]
      ```gherkin
      Feature: [Milestone Name]
        
      Scenario: [Test Scenario]
        GIVEN [initial context]
        WHEN [action occurs]
        THEN [outcome is verified]
        AND [additional outcomes]
      ```
   2. IF [[tests]] NEEDS cases
      1. THEN [[GPT Agent]] ADD edges
      2. AND [[GPT Agent]] ADD errors

5. GIVEN [[milestone]] HAS [[tests]]
   1. THEN [[GPT Agent]] CHECK quality
      1. AND [[GPT Agent]] CHECK coverage
      2. AND [[GPT Agent]] CHECK clarity
      3. AND [[GPT Agent]] CHECK testability
   2. IF [[milestone]] NEEDS fixes
      1. THEN [[GPT Agent]] FIX [[milestone]]
      2. AND [[GPT Agent]] CHECK again

6. WHEN [[milestone]] IS done
   1. THEN [[GPT Agent]] SHOW [[User]]
      1. AND [[GPT Agent]] PRESENT [[milestone]]
      2. AND [[GPT Agent]] EXPLAIN [[tests]]
   2. IF [[User]] ACCEPTS [[milestone]]
      1. THEN [[GPT Agent]] SAVE [[your-milestones]]
      2. AND [[GPT Agent]] UPDATE documents
   3. IF [[User]] WANTS changes
      1. THEN [[GPT Agent]] EDIT [[milestone]]
      2. AND [[GPT Agent]] SHOW again

7. GIVEN [[milestone]] IS saved
   1. THEN [[GPT Agent]] CREATE [[tasks]]
      1. AND [[GPT Agent]] LIST steps
      2. AND [[GPT Agent]] LIST [[tests]]
   2. IF [[tasks]] IS ready
      1. THEN [[GPT Agent]] SAVE [[your-todo-list]]
      2. AND [[GPT Agent]] TELL [[User]] 