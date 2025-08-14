---
name: create-operations-issue
description: "Use this prompt to create well-structured operations issues through iterative refinement, focusing on processes, workflows, and efficiency improvements."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


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
Following @instructions/conventions/most-valuable-project-management-conventions.md
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
