---
name: create-tutorial
description: "Create comprehensive, value-focused tutorials for entrepreneurs, professionals, and AI enthusiasts using clear documentation-style writing"
---

# 📚 Create Tutorial: High-Value Educational Content Generator
> 💡 *Transform knowledge into actionable, value-dense tutorials that educate without selling, using simple English and strategic visual placeholders*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value. This is the north star for inclusion decisions.*

Successfully create a comprehensive, publication-ready tutorial that:
- Delivers maximum educational value to entrepreneurs, professionals, and AI enthusiasts
- Uses clear, simple English without sales language
- Includes strategic placeholders for visual learning elements
- Follows documentation best practices for clarity and structure
- Receives user approval on outline before full development
- Saves to `drafts/{descriptive-name}-tutorial.md` format

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Create a high-value tutorial based on context analysis, obtaining user approval on the outline before developing the complete content.

### Deliverables
- Topic determination based on conversation/request analysis
- Initial tutorial outline for user review
- Complete tutorial with visual placeholders
- Saved file in `drafts/` directory with descriptive naming

### Acceptance Criteria
- [ ] Topic derived from conversation, request, or user input
- [ ] Outline approved by user before proceeding
- [ ] Zero sales language or promotional content
- [ ] All sections provide educational value
- [ ] Simple English accessible to target audience
- [ ] Strategic visual placeholders included
- [ ] Saved to correct location with descriptive filename

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Topic Discovery
**Deliverable:** Clear tutorial topic based on context
**Acceptance Criteria:** Topic aligns with user needs
- Analyze current conversation for implicit tutorial needs
- Review explicit user requests for tutorial topics
- If both exist, synthesize comprehensive topic
- If neither exists, ask user directly for topic preference
- Document selected topic and rationale

### Step 2: Outline Creation & Approval
**Deliverable:** Structured outline with section descriptions
**Acceptance Criteria:** User approves outline before proceeding
- Generate comprehensive outline with:
  - Clear learning objectives
  - Logical section progression
  - Time estimates per section
  - Key concepts to cover
  - Visual element placement strategy
- Present outline to user with rationale
- Ask: "Does this outline meet your needs? Any sections to add, remove, or modify?"
- Incorporate feedback until approved

### Step 3: Content Development
**Deliverable:** Complete tutorial content
**Acceptance Criteria:** All sections deliver value
- Write each section with:
  - Clear, simple explanations
  - Practical examples
  - Step-by-step instructions where applicable
  - Common pitfalls and solutions
- Maintain documentation style throughout
- Focus exclusively on educational value

### Step 4: Visual Placeholder Integration
**Deliverable:** Strategic image/screenshot placeholders
**Acceptance Criteria:** Visual aids enhance learning
- Add placeholders using format: `![Screenshot: Description of what to show]`
- Place visuals at:
  - Complex concept explanations
  - Step-by-step procedures
  - Before/after comparisons
  - Results demonstrations
- Include placeholder captions explaining visual purpose

### Step 5: File Creation & Saving
**Deliverable:** Saved tutorial file
**Acceptance Criteria:** Correct location and naming
- Generate descriptive filename from topic
- Save to `drafts/{descriptive-name}-tutorial.md`
- Confirm file creation and location

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN determining tutorial topic
**Best Practices:**
- Prioritize actionable, practical knowledge
- Choose topics that solve real problems
- Consider current trends and needs

**Rules:**
- ALWAYS check conversation context first
- ALWAYS check user requests second
- MUST synthesize both if present
- MUST ask user if neither exists

### WHEN writing tutorial content
**Best Practices:**
- Use active voice and present tense
- Break complex concepts into digestible chunks
- Include real-world applications
- Provide context before diving into details

**Conventions:**
- Headings follow logical hierarchy (H1 → H2 → H3)
- Code examples use appropriate syntax highlighting
- Lists for multiple related items
- Tables for comparative information

**Rules:**
- NEVER use sales language or promotional content
- NEVER include fluff or filler content
- ALWAYS define technical terms on first use
- ALWAYS provide value in every paragraph

### WHEN structuring sections
**Requirements:**
- Introduction with clear learning objectives
- Prerequisites section if applicable
- Core content in logical progression
- Practical exercises or examples
- Summary of key takeaways
- Next steps for continued learning

**Constraints:**
- Maximum 3 levels of heading depth
- Sections should be 3-7 minutes reading time
- Each section must stand alone conceptually

### WHEN adding visual placeholders
**Best Practices:**
- Describe exactly what the image should show
- Include annotations or callouts needed
- Specify if diagram, screenshot, or photo
- Consider accessibility in descriptions

**Rules:**
- ALWAYS use descriptive alt text format
- MUST explain visual's educational purpose
- NEVER add decorative-only images

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown with documentation-style formatting

### Structure Template
```markdown
# [Tutorial Title]

## 📎 Quick Reference
- **Time to Complete:** [X minutes]
- **Difficulty Level:** [Beginner/Intermediate/Advanced]
- **Prerequisites:** [List any required knowledge]
- **What You'll Learn:** [3-5 bullet points]

## 🎯 Learning Objectives

By the end of this tutorial, you will:
1. [Specific, measurable objective]
2. [Another concrete skill or knowledge]
3. [Additional learning outcome]

## 📋 Prerequisites

[List any required knowledge, tools, or setup]

## 🚀 [Section 1: Foundation Concept]

[Clear introduction to the concept]

![Screenshot: Show the initial state or interface]

### Understanding [Key Concept]

[Explanation in simple terms]

### Step-by-Step Process

1. **[Action]**: [Clear instruction]
   ![Screenshot: Show this specific step]
   
2. **[Next Action]**: [Detailed guidance]
   - [Sub-point if needed]
   - [Another sub-point]

### Common Pitfalls

- **[Problem]**: [Solution]
- **[Issue]**: [How to avoid/fix]

## 🔧 [Section 2: Practical Application]

[Continue with logical flow...]

## 💡 Key Takeaways

- [Most important concept]
- [Critical skill learned]
- [Essential principle]

## 🎓 Practice Exercises

1. **Exercise 1**: [Description]
   - Expected outcome: [What success looks like]
   
2. **Exercise 2**: [Description]
   - Challenge: [Optional harder variant]

## 📚 Next Steps

- [Recommended follow-up learning]
- [Advanced topics to explore]
- [Resources for deeper understanding]

## 🔗 Additional Resources

- [Relevant documentation or guides]
- [Tools or platforms mentioned]
- [Community or support channels]
```

### Delivery Instructions
- Save to `drafts/` directory
- Use kebab-case for filename
- Include `-tutorial` suffix
- Confirm successful file creation

---

# Usage Notes

## Target Audience Focus
This prompt specifically targets:
- **Entrepreneurs**: Practical, ROI-focused content
- **Professionals**: Efficiency and best practices
- **AI Enthusiasts**: Technical accuracy with accessibility

## Value-First Philosophy
Every section must answer: "How does this help the reader achieve their goals?"
- No filler content
- No sales pitches
- No unnecessary complexity
- Pure educational value

## Visual Learning Strategy
Placeholders serve as blueprint for visual creation:
- Screenshots for UI/UX guidance
- Diagrams for concept explanation
- Before/after for transformations
- Flowcharts for processes

## Documentation Best Practices
- Clear hierarchy and navigation
- Consistent formatting throughout
- Scannable with headers and lists
- Self-contained sections for reference

## Approval Gate
The outline approval step ensures:
- Alignment with user expectations
- Opportunity for scope adjustment
- Collaborative content development
- Waste prevention in content creation

## Reference
This prompt follows: [[prompt-template]]