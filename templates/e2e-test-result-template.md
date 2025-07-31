---
name: e2e-test-result-template
description: Use this when documenting the results of AI-executed e2e tests for Flutter applications. This template captures test execution outcomes, diagnostics, learnings, and actionable next steps for both frontend and backend.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🧪 AI E2E Test Execution Report: [Feature Name]

> 💡 *Comprehensive results from automated e2e test execution, including outcomes, diagnostics, and actionable insights for continuous improvement of both app and backend.*

[Brief summary of what was tested and the overall outcome]

## 📊 Execution Summary

> 💡 *High-level overview of test execution with key metrics and confidence scores.*

- **Test Plan**: [[e2e-test-plan-filename]]
- **Feature Version**: [version number]
- **Execution Date**: [YYYY-MM-DD HH:MM]
- **Total Duration**: [duration]
- **Environment**: Flutter [version] / iOS Simulator [version] / Supabase [version]
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
### ✅ Scenario 1: Successful User Registration
- **Duration**: 55s
- **Steps Executed**: 14/14
- **Optimizations Applied**:
  - Used 800ms delay after keyboard (from learning log)
  - Applied retry with backoff for backend user validation query
- **Confidence**: High (100% success over 3 runs)

### ❌ Scenario 2: Invalid Data Submission
- **Duration**: 1m 10s
- **Steps Executed**: 9/11
- **Failed At**: Step 3.2 - Backend validation
- **Failure Type**: Unexpected Record Found
- **Pattern Match**: Backend validation logic created a record despite UI error.
- **Recovery Attempts**: 1 (failed)
- **Confidence**: Low (failed consistently)
</example>

[Continue for all scenarios...]

## 🐛 Failure Analysis

> 💡 *Deep dive into failures with pattern recognition and root cause analysis.*

### Failure Patterns Detected
| Pattern | Occurrences | Likely Cause | Suggested Fix |
|---------|-------------|--------------|---------------|
| Backend data inconsistency | [count] | Race condition or transaction error | Wrap backend operations in a transaction |

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
  - Backend State: `test_results/[timestamp]_[scenario]_backend.json`

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
- **Database Queries**: [Count and average latency]

## 🧠 Learnings & Optimizations

> 💡 *New insights discovered during this test execution that can improve future runs.*

### New Patterns Discovered
[List any new failure patterns or successful strategies discovered, including backend-related ones]

### Backend Validation Strategies
[Document any query optimizations or validation approaches that improved reliability]

### Generated Learning Log
- **Location**: `logs/e2e-tests/[YYYYMMDD]-[feature-name].md`
- **Key Insights**: [Summarize main learnings]

## 🔧 Recommendations

> 💡 *Actionable recommendations for developers and future test improvements.*

### For Development Team
1. **Backend**: [Specific API or database logic changes needed]
2. **Frontend**: [Specific code or UI changes needed]
3. **Performance**: [Performance optimizations suggested for app or backend]

### For Test Improvement
1. [Test plan adjustments needed]
2. [New scenarios to add, covering more backend states]
3. [Timing or strategy changes for backend validation]

## 📋 Next Steps

> 💡 *Clear action items with ownership and priority.*

- [ ] **High Priority**: [Action item] - [[team-backend]]
- [ ] **Medium Priority**: [Action item] - [[team-mobile]]
- [ ] **Low Priority**: [Action item] - [Owner]

## 🔗 Related Resources

> 💡 *Links to all relevant files and documentation.*

- **Test Plan**: [[original-e2e-test-plan]]
- **Learning Log**: `logs/e2e-tests/[YYYYMMDD]-[feature-name].md`
- **Test Artifacts**: `test_results/[execution-timestamp]/`
- **Referenced Learnings**: [List any historical learning logs used]

## 📐 Applied Learnings From History

> 💡 *Historical insights that were applied during this execution.*

[List which past learnings were used and their effectiveness]
<example>
- From `20241225-login-feature.md`: 800ms keyboard delay - ✅ Effective
- From `20241220-data-sync.md`: Retry on backend query - ✅ Effective, reduced flakiness by 80%
</example>