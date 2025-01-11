---
document_type: protocol
goal: interact with Ghost API to manage blog content
gpt_action: follow these steps when user wants to use the Ghost API
---

CONTEXT: The [[User]] wants to interact with the Ghost API and needs you to handle the API operations based on their input, particularly for creating and managing blog posts.

1. GIVEN [[User]] RUNS plx-use-ghost-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK content format
      2. AND [[GPT Agent]] CHECK markdown requirements
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for content
   3. IF [[input]] NEEDS formatting
      1. THEN [[GPT Agent]] FORMAT content
      2. AND [[GPT Agent]] ADD frontmatter
      3. AND [[GPT Agent]] STRUCTURE markdown

2. WHEN [[GPT Agent]] PREPARES post
   1. THEN [[GPT Agent]] CREATE post object
      ```typescript
      const post = {
        title: string,
        content: string,
        status: 'draft' | 'published',
        tags?: string[],
        featured?: boolean,
        excerpt?: string
      }
      ```
   2. IF [[content]] NEEDS frontmatter
      1. THEN [[GPT Agent]] ADD required metadata
   3. IF [[User]] SPECIFIES options
      1. THEN [[GPT Agent]] ADD custom fields

3. WHEN [[GPT Agent]] CREATES post
   1. THEN [[GPT Agent]] USE GhostClient
      1. AND [[GPT Agent]] CALL createPost
      2. AND [[GPT Agent]] HANDLE response
   2. IF [[API call]] FAILS
      1. THEN [[GPT Agent]] SHOW error
      2. AND [[GPT Agent]] SUGGEST fixes
   3. IF [[API call]] SUCCEEDS
      1. THEN [[GPT Agent]] SHOW post URL
      2. AND [[GPT Agent]] CONFIRM creation

4. GIVEN [[post]] IS created
   1. THEN [[GPT Agent]] VERIFY content
      1. AND [[GPT Agent]] CHECK formatting
      2. AND [[GPT Agent]] CHECK metadata
   2. IF [[User]] WANTS changes
      1. THEN [[GPT Agent]] UPDATE post
      2. AND [[GPT Agent]] VERIFY again 