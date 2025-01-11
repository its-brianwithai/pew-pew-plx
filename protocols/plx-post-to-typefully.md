---
document_type: protocol
goal: create and post content to Typefully using the API
gpt_action: follow these steps when user wants to post content to Typefully
---

CONTEXT: The [[User]] wants to post content to Typefully and needs you to handle the API interaction to create a draft from their input.

1. GIVEN [[User]] RUNS plx-post-to-typefully command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK content format
      2. AND [[GPT Agent]] CHECK thread requirements
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for content
   3. IF [[input]] NEEDS formatting
      1. THEN [[GPT Agent]] FORMAT content
      2. AND [[GPT Agent]] ADD line breaks
      3. AND [[GPT Agent]] ADD emojis if appropriate

2. WHEN [[GPT Agent]] PREPARES draft
   1. THEN [[GPT Agent]] CREATE draft object
      ```typescript
      const draft = {
        content: string,
        threadify: boolean,
        schedule_date: string | null,
        share: boolean
      }
      ```
   2. IF [[content]] EXCEEDS tweet limit
      1. THEN [[GPT Agent]] SET threadify true
   3. IF [[User]] SPECIFIES schedule
      1. THEN [[GPT Agent]] ADD schedule_date

3. WHEN [[GPT Agent]] POSTS content
   1. THEN [[GPT Agent]] USE TypefullyAPI
      1. AND [[GPT Agent]] CALL createDraft
      2. AND [[GPT Agent]] HANDLE response
   2. IF [[API call]] FAILS
      1. THEN [[GPT Agent]] SHOW error
      2. AND [[GPT Agent]] SUGGEST fixes
   3. IF [[API call]] SUCCEEDS
      1. THEN [[GPT Agent]] SHOW draft ID
      2. AND [[GPT Agent]] CONFIRM creation

4. GIVEN [[draft]] IS created
   1. THEN [[GPT Agent]] VERIFY content
      1. AND [[GPT Agent]] CHECK formatting
      2. AND [[GPT Agent]] CHECK thread splits
   2. IF [[User]] WANTS changes
      1. THEN [[GPT Agent]] UPDATE draft
      2. AND [[GPT Agent]] VERIFY again 