# 🤖 Ultra Wide Turbo Agent Workspace

> A structured framework for GPT agents to maintain context, follow processes, and deliver consistent results through well-defined protocols and documentation patterns.

## 📑 Table of Contents
1. [Quick Start](#-quick-start)
2. [Framework Overview](#-framework-overview)
3. [Key Features](#-key-features)
4. [Getting Started](#-getting-started)
5. [Available Protocols](#-available-protocols)
6. [Best Practices](#-best-practices)
7. [Core Documents](#-core-documents)
8. [System Prompt](#-system-prompt)
9. [Utility Scripts](#-utility-scripts)

## 🚀 Quick Start

1. Copy the framework files to your workspace:
```bash
./copy-framework.sh
```
- Default target is one folder up (`../`)
- Enter custom target directory or press Enter for default
- Review files to be copied
- Confirm to proceed

2. Archive workspace files when needed:
```bash
./archive.sh
```
- Default source is one folder up (`../`)
- Default target is `turbo-archive` in current directory
- Review files to be archived
- Confirm to proceed

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

1. **Quality Training** (out of our hands)
   - Trained on relevant data
   - Proper model capabilities
   - Good base understanding

2. **Clear Direction**
   - Well-defined requirements
   - Structured processes
   - Clear documentation
   - Proper templates
   - Small, clear task scope

3. **Maintained Focus**
   - Regular progress tracking
   - Consistent documentation
   - Clear communication
   - Process adherence
   - Preserved context across sessions
   - Active context awareness
   - Proper state management

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
   The agent follows a milestone-based workflow:
   ```
   Requirements:
   - "Use plx-start for new projects"
   - "Use plx-refine to analyze requirements"
   
   Development:
   - Complete milestone tasks
   - Run tests at completion
   - Fix any issues
   - Present results
   
   Completion:
   - "Use plx-finish when done"
   - "Use plx-archive to preserve state"
   ```

4. **During Development**
   - Write tests first
   - Complete milestone tasks
   - Run tests at completion
   - Present results for review

## 📋 Available Protocols

| Protocol | Purpose | Key Features |
|----------|---------|--------------|
| `plx-start` | Initialize new tasks | - Sets up documentation<br>- Writes initial tests<br>- Creates test plan<br>- Verifies readiness |
| `plx-document` | Create documentation | - Follows standard patterns<br>- Includes test docs<br>- Maintains consistency<br>- Verifies quality |
| `plx-refine` | Analyze requirements | - Maps relationships<br>- Defines properties<br>- Plans implementation<br>- Validates completeness |
| `plx-content` | Prepare social content | - Educational focus<br>- Technical accuracy<br>- Multi-platform structure<br>- Visual requirements |
| `plx-collect` | Gather resources | - Processes user input<br>- Organizes resources<br>- Links relationships<br>- Maintains categories |
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
| `your-resources.md` | Resource management | - Categorized resources<br>- External references<br>- Tool documentation<br>- Learning materials |
| `our-content.md` | Content collection | - Social media content<br>- Educational focus<br>- Multi-platform structure<br>- Visual requirements |
| `our-hours.md` | Work time tracking | - Session logging<br>- Progress tracking<br>- Time monitoring<br>- Milestone updates |
| `the-refinement-process.md` | Requirements breakdown | - Breakdown guidelines<br>- Link management<br>- Relationship tracking<br>- Clear structure |
| `the-development-process.md` | Implementation guidance | - TDD workflow<br>- Quality guidelines<br>- Testing approach<br>- Best practices |
| `the-testing-process.md` | Testing standards | - Test organization<br>- Test patterns<br>- Coverage guidelines<br>- Quality assurance |
| `the-communication-process.md` | Interaction guidelines | - Response formats<br>- Status updates<br>- Error handling<br>- Clear communication |

## 🤖 System Prompt

The framework includes a comprehensive system prompt (`system-prompt.md`) that guides agent behavior:

1. **Core Development Flow**
   - Ensure proper requirements (plx-start/plx-refine)
   - Work through milestones
   - Only interact at milestone completion
   - Present results and get confirmation

2. **Operating Guidelines**
   - Complete full milestones
   - Run tests before check-in
   - Fix issues when found
   - Document progress

3. **Default Workflows**
   ```
   New Projects:
   plx-start/plx-refine -> establish requirements -> begin development

   Milestone Development:
   work -> complete milestone -> run tests -> present results

   Content Creation:
   plx-content -> process input -> create package -> add to our-content.md

   Resource Collection:
   plx-collect -> process input -> document resources -> update your-resources.md

   Completion:
   verify all -> run tests -> present results
   ```

4. **Response Formats**
   ```
   Milestone Completion:
   Milestone: [Name]
   Completed:
   - [Achievement 1]
   - [Achievement 2]
   Tests: [Status]
   Next Milestone: [Name]

   Blockers:
   Milestone: [Current]
   Blocker: [Description]
   Attempted: [Solutions Tried]
   Need: [What's Required]

   Content Creation:
   Content: [Topic]
   Type: [Platform]
   Source: [References]
   Status: [Draft/Ready]
   ```

The system prompt ensures consistent operation with clear milestone boundaries.

## 🛠 Utility Scripts

### Copy Framework (`copy-framework.sh`)

Copies all framework files to a target directory:
- Source files: `your-*.md`, `our-*.md`, `plx-*.md`, `the-*.md`, `system-prompt.md`
- Default target: `../` (one folder up)
- Shows files to be copied before proceeding
- Asks for confirmation before copying

### Archive Workspace (`archive.sh`)

Archives your workspace files to preserve state:
- Source directory defaults to `../` (one folder up)
- Target directory defaults to `turbo-archive` in current directory
- Shows files to be archived before proceeding
- Asks for confirmation before moving files