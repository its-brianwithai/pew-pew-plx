---
name: update-issue
description: "Universal issue update prompt that identifies the issue type from existing documentation and routes to the appropriate specialized update prompt."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 📝 Update Issue: Intelligent Routing for Issue Updates
> 💡 *Identify the type of existing issue and update it through the appropriate specialized workflow.*

## 🎯 Purpose
Update any existing issue by:
1. **Identifying the issue type** from existing documentation
2. **Routing to the appropriate update prompt**
3. **Following domain-specific refinement processes**
4. **Maintaining consistency with original structure**

## 🔄 Issue Type Identification

### Step 1: Locate Existing Issue
First, determine which issue needs updating:
1. Ask user for issue location or name if not provided
2. Read the existing issue file
3. Identify the issue type from structure and content

### Step 2: Determine Issue Type
Examine the existing issue for type indicators:

#### Tech Issue Indicators
- **Structure**: Requirements → Actor Flow → Deliverables → Acceptance Criteria → Implementation Checkpoints
- **Content**: Technical specifications, code components, system architecture
- **Execute workflow:**

# Update Tech Issue

Update an existing technical issue by refining it through the issue workflow phases.

## Instructions

1. Identify which existing technical issue needs to be updated (ask the user if unclear)
2. Determine which phase of the workflow the issue is currently in
3. Continue from that phase or revisit earlier phases if requirements have changed
4. Apply the issue workflow to refine and improve the issue documentation
5. Consider breaking down into implementation checkpoints if not already done

## Issue Workflow

![[create-tech-issue]]

## Process

- Review the current state of the issue documentation
- Identify gaps or areas needing refinement
- Apply the relevant workflow phases to update the issue
- If scope has grown beyond 3 points, trigger decomposition
- Consider adding implementation checkpoints to break work into PR-able increments
- Update the issue documentation maintaining the same file structure
- Preserve the original issue naming and location

#### Operations Issue Indicators
- **Structure**: Requirements → Process Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Process improvements, workflows, efficiency metrics
- **Execute workflow:**

# Update Operations Issue

Update an existing operations issue by refining process improvements and implementation plans.

## Instructions

1. Identify which existing operations issue needs updating
2. Review current process documentation
3. Update based on new findings or changed requirements
4. Refine implementation phases if needed
5. Adjust success metrics based on new insights

## Issue Workflow

# 📋 Create Operations Issue: Process and Workflow Improvement
> 💡 *Transform operational challenges into actionable improvement issues through systematic analysis and refinement.*

## 📋 Request
> 💡 *Core workflow for operations issue creation*

Transform user's operational request into a well-structured issue by:
1. **Creating minimal base** with the operational problem stated
2. **Researching context** for existing processes and bottlenecks
3. **Building iteratively** through targeted operational questions
4. **Saving to file** when user confirms completion

### Deliverables
- Initial operations issue capturing the problem
- Process analysis and current state assessment
- Iteratively refined improvement plan
- **ACTUAL FILE CREATED**: Issue saved to `issues/operations/`

### Acceptance Criteria
- [ ] Operational problem clearly defined
- [ ] Current process documented
- [ ] Improvement opportunities identified
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the problem, understand the process, build the solution incrementally.*

**Fundamental Principles:**
1. **Problem First**: Start with the operational pain point
2. **Process Understanding**: Map current state before proposing changes
3. **Incremental Improvement**: Build solutions through phases
4. **Measurable Impact**: Focus on quantifiable improvements

## 🔄 Workflow
> 💡 *Systematic approach to operations issue creation*

### Step 1: Create Minimal Base
**Template for Operations Issue:**
```markdown
# 🔧 Operations Issue: [Process/System Name]

[Brief description of operational challenge]

## 📝 Initial Requirement

### Requirements
1. [Process/workflow that needs improvement]
```

### Step 2: Interactive Refinement Questions

#### Process Flow Questions
1. **Current State**: "What's the current process step-by-step?"
2. **Pain Points**: "Where are the bottlenecks or inefficiencies?"
3. **Volume**: "How often does this process run? How many items?"
4. **Time**: "How long does each step currently take?"
5. **Resources**: "Who's involved and what tools are used?"

#### Improvement Questions
1. **Desired State**: "What would the ideal process look like?"
2. **Constraints**: "What can't be changed (budget, systems, regulations)?"
3. **Priority**: "What's the most critical improvement needed?"
4. **Timeline**: "When does this need to be implemented?"
5. **Success**: "How will we measure improvement?"

#### Implementation Questions
1. **Quick Wins**: "What can be improved immediately?"
2. **Dependencies**: "What needs to happen first?"
3. **Risks**: "What could go wrong during transition?"
4. **Training**: "Who needs to learn new processes?"
5. **Rollback**: "How do we revert if needed?"

### Step 3: File Creation
Save to: `issues/operations/[process-name]-improvement/operations-issue.md`

## 📏 Instructions
> 💡 *Rules for operations issue creation*

### WHEN starting an operations issue
- ALWAYS identify the specific process or workflow
- FOCUS on measurable inefficiencies
- DOCUMENT current state before proposing changes
- QUANTIFY impact where possible

### WHEN asking questions
- PRIORITIZE understanding current pain points
- FOCUS on practical, implementable solutions
- CONSIDER change management implications
- VALIDATE feasibility with user

### WHEN documenting improvements
- USE before/after comparisons
- INCLUDE time and cost savings estimates
- SPECIFY required resources
- PLAN phased implementation

## 📊 Output Format
> 💡 *Operations issue structure*

### Format Type
Markdown following @templates/business/operations-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. Current State → Desired State mapping
2. Process flow documentation
3. Resource requirements
4. Success metrics
5. Implementation phases

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Focus on operational efficiency
- Document process improvements
- Quantify expected benefits
- Create phased implementation plan
- Save actual file to disk

### What This Prompt MUST NOT Do
- Assume technical solutions without validation
- Ignore change management needs
- Skip current state analysis
- Create overly complex solutions

## Process

- Review current operational analysis
- Update process flows with new information
- Refine resource requirements
- Adjust implementation timeline
- Update success metrics
- Maintain file in same location

#### Marketing Issue Indicators
- **Structure**: Marketing Objectives → Campaign Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Campaigns, audience targeting, brand messaging
- **Execute workflow:**

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

#### Sales Issue Indicators
- **Structure**: Sales Objectives → Sales Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Pipeline stages, conversion strategies, revenue targets
- **Execute workflow:**

# Update Sales Issue

Update an existing sales issue by refining pipeline strategies and revenue plans.

## Instructions

1. Identify which existing sales issue needs updating
2. Review current pipeline documentation
3. Update based on sales performance data
4. Refine conversion strategies if needed
5. Adjust revenue targets based on market conditions

## Issue Workflow

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
Following @instructions/conventions/mvpm-issue-conventions.md
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

## Process

- Review current sales analysis
- Update pipeline metrics
- Refine sales process
- Adjust enablement needs
- Update revenue forecasts
- Revise success criteria
- Maintain file in same location

#### Finance Issue Indicators
- **Structure**: Financial Objectives → Money Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Budgets, cash flow, cost optimization
- **Execute workflow:**

# Update Finance Issue

Update an existing finance issue by refining financial strategies and optimization plans.

## Instructions

1. Identify which existing finance issue needs updating
2. Review current financial documentation
3. Update based on new financial data
4. Refine cost optimization strategies
5. Adjust financial targets based on performance

## Issue Workflow

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
Markdown following @templates/business/finance-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
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

## Process

- Review current financial analysis
- Update cash flow projections
- Refine budget allocations
- Adjust cost reduction plans
- Update investment priorities
- Revise financial metrics
- Maintain file in same location

#### People Issue Indicators
- **Structure**: People Objectives → People Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Hiring plans, team development, skills assessment
- **Execute workflow:**

# Update People Issue

Update an existing people issue by refining team strategies and development plans.

## Instructions

1. Identify which existing people issue needs updating
2. Review current team documentation
3. Update based on team changes or new requirements
4. Refine hiring or development strategies
5. Adjust success metrics based on team performance

## Issue Workflow

# 📋 Create People Issue: Team and Talent Development
> 💡 *Transform people challenges into actionable improvement issues through systematic analysis.*

## 📋 Request
> 💡 *Core workflow for people issue creation*

Transform user's people request into a well-structured issue by:
1. **Creating minimal base** with the people goal
2. **Researching context** for current team situation
3. **Building iteratively** through strategic people questions
4. **Saving to file** when people plan is complete

### Deliverables
- Initial people issue with objectives
- Team analysis and capability assessment
- Development opportunities identified
- **ACTUAL FILE CREATED**: Issue saved to `issues/people/`

### Acceptance Criteria
- [ ] People objectives clearly defined
- [ ] Current team state documented
- [ ] Growth opportunities identified
- [ ] Success metrics established
- [ ] **FILE IS CREATED ON DISK** when confirmed

## 🎯 Core Philosophy
> 💡 *Start with the team need, understand the gaps, build the solution incrementally.*

**Fundamental Principles:**
1. **People First**: Start with human needs
2. **Capability Understanding**: Know current skills
3. **Growth Focus**: Develop talent continuously
4. **Cultural Impact**: Consider team dynamics

## 🔄 Workflow

### Step 1: Create Minimal Base
**Template for People Issue:**
```markdown
# 👥 People Issue: [Team/People Initiative]

[Brief description of people goal or challenge]

## 📝 Initial Requirement

### People Objectives
1. [What people outcome is needed]
```

### Step 2: Interactive Refinement Questions

#### Team Questions
1. **Current Size**: "How many people on the team?"
2. **Gaps**: "What roles or skills are missing?"
3. **Performance**: "How is the team performing?"
4. **Culture**: "What's the team dynamic like?"
5. **Retention**: "Any turnover concerns?"

#### Hiring Questions
1. **Needs**: "What positions need filling?"
2. **Timeline**: "When do they need to start?"
3. **Budget**: "What's the salary range?"
4. **Source**: "Where will we find candidates?"
5. **Process**: "What's the interview process?"

#### Development Questions
1. **Skills**: "What skills need development?"
2. **Training**: "What training is needed?"
3. **Career**: "What growth paths exist?"
4. **Mentoring**: "Any mentorship needs?"
5. **Performance**: "How do we measure improvement?"

### Step 3: File Creation
Save to: `issues/people/[initiative-name]/people-issue.md`

## 📏 Instructions

### WHEN starting a people issue
- ALWAYS consider team impact
- IDENTIFY skill gaps clearly
- CONSIDER culture fit
- ESTABLISH growth paths

### WHEN asking questions
- FOCUS on team needs
- PRIORITIZE critical roles
- CONSIDER development opportunities
- VALIDATE cultural alignment

### WHEN documenting improvements
- MAP organizational structure
- SPECIFY role requirements
- PLAN onboarding process
- DEFINE success measures

## 📊 Output Format

### Format Type
Markdown following @templates/business/people-issue-template.md structure

### File Location
Following @instructions/conventions/mvpm-issue-conventions.md
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Organized within milestone and step hierarchy

### Key Sections
1. People objectives
2. Team analysis
3. Hiring/development plan
4. Cultural considerations
5. Success metrics

## ✅ Critical Success Factors

### What This Prompt MUST Do
- Define clear people goals
- Document team needs
- Create actionable hiring/development plan
- Establish team metrics
- Save actual file to disk

### What This Prompt MUST NOT Do
- Ignore cultural impact
- Skip skill assessment
- Forget onboarding needs
- Overlook retention factors

## Process

- Review current team analysis
- Update skill gap assessment
- Refine hiring pipeline
- Adjust development plans
- Update cultural initiatives
- Revise team metrics
- Maintain file in same location

### Step 3: Execute Update Workflow
Once issue type is confirmed:
1. Follow the specialized update workflow
2. Review current state of documentation
3. Apply appropriate refinements for that domain
4. Maintain file in same location

## 📏 Update Rules

### ALWAYS preserve
- Original file location and naming
- Core issue structure for that type
- Existing context and history
- Domain-specific terminology

### NEVER change
- Issue type mid-update
- File location or naming convention
- Template structure fundamentals
- Domain without explicit request

## 🎯 Workflow Execution

### Update Process
1. **Confirm issue type**: "Updating your [type] issue..."
2. **Review current state**: Analyze existing documentation
3. **Identify gaps**: What needs refinement or addition
4. **Apply updates**: Follow domain-specific workflow
5. **Validate consistency**: Ensure structure maintained

### Domain-Specific Focus Areas

#### Tech Updates
- Implementation details refinement
- Technical specification updates
- Architecture adjustments
- New dependencies or constraints

#### Operations Updates
- Process optimization findings
- Efficiency improvements
- Resource requirement changes
- Timeline adjustments

#### Marketing Updates
- Campaign strategy pivots
- Audience insight updates
- Channel effectiveness data
- Content requirement changes

#### Sales Updates
- Pipeline stage modifications
- Conversion rate updates
- Sales enablement needs
- Revenue forecast adjustments

#### Finance Updates
- Budget reallocation
- Cost saving opportunities
- Cash flow updates
- Investment priority changes

#### People Updates
- Team composition changes
- Skill gap updates
- Training plan adjustments
- Cultural initiative modifications

## ✅ Success Criteria
- Correct issue type identified
- Appropriate update workflow executed
- Original structure preserved
- Updates enhance clarity and actionability
- File maintained in original location
