# 🤖 Ultra Wide Turbo Agent Workspace

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Framework Overview](#-framework-overview)
2. [Key Features](#-key-features)
3. [Getting Started](#-getting-started)
4. [Available Protocols](#-available-protocols)
5. [Best Practices](#-best-practices)
6. [Core Documents](#-core-documents)
7. [System Prompt](#-system-prompt)

## 🔍 Framework Overview

This framework enhances your AI agent's capabilities by providing:
1. Test-driven development with implementation verification
2. Autonomous task execution with test validation
3. Persistent memory with optimized structure
4. Clear requirements and progress tracking
5. Consistent documentation patterns
6. Comprehensive project finalization
7. State preservation and workspace management
8. Work hours and progress tracking

We believe AI agents perform at their best when three key elements align:

1. **Test-Driven Development** (core principle)
   - Write tests first
   - Implement features
   - Verify implementations
   - Maintain coverage

2. **Clear Direction**
   - Well-defined milestones
   - Test requirements
   - Clear documentation
   - Proper templates

3. **Efficient State Management**
   - Main files (current state)
   - Context files (supporting info)
   - History files (past decisions)
   - Test results and coverage

## 🌟 Key Features

1. **Smart Memory Management**
   - Current state in main files
   - Supporting context in .context.md
   - Historical data in .history.md
   - Test history and results

2. **Structured Documentation**
   - Consistent formatting
   - Clear relationships
   - Version management
   - Test documentation

3. **Process Clarity**
   - Well-defined steps
   - Test requirements
   - Status tracking
   - Progress verification

4. **Test-Driven Workflow**
   - Write tests first
   - Track pending tests
   - Implement features
   - Verify completeness

5. **Work Tracking**
   - Session logging
   - Progress monitoring
   - Time tracking
   - Milestone tracking

## 🚀 Getting Started

1. **Setup**
   1. Choose your workspace folder
   2. Ensure your AI agent has access to all files
   3. Verify files are properly indexed in your IDE/editor
   4. Define tests and milestones

3. **Using Protocols**
   The agent will work autonomously, following TDD:
   - "Please follow plx-start to write initial tests"
   - "Use plx-test to implement pending tests"
   - "Follow plx-next to continue development"
   - "Run plx-finish when complete"
   - "Use plx-archive to preserve state"
   - "Run plx-reset to start fresh"
   - "Use plx-log to record hours"

4. **During Development**
   - Write tests first
   - Let agent implement
   - Verify completeness
   - Review at milestones
   - Log work sessions

## 📋 Available Protocols

| Protocol | Purpose | Key Features |
|----------|---------|--------------|
| `plx-start` | Initialize new tasks | - Sets up documentation<br>- Writes initial tests<br>- Creates test plan<br>- Verifies readiness |
| `plx-document` | Create documentation | - Follows standard patterns<br>- Includes test docs<br>- Maintains consistency<br>- Verifies quality |
| `plx-pause` | Preserve current state | - Optimizes file sizes<br>- Records test status<br>- Creates handoff notes<br>- Enables smooth resumption |
| `plx-resume` | Continue work | - Loads all versions<br>- Checks test state<br>- Maintains progress<br>- Ensures alignment |
| `plx-focus` | Get back on track | - Evaluates progress<br>- Verifies tests<br>- Maintains momentum<br>- Solves blockers |
| `plx-sync` | Verify alignment | - Checks file health<br>- Runs test suite<br>- Validates progress<br>- Maintains quality |
| `plx-add` | Add new content | - Processes additions<br>- Updates tests<br>- Maintains consistency<br>- Verifies changes |
| `plx-next` | Execute next task | - Autonomous execution<br>- Test verification<br>- Progress validation<br>- Efficient workflow |
| `plx-test` | Verify tests | - Finds pending tests<br>- Implements placeholders<br>- Validates coverage<br>- Reports results |
| `plx-optimise` | Optimize content | - Manages file sizes<br>- Preserves context<br>- Maintains relationships<br>- Improves structure |
| `plx-finish` | Finalize project | - Comprehensive checks<br>- Documentation updates<br>- Quality assurance<br>- Project completion |
| `plx-archive` | Archive workspace | - Structured archiving<br>- State preservation<br>- Relationship maintenance<br>- Clear organization |
| `plx-reset` | Reset workspace | - State preservation<br>- Clean workspace<br>- Original restoration<br>- History maintenance |
| `plx-log` | Record work hours | - Session tracking<br>- Progress monitoring<br>- Time logging<br>- Milestone tracking |

## ⚡ Best Practices

1. **Test-First Development**
   - Write tests before code
   - Track pending tests
   - Implement thoroughly
   - Verify completeness

2. **Effective Usage**
   - Let agent implement
   - Trust test results
   - Monitor coverage
   - Review completeness

3. **Quality Assurance**
   - Run tests frequently
   - Verify implementations
   - Maintain coverage
   - Guide direction

4. **Work Tracking**
   - Log sessions regularly
   - Track progress
   - Monitor time
   - Document milestones

## 📚 Core Documents

| Document | Purpose | Key Features |
|----------|---------|--------------|
| `your-memory.md` | Persistent memory bank | - Append-only log of decisions<br>- Timestamped entries<br>- Links to requirements<br>- Historical context |
| `your-todo-list.md` | Task tracking | - Milestone organization<br>- Numbered tasks<br>- Status tracking<br>- Requirement links |
| `your-requirements.md` | Requirements management | - Structured templates<br>- Links to todos/tests<br>- Status tracking<br>- Clear organization |
| `our-hours.md` | Work time tracking | - Session logging<br>- Progress tracking<br>- Time monitoring<br>- Milestone updates |
| `the-refinement-process.md` | Requirements breakdown | - Breakdown guidelines<br>- Link management<br>- Relationship tracking<br>- Clear structure |
| `the-development-process.md` | Implementation guidance | - TDD workflow<br>- Quality guidelines<br>- Testing approach<br>- Best practices |
| `the-testing-process.md` | Testing standards | - Test organization<br>- Test patterns<br>- Coverage guidelines<br>- Quality assurance |
| `the-communication-process.md` | Interaction guidelines | - Response formats<br>- Status updates<br>- Error handling<br>- Clear communication |

## 🤖 System Prompt

The framework includes a comprehensive system prompt (`system-prompt.md`) that guides agent behavior:

1. **Core Principles**
   - Test-Driven Development
   - Autonomous Operation
   - Context Management

2. **Operating Guidelines**
   - Task Execution
   - Progress Management
   - Communication Style
   - Work Tracking

3. **Default Workflows**
   ```
   New Features:
   plx-start -> write tests -> plx-next -> implement -> plx-test -> verify -> plx-sync

   Ongoing Work:
   plx-resume -> check context -> plx-next -> continue -> plx-test -> verify

   Milestones:
   plx-test -> verify all -> plx-sync -> check -> plx-pause -> await
   ```

4. **Response Formats**
   ```
   Task Updates:
   Status: [Phase]
   Progress: [%]
   Next: [Action]
   Blockers: [Any]

   Test Results:
   Tests: [Pass/Fail]
   Coverage: [%]
   Pending: [Count]
   Action: [Next]

   Milestone Completion:
   Milestone: [Name]
   Achievements: [List]
   Test Status: [Summary]
   Next: [Awaiting]
   ```

The system prompt ensures consistent, high-quality operation across all agents using this framework.
