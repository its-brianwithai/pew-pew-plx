---
document_type: protocol
goal: create engaging and valuable case studies that showcase project success and learnings
gpt_action: follow these steps when user wants to create a case study
---

CONTEXT: The [[User]] wants to create a case study to showcase a client project or technical implementation, highlighting key learnings and value delivered.

1. GIVEN [[User]] RUNS plx-create-case-study command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK case study type
         ```markdown
         # Case Study Types
         - client      : Client project showcase
         - technical   : Technical implementation deep-dive
         - process     : Process improvement story
         - innovation  : New solution or approach
         ```
      2. AND [[GPT Agent]] CHECK required parameters
         ```markdown
         # Required Parameters
         - title          : Name in Title Case
         - type          : One of the case study types above
         - industry      : Client's industry or tech domain
         - duration      : Project timeframe
         - target        : Target audience (clients/developers/etc)
         - platforms     : Where to publish (website/LinkedIn/etc)
         ```
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for case study type
      2. AND [[GPT Agent]] ASK for required parameters

2. WHEN [[GPT Agent]] CREATES case study
   1. THEN [[GPT Agent]] CREATE file in case-studies directory
      ```markdown
      # File Location
      case-studies/title-in-kebab-case.md
      ```
   2. THEN [[GPT Agent]] ADD frontmatter
      ```markdown
      # Frontmatter Format
      ---
      document_type: case-study
      title: Title In Title Case
      type: client | technical | process | innovation
      industry: Client Industry or Domain
      duration: Project Duration
      target_audience: Target Readers
      platforms: [Website, LinkedIn]
      gpt_action: follow these steps to document [title] case study
      ---
      ```
   3. THEN [[GPT Agent]] CREATE sections
      1. AND [[GPT Agent]] ADD "🎯 Executive Summary"
      2. AND [[GPT Agent]] ADD "🔍 Challenge"
      3. AND [[GPT Agent]] ADD "💡 Solution"
      4. AND [[GPT Agent]] ADD "⚙️ Implementation"
      5. AND [[GPT Agent]] ADD "📊 Results"
      6. AND [[GPT Agent]] ADD "🎓 Key Learnings"
      7. AND [[GPT Agent]] ADD "👥 Testimonials"

3. WHEN [[GPT Agent]] FILLS sections
   1. THEN [[GPT Agent]] WRITE Executive Summary
      1. AND [[GPT Agent]] HIGHLIGHT key achievements
      2. AND [[GPT Agent]] ADD compelling metrics
      3. AND [[GPT Agent]] INCLUDE value proposition
   2. THEN [[GPT Agent]] WRITE Challenge
      1. AND [[GPT Agent]] DESCRIBE initial situation
      2. AND [[GPT Agent]] EXPLAIN pain points
      3. AND [[GPT Agent]] ADD business impact
      4. AND [[GPT Agent]] INCLUDE constraints
   3. THEN [[GPT Agent]] WRITE Solution
      1. AND [[GPT Agent]] OUTLINE approach
      2. AND [[GPT Agent]] EXPLAIN key decisions
      3. AND [[GPT Agent]] ADD solution architecture
      4. AND [[GPT Agent]] HIGHLIGHT innovations
   4. THEN [[GPT Agent]] WRITE Implementation
      1. AND [[GPT Agent]] DESCRIBE process
      2. AND [[GPT Agent]] ADD technical details
      3. AND [[GPT Agent]] INCLUDE challenges overcome
      4. AND [[GPT Agent]] ADD code examples if relevant
   5. THEN [[GPT Agent]] WRITE Results
      1. AND [[GPT Agent]] LIST achievements
      2. AND [[GPT Agent]] ADD metrics and KPIs
      3. AND [[GPT Agent]] INCLUDE business impact
      4. AND [[GPT Agent]] ADD ROI if applicable
   6. THEN [[GPT Agent]] WRITE Key Learnings
      1. AND [[GPT Agent]] SHARE insights gained
      2. AND [[GPT Agent]] ADD best practices
      3. AND [[GPT Agent]] INCLUDE tips for others
   7. THEN [[GPT Agent]] ADD Testimonials
      1. AND [[GPT Agent]] INCLUDE client quotes
      2. AND [[GPT Agent]] ADD team feedback
      3. AND [[GPT Agent]] HIGHLIGHT satisfaction

4. WHEN [[GPT Agent]] OPTIMIZES for platforms
   1. THEN [[GPT Agent]] CREATE platform variants
      1. IF [[platform]] IS website
         1. THEN [[GPT Agent]] USE full format
         2. AND [[GPT Agent]] ADD rich media
      2. IF [[platform]] IS LinkedIn
         1. THEN [[GPT Agent]] CREATE summary version
         2. AND [[GPT Agent]] ADD key highlights
         3. AND [[GPT Agent]] INCLUDE link to full case study

5. GIVEN [[case study]] IS ready
   1. THEN [[GPT Agent]] ADD media elements
      1. AND [[GPT Agent]] USE format
         ```markdown
         [SCREENSHOT: Solution in action]
         [DIAGRAM: Architecture overview]
         [CHART: Key metrics and results]
         [PHOTO: Team or client]
         ```
   2. THEN [[GPT Agent]] VERIFY content quality
      1. AND [[GPT Agent]] CHECK value proposition
      2. AND [[GPT Agent]] CHECK metrics accuracy
      3. AND [[GPT Agent]] CHECK technical details
      4. AND [[GPT Agent]] CHECK testimonials
   3. THEN [[GPT Agent]] OPTIMIZE for readability
      1. AND [[GPT Agent]] ADD subheadings
      2. AND [[GPT Agent]] USE bullet points
      3. AND [[GPT Agent]] INCLUDE callouts
      4. AND [[GPT Agent]] CHECK formatting

NOTE: Remember to maintain a professional yet engaging tone, focus on concrete value and results, and include specific, measurable outcomes. The case study should be valuable both as a marketing tool and as a learning resource. Always respect client confidentiality and get approval for sharing specific details. 