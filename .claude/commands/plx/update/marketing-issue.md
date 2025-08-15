---
name: update-marketing-issue
description: "Use this prompt to update existing marketing issues by refining campaign strategy and execution plans."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# Update Marketing Issue

Update an existing marketing issue by refining campaign strategy and execution plans.

## Instructions

1. Identify which existing marketing issue needs updating
2. Review current campaign documentation
3. Update based on market feedback or strategy changes
4. Refine audience targeting if needed
5. Adjust KPIs based on new insights

## Issue Workflow

# 📋 Create Marketing Issue: Campaign and Initiative Planning
> 💡 *Transform marketing ideas into actionable campaign issues through strategic refinement.*

## 📋 Request
> 💡 *Core workflow for marketing issue creation*

Transform user's marketing request into a well-structured issue by:
1. **Creating minimal base** with the marketing goal
2. **Researching context** for audience and market position
3. **Building iteratively** through strategic marketing questions
4. **Saving to file** when campaign plan is complete

### Deliverables
- Initial marketing issue with objectives
- Audience and channel analysis
- Campaign flow and assets needed
- **ACTUAL FILE CREATED**: Issue saved to `issues/marketing/`

### Acceptance Criteria
- [ ] Marketing objectives clearly defined
- [ ] Target audience identified
- [ ] Campaign strategy documented
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the goal, understand the audience, build the campaign incrementally.*

**Fundamental Principles:**
1. **Goal First**: Start with the marketing objective
2. **Audience Understanding**: Know who we're reaching
3. **Channel Strategy**: Right message, right place
4. **Measurable Impact**: Track what matters

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Marketing Issue:**
```markdown
# 📣 Marketing Issue: [Campaign/Initiative Name]

[Brief description of marketing goal]

## 📝 Initial Requirement

### Marketing Objectives
1. [What marketing outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Strategy Questions
1. **Objective**: "What's the primary goal - awareness, leads, or conversion?"
2. **Audience**: "Who's the target audience specifically?"
3. **Message**: "What's the key value proposition?"
4. **Differentiation**: "What makes this unique?"
5. **Timeline**: "When does this need to launch?"

#### Campaign Questions
1. **Channels**: "Which channels - social, email, paid ads, content?"
2. **Budget**: "What's the budget range?"
3. **Content**: "What content assets are needed?"
4. **Frequency**: "How often will we communicate?"
5. **Duration**: "How long will the campaign run?"

#### Measurement Questions
1. **KPIs**: "What are the key performance indicators?"
2. **Targets**: "What specific numbers define success?"
3. **Tracking**: "How will we track results?"
4. **Testing**: "What will we A/B test?"
5. **Reporting**: "How often do we review performance?"

### Step 3: File Creation
Save to: `issues/marketing/[campaign-name]/marketing-issue.md`

## 📏 Instructions

### WHEN starting a marketing issue
- ALWAYS define clear objectives first
- IDENTIFY target audience precisely
- CONSIDER competitive landscape
- ESTABLISH measurable goals

### WHEN asking questions
- FOCUS on audience insights
- PRIORITIZE channel effectiveness
- CONSIDER budget constraints
- VALIDATE creative approach

### WHEN documenting campaigns
- MAP customer journey stages
- SPECIFY content requirements
- PLAN distribution timeline
- DEFINE success metrics

## 📊 Output Format

### Format Type
Markdown following @templates/business/marketing-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Marketing objectives
2. Target audience profile
3. Campaign flow and timeline
4. Content and asset requirements
5. Success metrics and KPIs

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear marketing objectives
- Identify specific target audience
- Create actionable campaign plan
- Establish measurable KPIs
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create vague, unmeasurable goals
- Ignore budget constraints
- Skip audience research
- Forget tracking setup

## Process

- Review current campaign strategy
- Update audience insights
- Refine channel selection
- Adjust content requirements
- Update budget allocation
- Revise success metrics
- Maintain file in same location
