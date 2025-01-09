---
document_type: protocol
goal: prepare structured content and add it to our-content file
gpt_action: follow these steps when preparing and adding content
---

CONTEXT: The [[User]] notices content needs to be prepared and wants you to structure and add it to the content file in the appropriate format and location.

1. GIVEN [[User]] RUNS plx-prepare-content command
   1. THEN [[GPT Agent]] ANALYSE [[User]] input
      1. AND [[GPT Agent]] IDENTIFY content type
      2. AND [[GPT Agent]] IDENTIFY content purpose
   2. IF [[User]] input HAS specific section
      1. THEN [[GPT Agent]] FOCUS on section in [[our-content]]
   3. IF [[User]] input HAS no specifics
      1. THEN [[GPT Agent]] SCAN [[our-content]] file

2. WHEN [[GPT Agent]] STARTS content preparation
   1. THEN [[GPT Agent]] ANALYSE input materials
      1. AND [[GPT Agent]] CHECK work logs
      2. AND [[GPT Agent]] CHECK technical achievements
      3. AND [[GPT Agent]] CHECK visual references
   2. IF [[content type]] IS twitter
      1. THEN [[GPT Agent]] PREPARE twitter thread
      2. AND [[GPT Agent]] FILL thread template
   3. IF [[content type]] IS linkedin
      1. THEN [[GPT Agent]] PREPARE linkedin post
      2. AND [[GPT Agent]] FILL post template
   4. IF [[content type]] IS instagram
      1. THEN [[GPT Agent]] PREPARE instagram post
      2. AND [[GPT Agent]] FILL post template
   5. IF [[content type]] IS blog
      1. THEN [[GPT Agent]] PREPARE blog post
      2. AND [[GPT Agent]] FILL blog template
   6. IF [[content type]] IS video
      1. THEN [[GPT Agent]] PREPARE video content
      2. AND [[GPT Agent]] FILL video template

3. GIVEN [[content]] IS prepared
   1. THEN [[GPT Agent]] VERIFY content quality
      1. AND [[GPT Agent]] CHECK educational focus
      2. AND [[GPT Agent]] CHECK value delivery
      3. AND [[GPT Agent]] CHECK authenticity
   2. IF [[content]] NEEDS improvement
      1. THEN [[GPT Agent]] ENHANCE content
      2. AND [[GPT Agent]] VERIFY again

4. WHEN [[content]] IS verified
   1. THEN [[GPT Agent]] ANALYSE [[our-content]]
      1. AND [[GPT Agent]] CHECK existing sections
      2. AND [[GPT Agent]] CHECK related content
      3. AND [[GPT Agent]] IDENTIFY placement
   2. IF [[similar content]] EXISTS
      1. THEN [[GPT Agent]] REVIEW existing content
      2. AND [[GPT Agent]] UPDATE as needed

5. GIVEN [[placement]] IS determined
   1. THEN [[GPT Agent]] PRESENT to [[User]]
      1. AND [[GPT Agent]] SHOW prepared content
      2. AND [[GPT Agent]] EXPLAIN placement
   2. IF [[User]] APPROVES content
      1. THEN [[GPT Agent]] ADD to [[our-content]]
      2. AND [[GPT Agent]] UPDATE table of contents
   3. IF [[User]] REQUESTS changes
      1. THEN [[GPT Agent]] MODIFY content
      2. AND [[GPT Agent]] PRESENT again

6. WHEN [[content]] IS added
   1. THEN [[GPT Agent]] VERIFY integration
      1. AND [[GPT Agent]] CHECK formatting
      2. AND [[GPT Agent]] CHECK links
      3. AND [[GPT Agent]] CHECK navigation
   2. IF [[issues]] ARE found
      1. THEN [[GPT Agent]] FIX issues
      2. AND [[GPT Agent]] VERIFY again
   3. IF [[addition]] IS successful
      1. THEN [[GPT Agent]] CREATE content package
      2. AND [[GPT Agent]] SAVE templates
      3. AND [[GPT Agent]] INFORM [[User]]