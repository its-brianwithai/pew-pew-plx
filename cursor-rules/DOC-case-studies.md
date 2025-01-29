---
description: How to create engaging and valuable case studies that showcase project success and learnings
globs: case-studies/*.md
document_type: protocol
goal: Create comprehensive case studies that document project successes and learnings
gpt_action: Follow these steps when creating a case study document
---

# How We Document Case Studies

## Purpose
Create structured, engaging case studies that effectively showcase project successes, technical implementations, and key learnings while providing value to the target audience.

## Trigger Conditions
- Need to document a successful client project
- Showcase a technical implementation
- Share process improvements
- Document innovative solutions
- Create marketing materials for success stories

## Requirements
1. Clear case study type identification
   - Client project showcase
   - Technical implementation deep-dive
   - Process improvement story
   - Innovation showcase

2. Required Parameters
   - Title (in Title Case)
   - Type (from above list)
   - Industry/Domain
   - Project Duration
   - Target Audience
   - Publishing Platforms

3. Proper File Structure
   - Located in case-studies directory
   - Named using kebab-case
   - Markdown format

## Implementation Steps
1. Set Up Case Study Structure
   - Create file in case-studies directory
   - Add frontmatter with required parameters
   - Set up main sections with emoji headers

2. Write Core Sections
   - 🎯 Executive Summary
     - Key achievements
     - Compelling metrics
     - Value proposition
   
   - 🔍 Challenge
     - Initial situation
     - Pain points
     - Business impact
     - Constraints

   - 💡 Solution
     - Approach overview
     - Key decisions
     - Solution architecture
     - Innovations

   - ⚙️ Implementation
     - Process description
     - Technical details
     - Challenges overcome
     - Code examples (if relevant)

   - 📊 Results
     - Achievements list
     - Metrics and KPIs
     - Business impact
     - ROI details

   - 🎓 Key Learnings
     - Insights gained
     - Best practices
     - Tips for others

   - 👥 Testimonials
     - Client quotes
     - Team feedback
     - Satisfaction highlights

3. Add Media Elements
   - Screenshots of solution
   - Architecture diagrams
   - Results charts
   - Team/client photos
   - Proper captions and references

4. Optimize for Platforms
   - Website: Full format with rich media
   - LinkedIn: Summary version with key highlights
   - Other platforms: Adapted versions as needed

5. Quality Check
   - Verify value proposition
   - Validate metrics accuracy
   - Review technical details
   - Confirm testimonials
   - Check formatting and readability

## Examples
### Good Example
```markdown
---
document_type: case-study
title: AI-Powered Inventory Optimization
type: technical
industry: Retail Technology
duration: 6 months
target_audience: Technical Decision Makers
platforms: [Website, LinkedIn]
---

# AI-Powered Inventory Optimization

## 🎯 Executive Summary
Implemented machine learning solution reducing inventory costs by 35% while maintaining 99.9% availability.

## 🔍 Challenge
Client struggled with $2M annual losses from overstock and stockouts...

[Remaining sections following structure]
```

### Bad Example
```markdown
# Project X Case Study

We did some cool stuff for a client. They were happy.
It worked well and saved money.

[No structure, missing details, unprofessional tone]
```

## Validation Checklist
- [ ] Case study type is clearly identified
- [ ] All required parameters are provided
- [ ] File structure follows conventions
- [ ] All core sections are completed
- [ ] Media elements are properly included
- [ ] Platform-specific versions are created
- [ ] Content is professional and engaging
- [ ] Metrics and results are specific and verifiable
- [ ] Client confidentiality is maintained
- [ ] Proper approvals are obtained 