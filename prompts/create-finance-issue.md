---
name: create-finance-issue
description: "Use this prompt to create well-structured finance issues for budgeting, cash flow management, and financial optimization."
---

# 📋 Create Finance Issue: Financial Planning and Optimization
> 💡 *Transform financial challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for finance issue creation*

Transform user's financial request into a well-structured issue by:
1. **Creating minimal base** with the financial goal
2. **Researching context** for current financial position
3. **Building iteratively** through strategic finance questions
4. **Saving to file** when financial plan is complete

### Deliverables
- Initial finance issue with objectives
- Financial analysis and cash flow assessment
- Cost optimization opportunities identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/finance/`

### Acceptance Criteria
- [ ] Financial objectives clearly defined
- [ ] Current position documented
- [ ] Improvement opportunities identified
- [ ] Financial targets established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the financial goal, understand the numbers, build the solution incrementally.*

**Fundamental Principles:**
1. **Numbers First**: Start with current financial position
2. **Cash Flow Focus**: Understand money movement
3. **Cost Optimization**: Find efficiency opportunities
4. **Measurable Impact**: Track financial improvements

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for Finance Issue:**
```markdown
# 💵 Finance Issue: [Financial Initiative/Problem]

[Brief description of financial goal or challenge]

## 📝 Initial Requirement

### Financial Objectives
1. [What financial outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Financial Position Questions
1. **Current State**: "What's the current cash position?"
2. **Burn Rate**: "What's the monthly burn?"
3. **Revenue**: "What's current MRR/ARR?"
4. **Runway**: "How many months of runway?"
5. **Profitability**: "Are we profitable? If not, when?"

#### Cost Questions
1. **Fixed Costs**: "What are monthly fixed costs?"
2. **Variable Costs**: "What varies with volume?"
3. **Biggest Expenses**: "Top 3 cost categories?"
4. **Optimization**: "Where can we cut costs?"
5. **ROI**: "What spending has best ROI?"

#### Planning Questions
1. **Budget**: "What's the budget target?"
2. **Forecast**: "What's the revenue forecast?"
3. **Investment**: "What investments are needed?"
4. **Funding**: "Any funding requirements?"
5. **Metrics**: "What KPIs to track?"

### Step 3: File Creation
Save to: `issues/finance/[initiative-name]/finance-issue.md`

## 📏 Instructions

### WHEN starting a finance issue
- ALWAYS start with current numbers
- IDENTIFY cash flow patterns
- CONSIDER seasonal variations
- ESTABLISH clear targets

### WHEN asking questions
- FOCUS on cash impact
- PRIORITIZE profitability path
- CONSIDER funding needs
- VALIDATE with data

### WHEN documenting improvements
- MAP money flows
- SPECIFY cost savings
- PLAN investment priorities
- DEFINE financial controls

## 📊 Output Format

### Format Type
Markdown following [[finance-issue-template]] structure

### File Location
Following [[mvpm-issue-conventions]]
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Financial objectives
2. Current position analysis
3. Money flow documentation
4. Cost optimization plan
5. Financial metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear financial targets
- Document current position
- Identify savings opportunities
- Create tracking metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Create unrealistic projections
- Ignore cash flow constraints
- Skip risk assessment
- Forget compliance needs
