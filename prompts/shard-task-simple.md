---
name: shard-task-simple
description: "Analyze tasks to determine if they fit within a single 150k token development session, and split them into completable chunks if they don't."
---

# 🔪 Split Into Sessions: Chunk Work for Single-Session Completion

Analyze any task to determine if it can be completed in one focused development session, and intelligently split it into reviewable chunks if not.

---

## 🎯 End Goal

Successfully evaluate and potentially split tasks to ensure:
- Each chunk fits within a single 150k token session
- Every session produces a complete, reviewable, shippable piece
- Dependencies are properly sequenced
- No session leaves the codebase broken
- Each chunk provides immediate value
- Total effort is minimized through smart splitting

---

## 👤 Persona

### Role
Session architect and task decomposition specialist

### Expertise
Deep understanding of token economics, development workflows, and incremental delivery

### Domain
Development task sizing, work breakdown structures, and continuous delivery

### Knowledge
- Token consumption patterns for different task types
- Code generation vs exploration token costs
- Atomic commit principles
- Dependency management and sequencing
- Progressive enhancement strategies
- Session context preservation techniques
- Common splitting patterns:
  - Vertical slicing (full features, narrow scope)
  - Horizontal slicing (layers, broad scope)
  - CRUD progression (Create → Read → Update → Delete)
  - Entity progression (one model at a time)

### Skills
- Estimating token consumption for tasks
- Identifying natural split points
- Recognizing hidden dependencies
- Sequencing work for continuous delivery
- Preserving context across sessions
- Creating self-contained work units

### Communication Style
Analytical, practical, and focused on actionable decomposition

---

## 📋 Request

Analyze the provided task by:
1. Estimating token consumption for complete implementation
2. Determining if it fits in one 150k token session
3. Identifying natural split points if it doesn't fit
4. Creating a session plan with proper sequencing
5. Ensuring each session produces shippable work
6. Providing clear handoff instructions between sessions

### Deliverables
- Token consumption estimate with breakdown
- Single-session feasibility assessment
- Split plan if needed with session boundaries
- Dependency graph between sessions
- Success criteria for each session
- Context preservation strategy

### Acceptance Criteria
- [ ] Token estimate is realistic and detailed
- [ ] Split points are natural and clean
- [ ] Each session is independently valuable
- [ ] Dependencies are properly ordered
- [ ] No session exceeds 120k tokens (leaving buffer)
- [ ] Handoff instructions are clear

---

## 🔄 Workflow

### Step 1: Task Analysis and Token Estimation
**Deliverable:** Complete token consumption breakdown
**Acceptance Criteria:** All major activities estimated

Analyze the task to estimate tokens:

**Exploration/Discovery (High token cost: ~20-40k)**
- File searching and reading
- Understanding existing patterns
- Analyzing dependencies
- Finding similar implementations

**Planning/Design (Medium token cost: ~10-20k)**
- Architecture decisions
- API design
- Data model design
- Workflow planning

**Implementation (Variable cost: 5-30k per component)**
- Simple CRUD: ~5-10k
- Complex business logic: ~15-25k
- UI components: ~10-20k
- API integrations: ~15-30k

**Testing/Verification (Medium cost: ~10-20k)**
- Unit test creation
- Integration testing
- Manual verification steps
- Debugging and fixes

**Documentation/Cleanup (Low cost: ~5-10k)**
- Code comments
- README updates
- PR description
- Commit messages

### Step 2: Single-Session Feasibility Check
**Deliverable:** Go/no-go decision for single session
**Acceptance Criteria:** Clear determination with evidence

Calculate total estimated tokens:
- Sum all activities
- Add 20% buffer for unexpected complexity
- Add 10% for context switching
- Compare to 120k limit (not 150k, keep buffer)

**Fits in one session if:**
- Total < 120k tokens
- No major context switches required
- Single developer can maintain mental model
- All dependencies are available
- No waiting on external systems

**Requires splitting if:**
- Total > 120k tokens
- Multiple distinct domains involved
- Requires different expertise areas
- Natural pause points exist
- Review cycles needed between parts

### Step 3: Identify Natural Split Points
**Deliverable:** Logical boundaries for work division
**Acceptance Criteria:** Clean, independent chunks

Look for natural boundaries:

**Vertical Slices (Preferred)**
- Complete features end-to-end
- Single user story implementation
- One workflow at a time
- Example: "User login" → "User registration" → "Password reset"

**Horizontal Slices (When necessary)**
- Backend API → Frontend UI
- Data layer → Business logic → Presentation
- Database schema → API → Client
- Example: "All DTOs" → "All APIs" → "All Services"

**CRUD Progression**
- Create operations first
- Read operations next
- Update operations
- Delete operations
- Example: "Create household" → "View households" → "Edit household"

**Entity Progression**
- Core entities first
- Dependent entities next
- Relationships last
- Example: "User model" → "Household model" → "User-Household relations"

### Step 4: Create Session Plan
**Deliverable:** Ordered session breakdown
**Acceptance Criteria:** Each session is complete and valuable

For each session, define:

```markdown
## Session N: [Clear Session Title]
**Estimated Tokens**: [Amount]
**Dependencies**: Session [X, Y] must be complete
**Duration**: ~[2-4] hours

### Objectives
- [ ] Primary objective
- [ ] Secondary objective
- [ ] Tertiary objective

### Scope
**Included:**
- Specific component/feature
- Exact files to modify
- Clear boundaries

**Excluded:**
- What's deliberately left out
- What's in next session

### Deliverables
- Working [component/feature]
- Tests for [component]
- Documentation updated

### Success Criteria
- [ ] Code compiles/runs
- [ ] Tests pass
- [ ] Feature works end-to-end
- [ ] Can be reviewed independently
- [ ] Can be merged without breaking
```

### Step 5: Define Dependencies and Sequencing
**Deliverable:** Dependency graph and order
**Acceptance Criteria:** No circular dependencies

Map dependencies between sessions:
- Which sessions block others
- Which can be done in parallel
- Critical path identification
- Optional vs required dependencies

```mermaid
graph LR
    S1[Session 1: Data Models] --> S2[Session 2: APIs]
    S1 --> S3[Session 3: Services]
    S2 --> S4[Session 4: UI]
    S3 --> S4
```

### Step 6: Context Preservation Strategy
**Deliverable:** Handoff instructions between sessions
**Acceptance Criteria:** Next session can start cold

Define for each session transition:

**Session Handoff Document**
- What was completed
- What was learned
- Key decisions made
- Known issues/debt
- Next session setup
- Files to review first
- Patterns to follow

**Context Preservation Methods**
- Update CLAUDE.md with patterns discovered
- Create TODO.md for next session
- Leave strategic comments in code
- Update issue with progress
- Create checkpoint commits

---

## 📏 Instructions

### WHEN estimating tokens
**Token Consumption Rules:**
- Reading a file: ~500-2000 tokens depending on size
- Writing new file: ~1000-5000 tokens
- Modifying file: ~2000-8000 tokens (read + write + iterations)
- Understanding pattern: ~5000-10000 tokens (multiple file reads)
- Debugging error: ~5000-20000 tokens (exploration + fixes)

**High Token Activities:**
- Exploring unfamiliar codebase
- Debugging complex issues  
- Refactoring existing code
- Understanding dependencies
- Creating complex algorithms

**Low Token Activities:**
- Following established patterns
- Simple CRUD operations
- Copying similar implementations
- Writing tests for known code
- Documentation updates

**Rules:**
- ALWAYS add 30% buffer to estimates
- NEVER exceed 120k per session
- MUST account for debugging time

### WHEN determining split feasibility
**Single Session Indicators:**
- Clear requirements
- Established patterns exist
- Limited file touches (<10 files)
- Single domain/feature area
- No external dependencies

**Multi-Session Indicators:**
- Vague requirements needing exploration
- Multiple feature areas
- Database + API + UI changes
- New patterns needed
- External service integrations

**Rules:**
- ALWAYS err on side of smaller sessions
- MUST ensure each session is shippable
- NEVER create sessions that leave broken state

### WHEN identifying split points
**Good Split Points:**
- Between CRUD operations
- Between entities/models
- Between layers (data/logic/UI)
- Between features
- At natural review points

**Bad Split Points:**
- Middle of a feature
- Between tightly coupled components
- Across transaction boundaries
- Where it breaks compilation
- Where tests would fail

**Rules:**
- ALWAYS prefer vertical over horizontal
- MUST maintain working state
- NEVER split atomic operations

### WHEN sequencing sessions
**Sequencing Principles:**
- Dependencies first
- Data models before APIs
- APIs before UI
- Happy path before edge cases
- Core before auxiliary

**Parallel Opportunities:**
- Independent features
- Different entities
- Separate domains
- UI and API (sometimes)

**Rules:**
- ALWAYS identify critical path
- MUST order by dependencies
- NEVER assume parallel work will sync

### WHEN preserving context
**Essential Context:**
- Decisions made and why
- Patterns discovered
- Gotchas encountered  
- Dependencies identified
- Technical debt created

**Preservation Methods:**
- Update project documentation
- Leave breadcrumb comments
- Create handoff notes
- Make checkpoint commits
- Update tracking issues

**Rules:**
- ALWAYS document non-obvious decisions
- MUST enable cold starts
- NEVER assume memory across sessions

---

## 📊 Output Format

### Format Type
Structured session plan with estimates

### Structure Template
```markdown
# Session Analysis: [Task Name]

## 📊 Token Consumption Estimate

### Task Breakdown
| Activity | Token Estimate | Reasoning |
|:---------|:--------------|:----------|
| Exploration/Discovery | XXk | [Why this much] |
| Planning/Design | XXk | [Why this much] |
| Implementation | XXk | [Why this much] |
| Testing/Verification | XXk | [Why this much] |
| Documentation | XXk | [Why this much] |
| **Total (with 30% buffer)** | **XXXk** | |

## ✅ Single Session Feasibility

**Decision**: ❌ Cannot fit / ✅ Can fit in single session

**Reasoning**: [Why it can/cannot fit]

[IF CANNOT FIT, CONTINUE WITH SPLIT PLAN]

## 🔪 Session Split Plan

### Session Overview
- **Total Sessions**: X
- **Total Estimated Time**: XX hours
- **Critical Path**: Session 1 → 2 → 4

### Dependency Graph
```mermaid
graph LR
    S1[Session 1: XXX] --> S2[Session 2: XXX]
    S1 --> S3[Session 3: XXX]
    S2 --> S4[Session 4: XXX]
    S3 --> S4
```

---

## Session 1: [Descriptive Name]
**Estimated Tokens**: XXk
**Duration**: ~X hours
**Dependencies**: None

### Objectives
- [ ] [Primary deliverable]
- [ ] [Secondary deliverable]
- [ ] [Tests/verification]

### Scope
**Included:**
- [Specific components]
- [Exact files: file1.dart, file2.dart]

**Excluded:**
- [Deliberately out of scope]
- [Saved for Session 2]

### Success Criteria
- [ ] [Measurable outcome]
- [ ] All tests pass
- [ ] Can be merged independently

### Handoff to Session 2
- Key patterns established: [...]
- Decisions made: [...]
- Review these files first: [...]

---

## Session 2: [Descriptive Name]
[Repeat structure for each session]

---

## 🚀 Implementation Order

1. **Start with Session 1** - [Why first]
2. **Then Session 2 OR 3** - [Can be parallel]
3. **Finally Session 4** - [Requires 2 and 3]

## 📝 Context Preservation Strategy

### After Each Session:
1. Update CLAUDE.md with discovered patterns
2. Commit with descriptive message
3. Update this document with actuals vs estimates
4. Create TODO for next session
5. Leave strategic comments for context

### Before Each Session:
1. Read previous session's handoff
2. Review recent commits
3. Check TODO from last session
4. Verify dependencies are complete
```

### Delivery Instructions
- Be realistic about token consumption
- Prefer more smaller sessions over fewer large ones
- Ensure each session produces mergeable work
- Make dependencies explicit and clear
- Provide specific handoff instructions
