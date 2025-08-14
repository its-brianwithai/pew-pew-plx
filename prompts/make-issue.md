---
name: make-issue
description: "Universal content transformation prompt that analyzes source material to determine appropriate issue type and converts it into a structured issue using the right specialized template."
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

![[make-operations-issue]]

#### Marketing Content
**Indicators**: Campaign briefs, audience research, brand discussions, content calendars, channel performance
**Extract**: Goals, target audience, messaging, channels
**Execute workflow:**

![[make-marketing-issue]]

#### Sales Content
**Indicators**: Pipeline reports, deal discussions, conversion data, prospect feedback, quota planning
**Extract**: Sales objectives, pipeline stages, enablement needs
**Execute workflow:**

![[make-sales-issue]]

#### Financial Content
**Indicators**: Budget spreadsheets, expense reports, revenue projections, cost analyses, investment proposals
**Extract**: Financial goals, cash flows, optimization opportunities
**Execute workflow:**

![[make-finance-issue]]

#### People Content
**Indicators**: Team feedback, hiring requests, skill assessments, training needs, performance reviews
**Extract**: Team needs, capability gaps, development opportunities
**Execute workflow:**

![[make-people-issue]]

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