---
name: make-issue
description: "Universal content transformation prompt that analyzes source material to determine appropriate issue type and converts it into a structured issue using the right specialized template."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🏗️ Make Issue: Transform Any Content Into Structured Issues
> 💡 *Analyze source content to identify domain, then transform it into the appropriate type of structured issue.*

## 🎯 Purpose
Transform any content (conversations, notes, requirements, feedback) into structured issues by:
1. **Analyzing content domain** to determine issue type
2. **Extracting relevant information** for that domain
3. **Routing to specialized make prompt** for transformation
4. **Creating properly structured deliverables**

## 🔄 Content Analysis & Routing

### Step 1: Analyze Source Content
Examine the input material for domain indicators:

#### Technical Content
**Indicators**: Code snippets, error messages, feature descriptions, API discussions, database schemas, performance metrics
**Extract**: Requirements, components, interactions, constraints
**Execute workflow:**

![[make-tech-issue]]

#### Operational Content
**Indicators**: Process descriptions, workflow diagrams, efficiency discussions, bottleneck analyses, procedure documentation
**Extract**: Current state, pain points, improvement opportunities
**Execute workflow:**

# 🏗️ Make Operations Issue: Transform Content Into Process Improvements
> 💡 *Convert operational discussions, process documentation, or efficiency reports into actionable improvement issues.*

## 🎯 End Goal
Transform input content into a complete operations issue that:
- Captures process inefficiencies from source material
- Maps current vs desired state clearly
- Identifies concrete improvement opportunities
- Establishes measurable success criteria
- Follows @templates/business/operations-issue-template.md structure

## 📋 Request
Transform operational content into an issue by:
1. Extracting process problems and inefficiencies
2. Identifying stakeholders and resources
3. Mapping current vs desired workflows
4. Defining improvement deliverables
5. Creating success metrics
6. Structuring per operations template

### Deliverables
- Complete operations issue document
- Process flow mapping
- Resource requirement analysis
- Implementation phases
- Success metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Process Problems**: What's not working?
- **Inefficiencies**: Where's time/money wasted?
- **Volume/Frequency**: How often, how much?
- **Stakeholders**: Who's affected?
- **Current Tools**: What's being used?
- **Desired Outcomes**: What's the goal?

### Step 2: Process Mapping
Transform descriptions into flows:
- Current state step-by-step
- Bottleneck identification
- Time per step
- Resource usage
- Desired state vision

### Step 3: Improvement Identification
Extract from content:
- Quick wins possible
- Major changes needed
- Resource requirements
- Training needs
- Risk factors

### Step 4: Success Metrics
Generate measurable criteria:
- Time savings targets
- Cost reduction goals
- Quality improvements
- Efficiency gains
- ROI calculations

### Step 5: Phase Planning
Structure implementation:
- Immediate improvements
- Short-term changes
- Long-term optimization
- Dependencies
- Rollback plans

## 📏 Instructions

### WHEN analyzing operational content
- Look for pain points and complaints
- Identify repeated problems
- Note time and resource waste
- Find manual processes to automate

### WHEN structuring improvements
- Start with quick wins
- Build toward larger changes
- Consider change management
- Plan for training needs

### WHEN creating metrics
- Use specific numbers
- Focus on time and cost
- Include quality measures
- Make them verifiable

## 📊 Output Format

### Format Type
Complete issue following @templates/business/operations-issue-template.md

### Structure
1. Problem statement
2. Current state analysis
3. Desired state vision
4. Implementation phases
5. Success metrics
6. Risk mitigation

#### Marketing Content
**Indicators**: Campaign briefs, audience research, brand discussions, content calendars, channel performance
**Extract**: Goals, target audience, messaging, channels
**Execute workflow:**

# 🏗️ Make Marketing Issue: Transform Ideas Into Campaign Plans
> 💡 *Convert marketing briefs, ideas, or discussions into actionable campaign issues.*

## 🎯 End Goal
Transform input content into a complete marketing issue that:
- Captures marketing objectives from source
- Defines target audience clearly
- Maps campaign journey and touchpoints
- Identifies required assets and channels
- Follows @templates/business/marketing-issue-template.md structure

## 📋 Request
Transform marketing content into an issue by:
1. Extracting objectives and goals
2. Identifying target audience
3. Mapping campaign flow
4. Defining content needs
5. Creating success metrics
6. Structuring per marketing template

### Deliverables
- Complete marketing issue document
- Audience profile
- Campaign timeline
- Asset requirements
- KPI framework

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Marketing Goals**: What needs to be achieved?
- **Target Audience**: Who are we reaching?
- **Value Proposition**: What's the message?
- **Channels**: Where will we communicate?
- **Budget**: What resources are available?
- **Timeline**: When does this happen?

### Step 2: Audience Mapping
Extract from content:
- Demographics
- Psychographics
- Pain points
- Buying journey stage
- Channel preferences

### Step 3: Campaign Structure
Build from descriptions:
- Awareness tactics
- Consideration content
- Conversion offers
- Retention strategies
- Timeline and phases

### Step 4: Asset Identification
Determine needs:
- Content pieces
- Creative assets
- Landing pages
- Email sequences
- Ad materials

### Step 5: Success Framework
Generate metrics:
- Reach targets
- Engagement rates
- Conversion goals
- ROI expectations
- Attribution model

## 📏 Instructions

### WHEN analyzing marketing content
- Look for business objectives
- Identify audience mentions
- Note competitive references
- Find budget indicators

### WHEN structuring campaigns
- Map to customer journey
- Align channels to audience
- Phase content delivery
- Plan measurement points

### WHEN creating KPIs
- Use industry benchmarks
- Set realistic targets
- Include leading indicators
- Define attribution

## 📊 Output Format

### Format Type
Complete issue following @templates/business/marketing-issue-template.md

### Structure
1. Marketing objectives
2. Audience definition
3. Campaign strategy
4. Channel plan
5. Content calendar
6. Success metrics

#### Sales Content
**Indicators**: Pipeline reports, deal discussions, conversion data, prospect feedback, quota planning
**Extract**: Sales objectives, pipeline stages, enablement needs
**Execute workflow:**

# 🏗️ Make Sales Issue: Transform Data Into Revenue Plans
> 💡 *Convert sales reports, pipeline data, or revenue discussions into actionable sales issues.*

## 🎯 End Goal
Transform input content into a complete sales issue that:
- Captures revenue goals from source
- Maps pipeline improvements needed
- Identifies sales enablement gaps
- Establishes clear targets
- Follows @templates/business/sales-issue-template.md structure

## 📋 Request
Transform sales content into an issue by:
1. Extracting revenue objectives
2. Analyzing pipeline data
3. Identifying conversion blocks
4. Mapping enablement needs
5. Creating success metrics
6. Structuring per sales template

### Deliverables
- Complete sales issue document
- Pipeline analysis
- Sales process map
- Enablement plan
- Revenue targets

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Revenue Goals**: What targets are mentioned?
- **Pipeline Issues**: Where are problems?
- **Conversion Rates**: What percentages appear?
- **Sales Cycle**: How long to close?
- **Competition**: Who are we losing to?
- **Resources**: What's available?

### Step 2: Pipeline Mapping
Extract from content:
- Lead sources
- Qualification criteria
- Stage progression
- Drop-off points
- Average deal size

### Step 3: Process Analysis
Build from descriptions:
- Prospecting methods
- Discovery process
- Proposal approach
- Negotiation tactics
- Close techniques

### Step 4: Enablement Needs
Identify requirements:
- Sales materials
- Training gaps
- Tool needs
- Process improvements
- Competitive intel

### Step 5: Target Setting
Generate metrics:
- Revenue targets
- Pipeline coverage
- Activity metrics
- Conversion goals
- Velocity targets

## 📏 Instructions

### WHEN analyzing sales content
- Look for revenue numbers
- Identify win/loss reasons
- Note competitor mentions
- Find process inefficiencies

### WHEN structuring improvements
- Focus on conversion rates
- Map to sales stages
- Prioritize quick wins
- Plan enablement support

### WHEN creating targets
- Use historical data
- Set stretch goals
- Include activity metrics
- Define leading indicators

## 📊 Output Format

### Format Type
Complete issue following @templates/business/sales-issue-template.md

### Structure
1. Sales objectives
2. Pipeline analysis
3. Process improvements
4. Enablement plan
5. Revenue targets
6. Success metrics

#### Financial Content
**Indicators**: Budget spreadsheets, expense reports, revenue projections, cost analyses, investment proposals
**Extract**: Financial goals, cash flows, optimization opportunities
**Execute workflow:**

# 🏗️ Make Finance Issue: Transform Numbers Into Financial Plans
> 💡 *Convert financial reports, budgets, or cost discussions into actionable finance issues.*

## 🎯 End Goal
Transform input content into a complete finance issue that:
- Captures financial objectives from source
- Maps money flows clearly
- Identifies optimization opportunities
- Establishes financial controls
- Follows @templates/business/finance-issue-template.md structure

## 📋 Request
Transform financial content into an issue by:
1. Extracting financial goals
2. Analyzing cash flows
3. Identifying cost savings
4. Mapping investment needs
5. Creating financial metrics
6. Structuring per finance template

### Deliverables
- Complete finance issue document
- Cash flow analysis
- Budget breakdown
- Cost optimization plan
- Financial metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Financial Goals**: What targets exist?
- **Current Numbers**: What's the baseline?
- **Cash Flow**: How does money move?
- **Cost Structure**: Where does money go?
- **Revenue Sources**: Where does money come from?
- **Constraints**: What limitations exist?

### Step 2: Financial Mapping
Extract from content:
- Revenue streams
- Cost categories
- Working capital needs
- Investment requirements
- Funding sources

### Step 3: Optimization Analysis
Build from descriptions:
- Cost reduction opportunities
- Revenue growth potential
- Efficiency improvements
- Investment priorities
- Risk factors

### Step 4: Control Framework
Identify needs:
- Budget controls
- Approval processes
- Reporting requirements
- Compliance needs
- Audit trails

### Step 5: Metric Development
Generate measures:
- Profitability metrics
- Liquidity ratios
- Efficiency indicators
- Growth metrics
- Risk measures

## 📏 Instructions

### WHEN analyzing financial content
- Look for specific numbers
- Identify trends and patterns
- Note variances from plan
- Find optimization mentions

### WHEN structuring improvements
- Focus on cash impact
- Prioritize by ROI
- Consider timing of changes
- Plan for contingencies

### WHEN creating metrics
- Use standard ratios
- Set realistic targets
- Include early warnings
- Define thresholds

## 📊 Output Format

### Format Type
Complete issue following @templates/business/finance-issue-template.md

### Structure
1. Financial objectives
2. Current position
3. Money flow analysis
4. Optimization plan
5. Investment priorities
6. Success metrics

#### People Content
**Indicators**: Team feedback, hiring requests, skill assessments, training needs, performance reviews
**Extract**: Team needs, capability gaps, development opportunities
**Execute workflow:**

# 🏗️ Make People Issue: Transform Feedback Into Team Plans
> 💡 *Convert HR discussions, team feedback, or organizational needs into actionable people issues.*

## 🎯 End Goal
Transform input content into a complete people issue that:
- Captures team needs from source
- Maps capability gaps clearly
- Identifies development opportunities
- Establishes team success metrics
- Follows @templates/business/people-issue-template.md structure

## 📋 Request
Transform people content into an issue by:
1. Extracting team objectives
2. Analyzing capability gaps
3. Identifying hiring needs
4. Mapping development plans
5. Creating team metrics
6. Structuring per people template

### Deliverables
- Complete people issue document
- Team capability analysis
- Hiring/development plan
- Cultural considerations
- Success metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Team Needs**: What's mentioned about people?
- **Skill Gaps**: What capabilities are missing?
- **Performance Issues**: What problems exist?
- **Growth Needs**: What development is needed?
- **Cultural Factors**: What team dynamics appear?
- **Constraints**: What limitations exist?

### Step 2: Team Mapping
Extract from content:
- Current headcount
- Role distribution
- Skill inventory
- Performance levels
- Team dynamics

### Step 3: Gap Analysis
Build from descriptions:
- Missing roles
- Skill deficiencies
- Capacity constraints
- Leadership gaps
- Cultural issues

### Step 4: Development Planning
Identify needs:
- Training requirements
- Mentorship opportunities
- Career paths
- Performance improvements
- Team building

### Step 5: Success Framework
Generate measures:
- Hiring metrics
- Performance indicators
- Engagement scores
- Retention rates
- Development progress

## 📏 Instructions

### WHEN analyzing people content
- Look for team mentions
- Identify skill references
- Note performance issues
- Find cultural indicators

### WHEN structuring improvements
- Focus on critical gaps
- Balance hiring vs development
- Consider team dynamics
- Plan for succession

### WHEN creating metrics
- Use team KPIs
- Set development goals
- Include engagement measures
- Define retention targets

## 📊 Output Format

### Format Type
Complete issue following @templates/business/people-issue-template.md

### Structure
1. People objectives
2. Team assessment
3. Capability gaps
4. Hiring/development plan
5. Cultural initiatives
6. Success metrics

### Step 2: Domain Determination Strategy

#### Primary Analysis
1. Scan for domain-specific terminology
2. Identify the main problem or goal
3. Look for stakeholder types mentioned
4. Consider the business context

#### Mixed Domain Handling
When content spans multiple domains:
1. Identify the primary domain (main focus)
2. Note secondary domains for cross-references
3. Create primary issue type first
4. Suggest related issues if needed

#### Ambiguous Content
If domain is unclear:
1. Look for action verbs and outcomes
2. Consider who would own this work
3. Default to most logical domain
4. Ask user for clarification if needed

### Step 3: Execute Transformation
Once domain is determined:
1. Apply the specialized make workflow
2. Extract domain-specific elements
3. Map to appropriate template structure
4. Generate complete issue document

## 📊 Extraction Patterns by Domain

### Technical Extraction
- **Look for**: Functions, classes, endpoints, data flows
- **Map to**: Actors, components, interactions
- **Structure as**: Requirements → Actor Flow → Deliverables

### Operational Extraction
- **Look for**: Steps, dependencies, resources, timelines
- **Map to**: Current state, future state, gaps
- **Structure as**: Requirements → Process Flow → Deliverables

### Marketing Extraction
- **Look for**: Audiences, messages, channels, metrics
- **Map to**: Objectives, strategies, tactics
- **Structure as**: Marketing Objectives → Campaign Flow → Deliverables

### Sales Extraction
- **Look for**: Stages, conversions, blockers, tools
- **Map to**: Pipeline, enablement, targets
- **Structure as**: Sales Objectives → Sales Flow → Deliverables

### Financial Extraction
- **Look for**: Numbers, trends, variances, forecasts
- **Map to**: Current position, targets, plans
- **Structure as**: Financial Objectives → Money Flow → Deliverables

### People Extraction
- **Look for**: Roles, skills, gaps, growth
- **Map to**: Current team, needs, development
- **Structure as**: People Objectives → People Flow → Deliverables

## 🎯 Transformation Process

### Content Processing Steps
1. **Parse source material** completely
2. **Identify all relevant elements** for the domain
3. **Organize by template sections** for that type
4. **Fill gaps with reasonable defaults** where needed
5. **Generate structured output** following template

### Quality Checks
- Ensure all mentioned requirements captured
- Verify flows are complete and logical
- Check deliverables are concrete
- Confirm success criteria are measurable
- Validate structure matches template

## 📏 Transformation Rules

### ALWAYS extract
- Explicit requirements and goals
- Implicit needs and assumptions
- Stakeholders and interactions
- Constraints and dependencies
- Success indicators

### NEVER ignore
- Edge cases mentioned
- Risks or concerns raised
- Timeline references
- Budget implications
- Technical constraints

## ✅ Success Criteria
- Correct domain identified from content
- All relevant information extracted
- Appropriate template structure applied
- Gaps filled with sensible defaults
- Complete issue ready for review
