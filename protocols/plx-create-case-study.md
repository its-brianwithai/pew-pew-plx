---
document_type: protocol
goal: create engaging and valuable case studies that showcase project success and learnings
gpt_action: follow these steps when user wants to create a case study
---

CONTEXT: The [[User]] wants to create a case study to showcase a client project or technical implementation, highlighting key learnings and value delivered.

1. GIVEN [[User]] RUNS plx-create-case-study command
   1. THEN [[You]] READ [[input]]
      1. AND [[You]] CHECK case study type
         ```markdown
         # Case Study Types
         - client      : Client project showcase
         - technical   : Technical implementation deep-dive
         - process     : Process improvement story
         - innovation  : New solution or approach
         ```
      2. AND [[You]] CHECK required parameters
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
      1. THEN [[You]] ASK [[User]] for case study type
      2. AND [[You]] ASK for required parameters

2. WHEN [[You]] CREATES case study
   1. THEN [[You]] CREATE file in case-studies directory
      ```markdown
      # File Location
      case-studies/title-in-kebab-case.md
      ```
   2. THEN [[You]] ADD frontmatter
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
   3. THEN [[You]] CREATE sections
      1. AND [[You]] ADD "🎯 Executive Summary"
      2. AND [[You]] ADD "🔍 Challenge"
      3. AND [[You]] ADD "💡 Solution"
      4. AND [[You]] ADD "⚙️ Implementation"
      5. AND [[You]] ADD "📊 Results"
      6. AND [[You]] ADD "🎓 Key Learnings"
      7. AND [[You]] ADD "👥 Testimonials"

3. WHEN [[You]] FILLS sections
   1. THEN [[You]] WRITE Executive Summary
      1. AND [[You]] HIGHLIGHT key achievements
      2. AND [[You]] ADD compelling metrics
      3. AND [[You]] INCLUDE value proposition
   2. THEN [[You]] WRITE Challenge
      1. AND [[You]] DESCRIBE initial situation
      2. AND [[You]] EXPLAIN pain points
      3. AND [[You]] ADD business impact
      4. AND [[You]] INCLUDE constraints
   3. THEN [[You]] WRITE Solution
      1. AND [[You]] OUTLINE approach
      2. AND [[You]] EXPLAIN key decisions
      3. AND [[You]] ADD solution architecture
      4. AND [[You]] HIGHLIGHT innovations
   4. THEN [[You]] WRITE Implementation
      1. AND [[You]] DESCRIBE process
      2. AND [[You]] ADD technical details
      3. AND [[You]] INCLUDE challenges overcome
      4. AND [[You]] ADD code examples if relevant
   5. THEN [[You]] WRITE Results
      1. AND [[You]] LIST achievements
      2. AND [[You]] ADD metrics and KPIs
      3. AND [[You]] INCLUDE business impact
      4. AND [[You]] ADD ROI if applicable
   6. THEN [[You]] WRITE Key Learnings
      1. AND [[You]] SHARE insights gained
      2. AND [[You]] ADD best practices
      3. AND [[You]] INCLUDE tips for others
   7. THEN [[You]] ADD Testimonials
      1. AND [[You]] INCLUDE client quotes
      2. AND [[You]] ADD team feedback
      3. AND [[You]] HIGHLIGHT satisfaction

4. WHEN [[You]] OPTIMIZES for platforms
   1. THEN [[You]] CREATE platform variants
      1. IF [[platform]] IS website
         1. THEN [[You]] USE full format
         2. AND [[You]] ADD rich media
      2. IF [[platform]] IS LinkedIn
         1. THEN [[You]] CREATE summary version
         2. AND [[You]] ADD key highlights
         3. AND [[You]] INCLUDE link to full case study

5. GIVEN [[case study]] IS ready
   1. THEN [[You]] ADD media elements
      1. AND [[You]] USE format
         ```markdown
         [SCREENSHOT: Solution in action]
         [DIAGRAM: Architecture overview]
         [CHART: Key metrics and results]
         [PHOTO: Team or client]
         ```
   2. THEN [[You]] VERIFY content quality
      1. AND [[You]] CHECK value proposition
      2. AND [[You]] CHECK metrics accuracy
      3. AND [[You]] CHECK technical details
      4. AND [[You]] CHECK testimonials
   3. THEN [[You]] OPTIMIZE for readability
      1. AND [[You]] ADD subheadings
      2. AND [[You]] USE bullet points
      3. AND [[You]] INCLUDE callouts
      4. AND [[You]] CHECK formatting

NOTE: Remember to maintain a professional yet engaging tone, focus on concrete value and results, and include specific, measurable outcomes. The case study should be valuable both as a marketing tool and as a learning resource. Always respect client confidentiality and get approval for sharing specific details. 
