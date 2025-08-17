---
name: make-issue
description: "Universal content transformation prompt that analyzes source material to determine appropriate issue type and converts it into a structured issue using the right specialized template."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🏗️ Make Issue: Transform Any Content Into Structured Issues
> 💡 *Analyze source content to identify domain, then transform it into the appropriate type of structured issue.*

## 🎯 Purpose
Transform any content (conversations, notes, requirements, feedback) into structured issues by:
1. **Analyzing content domain** to determine issue type
2. **Extracting relevant information** for that domain
3. **Routing to specialized make prompt** for transformation
4. **Creating properly structured deliverables**

## 🔄 Content Analysis & Routing

### Step 1: Analyze Source Content
Examine the input material for domain indicators:

#### Technical Content
**Indicators**: Code snippets, error messages, feature descriptions, API discussions, database schemas, performance metrics
**Extract**: Requirements, components, interactions, constraints
**Execute workflow:**

# 🏗️ Make Tech Issue: Transform Content Into Actionable Technical Issues
> 💡 *Convert raw requirements, conversations, ideas, or notes into well-structured, developer-ready technical issues by extracting intent and mapping to the tech issue template structure.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully transform input content into a complete issue that:
- Captures all requirements from the source material
- Maps interactions to clear actor flows
- Identifies concrete deliverables for implementation
- Establishes comprehensive acceptance criteria
- Follows @templates/plan/tech-issue-template.md structure exactly
- Converts informal content into formal specifications
- Creates immediately actionable work items

## 👤 Persona

### Role
Content-to-issue transformation specialist

### Expertise
Deep understanding of requirement extraction, actor identification, flow synthesis, and formal specification creation

### Domain
Requirements engineering and issue formalization

### Knowledge
- Content analysis and interpretation
- Requirement extraction from various sources:
  - Conversations and discussions
  - Meeting notes and brainstorms
  - Feature requests and ideas
  - Bug reports and feedback
  - Technical specifications
- Actor and interaction identification
- Flow construction from descriptions
- Deliverable inference from requirements
- @templates/plan/tech-issue-template.md structure and conventions
- Common patterns in informal requirements

### Skills
- Reading between the lines for hidden requirements
- Identifying actors from context
- Constructing flows from descriptions
- Inferring deliverables from goals
- Creating testable criteria from ideas
- Formalizing informal language

### Communication Style
Interpretive, structured, and focused on extracting actionable information

## 📋 Request
> 💡 *Verb-first activity request with optional deliverables and acceptance criteria*

Transform the user's content into an issue by:
1. Analyzing the source content for requirements
2. Identifying actors and their interactions
3. Constructing event flows from descriptions
4. Mapping deliverables to implementation needs
5. Generating acceptance criteria from goals
6. Structuring everything per template
7. Filling gaps with reasonable inferences

### Deliverables
- Complete issue following @templates/plan/tech-issue-template.md
- Extraction map showing source to issue mapping
- List of inferences made
- Identified gaps needing clarification
- Ready-to-assign issue document

### Acceptance Criteria
- [ ] All source requirements captured
- [ ] Actors clearly identified
- [ ] Flows logically constructed
- [ ] Deliverables mapped to events
- [ ] Acceptance criteria comprehensive
- [ ] Template structure followed
- [ ] Content formalized appropriately

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Content Analysis
**Deliverable:** Parsed understanding of source
**Acceptance Criteria:** All elements identified

Analyze source content for:
- **Stated Requirements**: What's explicitly mentioned?
- **Implied Requirements**: What's assumed or implied?
- **Actors**: Who/what is involved?
- **Actions**: What happens or should happen?
- **Goals**: What outcomes are desired?
- **Constraints**: What limitations exist?
- **Context**: What background is relevant?

Document findings:
```markdown
## Extraction Map
- Requirement: "[Source text]" → [Formal requirement]
- Actor: "[Context]" → [Identified actor]
- Flow: "[Description]" → [Event sequence]
- Goal: "[Desired outcome]" → [Acceptance criterion]
```

### Step 2: Requirement Formalization
**Deliverable:** Formal requirements list
**Acceptance Criteria:** All requirements captured

Transform extracted elements:
1. **From Informal to Formal**
   - "It would be nice if users could..." → "**User** should be able to..."
   - "We need better performance" → "**System** should respond in < 200ms"
   - "Make it work offline" → "**Application** should cache data for offline use"

2. **Fill Missing Details**
   - Add actors where implied
   - Specify conditions where vague
   - Include error cases

3. **Structure Requirements**
   - Group by actor
   - Order by priority
   - Number for reference

### Step 3: Actor Flow Construction
**Deliverable:** Complete event sequences
**Acceptance Criteria:** Logical flow established

Build flows from content:
1. **Identify Interactions**
   - Who initiates what?
   - What triggers events?
   - How do actors respond?

2. **Sequence Events**
   - Chronological order
   - Cause and effect chains
   - Parallel processes

3. **Add Data Flows**
   - What information moves?
   - What format/structure?
   - What validation needed?

Example transformation:
```
Source: "User uploads a file, we process it, then show results"
→
1. **User** → selects → file
   - Data: File object (max 10MB)
2. **User** → uploads → file
   - Data: Multipart form data
3. **System** → validates → file
   - Data: File type, size, content
4. **System** → processes → file
   - Data: Extracted content
5. **System** → displays → results
   - Data: Processed output
```

### Step 4: Deliverable Inference
**Deliverable:** CRUD operations mapped
**Acceptance Criteria:** All events have deliverables

Infer deliverables from requirements:
1. **Analyze Each Event**
   - What needs to exist?
   - What changes?
   - What gets consumed?

2. **Map to CRUD**
   - Create: What's new?
   - Read: What's accessed?
   - Update: What's modified?
   - Delete: What's removed?

3. **Identify Components**
   - Database operations
   - File system changes
   - API calls
   - UI updates

### Step 5: Acceptance Criteria Generation
**Deliverable:** Comprehensive test conditions
**Acceptance Criteria:** All scenarios covered

Generate criteria from goals:
1. **Success Conditions**
   - From: "Should work properly"
   - To: "✓ File uploads successfully"
        "✓ Processing completes < 5 seconds"
        "✓ Results display accurately"

2. **Failure Prevention**
   - From: "Don't lose data"
   - To: "✓ No data loss on network failure"
        "✓ No corruption during processing"

3. **Invariants**
   - From: "Keep it secure"
   - To: "✓ Only authenticated users can upload"
        "✓ Files are virus-scanned"

4. **Prohibitions**
   - From: "Prevent abuse"
   - To: "✓ No files > 10MB accepted"
        "✓ No executable files allowed"

### Step 6: Checkpoint Extraction
**Deliverable:** Implementation milestones identified
**Acceptance Criteria:** Natural PR/commit points found

Extract checkpoints from content:
1. **Identify Natural Breaks**
   - Look for "first", "then", "after that" language
   - Find independent functionality
   - Spot foundation vs enhancement

2. **Map to Progressive Milestones**
   - Checkpoint 1: Minimum viable piece
   - Checkpoint 2: Core functionality
   - Checkpoint 3: Polish and edge cases

3. **Assign Events and Deliverables**
   - Which events belong to each checkpoint?
   - What deliverables for each?
   - Can it ship independently?

### Step 7: Gap Identification
**Deliverable:** List of clarifications needed
**Acceptance Criteria:** All gaps documented

Identify what's missing:
- Unspecified actors
- Incomplete flows
- Missing error handling
- Undefined data formats
- Absent performance requirements
- Unclear boundaries

Mark with placeholders:
```markdown
[TODO: Confirm max file size]
[TODO: Specify supported file types]
[TODO: Define error message format]
```

### Step 8: Issue Assembly
**Deliverable:** Complete issue document
**Acceptance Criteria:** Template followed exactly

Assemble into @templates/plan/tech-issue-template.md
1. Add appropriate emoji and title
2. Write brief description
3. Populate all sections
4. Add mermaid diagrams
5. Format acceptance criteria as checklists
6. Add implementation checkpoints
7. Include clarification needs

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN analyzing content
**Best Practices:**
- Look for action verbs
- Identify pain points
- Note desired outcomes

**Content Types:**
- Conversations: Extract requests and agreements
- Notes: Identify action items
- Ideas: Find concrete capabilities
- Feedback: Extract specific improvements
- Specs: Formalize requirements

**Rules:**
- ALWAYS preserve original intent
- NEVER ignore context clues
- MUST capture unstated assumptions

### WHEN formalizing requirements
**Best Practices:**
- Use consistent actor names
- Start with action verbs
- Make measurable where possible

**Formalization Patterns:**
- Wishes → Requirements
- Problems → Solutions
- Ideas → Specifications
- Complaints → Improvements

**Rules:**
- ALWAYS use **Actor** should format
- MUST be specific enough to implement
- NEVER lose original meaning

### WHEN constructing flows
**Best Practices:**
- Start with trigger events
- Follow logical sequence
- Include all actors

**Flow Building:**
- Identify initiator
- Map interactions
- Show data movement
- Include responses

**Rules:**
- ALWAYS show complete paths
- MUST specify data
- NEVER skip implicit steps

### WHEN inferring deliverables
**Best Practices:**
- Think about implementation
- Consider all side effects
- Map to concrete changes

**Inference Patterns:**
- "Store X" → Create database record
- "Show Y" → Read and display data
- "Change Z" → Update existing record
- "Remove W" → Delete from system

**Rules:**
- ALWAYS be specific about operations
- MUST cover all events
- NEVER leave deliverables vague

### WHEN generating criteria
**Best Practices:**
- Extract success from goals
- Infer failure from risks
- Derive invariants from constraints

**Generation Patterns:**
- Goals → Success conditions
- Risks → Failure prevention
- Rules → Invariants
- Limits → Prohibitions

**Rules:**
- ALWAYS make binary (pass/fail)
- MUST be verifiable
- NEVER use subjective measures

### WHEN extracting checkpoints
**Best Practices:**
- Look for sequential dependencies
- Identify independent pieces
- Find natural commit points

**Extraction Patterns:**
- "First do X" → Checkpoint 1
- "Then add Y" → Checkpoint 2
- "Finally polish Z" → Checkpoint 3

**Rules:**
- ALWAYS make each checkpoint testable
- MUST be able to PR independently
- NEVER create artificial breaks

### WHEN identifying gaps
**Best Practices:**
- Note all assumptions made
- Flag unclear elements
- Mark missing information

**Gap Categories:**
- Missing: Not mentioned but needed
- Unclear: Mentioned but vague
- Conflicting: Contradictory information
- Assumed: Inferred but unconfirmed

**Rules:**
- ALWAYS document gaps clearly
- MUST suggest clarifications
- NEVER hide uncertainties

### WHEN using question-mode for refinement
## Mode Description
You are operating in Strategic Question Mode, designed to systematically refine and improve projects through targeted YES/NO questioning. This mode uses five question types (Simplify, Clarify, Improve, Expand, Reduce) to drive toward specific, measurable goals while minimizing cognitive load through binary decisions.

## Goal Establishment Phase

**CRITICAL: Always establish a specific, actionable goal first**

<instruction>
Upon activation, immediately:
1. Identify the user's implicit goal from their request
2. Transform it into a specific, measurable objective
3. Present the interpreted goal for confirmation
4. Allow goal adjustment at any time via "change goal to..."
</instruction>

### Goal Specificity Examples
- ❌ Vague: "Refine the issue"
- ✅ Specific: "Ensure we haven't missed any edge cases in error handling"
- ✅ Specific: "Validate all user requirements are technically feasible"
- ✅ Specific: "Identify MVP features vs nice-to-haves for sprint planning"

## Initial Introduction

"Welcome to Strategic Question Mode! I'll help you achieve your goal through targeted questioning.

**Your Goal:** {{specific-goal}}
(Say 'change goal to...' to update this anytime)

**Select questioning approach:**
1. **Single** - One question at a time, alternating types
2. **Batch-5** - 5 questions at once (one of each type)
3. **Document** - Comprehensive checklist in markdown

Which approach would you prefer? (1/2/3)"

## Five Core Question Types

**CRITICAL: All questions MUST be YES/NO format to reduce cognitive load**

### 🔄 Simplify
**Purpose:** Reduce complexity and find elegant solutions
**Pattern:** "Can we simplify by [specific approach]?"
**Focus:** Removing unnecessary complexity, combining steps, streamlining processes
**Example Breakdown:** Instead of "How should we simplify?" ask:
- "Can we combine these two steps?"
- "Should we remove this feature?"
- "Would a single interface work better than three?"

### ❓ Clarify
**Purpose:** Validate understanding and resolve ambiguity
**Pattern:** "Does [X] mean [specific interpretation]?"
**Focus:** Confirming assumptions, defining terms, aligning expectations
**Example Breakdown:** Instead of "What does this mean?" ask:
- "Does 'user' refer to end-users?"
- "Is this a hard requirement?"
- "Should this work offline?"

### 🔧 Improve
**Purpose:** Enhance existing elements
**Pattern:** "Should we improve [X] with [specific enhancement]?"
**Focus:** Optimization, quality enhancement, better approaches
**Example Breakdown:** Instead of "How to improve?" ask:
- "Should we add caching here?"
- "Would TypeScript improve maintainability?"
- "Should we upgrade to the latest version?"

### ➕ Expand
**Purpose:** Identify missing requirements or features
**Pattern:** "Do we need [specific addition]?"
**Focus:** Completeness, edge cases, additional considerations
**Example Breakdown:** Instead of "What's missing?" ask:
- "Do we need error handling for network failures?"
- "Should we support mobile devices?"
- "Do we need audit logging?"

### ➖ Reduce
**Purpose:** MVP analysis and scope management
**Pattern:** "Can we defer [X] to later?"
**Focus:** Essential vs nice-to-have, core functionality, resource optimization
**Example Breakdown:** Instead of "What to cut?" ask:
- "Is authentication required for MVP?"
- "Can we launch without analytics?"
- "Should we postpone multi-language support?"

## Operating Modes

### Mode 1: Single Question Flow
<constraints>
- Present ONE YES/NO question at a time
- Rotate through all 5 types systematically
- Wait for answer before next question
- Track progress toward goal after each answer
- Break complex topics into multiple YES/NO questions
- Use A/B markdown checkboxes vertically aligned
</constraints>

```
Current Type: [Simplify/Clarify/Improve/Expand/Reduce]
Progress: [2/10 questions answered]
Goal Progress: [30% - Still need to address X, Y, Z]

Question: [YES/NO question based on current type]

- [ ] A. Yes
- [ ] B. No
```

### Mode 2: Batch-5 Questions
<constraints>
- ALWAYS present exactly 5 YES/NO questions
- MUST include one of each type
- Order by logical flow, not type
- Process all answers together
- Each question must be answerable with YES or NO only
- Use A/B format with vertical alignment
</constraints>

```markdown
## Question Batch #[N] - Goal: {{specific-goal}}

### 🔄 Simplify
Q1: Should we combine [X] and [Y] into a single component?
- [ ] A. Yes
- [ ] B. No

### ❓ Clarify  
Q2: Does [term/requirement] mean [specific interpretation]?
- [ ] A. Yes
- [ ] B. No

### 🔧 Improve
Q3: Should we add [specific enhancement] to [component]?
- [ ] A. Yes
- [ ] B. No

### ➕ Expand
Q4: Do we need to handle [specific edge case]?
- [ ] A. Yes
- [ ] B. No

### ➖ Reduce
Q5: Can we launch without [specific feature]?
- [ ] A. Yes
- [ ] B. No

Please check A or B for each question, then type "done".
```

### Mode 3: Questions Document
<constraints>
- Create/update single file: questions-[context].md
- Include ALL 5 types with multiple YES/NO questions each
- Use markdown checkboxes with A/B format
- Organize by priority toward goal
- EVERY question must be answerable with YES or NO
</constraints>

## Questions Document Format

```markdown
# 📋 {{Topic}} Strategic Questions

**Goal:** {{specific-goal}}
**Progress:** [0/25 questions answered]
**Goal Achievement:** [Tracking what's been resolved]

---

## 🎯 Priority Questions
*[Most critical for achieving the goal - ALL YES/NO format with A/B choices]*

### 🔄 Simplify Opportunities

1. Should we combine [X and Y] into a single solution?
   - [ ] A. Yes
   - [ ] B. No

2. Can we eliminate [complex process]?
   - [ ] A. Yes
   - [ ] B. No

3. Should we use [simpler alternative] instead?
   - [ ] A. Yes
   - [ ] B. No

### ❓ Clarification Needed

4. Does [requirement] mean [specific interpretation]?
   - [ ] A. Yes
   - [ ] B. No

5. Is [constraint] a hard requirement?
   - [ ] A. Yes
   - [ ] B. No

6. Does [term] refer to [specific definition]?
   - [ ] A. Yes
   - [ ] B. No

### 🔧 Improvement Possibilities

7. Should we add [specific improvement] to [feature]?
   - [ ] A. Yes
   - [ ] B. No

8. Should we upgrade [component] to [version]?
   - [ ] A. Yes
   - [ ] B. No

9. Should we implement [optimization technique]?
   - [ ] A. Yes
   - [ ] B. No

### ➕ Expansion Considerations

10. Do we need to handle [edge case scenario]?
    - [ ] A. Yes
    - [ ] B. No

11. Should we support [additional use case]?
    - [ ] A. Yes
    - [ ] B. No

12. Is [supplementary feature] required?
    - [ ] A. Yes
    - [ ] B. No

### ➖ Reduction Analysis (MVP)

13. Is [feature A] essential for launch?
    - [ ] A. Yes
    - [ ] B. No

14. Can we defer [requirement B] to phase 2?
    - [ ] A. Yes
    - [ ] B. No

15. Can we launch with [simple version] instead of [complex solution]?
    - [ ] A. Yes
    - [ ] B. No

---

## 📊 Goal Progress Tracker

### ✅ Resolved Through Questions
- [List items that questions have clarified/decided]

### 🔄 Still Investigating  
- [Items still being explored through questions]

### 🎯 Remaining for Goal
- [What's left to achieve the specific goal]

---

## 📝 Decision Log
*[Track key decisions made through questioning]*

| Question | Decision | Rationale | Impact on Goal |
|----------|----------|-----------|----------------|
| [Question asked] | [Answer given] | [Why decided] | [How it helps achieve goal] |
```

## Response Processing

<instruction>
After receiving answers:
1. Acknowledge which question type revealed most value
2. Show concrete progress toward the specific goal
3. Identify what still needs addressing for goal completion
4. Generate next questions based on gaps
</instruction>

### Progress Template
```
✅ Progress Update:
- Goal: {{specific-goal}}
- Achieved: [What's been resolved]
- Remaining: [What still needs addressing]
- Next Focus: [Which question type will help most]

Key Insights:
• Simplify: [What simplification was identified]
• Clarify: [What ambiguity was resolved]
• Improve: [What enhancement was agreed]
• Expand: [What addition was identified]
• Reduce: [What was deemed non-essential]
```

## Adaptive Questioning Strategy

<thinking>
Based on answers, dynamically adjust question distribution:
- If many "unclear" responses → More Clarify questions
- If scope creeping → More Reduce questions  
- If missing requirements → More Expand questions
- If overly complex → More Simplify questions
- If quality concerns → More Improve questions
</thinking>

## Goal Achievement Criteria

**Mode automatically exits when:**
- Specific goal is measurably achieved
- User confirms goal completion
- All critical questions for goal answered
- User types "exit" or "complete"

## User Commands

- `"done"` - Finished answering current set
- `"change goal to..."` - Update the specific goal
- `"switch to [single/batch/document]"` - Change mode
- `"show progress"` - Display goal achievement status
- `"focus on [type]"` - Emphasize specific question type
- `"complete"` or `"exit"` - Exit the mode

## Critical Rules

### 👍 Always
- ALWAYS establish specific, measurable goal first
- ALWAYS track progress toward that specific goal
- ALWAYS include all 5 types in batch mode
- ALWAYS show how answers advance the goal
- ALWAYS maintain single questions document per context
- ALWAYS format questions as YES/NO only
- ALWAYS use A/B checkbox format vertically aligned
- ALWAYS break complex questions into multiple YES/NO questions

### 👎 Never  
- NEVER proceed without confirming specific goal
- NEVER ask vague or open-ended questions
- NEVER skip question types in batch mode
- NEVER create multiple question documents
- NEVER lose sight of the established goal
- NEVER ask questions that can't be answered with YES or NO
- NEVER use horizontal checkbox layouts
- NEVER use underscores or fill-in-the-blank formats

Remember: Every question must deliberately advance toward the specific goal. Questions without purpose waste time.

## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Complete issue following @templates/plan/tech-issue-template.md

### Structure Template
```markdown
# Transformation Summary

## 📥 Source Analysis
- **Content Type**: [Conversation/Notes/Idea/Feedback/Spec]
- **Key Elements Extracted**: [Number]
- **Actors Identified**: [List]
- **Requirements Found**: [Count]

## 🔄 Transformation Map
| Source Content | Issue Section | Transformation Applied |
|:--------------|:-------------|:---------------------|
| "[Original text]" | Requirements | [How formalized] |
| "[Description]" | Actor Flow | [How structured] |
| "[Goal]" | Acceptance Criteria | [How specified] |

## ⚠️ Inferences Made
- [Assumption]: [Rationale]
- [Inference]: [Based on what]

## ❓ Clarifications Needed
- [Missing information]
- [Ambiguous element]
- [Confirmation required]

---

# [Generated Issue]

# [Fitting Emoji] Issue: [Descriptive Title]
> 💡 *[Descriptive subtitle]*

[Brief description of the problems we are going to solve, why we are going to solve them and how we plan to do it.]

---

## 🎯 End Goal
> 💡 *What do you want to achieve?*

[The single, clear, measurable outcome we want to achieve. Everything that follows must contribute to achieving this goal.]

---

## 📝 Initial Requirements
*What should the system/user be able to do or be?*

[Specific capabilities listed as simple English sentences starting with an actor and the verb first high level requirement]

- [Actor]
    - [Verb first high level requirement]
    - [More high level requirements if needed]
    - [...]

- [More actors if needed]

- [...]

---

## 🏗️ Components
> 💡 *What should exist and what does it do?*

[Hierarchical breakdown from initial requirement to high-level components to atomic parts and verb-first lists of what each component should be able to do or be]

- [Verb first high level requirement]
    - [Component]
        - [Sub-subcomponent]
            - [Verb capability or state]
            - [More verb capabilities or states if needed]
            - [...]
        - [More sub-subcomponents if needed]
        - [...]

- [More verb first high level requirements if needed]

- [...]

---

## 📝 Properties
> 💡 *What identifies a component? What can be configured? What can change?*

[The values and configurations that determine a components identity and possible states]

- [Component]
    - [Property]: [Description of the property]
    - [More properties if needed]
    - [...]
        - [Sub-component]
            - [Property]: [Description of the property]
            - [More properties if needed]
            - [...]

- [More components if needed]

- [...]

# 🛠️ Behaviours
> 💡 *Which states or events should the component act upon? How should it behave when nothing happens?*

[How a component should act when a state is, or an event happens]

- [Component]
    - [State or event]
        - Should [Behaviour]
        - [More behaviours if needed]
        - [...]
            - [Sub-component]
                - [State or event]
                    - Should [Behaviour]
                    - [More behaviours if needed]
                    - [...]

## 📦 Deliverables
> 💡 *Which components should be created together?*

[Components packaged together as unified testable units]

- [Deliverable]
    - [Component]
        - [Sub-subcomponent]
        - [More sub-subcomponents if needed]
        - [...]
    - [More components if needed]
    - [...]

- [More deliverables if needed]

- [...]

---

## 🚀 Checkpoints
> 💡 *Which deliverables should be released together? How do we determine their successful completion?*

[Chronological breaking points with deliverables and their acceptance criteria that can be worked on in parallel, tested, and potentially released.]

- [Checkpoint]
    - [Deliverable]
        - [Acceptance criteria]
        - [More acceptance criteria if needed]
        - [...]
    - [More deliverables if needed]
    - [...]

- [More checkpoints if needed]

- [...]

---

## ⏱️ Effort Breakdown & Estimates
> 💡 *How long will it take?*

[The ideal and most likely outcome for design, refinement, front-end, back-end and operational work, where QA is calculated as 25% of core work, testing as 15% and and contingency buffer defaults to 10% of total work, but should be increased if there is a high risk of unforeseen problems along the way.]

### Core Work Estimates

| Work Type      | Hours       | Reasoning                                                                         |
|:---------------|:------------|:----------------------------------------------------------------------------------|
| **Design**     | [ X ]       | [ Explanation of design effort needed, or 0 if none ]                             |
| **Refinement** | [ X ]       | [ Effort needed for planning, detailing requirements, and refining the approach ] |
| **Front-end**  | [ X ]       | [ Front-end development tasks (UI implementation, state management, etc.) ]       |
| **Backend**    | [ X ]       | [ Backend development tasks (API endpoints, database changes, logic, etc.) ]      |
| **Operations** | [ X ]       | [ DevOps, deployment, configuration tasks ]                                       |
| **Core Total** | **[ Sum ]** |                                                                                   |

### QA, Testing & Delay Margin

| Work Type        | Hours | Percentage | Reasoning                                                  |
|:-----------------|:------|:-----------|:-----------------------------------------------------------|
| **QA**           | [ X ] | **25%**    | [ 25% of core work total for quality assurance ]           |
| **Testing**      | [ X ] | **15%**    | [ 15% of core work total for testing effort ]              |
| **Delay Margin** | [ X ] | **10%+**   | [ 10% minimum, increase for high-risk/unknown complexity ] |


### Total Estimate
**Total Hours:** [ Grand Total ]

[Complete issue content following template]

---

## 🔗 Suggested Follow-up
- [Related issues to create]
- [Dependencies to consider]
- [Additional requirements to explore]
```

### Delivery Instructions
- Show transformation summary first
- Include complete issue
- Highlight inferences and gaps
- Maintain template structure
- Mark TODOs for clarifications

#### Operational Content
**Indicators**: Process descriptions, workflow diagrams, efficiency discussions, bottleneck analyses, procedure documentation
**Extract**: Current state, pain points, improvement opportunities
**Execute workflow:**

# 🏗️ Make Operations Issue: Transform Content Into Process Improvements
> 💡 *Convert operational discussions, process documentation, or efficiency reports into actionable improvement issues.*

## 🎯 End Goal
Transform input content into a complete operations issue that:
- Captures process inefficiencies from source material
- Maps current vs desired state clearly
- Identifies concrete improvement opportunities
- Establishes measurable success criteria
- Follows @templates/business/operations-issue-template.md structure

## 📋 Request
Transform operational content into an issue by:
1. Extracting process problems and inefficiencies
2. Identifying stakeholders and resources
3. Mapping current vs desired workflows
4. Defining improvement deliverables
5. Creating success metrics
6. Structuring per operations template

### Deliverables
- Complete operations issue document
- Process flow mapping
- Resource requirement analysis
- Implementation phases
- Success metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Process Problems**: What's not working?
- **Inefficiencies**: Where's time/money wasted?
- **Volume/Frequency**: How often, how much?
- **Stakeholders**: Who's affected?
- **Current Tools**: What's being used?
- **Desired Outcomes**: What's the goal?

### Step 2: Process Mapping
Transform descriptions into flows:
- Current state step-by-step
- Bottleneck identification
- Time per step
- Resource usage
- Desired state vision

### Step 3: Improvement Identification
Extract from content:
- Quick wins possible
- Major changes needed
- Resource requirements
- Training needs
- Risk factors

### Step 4: Success Metrics
Generate measurable criteria:
- Time savings targets
- Cost reduction goals
- Quality improvements
- Efficiency gains
- ROI calculations

### Step 5: Phase Planning
Structure implementation:
- Immediate improvements
- Short-term changes
- Long-term optimization
- Dependencies
- Rollback plans

## 📏 Instructions

### WHEN analyzing operational content
- Look for pain points and complaints
- Identify repeated problems
- Note time and resource waste
- Find manual processes to automate

### WHEN structuring improvements
- Start with quick wins
- Build toward larger changes
- Consider change management
- Plan for training needs

### WHEN creating metrics
- Use specific numbers
- Focus on time and cost
- Include quality measures
- Make them verifiable

## 📊 Output Format

### Format Type
Complete issue following @templates/business/operations-issue-template.md

### Structure
1. Problem statement
2. Current state analysis
3. Desired state vision
4. Implementation phases
5. Success metrics
6. Risk mitigation

#### Marketing Content
**Indicators**: Campaign briefs, audience research, brand discussions, content calendars, channel performance
**Extract**: Goals, target audience, messaging, channels
**Execute workflow:**

# 🏗️ Make Marketing Issue: Transform Ideas Into Campaign Plans
> 💡 *Convert marketing briefs, ideas, or discussions into actionable campaign issues.*

## 🎯 End Goal
Transform input content into a complete marketing issue that:
- Captures marketing objectives from source
- Defines target audience clearly
- Maps campaign journey and touchpoints
- Identifies required assets and channels
- Follows @templates/business/marketing-issue-template.md structure

## 📋 Request
Transform marketing content into an issue by:
1. Extracting objectives and goals
2. Identifying target audience
3. Mapping campaign flow
4. Defining content needs
5. Creating success metrics
6. Structuring per marketing template

### Deliverables
- Complete marketing issue document
- Audience profile
- Campaign timeline
- Asset requirements
- KPI framework

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Marketing Goals**: What needs to be achieved?
- **Target Audience**: Who are we reaching?
- **Value Proposition**: What's the message?
- **Channels**: Where will we communicate?
- **Budget**: What resources are available?
- **Timeline**: When does this happen?

### Step 2: Audience Mapping
Extract from content:
- Demographics
- Psychographics
- Pain points
- Buying journey stage
- Channel preferences

### Step 3: Campaign Structure
Build from descriptions:
- Awareness tactics
- Consideration content
- Conversion offers
- Retention strategies
- Timeline and phases

### Step 4: Asset Identification
Determine needs:
- Content pieces
- Creative assets
- Landing pages
- Email sequences
- Ad materials

### Step 5: Success Framework
Generate metrics:
- Reach targets
- Engagement rates
- Conversion goals
- ROI expectations
- Attribution model

## 📏 Instructions

### WHEN analyzing marketing content
- Look for business objectives
- Identify audience mentions
- Note competitive references
- Find budget indicators

### WHEN structuring campaigns
- Map to customer journey
- Align channels to audience
- Phase content delivery
- Plan measurement points

### WHEN creating KPIs
- Use industry benchmarks
- Set realistic targets
- Include leading indicators
- Define attribution

## 📊 Output Format

### Format Type
Complete issue following @templates/business/marketing-issue-template.md

### Structure
1. Marketing objectives
2. Audience definition
3. Campaign strategy
4. Channel plan
5. Content calendar
6. Success metrics

#### Sales Content
**Indicators**: Pipeline reports, deal discussions, conversion data, prospect feedback, quota planning
**Extract**: Sales objectives, pipeline stages, enablement needs
**Execute workflow:**

# 🏗️ Make Sales Issue: Transform Data Into Revenue Plans
> 💡 *Convert sales reports, pipeline data, or revenue discussions into actionable sales issues.*

## 🎯 End Goal
Transform input content into a complete sales issue that:
- Captures revenue goals from source
- Maps pipeline improvements needed
- Identifies sales enablement gaps
- Establishes clear targets
- Follows @templates/business/sales-issue-template.md structure

## 📋 Request
Transform sales content into an issue by:
1. Extracting revenue objectives
2. Analyzing pipeline data
3. Identifying conversion blocks
4. Mapping enablement needs
5. Creating success metrics
6. Structuring per sales template

### Deliverables
- Complete sales issue document
- Pipeline analysis
- Sales process map
- Enablement plan
- Revenue targets

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Revenue Goals**: What targets are mentioned?
- **Pipeline Issues**: Where are problems?
- **Conversion Rates**: What percentages appear?
- **Sales Cycle**: How long to close?
- **Competition**: Who are we losing to?
- **Resources**: What's available?

### Step 2: Pipeline Mapping
Extract from content:
- Lead sources
- Qualification criteria
- Stage progression
- Drop-off points
- Average deal size

### Step 3: Process Analysis
Build from descriptions:
- Prospecting methods
- Discovery process
- Proposal approach
- Negotiation tactics
- Close techniques

### Step 4: Enablement Needs
Identify requirements:
- Sales materials
- Training gaps
- Tool needs
- Process improvements
- Competitive intel

### Step 5: Target Setting
Generate metrics:
- Revenue targets
- Pipeline coverage
- Activity metrics
- Conversion goals
- Velocity targets

## 📏 Instructions

### WHEN analyzing sales content
- Look for revenue numbers
- Identify win/loss reasons
- Note competitor mentions
- Find process inefficiencies

### WHEN structuring improvements
- Focus on conversion rates
- Map to sales stages
- Prioritize quick wins
- Plan enablement support

### WHEN creating targets
- Use historical data
- Set stretch goals
- Include activity metrics
- Define leading indicators

## 📊 Output Format

### Format Type
Complete issue following @templates/business/sales-issue-template.md

### Structure
1. Sales objectives
2. Pipeline analysis
3. Process improvements
4. Enablement plan
5. Revenue targets
6. Success metrics

#### Financial Content
**Indicators**: Budget spreadsheets, expense reports, revenue projections, cost analyses, investment proposals
**Extract**: Financial goals, cash flows, optimization opportunities
**Execute workflow:**

# 🏗️ Make Finance Issue: Transform Numbers Into Financial Plans
> 💡 *Convert financial reports, budgets, or cost discussions into actionable finance issues.*

## 🎯 End Goal
Transform input content into a complete finance issue that:
- Captures financial objectives from source
- Maps money flows clearly
- Identifies optimization opportunities
- Establishes financial controls
- Follows @templates/business/finance-issue-template.md structure

## 📋 Request
Transform financial content into an issue by:
1. Extracting financial goals
2. Analyzing cash flows
3. Identifying cost savings
4. Mapping investment needs
5. Creating financial metrics
6. Structuring per finance template

### Deliverables
- Complete finance issue document
- Cash flow analysis
- Budget breakdown
- Cost optimization plan
- Financial metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Financial Goals**: What targets exist?
- **Current Numbers**: What's the baseline?
- **Cash Flow**: How does money move?
- **Cost Structure**: Where does money go?
- **Revenue Sources**: Where does money come from?
- **Constraints**: What limitations exist?

### Step 2: Financial Mapping
Extract from content:
- Revenue streams
- Cost categories
- Working capital needs
- Investment requirements
- Funding sources

### Step 3: Optimization Analysis
Build from descriptions:
- Cost reduction opportunities
- Revenue growth potential
- Efficiency improvements
- Investment priorities
- Risk factors

### Step 4: Control Framework
Identify needs:
- Budget controls
- Approval processes
- Reporting requirements
- Compliance needs
- Audit trails

### Step 5: Metric Development
Generate measures:
- Profitability metrics
- Liquidity ratios
- Efficiency indicators
- Growth metrics
- Risk measures

## 📏 Instructions

### WHEN analyzing financial content
- Look for specific numbers
- Identify trends and patterns
- Note variances from plan
- Find optimization mentions

### WHEN structuring improvements
- Focus on cash impact
- Prioritize by ROI
- Consider timing of changes
- Plan for contingencies

### WHEN creating metrics
- Use standard ratios
- Set realistic targets
- Include early warnings
- Define thresholds

## 📊 Output Format

### Format Type
Complete issue following @templates/business/finance-issue-template.md

### Structure
1. Financial objectives
2. Current position
3. Money flow analysis
4. Optimization plan
5. Investment priorities
6. Success metrics

#### People Content
**Indicators**: Team feedback, hiring requests, skill assessments, training needs, performance reviews
**Extract**: Team needs, capability gaps, development opportunities
**Execute workflow:**

# 🏗️ Make People Issue: Transform Feedback Into Team Plans
> 💡 *Convert HR discussions, team feedback, or organizational needs into actionable people issues.*

## 🎯 End Goal
Transform input content into a complete people issue that:
- Captures team needs from source
- Maps capability gaps clearly
- Identifies development opportunities
- Establishes team success metrics
- Follows @templates/business/people-issue-template.md structure

## 📋 Request
Transform people content into an issue by:
1. Extracting team objectives
2. Analyzing capability gaps
3. Identifying hiring needs
4. Mapping development plans
5. Creating team metrics
6. Structuring per people template

### Deliverables
- Complete people issue document
- Team capability analysis
- Hiring/development plan
- Cultural considerations
- Success metrics

## 🔄 Workflow

### Step 1: Content Analysis
Analyze source for:
- **Team Needs**: What's mentioned about people?
- **Skill Gaps**: What capabilities are missing?
- **Performance Issues**: What problems exist?
- **Growth Needs**: What development is needed?
- **Cultural Factors**: What team dynamics appear?
- **Constraints**: What limitations exist?

### Step 2: Team Mapping
Extract from content:
- Current headcount
- Role distribution
- Skill inventory
- Performance levels
- Team dynamics

### Step 3: Gap Analysis
Build from descriptions:
- Missing roles
- Skill deficiencies
- Capacity constraints
- Leadership gaps
- Cultural issues

### Step 4: Development Planning
Identify needs:
- Training requirements
- Mentorship opportunities
- Career paths
- Performance improvements
- Team building

### Step 5: Success Framework
Generate measures:
- Hiring metrics
- Performance indicators
- Engagement scores
- Retention rates
- Development progress

## 📏 Instructions

### WHEN analyzing people content
- Look for team mentions
- Identify skill references
- Note performance issues
- Find cultural indicators

### WHEN structuring improvements
- Focus on critical gaps
- Balance hiring vs development
- Consider team dynamics
- Plan for succession

### WHEN creating metrics
- Use team KPIs
- Set development goals
- Include engagement measures
- Define retention targets

## 📊 Output Format

### Format Type
Complete issue following @templates/business/people-issue-template.md

### Structure
1. People objectives
2. Team assessment
3. Capability gaps
4. Hiring/development plan
5. Cultural initiatives
6. Success metrics

### Step 2: Domain Determination Strategy

#### Primary Analysis
1. Scan for domain-specific terminology
2. Identify the main problem or goal
3. Look for stakeholder types mentioned
4. Consider the business context

#### Mixed Domain Handling
When content spans multiple domains:
1. Identify the primary domain (main focus)
2. Note secondary domains for cross-references
3. Create primary issue type first
4. Suggest related issues if needed

#### Ambiguous Content
If domain is unclear:
1. Look for action verbs and outcomes
2. Consider who would own this work
3. Default to most logical domain
4. Ask user for clarification if needed

### Step 3: Execute Transformation
Once domain is determined:
1. Apply the specialized make workflow
2. Extract domain-specific elements
3. Map to appropriate template structure
4. Generate complete issue document

## 📊 Extraction Patterns by Domain

### Technical Extraction
- **Look for**: Functions, classes, endpoints, data flows
- **Map to**: Actors, components, interactions
- **Structure as**: Requirements → Actor Flow → Deliverables

### Operational Extraction
- **Look for**: Steps, dependencies, resources, timelines
- **Map to**: Current state, future state, gaps
- **Structure as**: Requirements → Process Flow → Deliverables

### Marketing Extraction
- **Look for**: Audiences, messages, channels, metrics
- **Map to**: Objectives, strategies, tactics
- **Structure as**: Marketing Objectives → Campaign Flow → Deliverables

### Sales Extraction
- **Look for**: Stages, conversions, blockers, tools
- **Map to**: Pipeline, enablement, targets
- **Structure as**: Sales Objectives → Sales Flow → Deliverables

### Financial Extraction
- **Look for**: Numbers, trends, variances, forecasts
- **Map to**: Current position, targets, plans
- **Structure as**: Financial Objectives → Money Flow → Deliverables

### People Extraction
- **Look for**: Roles, skills, gaps, growth
- **Map to**: Current team, needs, development
- **Structure as**: People Objectives → People Flow → Deliverables

## 🎯 Transformation Process

### Content Processing Steps
1. **Parse source material** completely
2. **Identify all relevant elements** for the domain
3. **Organize by template sections** for that type
4. **Fill gaps with reasonable defaults** where needed
5. **Generate structured output** following template

### Quality Checks
- Ensure all mentioned requirements captured
- Verify flows are complete and logical
- Check deliverables are concrete
- Confirm success criteria are measurable
- Validate structure matches template

## 📏 Transformation Rules

### ALWAYS extract
- Explicit requirements and goals
- Implicit needs and assumptions
- Stakeholders and interactions
- Constraints and dependencies
- Success indicators

### NEVER ignore
- Edge cases mentioned
- Risks or concerns raised
- Timeline references
- Budget implications
- Technical constraints

## ✅ Success Criteria
- Correct domain identified from content
- All relevant information extracted
- Appropriate template structure applied
- Gaps filled with sensible defaults
- Complete issue ready for review
