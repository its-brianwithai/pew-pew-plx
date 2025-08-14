---
name: update-issue
description: "Universal issue update prompt that identifies the issue type from existing documentation and routes to the appropriate specialized update prompt."
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

![[update-tech-issue]]

#### Operations Issue Indicators
- **Structure**: Requirements → Process Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Process improvements, workflows, efficiency metrics
- **Execute workflow:**

![[update-operations-issue]]

#### Marketing Issue Indicators
- **Structure**: Marketing Objectives → Campaign Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Campaigns, audience targeting, brand messaging
- **Execute workflow:**

![[update-marketing-issue]]

#### Sales Issue Indicators
- **Structure**: Sales Objectives → Sales Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Pipeline stages, conversion strategies, revenue targets
- **Execute workflow:**

![[update-sales-issue]]

#### Finance Issue Indicators
- **Structure**: Financial Objectives → Money Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Budgets, cash flow, cost optimization
- **Execute workflow:**

![[update-finance-issue]]

#### People Issue Indicators
- **Structure**: People Objectives → People Flow → Deliverables → Success Criteria → Implementation Checkpoints
- **Content**: Hiring plans, team development, skills assessment
- **Execute workflow:**

![[update-people-issue]]

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