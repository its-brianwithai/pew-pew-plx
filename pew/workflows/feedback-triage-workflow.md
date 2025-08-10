# 🌊 Feedback Triage Workflow: Collaborative User Feedback Processing
> 💡 *A document-driven orchestration for systematically processing user feedback through preliminary analysis, collaborative validation, and targeted action creation with comprehensive tracking.*

This workflow establishes a collaborative approach to processing user feedback from Slack channels through a two-stage analysis system. It creates and maintains a living document that tracks each feedback item through preliminary analysis, user validation, action creation, and completion tracking while ensuring proper Slack threading and GitHub integration.

## 🎯 Philosophical Foundations
> 💡 *The deeper purpose and guiding principles that inform every decision in this workflow.*

### Core Purpose
This workflow exists to create a transparent, collaborative bridge between user voice and development action. It transforms the feedback triage process from autonomous decision-making to validated, documented collaboration that ensures no feedback is lost while maintaining development focus through human validation at every critical decision point.

### Guiding Principles
1. **Human Validation**: No action is taken without explicit user confirmation of preliminary analysis
2. **Document-Driven Transparency**: Every decision, rationale, and action is tracked in a living document
3. **Collaborative Intelligence**: Combine systematic analysis with human judgment for optimal outcomes
4. **Audit Trail Excellence**: Every feedback item maintains complete traceability from receipt to resolution
5. **Non-Destructive Processing**: Check for existing work before creating new issues or duplicates

### Success Criteria
- 100% of feedback items receive preliminary analysis and user validation
- Living document provides real-time status of all feedback processing
- Zero duplicate GitHub issues created due to proper existence checking
- Complete Slack message threading through proper ID tracking
- User has final authority over all classification and action decisions

## 🧩 Core Concepts
> 💡 *Essential ideas and patterns that power this workflow's systematic approach.*

### Key Abstractions
- **Living Document**: Central tracking document updated throughout the process
- **Preliminary Analysis**: Initial automated analysis requiring user validation
- **Collaborative Validation**: User confirms, adjusts, or overrides preliminary analysis
- **Action Artifact**: GitHub issues, backlog items, or documentation created after validation
- **State Tracking**: Each feedback item's current status in the processing pipeline

### Workflow Patterns
- **Document-First Approach**: Create tracking document before processing begins
- **Analyze-Validate-Act Cycle**: Three-stage processing for each feedback item
- **Existence Verification**: Check GitHub and codebase before creating new work
- **Message Threading**: Maintain Slack conversation context through proper ID tracking

## 🔄 Systematic Methodology
> 💡 *The structured approach that transforms inputs into desired outcomes through repeatable, testable steps.*

### Overview
This workflow systematically processes user feedback through document creation, extraction, preliminary analysis, collaborative validation, and targeted action creation. Each feedback item progresses through states tracked in a living document, with user validation required before any actions are taken.

### Phase Architecture
```
Phase 0: MCP Connection Establishment
├── Step 0.1: Progressive Connection Retry
├── Step 0.2: Tool Verification
└── Quality Gate: MCP Tools Available

Phase 1: Document Foundation
├── Step 1.1: Create Processing Document
├── Step 1.2: Initialize Tracking Structure
└── Quality Gate: Document Ready for Updates

Phase 2: Feedback Extraction & Initial Analysis
├── Step 2.1: Extract Slack Messages with IDs
├── Step 2.2: Preliminary Analysis (Automated)
├── Step 2.3: GitHub Issue Existence Check
├── Step 2.4: Codebase Validation Check
└── Step 2.5: Update Document with Preliminary Results

Phase 3: Collaborative Validation (Per Item)
├── Decision Point: Present Analysis to User
├── Step 3.1: User Reviews Preliminary Analysis
├── Step 3.2: User Confirms/Adjusts Classification
├── Step 3.3: User Decides Action Priority
└── Step 3.4: Update Document with Validated Results

Phase 4: Action Execution (Per Validated Item)
├── Branch A: Create GitHub Issue (if approved)
├── Branch B: Create Backlog Item (if approved)
├── Branch C: Document Decision Only (if approved)
├── Branch D: Reply to Slack Thread
└── Step 4.5: Update Document Status

Phase 5: Final Documentation
├── Step 5.1: Generate Summary Report
├── Step 5.2: User Approval for Slack Posting
└── Quality Gate: Complete Audit Trail
```

## 📊 Workflow Orchestration
> 💡 *Detailed execution plan with agent coordination, decision logic, and quality controls.*

### Phase 0: MCP Connection Establishment
> *Ensuring reliable Slack integration before beginning feedback processing*

#### Prerequisites
- Slack MCP server configured in `.mcp.json`
- Channel access permissions verified
- No overlapping triage periods

#### Step 0.1: Progressive Connection Establishment
- **Purpose**: Establish reliable MCP connection with mandatory retry logic
- **Instructions**: Test `mcp__{{slack_mcp}}__conversations_history` with sleep retry loop
- **Agent**: Human operator
- **Success Criteria**: MCP tools respond successfully
- **Critical Requirement**: NEVER proceed until MCP connection works
- **Error Handling**: 
  - Test MCP tool immediately on workflow start
  - If MCP fails: Execute `sleep 5` bash command
  - Retry MCP tool after sleep
  - Continue sleep-retry cycle for maximum 10 attempts
  - NEVER use ListMcpResourcesTool or similar fallbacks
  - After 10 failed attempts, escalate to user for MCP configuration check
  - NEVER proceed with workflow until MCP connection confirmed working
- **Timing**: As long as needed until connection established

#### Quality Gate: MCP Tools Available
- **Validation Criteria**:
  - [ ] `mcp__{{slack_mcp}}__conversations_history` functional
  - [ ] `mcp__{{slack_mcp}}__conversations_add_message` functional
  - [ ] Channel access confirmed (`{{feedback_channel_id}`)
- **Pass Actions**: Proceed to document creation
- **Fail Actions**: Continue retry loop until connection works - NEVER proceed without working MCP

### Phase 1: Document Foundation
> *Creating the central tracking document that will be updated throughout the process*

#### Step 1.1: Create Processing Document
- **Purpose**: Establish living document for tracking all feedback items
- **Instructions**: Create document using [[feedback-report-template]] structure
- **Agent**: Human operator
- **Inputs**: Current date, triage session scope
- **Outputs**: Initial tracking document at `reports/{YYYY}/{MM}/{DD}/feedback-triage-report.md`
- **Success Criteria**: Document created with proper structure and ready for updates
- **Template Sections**:
  - Summary (to be updated)
  - Bugs (populated during processing)
  - Improvements (populated during processing)
  - Metrics (calculated during processing)
  - Files Created (tracked throughout)
  - Next Steps (determined with user)
- **Timing**: 2-3 minutes

#### Step 1.2: Initialize Tracking Structure
- **Purpose**: Set up internal tracking for feedback item states
- **Instructions**: Create todo list for systematic processing
- **Agent**: Human operator
- **Outputs**: Todo list matching feedback items to be processed
- **Success Criteria**: Tracking system ready for item-by-item updates
- **Timing**: 1 minute

#### Quality Gate: Document Ready for Updates
- **Validation Criteria**:
  - [ ] Document created with all required sections
  - [ ] File path follows naming convention
  - [ ] Todo tracking system initialized
- **Pass Actions**: Proceed to feedback extraction
- **Fail Actions**: Fix document structure issues

### Phase 2: Feedback Extraction & Initial Analysis
> *Gathering feedback messages and performing preliminary analysis requiring user validation*

#### Step 2.1: Extract Slack Messages with Complete Metadata and Replies
- **Purpose**: Retrieve all feedback messages with threading information, replies, and reaction data
- **Instructions**: Use `mcp__{{slack_mcp}}__conversations_history` and `mcp__{{slack_mcp}}__conversations_replies` for comprehensive extraction
- **Agent**: Human operator with MCP tools
- **MCP Tools**: 
  - `mcp__{{slack_mcp}}__conversations_history`
  - `mcp__{{slack_mcp}}__conversations_replies` (for each message)
- **Parameters**:
  - `channel_id`: `{{feedback_channel_id}` (raw ID, no quotes)
  - `limit`: `2d` (for comprehensive coverage)
- **Critical Data Captured**:
  - **Message ID/timestamp** (for Slack threading)
  - **User ID and name** (for context)
  - **Message text** (the feedback content)
  - **Thread timestamp** (for reply threading)
  - **All replies to each message** (additional context and status updates)
  - **Reaction data** (checkmark ✅ indicates handled items)
- **Reaction Analysis**:
  - **Checkmark (✅)**: Item already handled - mark as processed, lower priority
  - **Other reactions**: Note for context but don't affect processing
- **Outputs**: Complete message dataset with replies and reaction status
- **Success Criteria**: All messages, replies, and reactions retrieved with processing status identified
- **Error Handling**:
  - **Channel not found**: Verify raw ID usage
  - **Empty results**: Try alternative time parameters
  - **Missing metadata**: Re-extract with full parameter set
  - **Reply fetch fails**: Continue with main message, note missing context
- **Timing**: 3-5 minutes (includes reply fetching)

#### Step 2.2: Preliminary Analysis (Automated)
- **Purpose**: Provide initial analysis that requires user validation before action
- **Instructions**: Analyze each feedback item systematically but mark as preliminary
- **Agent**: Human analyst
- **Analysis Framework**:
  - **Issue Understanding**: What is the user reporting?
  - **Initial Classification**: Bug/Enhancement/Intended (preliminary)
  - **Severity Assessment**: High/Medium/Low impact (preliminary)
  - **Component Identification**: Which system area is affected?
- **Outputs**: Preliminary analysis requiring user validation
- **Success Criteria**: Each item has preliminary classification with rationale
- **Timing**: 1-2 minutes per item

#### Step 2.3: GitHub Issue Existence Check
- **Purpose**: Prevent duplicate issue creation by checking existing work
- **Instructions**: Search GitHub issues and PRs for similar problems/features
- **Agent**: Human operator with GitHub tools
- **Search Methods**:
  - `gh issue list --search "[keywords]"`
  - `gh pr list --search "[keywords]"`
  - Repository search for related code
- **Outputs**: Existing work identified or confirmed absence
- **Success Criteria**: Definitive answer on whether issue already exists
- **Error Handling**:
  - **API limits**: Use web search as backup
  - **Ambiguous matches**: Document for user decision
- **Timing**: 1-2 minutes per item

#### Step 2.4: Codebase Validation Check
- **Purpose**: Verify current implementation and validate user's experience
- **Instructions**: Search codebase to understand current behavior
- **Agent**: Human analyst with code tools
- **Search Methods**:
  - Grep for relevant functionality
  - Find related components and files
  - Verify user's reported behavior against code
- **Outputs**: Code analysis supporting or refuting feedback
- **Success Criteria**: Clear understanding of current implementation
- **Timing**: 2-3 minutes per item

#### Step 2.5: Update Document with Preliminary Results
- **Purpose**: Record all preliminary analysis in living document with complete context
- **Instructions**: Update tracking document with comprehensive preliminary findings
- **Agent**: Human operator
- **Updates Include**:
  - Preliminary classification (marked as unconfirmed)
  - GitHub issue existence status
  - Codebase validation results
  - Slack message IDs for threading
  - **Reply context and additional information from threads**
  - **Reaction status** (✅ checkmark = already handled)
  - **Processing priority** (handled items = lower priority)
- **Document Structure**: Populate bugs and improvements sections with preliminary analysis
- **Success Criteria**: Document reflects all preliminary analysis with reply context and reaction status
- **Timing**: 5-7 minutes for comprehensive batch update

### Phase 3: Iterative User Validation (Per Item)
> *User validates each item individually with immediate document updates and action selection*

#### Step 3.1: Present Item Analysis to User
- **Purpose**: Present comprehensive analysis for single item requiring user validation
- **Instructions**: Show complete analysis including replies and reaction status for one item
- **Agent**: Human operator
- **Information Presented**:
  - Original feedback message and context
  - **All replies and thread context**
  - **Reaction status** (✅ = already handled, affects priority)
  - Preliminary classification with rationale
  - GitHub issue existence check results
  - Codebase validation findings
  - Recommended action and priority
- **Success Criteria**: User has complete context for decision making
- **Timing**: 2-3 minutes per item

#### Step 3.2: User Validates Classification and Selects Actions
- **Purpose**: User confirms classification and selects specific actions to take
- **Instructions**: User reviews analysis and selects from available actions
- **Agent**: Human operator (user)
- **Classification Validation**:
  - **Confirm preliminary analysis** OR **Override with user classification**
  - **Adjust priority based on reaction status** (✅ items = lower priority)
- **Action Selection** (User can select multiple):
  1. **Create Local Backlog Issue** (per project issue conventions)
  2. **Create GitHub Issue** (immediate tracking)
  3. **Reply to Slack Message** (with status update or explanation)
  4. **No Action** (document decision only)
- **Multiple Action Support**: User can select combinations (e.g., GitHub issue + Slack reply)
- **Success Criteria**: User provides validated classification and selected actions
- **Timing**: 1-2 minutes per item

#### Step 3.3: Execute User-Selected Actions Immediately
- **Purpose**: Execute selected actions immediately while context is fresh
- **Instructions**: Perform all user-selected actions for the current item
- **Agent**: Human operator
- **Action Execution**:
  - **If Create Local Backlog**: Generate markdown file per project conventions
  - **If Create GitHub Issue**: Use gh CLI with validated classification
  - **If Reply to Slack**: Use MCP tool with user-approved message
  - **If No Action**: Document rationale only
- **Success Criteria**: All selected actions completed successfully
- **Timing**: 3-5 minutes per item depending on actions selected

#### Step 3.4: Update Document with Results
- **Purpose**: Immediately update tracking document with completed actions
- **Instructions**: Update document with final classification and completed actions
- **Agent**: Human operator
- **Updates Include**:
  - Final user-validated classification
  - Actions taken and artifacts created
  - Links to GitHub issues, backlog files, Slack replies
  - User rationale for decisions
  - **Mark todo as completed for this item**
- **Success Criteria**: Document reflects current state, ready for next item
- **Timing**: 1 minute per item

#### Step 3.5: Continue to Next Item
- **Purpose**: Seamlessly move to next feedback item with updated context
- **Instructions**: Repeat validation cycle for remaining items
- **Agent**: Human operator
- **Process**: Return to Step 3.1 with next item until all items processed
- **Success Criteria**: All feedback items validated and processed
- **Timing**: Loop continues until completion

### Phase 4: Final Summary Generation
> *Generate comprehensive final report after all items processed*

#### Step 4.1: Compile Final Metrics
- **Purpose**: Calculate final statistics from all processed items
- **Instructions**: Aggregate data from completed item processing
- **Agent**: Human operator
- **Metrics Calculated**:
  - Total feedback items processed
  - Breakdown by bugs vs improvements
  - Actions taken (GitHub issues, backlog items, Slack replies)
  - Items with checkmark reactions (already handled)
  - Processing time and efficiency metrics
- **Success Criteria**: Complete metrics ready for final report
- **Timing**: 5 minutes

#### Step 4.2: Update Final Document Sections
- **Purpose**: Complete all remaining sections of tracking document
- **Instructions**: Finalize Summary, Metrics, Files Created, and Next Steps sections
- **Agent**: Human operator
- **Updates Include**:
  - Summary with key findings and patterns
  - Complete metrics with all counts and links
  - Full list of files created with paths
  - Next steps based on actions taken
- **Success Criteria**: Document is complete and ready for sharing
- **Timing**: 10 minutes

### Phase 5: Final Documentation
> *Generate comprehensive summary and obtain user approval for communication*

#### Step 5.1: Generate Summary Report
- **Purpose**: Create final comprehensive report with all metrics and artifacts
- **Instructions**: Complete all sections of tracking document with final data
- **Agent**: Human operator
- **Report Completion**:
  - Calculate final metrics (total items, actions taken, etc.)
  - List all files created with full paths
  - Compile next steps based on actions taken
  - Verify all links and references are working
- **Success Criteria**: Complete report ready for review and sharing
- **Timing**: 10-15 minutes

#### Step 5.2: User Approval for Slack Posting
- **Purpose**: Obtain explicit user consent before posting summaries to channels
- **Instructions**: Ask user for permission to post to specific channels
- **Agent**: Human operator (user)
- **Approval Process**:
  1. **Ask**: "Post summary to #feedback channel (`{{feedback_channel_id}`)? [Y/N]"
  2. **If approved**: Post summary to feedback channel
  3. **Ask**: "Post standup update to #standup channel (`C0996GRS1AN`)? [Y/N]" 
  4. **If approved**: Post standup summary to standup channel
- **Success Criteria**: Only approved channel posts made, all decisions documented
- **Timing**: 2-3 minutes plus user response time

#### Quality Gate: Complete Audit Trail
- **Validation Criteria**:
  - [ ] All feedback items processed through validation cycle
  - [ ] All user-approved actions completed and documented
  - [ ] All Slack replies sent to correct threads
  - [ ] Comprehensive report completed with working links
  - [ ] Only user-approved channel communications made
- **Pass Actions**: Workflow complete, archive document
- **Fail Actions**: Address incomplete items before finalizing

## 🛡️ Error Handling & Recovery
> 💡 *Comprehensive strategies for handling failures and maintaining workflow integrity.*

### Error Classification

| Error Type | Severity | Detection Method | Recovery Strategy |
|:---------- |:-------- |:---------------- |:----------------- |
| Document Creation Failed | High | File write error | Create in alternative location, update paths |
| Slack Threading Failed | Medium | Message post error | Post without threading, document manual follow-up |
| GitHub Issue Creation Failed | Medium | API error response | Retry with backoff, create backlog item instead |
| User Validation Timeout | Low | Extended wait time | Save progress, resume when user available |
| MCP Connection Lost | High | Tool unavailable | Execute sleep 5 retry loop for max 10 attempts, then escalate to user |

### Circuit Breaker Patterns
- **Document Corruption**: Save backup before each major update
- **API Rate Limits**: Implement progressive backoff for all external calls
- **User Availability**: Save state, allow resumption of workflow later

### Rollback Procedures
1. **Document Rollback**: Restore from backup if corruption occurs
2. **Slack Reply Rollback**: Delete incorrect messages if possible
3. **Issue Rollback**: Close mistakenly created issues with explanation
4. **State Rollback**: Reset todo tracking to previous checkpoint

## 📈 Monitoring & Optimization
> 💡 *How to observe, measure, and improve workflow performance.*

### Key Metrics
- **Analysis Accuracy**: Percentage of preliminary analyses confirmed by user (target: >80%)
- **User Validation Time**: Time spent on user validation per item (track for optimization)
- **Action Completion Rate**: Percentage of approved actions successfully completed (target: 100%)
- **Thread Success Rate**: Percentage of Slack replies successfully threaded (target: >95%)
- **Document Integrity**: All items tracked from start to finish (target: 100%)

### Optimization Opportunities
- **Batch User Validation**: Present multiple items for efficiency
- **Template Responses**: Standardize common reply patterns
- **Pattern Recognition**: Identify recurring feedback themes for proactive fixes

### Learning Loops
- **Classification Improvement**: Track which preliminary analyses need adjustment
- **Process Refinement**: Optimize user validation workflow based on feedback
- **Tool Enhancement**: Improve MCP integration based on failure patterns

## 🚀 Implementation Guide
> 💡 *Practical guidance for executing this workflow in production.*

### Entry Requirements
- [ ] Slack MCP configured and tested (`{{slack_mcp}}` in `.mcp.json`)
- [ ] GitHub CLI authenticated with proper permissions
- [ ] Write access to project repository for document creation
- [ ] User availability for validation decisions
- [ ] Previous day's feedback unprocessed

### Resource Requirements
- **MCP Server**: `{{slack_mcp}}` with conversation and messaging tools
- **Tools**: GitHub CLI, text editor, grep/search capabilities
- **Templates**: [[feedback-report-template]] for document structure
- **Access**: Feedback channel (`{{feedback_channel_id}`), GitHub repository, codebase
- **Time**: 2-4 hours depending on feedback volume and validation complexity
- **Skills**: Code analysis, user communication, classification judgment

### Execution Checklist
1. [ ] **Phase 0**: Test MCP immediately, sleep 5 seconds and retry if failed, max 10 attempts before escalation
2. [ ] **Phase 1**: Create processing document using [[feedback-report-template]]
3. [ ] **Phase 1**: Initialize todo tracking for systematic processing
4. [ ] **Phase 2**: Extract Slack messages with metadata, replies, and reactions
5. [ ] **Phase 2**: Perform preliminary analysis including reaction status (✅ = handled)
6. [ ] **Phase 2**: Check GitHub for existing issues/PRs
7. [ ] **Phase 2**: Validate against codebase implementation
8. [ ] **Phase 2**: Update document with preliminary results and reaction context
9. [ ] **Phase 3**: Iteratively present each item to user with complete context
10. [ ] **Phase 3**: For each item: validate classification and select actions (1-4)
11. [ ] **Phase 3**: Execute selected actions immediately (local backlog/GitHub/Slack/none)
12. [ ] **Phase 3**: Update document with results and continue to next item
13. [ ] **Phase 4**: Compile final metrics after all items processed
14. [ ] **Phase 4**: Complete all document sections with final data
15. [ ] **Phase 5**: Get user approval before posting summaries to channels
16. [ ] **Phase 5**: Verify complete audit trail exists

### Troubleshooting Guide

| Symptom | Likely Cause | Resolution |
|:------- |:------------ |:---------- |
| Document updates failing | File permission or path issue | Check write permissions, verify path exists |
| Slack threading not working | Wrong message ID captured | Re-extract messages with full metadata |
| User validation taking too long | Complex items or unclear analysis | Break complex items into smaller parts |
| GitHub issue creation failing | Authentication or API limits | Re-authenticate, implement rate limiting |
| MCP connection unstable | Network or server issues | Execute sleep 5 retry loop for max 10 attempts, then escalate |
| Missing message metadata | Incomplete extraction parameters | Re-run extraction with full parameter set |

## 🔮 Evolution & Versioning
> 💡 *How this workflow adapts and improves over time.*

### Version History
- **v1.0**: Original autonomous triage workflow
- **v2.0**: Document-driven collaborative validation approach
- **vNext**: Pattern-based preliminary analysis improvement

### Modification Triggers
- User validation accuracy drops below 70%
- Feedback volume exceeds processing capacity  
- New communication channels require integration
- Document structure proves insufficient for tracking needs

### Deprecation Strategy
- Maintain backward compatibility for existing reports
- Gradually phase in enhanced preliminary analysis
- Preserve audit trails during workflow transitions
- Train users on new collaborative validation approach
