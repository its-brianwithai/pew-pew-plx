---
document_type: protocol
goal: add high-quality Pexels images to blog posts or social media
gpt_action: follow these steps when adding Pexels images to content
---

CONTEXT: The [[User]] needs to add professional stock photos to their content and wants you to use the Pexels API to search, download, and properly attribute images while respecting licensing requirements.

1. GIVEN [[GPT Agent]] RECEIVES image request
   1. THEN [[GPT Agent]] IDENTIFY needs
      1. AND [[GPT Agent]] CHECK content type (blog/social)
      2. AND [[GPT Agent]] ANALYSE context
      3. AND [[GPT Agent]] DETERMINE purpose (header/illustration/background)
   2. IF needs UNCLEAR
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] UNDERSTANDS needs
   1. THEN [[GPT Agent]] PREPARE search
      1. AND [[GPT Agent]] CRAFT descriptive query
      2. AND [[GPT Agent]] SET orientation based on purpose
         1. IF header THEN landscape
         2. IF illustration THEN any
         3. IF background THEN match content
      3. AND [[GPT Agent]] SET limit 1
   2. IF search parameters UNCLEAR
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

3. GIVEN [[GPT Agent]] CAN search
   1. THEN [[GPT Agent]] USE Pexels API
      1. AND [[GPT Agent]] SEARCH photos
      2. AND [[GPT Agent]] CHECK results
   2. IF results EMPTY
      1. THEN [[GPT Agent]] REFINE query
      2. AND [[GPT Agent]] TRY again
   3. IF results FOUND
      1. THEN [[GPT Agent]] SELECT best match
         1. AND [[GPT Agent]] CHECK quality
         2. AND [[GPT Agent]] CHECK resolution
         3. AND [[GPT Agent]] CHECK style match

4. WHEN [[GPT Agent]] HAS photo
   1. THEN [[GPT Agent]] HANDLE based on type:
      1. IF blog post:
         1. AND [[GPT Agent]] CREATE folder structure
            Example: content/blogs/images/YYYY-MM-DD-slug/
         2. AND [[GPT Agent]] DOWNLOAD photo
            1. AND [[GPT Agent]] USE large2x for quality
            2. AND [[GPT Agent]] SAVE as PNG
         3. AND [[GPT Agent]] CREATE attribution
            1. AND [[GPT Agent]] ADD Pexels ID
            2. AND [[GPT Agent]] ADD photographer name
            3. AND [[GPT Agent]] ADD photographer URL
            4. AND [[GPT Agent]] ADD original URL
            5. AND [[GPT Agent]] ADD license info
      2. IF social media:
         1. AND [[GPT Agent]] PROVIDE direct Pexels URL
         2. AND [[GPT Agent]] PROVIDE attribution text

5. GIVEN [[photo]] IS ready
   1. THEN [[GPT Agent]] VERIFY files
      1. AND [[GPT Agent]] CHECK photo exists
      2. AND [[GPT Agent]] CHECK PNG format
      3. AND [[GPT Agent]] CHECK attribution
   2. IF verification PASSES
      1. THEN [[GPT Agent]] CONFIRM to [[User]]
         1. AND [[GPT Agent]] SHOW location
         2. AND [[GPT Agent]] SHOW attribution
   3. IF verification FAILS
      1. THEN [[GPT Agent]] FIX issues
      2. AND [[GPT Agent]] CHECK again 