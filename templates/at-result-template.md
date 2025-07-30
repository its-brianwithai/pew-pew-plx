---
name: at-result-template
description: Use this when documenting the results of AI-executed acceptance tests for Flutter applications. This template captures test execution outcomes, diagnostics, learnings, and actionable next steps.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🧪 AI Acceptance Test Execution Report: [Feature Name]

> 💡 *Comprehensive results from automated acceptance test execution, including outcomes, diagnostics, and actionable insights for continuous improvement.*

[Brief summary of what was tested and the overall outcome]

## 📊 Execution Summary

> 💡 *High-level overview of test execution with key metrics and confidence scores.*

- **Test Plan**: [[test-plan-filename]]
- **Feature Version**: [version number]
- **Execution Date**: [YYYY-MM-DD HH:MM]
- **Total Duration**: [duration]
- **Environment**: Flutter [version] / iOS Simulator [version]
- **DTD URI**: [URI used for connection]

### Overall Results
| Metric | Count | Percentage | Confidence |
|--------|-------|------------|------------|
| ✅ Passed | [number] | [%] | [High/Medium/Low] |
| ❌ Failed | [number] | [%] | - |
| ⏭️ Skipped | [number] | [%] | - |
| 🔄 Flaky | [number] | [%] | [Based on retry success] |

## 🔍 Scenario Results

> 💡 *Detailed breakdown of each test scenario execution with timings and outcomes.*

<example>
### ✅ Scenario 1: Successful Login
- **Duration**: 45s (15s faster than baseline)
- **Steps Executed**: 12/12
- **Optimizations Applied**: 
  - Used 800ms delay after keyboard (from learning log)
  - Applied fuzzy matching for button text
- **Confidence**: High (100% success over 3 runs)

### ❌ Scenario 2: Network Error Handling
- **Duration**: 2m 22s
- **Steps Executed**: 8/10
- **Failed At**: Step 2.3 - Toast notification verification
- **Failure Type**: Element Not Found
- **Pattern Match**: Known issue - toast timing (see diagnostics)
- **Recovery Attempts**: 3 (all failed)
- **Confidence**: Low (failed consistently)
</example>

[Continue for all scenarios...]

## 🐛 Failure Analysis

> 💡 *Deep dive into failures with pattern recognition and root cause analysis.*

### Failure Patterns Detected
| Pattern | Occurrences | Likely Cause | Suggested Fix |
|---------|-------------|--------------|---------------|
| [Pattern name] | [count] | [root cause] | [remediation] |

### Detailed Diagnostics
[For each failure, provide:]
- **Scenario**: [Name]
- **Step**: [Step number and description]
- **Expected**: [What should have happened]
- **Actual**: [What actually happened]
- **Evidence**:
  - Screenshot: `test_results/[timestamp]_[scenario]_failure.png`
  - Widget Tree: `test_results/[timestamp]_[scenario]_widgets.json`
  - Runtime Errors: [Any captured errors]
  - UI State: [Relevant UI elements present/missing]

## 📈 Performance Metrics

> 💡 *Test execution performance compared to baselines and historical data.*

### Timing Analysis
| Scenario | Current | Baseline | Difference | Trend |
|----------|---------|----------|------------|-------|
| [Name] | [time] | [time] | [+/- %] | [↑↓→] |

### Resource Usage
- **Peak Memory**: [MB]
- **CPU Usage**: [Average %]
- **Network Calls**: [Count and total duration]

## 🧠 Learnings & Optimizations

> 💡 *New insights discovered during this test execution that can improve future runs.*

### New Patterns Discovered
[List any new failure patterns or successful strategies discovered]

### Timing Optimizations
[Document any timing adjustments that improved reliability]

### Element Selection Insights
[Note any element selection strategies that worked well]

### Generated Learning Log
- **Location**: `logs/acceptance-tests/[YYYYMMDD]-[feature-name].md`
- **Key Insights**: [Summarize main learnings]

## 🔧 Recommendations

> 💡 *Actionable recommendations for developers and future test improvements.*

### For Development Team
1. [Specific code or UI changes needed]
2. [Performance optimizations suggested]
3. [Accessibility improvements required]

### For Test Improvement
1. [Test plan adjustments needed]
2. [New scenarios to add]
3. [Timing or strategy changes]

## 📋 Next Steps

> 💡 *Clear action items with ownership and priority.*

- [ ] **High Priority**: [Action item] - [Owner]
- [ ] **Medium Priority**: [Action item] - [Owner]
- [ ] **Low Priority**: [Action item] - [Owner]

## 🔗 Related Resources

> 💡 *Links to all relevant files and documentation.*

- **Test Plan**: [[original-test-plan]]
- **Learning Log**: `logs/acceptance-tests/[YYYYMMDD]-[feature-name].md`
- **Test Artifacts**: `test_results/[execution-timestamp]/`
- **Referenced Learnings**: [List any historical learning logs used]
- **Video Recording**: [If available]

## 📐 Applied Learnings From History

> 💡 *Historical insights that were applied during this execution.*

[List which past learnings were used and their effectiveness]
<example>
- From `20241225-login-feature.md`: 800ms keyboard delay - ✅ Effective
- From `20241220-navigation.md`: Fuzzy button matching - ✅ Effective
</example>