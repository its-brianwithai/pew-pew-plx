---
document_type: protocol
goal: prepare structured content and add it to our-content file
gpt_action: follow these steps when preparing and adding content
---

CONTEXT: The [[User]] notices content needs to be prepared and wants you to structure and add it to the content file in the appropriate format and location.

1. GIVEN [[User]] RUNS plx-prepare-content command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY content type
      2. AND [[You]] IDENTIFY content purpose
   2. IF [[User]] input HAS specific section
      1. THEN [[You]] FOCUS on section in [[our-content]]
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] SCAN [[our-content]] file

2. WHEN [[You]] STARTS content preparation
   1. THEN [[You]] ANALYSE input materials
      1. AND [[You]] CHECK work logs
      2. AND [[You]] CHECK technical achievements
      3. AND [[You]] CHECK visual references
   2. IF [[content type]] IS twitter
      1. THEN [[You]] PREPARE twitter thread
      2. AND [[You]] FILL thread template
   3. IF [[content type]] IS linkedin
      1. THEN [[You]] PREPARE linkedin post
      2. AND [[You]] FILL post template
   4. IF [[content type]] IS instagram
      1. THEN [[You]] PREPARE instagram post
      2. AND [[You]] FILL post template
   5. IF [[content type]] IS blog
      1. THEN [[You]] PREPARE blog post
      2. AND [[You]] FILL blog template
   6. IF [[content type]] IS video
      1. THEN [[You]] PREPARE video content
      2. AND [[You]] FILL video template

3. GIVEN [[content]] IS prepared
   1. THEN [[You]] VERIFY content quality
      1. AND [[You]] CHECK educational focus
      2. AND [[You]] CHECK value delivery
      3. AND [[You]] CHECK authenticity
   2. IF [[content]] NEEDS improvement
      1. THEN [[You]] ENHANCE content
      2. AND [[You]] VERIFY again

4. WHEN [[content]] IS verified
   1. THEN [[You]] ANALYSE [[our-content]]
      1. AND [[You]] CHECK existing sections
      2. AND [[You]] CHECK related content
      3. AND [[You]] IDENTIFY placement
   2. IF [[similar content]] EXISTS
      1. THEN [[You]] REVIEW existing content
      2. AND [[You]] UPDATE as needed

5. GIVEN [[placement]] IS determined
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] SHOW prepared content
      2. AND [[You]] EXPLAIN placement
   2. IF [[User]] APPROVES content
      1. THEN [[You]] ADD to [[our-content]]
      2. AND [[You]] UPDATE table of contents
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] MODIFY content
      2. AND [[You]] PRESENT again

6. WHEN [[content]] IS added
   1. THEN [[You]] VERIFY integration
      1. AND [[You]] CHECK formatting
      2. AND [[You]] CHECK links
      3. AND [[You]] CHECK navigation
   2. IF [[issues]] ARE found
      1. THEN [[You]] FIX issues
      2. AND [[You]] VERIFY again
   3. IF [[addition]] IS successful
      1. THEN [[You]] CREATE content package
      2. AND [[You]] SAVE templates
      3. AND [[You]] INFORM [[User]]
