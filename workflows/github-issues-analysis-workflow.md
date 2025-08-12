# 🌊 GitHub Issues Analysis Workflow: Systematic Issue Management & Prioritization
> 💡 *A comprehensive orchestration for analyzing, categorizing, and prioritizing GitHub issues to maintain development velocity and reduce technical debt*

This workflow establishes a systematic approach to analyzing GitHub issues, identifying patterns, recommending actions, and communicating priorities to the team. It transforms raw issue data into actionable insights for sprint planning and technical debt management.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
This workflow exists to prevent issue backlog from becoming unmanageable, ensure critical bugs are addressed promptly, and maintain clear development priorities. It transforms chaotic issue lists into structured action plans while identifying and addressing technical debt patterns.

### Guiding Principles
1. **Visibility**: Every issue should be categorized and assigned ownership
2. **Prioritization**: Critical bugs before enhancements, quick wins for momentum
3. **Debt Management**: Old issues either get actioned or archived
4. **Data-Driven**: Metrics guide decisions about resource allocation
5. **Communication**: Team awareness of priorities and technical debt

### Success Criteria
- 100% of issues labeled within 48 hours
- >50% of issues assigned to owners
- Critical bugs addressed within sprint
- Technical debt metrics improving month-over-month
- Clear sprint priorities communicated to team

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Issue Categories**: Bug, Enhancement, Feature, Chore, Task
- **Priority Levels**: Critical, High, Medium, Low
- **Assignment Status**: Assigned, Unassigned, Stale
- **Age Buckets**: New (<7d), Active (7-30d), Aging (30-90d), Stale (>90d)

### Analysis Patterns
- **Categorization Matrix**: Type × Priority × Assignment
- **Quick Win Identification**: Low effort + High value items
- **Debt Quantification**: Unassigned % + Unlabeled % + Age distribution
- **Sprint Capacity**: Available hours vs estimated effort

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow systematically extracts issue data, analyzes patterns, identifies actions, and communicates priorities through data extraction, categorization, analysis, recommendation, and documentation phases. The analysis document is built progressively throughout the workflow rather than created at the end, providing continuous visibility into progress and allowing for iterative refinement.

### Phase Architecture
```
Phase 1: Data Extraction
├── Step 1.1: Query Open Issues
├── Step 1.2: Query Open PRs
├── Step 1.3: Initialize Analysis Document
└── Quality Gate: Data Completeness

Phase 2: Categorization
├── Parallel Block:
│   ├── Step 2.1: Group by Type
│   ├── Step 2.2: Group by Assignment
│   └── Step 2.3: Calculate Age Distribution
├── Step 2.4: Update Document with Metrics
└── Quality Gate: Coverage Metrics

Phase 3: Analysis
├── Step 3.1: Identify Critical Path
├── Step 3.2: Find Quick Wins
├── Step 3.3: Assess Technical Debt
├── Step 3.4: Update Document with Individual Analysis
└── Decision Point: Action Classification

Phase 4: Recommendations
├── Step 4.1: This Week Priorities
├── Step 4.2: Next Sprint Planning
├── Step 4.3: Debt Reduction Actions
├── Step 4.4: Update Document with Recommendations
└── Synchronization: Compile Actions

Phase 5: Communication
├── Step 5.1: Finalize Analysis Document
├── Step 5.2: Confirm Standup Channel Posting
├── Step 5.3: Post to Standup Channel
└── Quality Gate: Team Acknowledgment
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 1: Data Extraction
> *Gathering comprehensive issue and PR data from GitHub*

#### Prerequisites
- GitHub CLI authenticated
- Repository access permissions
- No ongoing issue migrations

#### Step 1.1: Query Open Issues
- **Purpose**: Extract all open issues with metadata including body for context
- **Instructions**: Use gh CLI to query issues with full details for analysis
- **Command**: `gh issue list --state open --limit 100 --json number,title,state,labels,assignees,createdAt,updatedAt,body,comments`
- **Outputs**: JSON data of all open issues with descriptions
- **Success Criteria**: All open issues retrieved with body content
- **Error Handling**:
    - **Auth Failed**: Re-authenticate gh CLI
    - **Rate Limited**: Wait and retry
    - **Large Response**: Paginate if needed
- **Timing**: < 30 seconds

#### Step 1.2: Query Open PRs
- **Purpose**: Identify in-progress work
- **Instructions**: Query open PRs to understand active development
- **Command**: `gh pr list --state open --json number,title,author,isDraft`
- **Outputs**: List of open PRs with status
- **Success Criteria**: All open PRs retrieved
- **Timing**: < 15 seconds

#### Step 1.3: Initialize Analysis Document
- **Purpose**: Create document skeleton for progressive updates
- **Instructions**: Create analysis document using [[github-issues-analysis-template]] with placeholder content
- **Template Setup**:
    - Create directory structure: `@reports/{YYYY}/{MM}/{DD}/`
    - Initialize document with current date and basic structure
    - Fill executive summary placeholder with "Analysis in progress..."
    - Set up all section headers and tables with placeholder values
    - Add timestamp for analysis start
- **Outputs**: Empty structured document ready for progressive updates
- **Success Criteria**: Document created with proper template structure
- **Error Handling**:
    - **Directory Creation Failed**: Retry with different permissions
    - **Template Missing**: Use fallback structure
- **Timing**: < 1 minute

#### Quality Gate: Data Completeness
- **Validation Criteria**:
    - [ ] All open issues retrieved
    - [ ] PR data includes draft status
    - [ ] Metadata includes labels and assignees
- **Pass Actions**: Proceed to categorization
- **Fail Actions**: Retry with adjusted query

### Phase 2: Categorization
> *Organizing issues into meaningful groups for analysis*

#### Step 2.1: Group by Type
- **Purpose**: Categorize issues by their type labels
- **Instructions**: Parse labels to identify bugs, enhancements, features
- **Categories**:
    - Bugs: `type:bug`
    - Enhancements: `type:enhancement`
    - Features: `type:feature`
    - Chores: `type:chore`
    - Unlabeled: No type label
- **Outputs**: Issue counts by category
- **Timing**: < 1 minute

#### Step 2.2: Group by Assignment
- **Purpose**: Identify ownership gaps
- **Instructions**: Count assigned vs unassigned issues
- **Metrics**:
    - Total assigned
    - Total unassigned
    - Assignment rate percentage
- **Outputs**: Assignment statistics
- **Timing**: < 30 seconds

#### Step 2.3: Calculate Age Distribution
- **Purpose**: Identify stale issues
- **Instructions**: Calculate days since creation for each issue
- **Age Buckets**:
    - New: < 7 days
    - Active: 7-30 days
    - Aging: 30-90 days
    - Stale: > 90 days
- **Outputs**: Issue age distribution
- **Timing**: < 1 minute

#### Step 2.4: Update Document with Metrics
- **Purpose**: Populate document with categorization metrics and summary data
- **Instructions**: Update analysis document with calculated statistics
- **Document Updates**:
    - Fill Key Metrics table with actual values (open issues, assignment rate, label coverage, etc.)
    - Update Type Distribution section with issue counts and numbers
    - Populate Assignment Status with assignee breakdown
    - Complete Age Distribution with calculated buckets
    - Update executive summary with high-level findings
- **Outputs**: Document with completed metrics and categorization sections
- **Success Criteria**: All placeholder values replaced with actual data
- **Error Handling**:
    - **File Write Failed**: Retry with backup location
    - **Template Corruption**: Restore from backup
- **Timing**: 2-3 minutes

### Phase 3: Analysis
> *Identifying patterns and extracting insights from categorized data*

#### Step 3.1: Analyze Each Issue Individually
- **Purpose**: Provide detailed analysis for EVERY open issue
- **Instructions**: Analyze each issue comprehensively for relevance and priority
- **Analysis Framework**: For each issue, assess:
    - **User Impact**: How many users affected? Core functionality blocked?
    - **Technical Scope**: Simple fix or architectural change?
    - **Dependencies**: Blocked by other work? Blocking other issues?
    - **Effort Estimate**: Hours/days required based on scope
    - **Business Value**: Revenue impact, user retention, growth enabler?
    - **Risk Assessment**: What happens if not fixed? Security implications?
- **Categorization**:
    - **Critical Path**: Bugs blocking core features, security issues, PR dependencies
    - **Quick Wins**: <2 hour fixes with high visibility
    - **Sprint Candidates**: Well-defined, assigned, ready to work
    - **Backlog**: Nice-to-have, low priority, needs refinement
    - **Archive Candidates**: Stale >90 days, no longer relevant
- **Output Format**: Structured analysis paragraph per issue
- **Outputs**: Complete issue-by-issue analysis document
- **Timing**: 30-45 seconds per issue (15-20 minutes for 27 issues)

#### Step 3.2: Find Quick Wins
- **Purpose**: Identify low-effort, high-value items
- **Instructions**: Find issues that can be resolved quickly
- **Quick Win Matrix**:
  ```
  | Type        | Effort | Examples              | Priority |
  |:----------- |:------ |:--------------------- |:-------- |
  | Bug Fix     | <2h    | UI fixes, typos       | High     |
  | Enhancement | <4h    | Small improvements    | Medium   |
  | Chore       | <1h    | Config updates        | Low      |
  ```
- **Outputs**: Quick win list with effort estimates
- **Timing**: 2-3 minutes

#### Step 3.3: Assess Technical Debt
- **Purpose**: Quantify and categorize technical debt
- **Instructions**: Calculate debt metrics
- **Debt Indicators**:
    - Unassigned rate > 50%
    - Unlabeled rate > 20%
    - Stale issues > 25%
    - Bug rate > 40%
- **Outputs**: Technical debt assessment
- **Timing**: 1-2 minutes

#### Step 3.4: Update Document with Individual Analysis
- **Purpose**: Populate document with detailed per-issue analysis organized by priority categories
- **Instructions**: Update analysis document with comprehensive issue breakdowns
- **Document Updates**:
    - Complete Critical Path Issues section with detailed analysis for each issue
    - Populate Quick Wins section with effort estimates and rationales
    - Fill Active Bugs section with impact assessments
    - Update Enhancement Opportunities with value propositions
    - Complete Major Features section with implementation scope
    - Populate Unlabeled Issues section with triage recommendations
    - Fill Backlog Items section with prioritization reasoning
    - Update Technical Debt Assessment with debt indicators and hotspots
- **Analysis Requirements**: Each issue entry must include:
    - 3-5 sentence comprehensive analysis
    - Direct GitHub URL in markdown format
    - Impact, scope, dependencies, and timing
    - Clear categorization rationale
- **Outputs**: Document with complete detailed issue analysis sections
- **Success Criteria**: Every open issue analyzed and documented in appropriate category
- **Error Handling**:
    - **Analysis Incomplete**: Flag missing issues for follow-up
    - **Category Overlap**: Prioritize most critical classification
- **Timing**: 15-20 minutes

#### Decision Point: Action Classification
- **Decision Matrix**:
  ```
  | Issue Type | Age    | Assignment | Action           |
  |:---------- |:------ |:---------- |:---------------- |
  | Bug        | New    | No         | Assign This Week |
  | Bug        | Stale  | No         | Triage or Close  |
  | Feature    | Any    | Yes        | Sprint Planning  |
  | Any        | >90d   | No         | Archive Review   |
  ```

### Phase 4: Recommendations
> *Creating actionable recommendations based on analysis*

#### Step 4.1: This Week Priorities
- **Purpose**: Define immediate actions
- **Instructions**: List top 3-5 priorities for current week
- **Priority Criteria**:
    1. Critical bugs
    2. Quick wins
    3. PR blockers
    4. Triage unlabeled
- **Outputs**: This week action list
- **Timing**: 2 minutes

#### Step 4.2: Next Sprint Planning
- **Purpose**: Prepare sprint backlog
- **Instructions**: Identify work for next sprint
- **Sprint Candidates**:
    - Assigned features
    - High-priority enhancements
    - Debt reduction items
- **Outputs**: Sprint candidate list with effort
- **Timing**: 3 minutes

#### Step 4.3: Debt Reduction Actions
- **Purpose**: Define technical debt actions
- **Instructions**: Create debt reduction plan
- **Actions**:
    - Archive stale issues
    - Triage unlabeled items
    - Assign ownership
    - Close duplicates
- **Outputs**: Debt action items
- **Timing**: 2 minutes

#### Step 4.4: Update Document with Recommendations
- **Purpose**: Complete document with actionable recommendations and planning tables
- **Instructions**: Finalize recommendations sections in analysis document
- **Document Updates**:
    - Complete This Week Priorities with specific actions and assignee recommendations
    - Populate Next Sprint Planning table with prioritized issues and effort estimates
    - Fill Process Improvements section with systematic enhancements
    - Update Progress Tracking with current metrics and trend analysis
    - Complete Action Items with ownership and due dates
    - Finalize executive summary with key decisions and next steps
- **Recommendation Quality**:
    - All priorities must have clear ownership recommendations
    - Sprint planning must include rationale for each item
    - Action items must be specific and time-bound
    - Process improvements must be implementable
- **Outputs**: Document with complete recommendations and action planning
- **Success Criteria**: All recommendation sections populated with actionable items
- **Error Handling**:
    - **Priority Conflicts**: Use decision matrix to resolve
    - **Resource Constraints**: Flag capacity issues
- **Timing**: 5-7 minutes

### Phase 5: Communication
> *Sharing analysis and priorities with the team*

#### Step 5.1: Finalize Analysis Document
- **Purpose**: Complete final review and polish of progressively-built analysis document
- **Instructions**: Perform final review and cleanup of analysis document built throughout workflow
- **Final Review Tasks**:
    - Verify all sections are complete with no placeholder content remaining
    - Ensure consistent formatting and emoji usage throughout
    - Validate that all GitHub URLs are properly formatted as markdown links
    - Cross-check that every open issue is documented in appropriate category
    - Confirm executive summary accurately reflects key findings
    - Add final timestamp and completion status
    - Perform spell-check and formatting consistency review
- **Quality Assurance**:
    - Executive summary coherent and actionable
    - All metrics tables populated with current values
    - Every issue analysis includes required elements (impact, scope, timing)
    - Recommendations are specific and assignable
    - Action items have clear ownership and deadlines
- **Outputs**: Polished, complete analysis document ready for team consumption
- **Success Criteria**: Document passes quality review with no missing sections
- **Error Handling**:
    - **Missing Analysis**: Flag incomplete sections for emergency completion
    - **Formatting Issues**: Apply standard template formatting
    - **Link Validation**: Verify all GitHub URLs are accessible
- **Timing**: 3-5 minutes (review and polish only)

#### Step 5.2: Confirm Standup Channel Posting
- **Purpose**: Get user confirmation before posting to team
- **Instructions**: Ask user for confirmation to post to standup channel
- **Prompt**: "Ready to post the GitHub issues analysis to #standup channel (C0996GRS1AN)? [Y/N]"
- **Options**:
    - **Yes**: Proceed to post
    - **No**: Save locally only
    - **Edit**: Allow modifications before posting
- **Success Criteria**: User consent obtained
- **Timing**: < 30 seconds

#### Step 5.3: Post to Standup Channel
- **Purpose**: Communicate priorities to team
- **Instructions**: Post summary to Slack standup channel after confirmation
- **Channel**: `C0996GRS1AN` (#standup)
- **Message Contents**:
    - Key metrics
    - Critical issues with GitHub URLs
    - This week priorities with issue numbers
    - Sprint candidates with effort estimates
    - Debt indicators
    - Link to full analysis document
- **URL Format**: Include issue links where space permits
- **Success Criteria**: Message posted and acknowledged
- **Timing**: 1 minute

#### Quality Gate: Team Acknowledgment
- **Validation Criteria**:
    - [ ] Analysis document created with direct URLs
    - [ ] User confirmation received
    - [ ] Standup message posted (if confirmed)
    - [ ] Key stakeholders notified
    - [ ] Actions assigned if needed
- **Pass Actions**: Workflow complete
- **Fail Actions**: Follow up with team

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection | Recovery |
|:---------- |:-------- |:--------- |:-------- |
| GitHub API Failure | High | API error | Retry with backoff |
| Auth Expired | High | 401 error | Re-authenticate |
| Rate Limited | Medium | 403 error | Wait for reset |
| Incomplete Data | Low | Missing fields | Use defaults |

### Recovery Procedures
1. **API Failures**: Cache previous analysis, retry
2. **Data Issues**: Flag incomplete data in report
3. **Communication Failures**: Save locally, retry posting

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Issue Resolution Rate**: Closed/Created ratio (target: >1.0)
- **Assignment Rate**: Assigned/Total (target: >50%)
- **Label Coverage**: Labeled/Total (target: >90%)
- **Age Distribution**: Stale percentage (target: <25%)
- **Bug Rate**: Bugs/Total (target: <30%)

### Optimization Opportunities
- Automate label assignment with AI
- Create issue templates for consistency
- Implement auto-assignment rules
- Schedule regular triage sessions

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] GitHub CLI installed and authenticated
- [ ] Slack access for posting
- [ ] 30-60 minutes available
- [ ] Previous analysis for comparison (optional)

### Resource Requirements
- **Tools**: GitHub CLI, Text editor, Slack
- **Access**: Repository, Standup channel
- **Time**: 30-45 minutes
- **Frequency**: Weekly (Monday mornings)

### Execution Checklist
1. [ ] Extract issue data with gh CLI (include body field for context)
2. [ ] Extract PR data  
3. [ ] **Initialize analysis document** using [[github-issues-analysis-template]]
   - [ ] Create @reports/{YYYY}/{MM}/{DD}/github-issues-analysis-report.md
   - [ ] Set up template structure with placeholders
   - [ ] Add analysis start timestamp
4. [ ] Categorize by type and assignment
5. [ ] Calculate age distribution
6. [ ] **Update document with metrics and categorization data**
   - [ ] Fill key metrics table with actual values
   - [ ] Update type distribution with issue counts
   - [ ] Complete assignment status and age distribution
7. [ ] **Analyze EACH issue individually** (15-20 minutes)
   - [ ] Write 3-5 sentence analysis per issue
   - [ ] Cover impact, scope, blockers, priority
   - [ ] Include direct GitHub URL for each
8. [ ] **Update document with detailed issue analysis**
   - [ ] Populate all priority category sections
   - [ ] Complete technical debt assessment
   - [ ] Ensure every issue is documented in appropriate section
9. [ ] Create this week priorities based on analyses
10. [ ] Define sprint candidates with justification
11. [ ] Create debt reduction action plan
12. [ ] **Update document with recommendations**
   - [ ] Complete this week priorities with ownership
   - [ ] Fill next sprint planning table
   - [ ] Add process improvements and action items
13. [ ] **Finalize analysis document**
   - [ ] Review all sections for completeness
   - [ ] Verify formatting and link consistency
   - [ ] Add completion timestamp
14. [ ] Ask user: "Post to #standup (C0996GRS1AN)? [Y/N]"
15. [ ] Post to standup channel (if confirmed)
16. [ ] Update issue labels/assignments as needed

### Troubleshooting Guide

| Symptom | Cause | Resolution |
|:------- |:----- |:---------- |
| Missing issues | Query limit | Increase --limit parameter |
| No labels | New issues | Schedule triage session |
| High debt metrics | Lack of triage | Dedicated debt sprint |

## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: Manual analysis with CLI tools
- **vNext**: Automated metrics dashboard

### Modification Triggers
- Issue count exceeds 50
- Assignment rate drops below 25%
- New issue categories added
- Team structure changes

### Improvement Roadmap
- Automated daily metrics
- Predictive sprint capacity
- Auto-labeling with ML
- Trend analysis graphs