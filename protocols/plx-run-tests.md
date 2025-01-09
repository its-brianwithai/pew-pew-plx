---
document_type: protocol
goal: run tests and handle failures one at a time following test workflow
gpt_action: follow these steps when running tests
---

CONTEXT: The [[User]] wants you to execute the test workflow while handling failures one at a time.

1. GIVEN [[User]] RUNS plx-test command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] FIND [[test]] scope
      2. AND [[GPT Agent]] FIND [[test]] type
   2. IF [[input]] HAS scope
      1. THEN [[GPT Agent]] FOCUS scope
   3. IF [[input]] IS empty
      1. THEN [[GPT Agent]] RUN all [[tests]]

2. WHEN [[GPT Agent]] STARTS [[testing process]]
   1. THEN [[GPT Agent]] RUN [[tests]]
   2. IF [[tests]] FAIL
      1. THEN [[GPT Agent]] FIND first failing [[test]]
      2. AND [[GPT Agent]] SET [[attempt]] to 1
      3. AND [[GPT Agent]] TELL [[User]]

3. GIVEN [[GPT Agent]] HAS failing [[test]]
   1. THEN [[GPT Agent]] READ [[test]]
   2. AND [[GPT Agent]] SCAN codebase
   3. AND [[GPT Agent]] CREATE [[fix approach]]
   4. AND [[GPT Agent]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[fix approach]]
         1. THEN [[GPT Agent]] START implementation
      2. IF [[User]] REJECTS [[fix approach]]
         1. THEN [[GPT Agent]] CREATE new [[fix approach]]

4. WHEN [[GPT Agent]] IMPLEMENTS [[fix approach]]
   1. THEN [[GPT Agent]] RUN [[tests]]
      1. IF first [[test]] SUCCEEDS
         1. THEN [[GPT Agent]] START [[testing process]]
      2. IF first [[test]] FAILS
         1. THEN [[GPT Agent]] ADD 1 to [[attempt]]
         2. AND [[GPT Agent]] CHECK [[attempt]]
            1. IF [[attempt]] IS below 3
               1. THEN [[GPT Agent]] REPEAT from step 3
            2. IF [[attempt]] IS 3
               1. THEN [[GPT Agent]] START analysis

5. GIVEN [[GPT Agent]] NEEDS analysis
   1. THEN [[GPT Agent]] SCAN codebase
   2. AND [[GPT Agent]] READ documentation
   3. AND [[GPT Agent]] CHECK dependencies
   4. AND [[GPT Agent]] CREATE new [[strategy]]
   5. AND [[GPT Agent]] SHOW [[User]]
      1. IF [[User]] ACCEPTS [[strategy]]
         1. THEN [[GPT Agent]] RESET [[attempt]]
         2. AND [[GPT Agent]] START implementation
      2. IF [[User]] REJECTS [[strategy]]
         1. THEN [[GPT Agent]] CREATE new [[strategy]]

6. WHEN [[tests]] SUCCEED
   1. THEN [[GPT Agent]] SAVE changes
   2. AND [[GPT Agent]] UPDATE [[your-todo-list]]
   3. AND [[GPT Agent]] TELL [[User]]