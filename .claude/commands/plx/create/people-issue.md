---
name: create-people-issue
description: "Use this prompt to create well-structured people issues for hiring, team development, and organizational improvements."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


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
Following @instructions/conventions/most-valuable-project-management-conventions.md
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
