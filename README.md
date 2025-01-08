# 🤖 Ultra Wide Turbo Workspace

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
   - Implement thoroughly
   - Run tests autonomously
   - Verify completeness
   - Only ask user when:
     - Told not to run tests
     - Missing permissions
     - Need specific setup/input
     - Can't access resources

5. **Work Tracking**
   - Session logging
   - Progress monitoring
   - Time tracking
   - Milestone tracking

## 🚀 Getting Started

1. **Setup**
   1. Choose a workspace folder for your project
   2. Copy the framework files into your workspace
   3. Make sure your AI agent can access the files
   4. The agent will use these files to maintain context

2. **Using The Framework**
   - Start by telling the agent what you want to build
   - The agent will use `plx-` commands to:
     - Analyze requirements
     - Create test plans
     - Track progress
     - Maintain documentation
     - Keep everything in sync
   - All work is documented in the `your-` files:
     - Requirements in `your-requirements.md`
     - Tasks in `your-todo-list.md`
     - Context in `your-memory.md`
     - Resources in `your-resources.md`

3. **Best Practices**
   - Let the agent use its protocols
   - Trust the test-driven workflow
   - Review the `your-` files to track progress
   - Use `plx-` commands when needed
   - Keep the workspace files organized

## 📋 Available Protocols

| Protocol | Purpose | Key Features |
|----------|---------|--------------|
| `plx-start` | Initialize new tasks | - Sets up documentation<br>- Writes initial tests<br>- Creates test plan<br>- Verifies readiness |
| `plx-document` | Create documentation | - Follows standard patterns<br>- Includes test docs<br>- Maintains consistency<br>- Verifies quality |
| `plx-refine` | Analyze requirements | - Maps relationships<br>- Defines properties<br>- Plans implementation<br>- Validates completeness |
| `plx-content` | Prepare social content | - Educational focus<br>- Technical accuracy<br>- Multi-platform structure<br>- Visual requirements |
| `plx-collect` | Gather resources | - Processes user input<br>- Organizes resources<br>- Links relationships<br>- Maintains categories |
| `plx-ask-smarter-agent` | Get help from smarter agent | - Details current issue<br>- Provides full context<br>- Lists all attempts<br>- Shares understanding |
| `plx-stick-to-the-process` | Realign with task process | - Checks current state<br>- Returns to last good step<br>- Enforces order<br>- Prevents shortcuts |
| `plx-pause` | Preserve current state | - Optimizes file sizes<br>- Records test status<br>- Creates handoff notes<br>- Enables smooth resumption |
| `plx-resume` | Continue work | - Loads all versions<br>- Checks test state<br>- Maintains progress<br>- Ensures alignment |
| `plx-focus` | Evaluate current task | - Reviews current milestone<br>- Questions approach<br>- Finds improvements<br>- Suggests optimizations |
| `plx-ask` | Self-check information needs | - Reviews current task<br>- Identifies unclear points<br>- Improves understanding<br>- Enhances approach |
| `plx-sync` | Verify alignment | - Checks file health<br>- Runs test suite<br>- Validates progress<br>- Maintains quality |
| `plx-add` | Add new content | - Processes additions<br>- Updates tests<br>- Maintains consistency<br>- Verifies changes |
| `plx-next` | Execute next task | - Autonomous execution<br>- Test verification<br>- Progress validation<br>- Efficient workflow |
| `plx-test` | Verify tests | - Finds pending tests<br>- Implements placeholders<br>- Validates coverage<br>- Reports results |
| `plx-optimise` | Optimize content | - Manages file sizes<br>- Preserves context<br>- Maintains relationships<br>- Improves structure |
| `plx-finish` | Finalize project | - Comprehensive checks<br>- Documentation updates<br>- Quality assurance<br>- Project completion |
| `plx-archive` | Archive workspace | - Structured archiving<br>- State preservation<br>- Relationship maintenance<br>- Clear organization |
| `plx-reset` | Reset workspace | - State preservation<br>- Clean workspace<br>- Original restoration<br>- History maintenance |
| `plx-log` | Record work hours | - Session tracking<br>- Progress monitoring<br>- Time logging<br>- Milestone tracking |
| `plx-release` | Prepare and execute release | - Stages all changes<br>- Updates documentation<br>- Ensures consistency<br>- Manages version control |
| `plx-commit` | Handle git commits | - Reviews changes<br>- Formats messages<br>- Executes commit<br>- Pushes changes |
| `plx-config` | Configure agent behavior | - Customizes framework<br>- Adapts to project needs<br>- Updates workspace files<br>- Maintains consistency |

## ⚡ Best Practices

1. **Test-First Development**
   - Write tests before code
   - Track pending tests
   - Implement thoroughly
   - Run tests autonomously
   - Only ask user when:
     - Told not to run tests
     - Missing permissions
     - Need specific setup
     - Can't access resources
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

The framework includes a system prompt (`_system-prompt.md`) that tells the agent:

1. **Core Documents**
   - Which files to maintain (`your-` files)
   - Which processes to follow (`the-` files)

2. **Core Workflow**
   - Follow the task process
   - Get feedback before changes
   - Keep todos updated

3. **PLX Commands**
   - Sacred protocols in `_plx-*.md` files
   - Each defines exact steps to take
   - Follow them precisely when user invokes

4. **Rules**
   - What to always do
   - What to never do
   - How to handle files

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