---
name: create-sales-issue
description: "Use this prompt to create well-structured sales issues for pipeline improvements, conversion optimization, and revenue growth initiatives."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 📋 Create Sales Issue: Revenue and Pipeline Development
> 💡 *Transform sales challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for sales issue creation*

Transform user's sales request into a well-structured issue by:
1. **Creating minimal base** with the sales goal
2. **Researching context** for current pipeline and performance
3. **Building iteratively** through strategic sales questions
4. **Saving to file** when sales plan is complete

### Deliverables
- Initial sales issue with objectives
- Pipeline and process analysis
- Sales enablement needs identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/sales/`

### Acceptance Criteria
- [ ] Sales objectives clearly defined
- [ ] Pipeline stages documented
- [ ] Improvement opportunities identified
- [ ] Revenue targets established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the revenue goal, understand the pipeline, build the solution incrementally.*

**Fundamental Principles:**
1. **Revenue First**: Start with the financial objective
2. **Pipeline Understanding**: Know where deals get stuck
3. **Process Optimization**: Remove friction points
4. **Measurable Growth**: Track what drives revenue

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Sales Issue:**
```markdown
# 💰 Sales Issue: [Sales Initiative/Problem]

[Brief description of sales goal or challenge]

## 📝 Initial Requirement

### Sales Objectives
1. [What sales outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Revenue Questions
1. **Target**: "What's the revenue target?"
2. **Timeline**: "By when do we need to hit this?"
3. **Current State**: "What's current performance?"
4. **Gap**: "What's blocking us from the target?"
5. **Resources**: "What budget/headcount is available?"

#### Pipeline Questions
1. **Stages**: "What are the current pipeline stages?"
2. **Conversion**: "Where do we lose most deals?"
3. **Velocity**: "How long is the sales cycle?"
4. **Volume**: "How many leads enter the pipeline?"
5. **Quality**: "What's the lead quality like?"

#### Enablement Questions
1. **Tools**: "What sales tools are needed?"
2. **Training**: "What skills gaps exist?"
3. **Content**: "What collateral is missing?"
4. **Process**: "What processes need improvement?"
5. **Competition**: "How do we lose to competitors?"

### Step 3: File Creation
Save to: `issues/sales/[initiative-name]/sales-issue.md`

## 📏 Instructions

### WHEN starting a sales issue
- ALWAYS quantify revenue impact
- IDENTIFY pipeline bottlenecks
- CONSIDER sales team capacity
- ESTABLISH clear targets

### WHEN asking questions
- FOCUS on conversion rates
- PRIORITIZE deal velocity
- CONSIDER competitive positioning
- VALIDATE with data

### WHEN documenting improvements
- MAP sales process stages
- SPECIFY enablement needs
- PLAN territory/account strategy
- DEFINE commission structure

## 📊 Output Format

### Format Type
Markdown following @templates/business/sales-issue-template.md structure

### File Location
Following @instructions/conventions/most-valuable-project-management-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Sales objectives and targets
2. Pipeline analysis
3. Sales process improvements
4. Enablement requirements
5. Revenue metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear revenue targets
- Identify pipeline improvements
- Create actionable sales plan
- Establish tracking metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create unrealistic targets
- Ignore sales capacity
- Skip competitive analysis
- Forget enablement needs
