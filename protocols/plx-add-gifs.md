---
document_type: protocol
goal: add engaging GIFs to blog posts or Typefully threads
gpt_action: follow these steps when adding GIFs to content
---

CONTEXT: The [[User]] needs to add engaging GIFs to their content and wants you to use the Giphy API to search, download, and properly attribute GIFs while respecting rate limits and licensing.

1. GIVEN [[GPT Agent]] RECEIVES GIF request
   1. THEN [[GPT Agent]] IDENTIFY needs
      1. AND [[GPT Agent]] CHECK content type (blog/Typefully)
      2. AND [[GPT Agent]] ANALYSE context
      3. AND [[GPT Agent]] DETERMINE purpose (reaction/demo/illustration)
   2. IF needs UNCLEAR
      1. THEN [[GPT Agent]] ASK [[User]]
      2. AND [[GPT Agent]] WAIT response

2. WHEN [[GPT Agent]] UNDERSTANDS needs
   1. THEN [[GPT Agent]] CHECK rate limits
      1. AND [[GPT Agent]] VERIFY within 42 reads/hour
      2. AND [[GPT Agent]] VERIFY within 1000 searches/day
   2. IF rate limits EXCEEDED
      1. THEN [[GPT Agent]] INFORM [[User]]
      2. AND [[GPT Agent]] SUGGEST waiting
   3. THEN [[GPT Agent]] PREPARE search
      1. AND [[GPT Agent]] CRAFT query
      2. AND [[GPT Agent]] SET rating 'g'
      3. AND [[GPT Agent]] SET limit 1

3. GIVEN [[GPT Agent]] CAN search
   1. THEN [[GPT Agent]] USE Giphy API
      1. AND [[GPT Agent]] SEARCH GIFs
      2. AND [[GPT Agent]] CHECK results
   2. IF results EMPTY
      1. THEN [[GPT Agent]] REFINE query
      2. AND [[GPT Agent]] TRY again
   3. IF results FOUND
      1. THEN [[GPT Agent]] SELECT best match
      2. AND [[GPT Agent]] CHECK size options

4. WHEN [[GPT Agent]] HAS GIF
   1. THEN [[GPT Agent]] HANDLE based on type:
      1. IF blog post:
         1. AND [[GPT Agent]] CREATE folder structure
            Example: content/blogs/images/YYYY-MM-DD-slug/
         2. AND [[GPT Agent]] DOWNLOAD GIF
            1. AND [[GPT Agent]] USE fixed_width for previews
            2. AND [[GPT Agent]] USE original for full posts
         3. AND [[GPT Agent]] CREATE attribution
            1. AND [[GPT Agent]] ADD Giphy ID
            2. AND [[GPT Agent]] ADD title
            3. AND [[GPT Agent]] ADD creator
            4. AND [[GPT Agent]] ADD URL
            5. AND [[GPT Agent]] ADD license
            6. AND [[GPT Agent]] ADD "Powered By GIPHY" mark
      2. IF Typefully:
         1. AND [[GPT Agent]] PROVIDE Giphy URL
         2. AND [[GPT Agent]] ADD "Powered By GIPHY" mark

5. GIVEN [[GIF]] IS ready
   1. THEN [[GPT Agent]] VERIFY files
      1. AND [[GPT Agent]] CHECK GIF exists
      2. AND [[GPT Agent]] CHECK attribution
      3. AND [[GPT Agent]] CHECK GIPHY mark
   2. IF verification PASSES
      1. THEN [[GPT Agent]] CONFIRM to [[User]]
         1. AND [[GPT Agent]] SHOW location
         2. AND [[GPT Agent]] SHOW attribution
   3. IF verification FAILS
      1. THEN [[GPT Agent]] FIX issues
      2. AND [[GPT Agent]] CHECK again 