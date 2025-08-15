---
name: create-activity
description: "Create a new activity document that describes a reusable action actors can perform"
---

# 🤝 Create Activity Document

## 🎯 End Goal

Create a simple, reusable activity document that describes what an action means and entails, focusing purely on the action itself without actor context.

### Deliverables
- Single activity document following verb-subject naming convention
- Clear explanation of what the activity involves
- Action-focused content that can be reused across multiple actors

### Acceptance Criteria
- [ ] Document follows activity-template structure
- [ ] Uses verb-subject naming (e.g., compare-prices, find-products)
- [ ] Focuses purely on the action without mentioning specific actors
- [ ] Explains what the activity means, does, and entails
- [ ] Saved to /activities/ directory in project root

## 📋 Request

Create a new activity document that describes a specific action or behavior that can be performed by different actors in the system.

## 📏 Instructions

### WHEN creating the activity document
**Rules:**
- ALWAYS use verb-subject naming convention for the filename
- ALWAYS focus purely on the action itself
- NEVER mention specific actors, systems, or contextual details
- MUST explain what the activity means, does, and entails
- ALWAYS save to /activities/{concept-category}/ directory structure
- MUST categorize by business concept (commerce, content, engagement, operations, planning)

**Best Practices:**
- Keep explanations simple and focused
- Make content reusable across different scenarios
- Use clear, action-oriented language
- Explain the core essence of the activity
- Choose appropriate concept category for organization

**Concept Categories:**
- **commerce** - buying, selling, pricing, product discovery activities
- **content** - creation, sharing, contribution, submission activities
- **engagement** - community, consultation, feedback, relationship activities
- **operations** - management, tracking, administrative, maintenance activities
- **planning** - scheduling, organizing, preparation, strategy activities

## 📊 Output Format

### Format Type
Markdown

### Structure Template
```markdown
# [Verb]-[Subject]
> 💡 *[Brief description of what this interaction accomplishes]*

[Explain what this activity means, what it involves, and what it entails. Focus purely on the action itself without mentioning specific actors, systems, or context. Keep it simple and reusable across different scenarios.]
```

### Delivery Instructions
- Save as [verb]-[subject].md in /activities/{concept-category}/ directory
- Use lowercase with hyphens for filename
- Choose appropriate concept category for the activity type
- Reference via flat wikilinks: [[verb-subject-wl-example]] (no folder paths in wikilinks)

---

role: [[meta-template-expert]]