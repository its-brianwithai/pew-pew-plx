---
name: create-issue
description: "Universal issue creation prompt that analyzes requirements to determine issue type (tech, operations, marketing, sales, finance, or people) and routes to the appropriate specialized prompt."
---

# 📋 Create Issue: Intelligent Routing for All Issue Types
> 💡 *Analyze the user's request to determine the appropriate issue type and create structured issues through the right specialized workflow.*

## 🎯 Purpose
Transform any user request into a well-structured issue by:
1. **Analyzing the domain** to determine issue type
2. **Routing to the appropriate specialized prompt**
3. **Following domain-specific refinement workflows**
4. **Creating actionable, structured deliverables**

## 🔄 Issue Type Determination

### Step 1: Analyze Request Domain
Examine the user's request for keywords and context to determine which type of issue to create:

#### Tech Issues
**Indicators**: Code, features, bugs, API, database, UI/UX, performance, security, architecture, implementation
**Execute workflow:**

![[create-tech-issue]]

#### Operations Issues  
**Indicators**: Process, workflow, efficiency, procedures, quality, automation, systems, bottlenecks
**Execute workflow:**

![[create-operations-issue]]

#### Marketing Issues
**Indicators**: Campaign, brand, audience, content, channels, messaging, positioning, awareness
**Execute workflow:**

![[create-marketing-issue]]

#### Sales Issues
**Indicators**: Pipeline, leads, conversions, revenue, deals, prospects, quotas, enablement
**Execute workflow:**

![[create-sales-issue]]

#### Finance Issues
**Indicators**: Budget, costs, cash flow, expenses, revenue, profitability, forecasting, investment
**Execute workflow:**

![[create-finance-issue]]

#### People Issues
**Indicators**: Hiring, team, skills, training, culture, performance, onboarding, retention
**Execute workflow:**

![[create-people-issue]]

### Step 2: Confirm Issue Type
If the domain is unclear:
1. Look for secondary indicators in the request
2. Consider the business context and goals
3. Ask the user to clarify if truly ambiguous
4. Default to the most likely type based on context

### Step 3: Execute Specialized Workflow
Once the issue type is determined:
1. Follow the complete workflow from the specialized prompt
2. Use the domain-specific questions for that issue type
3. Apply the appropriate template structure
4. Save to the correct directory path

## 📏 Decision Rules

### WHEN request mentions technical implementation
- Keywords: develop, code, fix, integrate, deploy
- **Route to**: @prompts/create-tech-issue.md

### WHEN request mentions business processes
- Keywords: improve, optimize, streamline, standardize
- **Route to**: @prompts/create-operations-issue.md

### WHEN request mentions customer engagement
- Keywords: promote, advertise, communicate, brand
- **Route to**: @prompts/create-marketing-issue.md

### WHEN request mentions revenue generation
- Keywords: sell, close, convert, prospect
- **Route to**: @prompts/create-sales-issue.md

### WHEN request mentions financial management
- Keywords: budget, spend, save, invest
- **Route to**: @prompts/create-finance-issue.md

### WHEN request mentions team management
- Keywords: hire, train, develop, retain
- **Route to**: @prompts/create-people-issue.md

## 🎯 Workflow Execution

### After Routing Decision
1. **Announce the issue type**: "Creating a [type] issue for your request..."
2. **Execute the specialized prompt**: Follow the complete workflow
3. **Apply domain expertise**: Use the specific questions and structure
4. **Maintain consistency**: Follow the exact template for that type

### File Locations
Files are saved following @instructions/conventions/mvpm-issue-conventions.md
- Location determined by project structure (MVMs and MVSs)
- Format: `{CONCEPT}-{number}-{description}-issue.md`
- Same format for ALL issue types (tech, operations, marketing, sales, finance, people)
- Files organized within milestone and step hierarchy as defined by project

## ✅ Success Criteria
- Correct issue type identified from request
- Appropriate specialized workflow executed
- Domain-specific questions asked
- Correct template structure applied
- File saved to appropriate location
