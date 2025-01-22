---
document_type: protocol
goal: create clear testable milestones with BDD Gherkin style tests
gpt_action: follow these steps when creating milestones
---

CONTEXT: The [[User]] notices we need clear checkpoints in the form of milestones and wants you to create clear testable milestones with BDD Gherkin style tests following the framework's standards.

1. GIVEN [[User]] RUNS plx-create-milestone command
   1. THEN [[You]] SCAN input
      1. AND [[You]] FIND [[milestone]] scope
      2. AND [[You]] FIND [[milestone]] requirements
   2. IF [[input]] HAS [[milestone]]
      1. THEN [[You]] FOCUS [[milestone]]
   3. IF [[input]] IS empty
      1. THEN [[You]] READ [[your-requirements]]
      2. AND [[You]] READ [[your-ticket]]

2. WHEN [[You]] STARTS creation
   1. THEN [[You]] READ [[requirements]]
      1. AND [[You]] FIND criteria
      2. AND [[You]] FIND specs
      3. AND [[You]] FIND [[dependencies]]
   2. IF [[requirements]] IS unclear
      1. THEN [[You]] ASK [[User]]
      2. AND [[You]] WAIT response

3. GIVEN [[requirements]] IS clear
   1. THEN [[You]] CREATE section
      1. AND [[You]] ADD emoji
      2. AND [[You]] WRITE title
      3. AND [[You]] WRITE description
   2. IF [[milestone]] NEEDS details
      1. THEN [[You]] ADD specs
      2. AND [[You]] ADD [[dependencies]]

4. WHEN [[milestone]] IS ready
   1. THEN [[You]] WRITE [[tests]]
      ```gherkin
      Feature: [Milestone Name]
        
      Scenario: [Test Scenario]
        GIVEN [initial context]
        WHEN [action occurs]
        THEN [outcome is verified]
        AND [additional outcomes]
      ```
   2. IF [[tests]] NEEDS cases
      1. THEN [[You]] ADD edges
      2. AND [[You]] ADD errors

5. GIVEN [[milestone]] HAS [[tests]]
   1. THEN [[You]] CHECK quality
      1. AND [[You]] CHECK coverage
      2. AND [[You]] CHECK clarity
      3. AND [[You]] CHECK testability
   2. IF [[milestone]] NEEDS fixes
      1. THEN [[You]] FIX [[milestone]]
      2. AND [[You]] CHECK again

6. WHEN [[milestone]] IS done
   1. THEN [[You]] SHOW [[User]]
      1. AND [[You]] PRESENT [[milestone]]
      2. AND [[You]] EXPLAIN [[tests]]
   2. IF [[User]] ACCEPTS [[milestone]]
      1. THEN [[You]] SAVE [[your-milestones]]
      2. AND [[You]] UPDATE documents
   3. IF [[User]] WANTS changes
      1. THEN [[You]] EDIT [[milestone]]
      2. AND [[You]] SHOW again

7. GIVEN [[milestone]] IS saved
   1. THEN [[You]] CREATE [[tasks]]
      1. AND [[You]] LIST steps
      2. AND [[You]] LIST [[tests]]
   2. IF [[tasks]] IS ready
      1. THEN [[You]] SAVE [[your-todo-list]]
      2. AND [[You]] TELL [[User]] 
