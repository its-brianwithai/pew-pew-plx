---
name: github-issues-analysis
description: "Use this template when conducting comprehensive GitHub issues analysis for sprint planning, technical debt assessment, and priority communication to the team."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [filename]] to reference them. Do not include the file extension or path.
---

# 📊 GitHub Issues Analysis - [YYYYMMDD formatted date]

## 📋 Executive Summary
> 💡 *High-level overview of repository health, critical findings, and immediate action items for the team.*

[Write 2-3 paragraphs summarizing: total issue count, PR status, most critical problems identified, technical debt indicators, and recommended immediate actions. Focus on what leadership needs to know.]

## 📈 Key Metrics

| Metric | Value |
|:-------|:------|
| Open Issues | [Count] |
| Open PRs | [Count with status] |
| Assignment Rate | [Percentage]% |
| Label Coverage | [Percentage]% |
| Bug Rate | [Percentage]% |
| Average Age | [Days] days |
| Stale Issues (>90d) | [Count] |

## 🔍 Categorization Summary

### Type Distribution
- **🐛 Bugs**: [Count] issues ([List issue numbers])
- **✨ Enhancements**: [Count] issues ([List issue numbers])
- **🚀 Features**: [Count] issues ([List issue numbers])
- **🧹 Chores**: [Count] issues ([List issue numbers])
- **❓ Unlabeled**: [Count] issues ([List issue numbers])

### Assignment Status
- **✅ Assigned**: [Count] issues ([Percentage]%)
  - [Username]: [Count] issues ([List issue numbers])
  - [Additional assignees with counts and issue numbers]
- **⚠️ Unassigned**: [Count] issues ([Percentage]%)

### Age Distribution
- **🆕 New** (<7 days): [Count] issues
- **🔄 Active** (7-30 days): [Count] issues
- **⏳ Aging** (30-90 days): [Count] issues
- **💀 Stale** (>90 days): [Count] issues

## 📝 Detailed Issue Analysis

### 🚨 Critical Path Issues
> 💡 *Issues blocking core functionality, security vulnerabilities, or PR dependencies that need immediate attention.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: [Bug/Enhancement/Feature] | **Status**: [Assigned to X/Unassigned] | **Age**: [X days] | **Priority**: [CRITICAL/HIGH/MEDIUM/LOW]
**Analysis**: [Write 3-5 sentences covering: current user/development impact, technical scope and complexity, dependencies or blockers, why this is critical path, estimated effort in hours/days, and immediate next steps required.]

[Repeat for each critical path issue]

### 🎯 Quick Wins
> 💡 *Low-effort, high-impact issues that can be resolved quickly to boost team morale and user satisfaction.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: [Bug/Enhancement/Feature] | **Status**: [Assigned/Unassigned] | **Age**: [X days] | **Effort**: [<2 hours/<4 hours/<1 day]
**Analysis**: [Write 2-3 sentences covering: what makes this a quick win, expected impact, implementation approach, and why it should be prioritized this week.]

[Repeat for each quick win]

### 🐛 Active Bugs
> 💡 *Bugs that impact functionality but aren't blocking critical paths.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: Bug | **Status**: [Assigned/Unassigned] | **Age**: [X days]
**Analysis**: [Write 3-4 sentences covering: bug symptoms and affected features, number of users impacted, root cause if known, workarounds if available, estimated fix effort, and recommended sprint for resolution.]

[Repeat for each active bug]

### ✨ Enhancement Opportunities
> 💡 *Feature improvements and UX enhancements ready for sprint planning.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: Enhancement | **Status**: [Assigned/Unassigned] | **Age**: [X days]
**Analysis**: [Write 2-3 sentences covering: enhancement value proposition, user benefit, implementation complexity, dependencies, and recommended prioritization.]

[Repeat for each enhancement]

### 🚀 Major Features
> 💡 *Large feature initiatives requiring multi-sprint planning.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: Feature | **Status**: [Assigned/Unassigned] | **Age**: [X days] | **Effort**: [X hours/days/weeks]
**Analysis**: [Write 3-5 sentences covering: feature scope and business value, implementation phases if defined, resource requirements, dependencies on other work, and recommended approach for breaking into sprint-sized chunks.]

[Repeat for each major feature]

### ❓ Unlabeled Issues (Need Triage)
> 💡 *Issues requiring categorization and initial assessment.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Status**: [Assigned/Unassigned] | **Age**: [X days]
**Analysis**: [Write 2-3 sentences covering: what the issue appears to be about, why it lacks labels, what information is missing, recommended categorization, and triage actions needed.]

[Repeat for each unlabeled issue]

### 📁 Backlog Items
> 💡 *Lower priority items or those needing refinement before implementation.*

#### [#Issue Number](https://github.com/[org]/[repo]/issues/[number]): [Issue Title]
**Type**: [Type] | **Status**: [Assigned/Unassigned] | **Age**: [X days]
**Analysis**: [Write 2-3 sentences covering: why this is backlog priority, what needs clarification or refinement, conditions that would elevate priority, and recommended timeline for review.]

[Repeat for each backlog item]

## 💭 Technical Debt Assessment

### 📊 Debt Indicators
| Indicator | Current | Impact |
|:----------|:--------|:-------|
| Unassigned Rate | [X]% | [Impact description] |
| Unlabeled Rate | [X]% | [Impact description] |
| Stale Issue Rate | [X]% | [Impact description] |
| Bug Accumulation | [X]% | [Impact description] |
| PR Age | [X days avg] | [Impact description] |

### 🔥 Debt Hotspots
- **[Area/Component]**: [Description of debt concentration and impact]
- **[Area/Component]**: [Description of debt concentration and impact]
[Additional hotspots as identified]

### 📉 Debt Reduction Strategy
1. **Immediate** (This Week):
   - [Specific action with issue numbers]
   - [Additional immediate actions]
2. **Short-term** (Next Sprint):
   - [Specific action with timeline]
   - [Additional short-term actions]
3. **Long-term** (Next Quarter):
   - [Strategic improvement with rationale]
   - [Additional long-term strategies]

## 🎯 Recommendations

### 📅 This Week Priorities ([Date Range])
> 💡 *Immediate actions for current week to maintain velocity and address critical issues.*

1. **[Priority 1]**: [Action description] ([Issue numbers]) - [Assignee recommendation] - [Effort estimate]
2. **[Priority 2]**: [Action description] ([Issue numbers]) - [Assignee recommendation] - [Effort estimate]
3. **[Priority 3]**: [Action description] ([Issue numbers]) - [Assignee recommendation] - [Effort estimate]
[Additional priorities as needed, typically 3-5 items]

### 🏃 Next Sprint Planning ([Date Range])
> 💡 *Recommended sprint backlog based on capacity, dependencies, and business priorities.*

| Priority | Issue | Type | Effort | Assignee | Rationale |
|:---------|:------|:-----|:-------|:---------|:----------|
| P0 | [#XXX](link) - [Title] | [Type] | [Hours/Points] | [Name/TBD] | [Why critical for sprint] |
| P1 | [#XXX](link) - [Title] | [Type] | [Hours/Points] | [Name/TBD] | [Business value] |
| P2 | [#XXX](link) - [Title] | [Type] | [Hours/Points] | [Name/TBD] | [Quick win rationale] |
[Additional sprint items organized by priority]

**Sprint Capacity**: [Available hours/points]
**Sprint Commitment**: [Total hours/points]
**Buffer**: [Percentage or hours]

### 🧹 Process Improvements
> 💡 *Recommended changes to development process to prevent future debt accumulation.*

- **Triage Process**: [Specific improvement recommendation]
- **Assignment Rules**: [Automation or process suggestion]
- **Label Standards**: [Categorization improvement]
- **Review Cadence**: [Meeting or review schedule change]
[Additional process improvements]

## 📊 Progress Tracking

### 🎯 Current Metrics
| Metric | Current |
|:-------|:--------|
| Open Issues | [Count] |
| Assignment Rate | [X]% |
| Label Coverage | [X]% |
| Bug Count | [Count] |
| Avg Resolution Time | [Days] |

### 📈 Trend Analysis
- **Issue Creation Rate**: [X issues/week] - [Trending up/down/stable]
- **Resolution Rate**: [X issues/week] - [Trending up/down/stable]
- **Bug Discovery Rate**: [X bugs/week] - [Trending up/down/stable]
- **PR Merge Rate**: [X PRs/week] - [Trending up/down/stable]

## 🚦 Action Items

### ✅ Immediate Actions (Today)
- [ ] [Specific action with owner]
- [ ] [Specific action with owner]
[Additional immediate actions]

### 📝 Follow-up Required
- [ ] [Item needing follow-up] - Owner: [Name] - Due: [Date]
- [ ] [Item needing follow-up] - Owner: [Name] - Due: [Date]
[Additional follow-up items]

### 🔄 Recurring Tasks
- [ ] Weekly triage session - [Day/Time]
- [ ] Sprint planning review - [Frequency]
- [ ] Debt assessment - [Frequency]
[Additional recurring tasks]

## 📎 Appendix

### 🔗 Related Documents
- [Previous analysis report from @reports/{YYYY}/{MM}/{DD}/]
- [Sprint planning document]
- [Technical debt tracker]
- [Team capacity planning]

### 📊 Raw Data
[Optional section for data tables or additional metrics not included above]

---
*Analysis conducted on [YYYYMMDD] at [HH:MM timezone]*
*Next analysis scheduled: [YYYYMMDD]*
*Report location: @reports/[YYYY]/[MM]/[DD]/github-issues-analysis-report.md*
