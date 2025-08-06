---
name: feedback-report-template
description: Use this template when creating comprehensive feedback triage reports after processing user feedback from Slack channels
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---

# 📊 Feedback Report - [Date]

> 💡 *Comprehensive summary of user feedback processing, classification decisions, and actions taken to improve the product based on user insights.*

[Brief overview of the feedback triage session including total items processed and overall findings]

## 📈 Summary
> 💡 *High-level metrics and key insights from this feedback processing session.*

Analyzed `[number]` feedback items from Slack #feedback channel. Processed `[number]` bugs and `[number]` improvements.

[Additional summary context about patterns, themes, or notable findings]

## 🐛 Bugs
> 💡 *Issues that represent unexpected behavior, errors, or malfunctions in the current system.*

### [Bug Number]. [Status Emoji] [Bug Title]
**Status:** [Intended Behavior / Confirmed Bug - Priority Level / In Progress (PR #X)]  
**Analysis:** [Brief technical analysis of the issue and its root cause]  
**Action:** 
- [Action taken: GitHub issue created, PR updated, backlog item created, etc.]
- [Additional actions if any]
- [Slack communication status]

[Repeat for each bug found]

## ✨ Improvements
> 💡 *Enhancement suggestions that would add new functionality or improve existing features.*

### [Improvement Number]. [Category Emoji] [Improvement Title]
**Status:** [Enhancement Created / Backlog / Already Planned / External Issue]  
**Analysis:** [Brief analysis of the enhancement value and implementation considerations]  
**Action:** 
- [Action taken: GitHub issue created, backlog item created, etc.]
- [Additional actions if any]
- [Slack communication status]

[Repeat for each improvement identified]

## 📊 Metrics
> 💡 *Quantitative summary of the feedback processing session and actions taken.*

- **Total Feedback:** `[number]` items
- **Bugs:** `[number]` ([breakdown by action taken])
- **Improvements:** `[number]` ([breakdown by action taken])
- **Actions Taken:** 
  - `[number]` GitHub issues created ([issue numbers])
  - `[number]` PRs updated ([PR numbers])
  - `[number]` Slack replies sent
  - `[number]` local issue documents created
  - `[number]` standup discussion points added

## 📁 Files Created
> 💡 *Complete list of all documents and issues generated during this triage session.*

[List each file created with full path for audit trail and future reference]
- `[path/to/file.md]`
- `[path/to/another-file.md]`

[Continue listing all created files]

## 🎯 Next Steps
> 💡 *Action items and follow-up work required based on the feedback processed.*

[List prioritized action items for team follow-up]

1. [High priority action item]
2. [Medium priority action item]  
3. [Lower priority or longer-term action]
4. [Additional next steps as needed]

[Continue with remaining action items]