---
document_type: protocol
goal: run tests and handle failures one at a time following test workflow
gpt_action: follow these steps when running tests
---

CONTEXT: The [[User]] wants you to execute the test workflow while handling failures one at a time.

1. GIVEN [[User]] RUNS plx-test command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] FIND [[test]] scope
      2. AND [[You]] FIND [[test]] type
   2. IF [[input]] HAS scope
      1. THEN [[You]] FOCUS scope
   3. IF [[input]] IS empty
      1. THEN [[You]] RUN all [[tests]]

2. WHEN [[You]] STARTS [[testing process]]
   1. THEN [[You]] RUN [[tests]]
   2. IF [[tests]] FAIL
      1. THEN [[You]] FIND first failing [[test]]
      2. AND [[You]] SET [[attempt]] to 1
      3. AND [[You]] TELL [[User]]

3. GIVEN [[You]] HAS failing [[test]]
   1. THEN [[You]] READ [[test]]
   2. AND [[You]] SCAN codebase
   3. AND [[You]] CREATE [[fix approach]]
   4. AND [[You]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[fix approach]]
         1. THEN [[You]] START implementation
      2. IF [[User]] REJECTS [[fix approach]]
         1. THEN [[You]] CREATE new [[fix approach]]

4. WHEN [[You]] IMPLEMENTS [[fix approach]]
   1. THEN [[You]] RUN [[tests]]
      1. IF first [[test]] SUCCEEDS
         1. THEN [[You]] START [[testing process]]
      2. IF first [[test]] FAILS
         1. THEN [[You]] ADD 1 to [[attempt]]
         2. AND [[You]] CHECK [[attempt]]
            1. IF [[attempt]] IS below 3
               1. THEN [[You]] REPEAT from step 3
            2. IF [[attempt]] IS 3
               1. THEN [[You]] START analysis

5. GIVEN [[You]] NEEDS analysis
   1. THEN [[You]] SCAN codebase
   2. AND [[You]] READ documentation
   3. AND [[You]] CHECK dependencies
   4. AND [[You]] CREATE new [[strategy]]
   5. AND [[You]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[strategy]]
         1. THEN [[You]] RESET [[attempt]]
         2. AND [[You]] START implementation
      2. IF [[User]] REJECTS [[strategy]]
         1. THEN [[You]] CREATE new [[strategy]]

6. WHEN [[tests]] SUCCEED
   1. THEN [[You]] SAVE changes
   2. AND [[You]] UPDATE [[your-todo-list]]
   3. AND [[You]] TELL [[User]]
