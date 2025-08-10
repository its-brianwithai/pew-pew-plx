---
name: create-project-instructions
description: "Systematically discover and document ONLY existing project conventions as concise, factual instruction files with line-by-line code references. Context window optimization is critical."
---

# 📚 Create Project Instructions: Document Existing Conventions Only
> 💡 *Extract ONLY factual, existing conventions from the codebase into ultra-concise instruction files. NO speculation, NO philosophy, NO rationale. Maximum 100 lines per file.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully create ultra-concise instruction files that:
- Document ONLY patterns found in actual code with file:line references
- Maximum 100 lines per file for context window optimization
- NO explanations, rationale, or philosophical discussions
- NO invented "best practices" not present in code
- ONLY factual observations with concrete examples
- Files under 2KB size limit

## 👤 Persona

### Role
Project convention analyst and documentation architect

### Expertise
Deep understanding of software architecture patterns, code organization principles, and documentation best practices across multiple programming paradigms

### Domain
Codebase analysis, pattern recognition, and developer documentation

### Knowledge
- Software design patterns and anti-patterns
- Framework-specific conventions and best practices
- Documentation standards and clarity principles
- Code organization methodologies
- Testing strategies and quality assurance
- Build systems and tooling configurations

### Skills
- Pattern recognition with line-by-line verification
- Factual extraction without interpretation
- Ultra-concise documentation (100 lines max)
- Evidence-based analysis only
- Context window optimization

### Communication Style
Factual, concise, evidence-based. NO philosophy, NO explanations, ONLY documented patterns

## 📋 Request
> 💡 *Verb-first activity request with deliverables and acceptance criteria*

Analyze the entire codebase to discover and document all conventions by:
1. **YOU PERSONALLY** scanning all relevant project files and structures
2. **YOU PERSONALLY** identifying patterns and conventions across different aspects
3. **YOU PERSONALLY** creating a discovery checklist for user confirmation
4. **THEN AND ONLY THEN** using agents to document approved conventions
5. Validating completeness and accuracy

**CRITICAL: Steps 1-3 MUST be done by YOU, not delegated to agents!**

### Deliverables
- Discovery checklist in `drafts/convention-discovery-checklist.md`
- Individual instruction files in `instructions/` subfolders
- Complete documentation of all discovered conventions

### Acceptance Criteria
- [ ] All major convention categories are discovered
- [ ] User has reviewed and approved the checklist
- [ ] Each convention type has detailed documentation
- [ ] Instruction files follow `{name}-{type}.md` naming
- [ ] Examples demonstrate real project usage
- [ ] No critical patterns are missed

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### ⚠️⚠️⚠️ CRITICAL WARNING ⚠️⚠️⚠️
**DO NOT DELEGATE INITIAL RESEARCH TO SUB-AGENTS!**
- Steps 1-3 MUST be done by YOU (the orchestrator) PERSONALLY
- Sub-agents lack context and will miss critical patterns
- Only use agents in Step 4 AFTER you've done the analysis
- If you try to delegate discovery, YOU WILL FAIL
### ⚠️⚠️⚠️ END WARNING ⚠️⚠️⚠️

### Step 1: Initial Project Analysis (DO IT YOURSELF)
**Deliverable:** Understanding of project structure and technology stack
**Acceptance Criteria:** Core technologies and frameworks identified

**🔴 YOU (THE ORCHESTRATOR) MUST DO THIS YOURSELF:**
- YOU scan project root for configuration files (package.json, pubspec.yaml, Cargo.toml, etc.)
- YOU identify primary language and framework
- YOU detect build tools and dependency managers
- YOU note testing frameworks and quality tools
- YOU document project type (web app, mobile, library, etc.)

**DO NOT create sub-tasks for this initial analysis!**

### Step 2: Deep Convention Analysis (CRITICAL - DO IT YOURSELF)
**Deliverable:** Thoroughly analyzed conventions with file:line references
**Acceptance Criteria:** Every pattern verified against actual code

**🔴 CRITICAL: YOU MUST DO THIS ANALYSIS YOURSELF - NO SUB-AGENTS!**
**The orchestrator (YOU) must personally:**
1. READ the actual source files yourself using Read/Grep/Glob tools
2. ANALYZE the patterns yourself by examining the code
3. EXTRACT conventions yourself with file:line references
4. DOCUMENT findings yourself before ANY agent execution

**⚠️ MANDATORY DEEP-DIVE CHECKLIST (DO YOURSELF):**
- [ ] YOU read ALL source files in primary directories
- [ ] YOU extract patterns that appear 3+ times with exact locations
- [ ] YOU document ONLY what exists, never what "should" exist
- [ ] YOU collect file:line references for every pattern
- [ ] YOU verify no speculation or interpretation added

**NEVER delegate initial analysis to sub-agents - they lack context!**

Analyze these core categories:

#### File Structure & Organization
- Directory structure patterns
- File naming conventions
- Module organization
- Feature vs layer organization
- Public vs private separation

#### Code Patterns
- Class/function naming conventions
- Variable naming patterns
- Comment styles and markers
- Code section organization
- Import/export patterns

#### Architecture Patterns
- State management approach
- Dependency injection patterns
- Service/repository patterns
- API/data layer organization
- Error handling strategies
- Response wrapper patterns

#### Data Flow
- DTOs and serialization
- Models vs entities
- Form management
- Validation patterns
- Data transformation layers

#### UI/UX Patterns
- Component organization
- Widget/component naming
- Theme system usage
- Responsive design patterns
- Navigation patterns
- Modal/dialog patterns

#### Testing Patterns
- Test file organization
- Test naming conventions
- Mocking strategies
- Test data patterns
- Coverage requirements

#### Build & Configuration
- Environment configuration
- Build scripts
- Code generation patterns
- Asset management
- Deployment configuration

#### Documentation
- Code documentation style
- README structure
- API documentation
- Inline documentation patterns
- Example provision

#### Quality & Standards
- Linting rules
- Formatting standards
- Git conventions
- PR/review process
- CI/CD patterns

### Step 3: Create Discovery Checklist
**Deliverable:** User-reviewable checklist of all discovered conventions
**Acceptance Criteria:** Clear, organized checklist ready for user review

Create `drafts/convention-discovery-checklist.md`:
```markdown
# 📋 Convention Discovery Checklist

Review and check the conventions you want documented for the developer agent.

## File Structure & Organization
- [ ] **Directory Structure**: [Describe discovered pattern]
  - Example: `lib/<feature>/<type>/` structure
- [ ] **File Naming**: [Describe pattern]
  - Example: `snake_case` with type suffixes `_service.dart`
[Continue for all discovered patterns...]

## Code Patterns
[List all discovered code patterns with examples]

[Continue for all categories...]
```

### Step 4: Parallel Agent Execution for Documentation Creation
**Deliverable:** All instruction files created simultaneously by specialized agents
**Acceptance Criteria:** Each checked convention has detailed documentation in the correct subfolder

**🔴 PREREQUISITE: You MUST have completed Steps 1-3 YOURSELF before this step!**
**Agents can ONLY document what YOU have already discovered and analyzed.**

#### 📐 CRITICAL: Parallel Execution Pattern
**This pattern enables TRUE parallel execution of multiple agents:**
- Multiple independent tasks that don't depend on each other
- Each task assigned to a specialized agent
- Results aggregated after completion
- Time-sensitive operations benefit from parallelization

**Implementation Structure:**
```xml
<!-- ALL agents MUST be in a SINGLE function_calls block for parallel execution -->
<function_calls>
  <invoke name="Task">
    <parameter name="subagent_type">agent-type-1</parameter>
    <parameter name="description">Brief description</parameter>
    <parameter name="prompt">Detailed CREATE prompt</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">agent-type-2</parameter>
    <parameter name="description">Brief description</parameter>
    <parameter name="prompt">Detailed CREATE prompt</parameter>
  </invoke>
  <!-- Continue for ALL agents in ONE block -->
</function_calls>
```

#### 🔴 CRITICAL CONSTRAINTS FOR ALL AGENTS
**IMPORTANT: Only use agents AFTER you've done the deep analysis yourself!**
**These constraints are NON-NEGOTIABLE for context window optimization:**
- MAXIMUM 100 lines per file (enforce hard limit)
- ONLY document patterns found in actual code
- MUST include file:line references for every pattern
- NO explanations, NO rationale, NO philosophy
- NO "best practices" unless explicitly coded
- NO interpretations or recommendations
- Format: Pattern → Example → File:Line references ONLY

#### Execute ALL Specialized Agents in Parallel
Launch all agents SIMULTANEOUSLY with STRICT BREVITY CONSTRAINTS:

```xml
<function_calls>
  <invoke name="Task">
    <parameter name="subagent_type">pattern-instruction-creator</parameter>
    <parameter name="description">Create pattern docs</parameter>
    <parameter name="prompt">CREATE pattern instruction files in instructions/patterns/ for patterns found in: [specific files]. CRITICAL CONSTRAINTS: MAXIMUM 100 lines per file. ONLY document what exists with file:line references. NO explanations, NO philosophy, NO rationale. Format: Pattern name, code example, file:line locations ONLY. Files must be under 2KB.</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">convention-instruction-creator</parameter>
    <parameter name="description">Create convention docs</parameter>
    <parameter name="prompt">CREATE convention files in instructions/conventions/. CRITICAL: MAX 100 lines. ONLY factual patterns with file:line refs. NO explanations. Format: Convention, example, locations. Under 2KB limit.</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">best-practice-instruction-creator</parameter>
    <parameter name="description">Create best practice docs</parameter>
    <parameter name="prompt">CREATE best practice files in instructions/best-practices/. CRITICAL: MAX 100 lines. ONLY practices actually found in code with file:line refs. NO invented practices. Under 2KB.</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">rule-instruction-creator</parameter>
    <parameter name="description">Create rule docs</parameter>
    <parameter name="prompt">CREATE rule files in instructions/rules/. CRITICAL: MAX 100 lines. ONLY rules enforced in actual code with file:line refs. NO speculation. Under 2KB.</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">guideline-instruction-creator</parameter>
    <parameter name="description">Create guideline docs</parameter>
    <parameter name="prompt">CREATE guideline files in instructions/guidelines/. CRITICAL: MAX 100 lines. ONLY guidelines evident in code with file:line refs. NO philosophy. Under 2KB.</parameter>
  </invoke>
  <invoke name="Task">
    <parameter name="subagent_type">standard-instruction-creator</parameter>
    <parameter name="description">Create standard docs</parameter>
    <parameter name="prompt">CREATE standard files in instructions/standards/. CRITICAL: MAX 100 lines. ONLY standards enforced in project with file:line refs. Under 2KB.</parameter>
  </invoke>
</function_calls>
```

**⚠️ CRITICAL RULES for Parallel Execution:**
- ALWAYS use a single `function_calls` block for parallel execution
- ALWAYS ensure agents are truly independent (no dependencies)
- ALWAYS provide complete prompts (agents can't communicate)
- ALWAYS verify results after parallel execution completes
- NEVER chain dependent agents in parallel
- NEVER use multiple separate function_calls for parallel work
- NEVER assume all agents will succeed
- NEVER skip verification of parallel results

#### 🔄 Agent Verification Loop Pattern
**Ensure agent deliverables are ACTUALLY created:**

This pattern ensures agents don't just analyze but actually CREATE their deliverables through verification and retry loops.

**Verification Flow:**
```
1. Execute agents (parallel)
2. Verify deliverables exist
3. Check deliverable quality
4. Identify gaps
5. Re-execute for missing items
6. Repeat until complete or max retries
```

#### Verification After Parallel Execution
After agents complete, VERIFY all files were created:

```bash
# Check each directory for created files
ls -la instructions/patterns/
ls -la instructions/conventions/
ls -la instructions/best-practices/
ls -la instructions/rules/
ls -la instructions/guidelines/
ls -la instructions/standards/

# For each directory, verify files exist and have content
for file in instructions/patterns/*.md; do
  if [[ ! -s "$file" ]]; then
    echo "Empty or missing: $file"
  fi
done
```

#### 🔴 CRITICAL: File Size Validation (MANDATORY)
```bash
# ENFORCE 2KB size limit for context window optimization
for dir in patterns conventions best-practices rules guidelines standards; do
  for file in instructions/$dir/*.md; do
    if [[ -f "$file" ]]; then
      size=$(wc -c < "$file")
      lines=$(wc -l < "$file")
      
      # REJECT files over 2KB or 100 lines
      if [[ $size -gt 2048 ]]; then
        echo "ERROR: File too large (${size} bytes): $file"
        echo "ACTION: Must regenerate with stricter constraints"
      fi
      
      if [[ $lines -gt 100 ]]; then
        echo "ERROR: File too long (${lines} lines): $file"
        echo "ACTION: Must regenerate within 100 line limit"
      fi
      
      # Check for philosophy/rationale (forbidden)
      if grep -iE "(philosophy|rationale|should|ideal|recommend|best practice)" "$file"; then
        echo "ERROR: Contains forbidden explanatory content: $file"
        echo "ACTION: Must regenerate with facts only"
      fi
      
      # Verify file:line references exist
      if ! grep -E "[a-zA-Z0-9_/]+\.(dart|ts|js|py|go|rs|swift):[0-9]+" "$file"; then
        echo "ERROR: Missing file:line references: $file"
        echo "ACTION: Must include concrete code locations"
      fi
    fi
  done
done
```

#### Re-execute for Failed Validation
If files fail size/content validation, re-run with STRICTER constraints:

```xml
<function_calls>
  <invoke name="Task">
    <parameter name="subagent_type">[specific-agent-that-failed]</parameter>
    <parameter name="prompt">RECREATE files that failed validation. CRITICAL: MAXIMUM 50 lines, under 1KB. ONLY facts with file:line refs. NO explanations. Format: pattern → example → locations.</parameter>
  </invoke>
</function_calls>
```

**⚠️ CRITICAL RULES for Verification:**
- ALWAYS verify after agent execution
- ALWAYS check both existence and content quality
- ALWAYS be specific in retry prompts
- ALWAYS set a maximum retry limit (3 attempts)
- NEVER assume agents completed work without checking
- NEVER skip verification for "simple" tasks
- NEVER accept partial deliverables without documentation

**Expected Directory Structure After Completion:**
```
instructions/
├── patterns/
│   ├── file-organization-patterns.md
│   ├── naming-convention-patterns.md
│   ├── state-management-patterns.md
│   ├── service-patterns.md
│   ├── api-patterns.md
│   ├── dto-patterns.md
│   └── component-patterns.md
├── conventions/
│   ├── git-conventions.md
│   ├── documentation-conventions.md
│   ├── code-comment-conventions.md
│   ├── testing-conventions.md
│   └── file-naming-conventions.md
├── best-practices/
│   ├── error-handling-best-practices.md
│   ├── performance-best-practices.md
│   ├── security-best-practices.md
│   ├── testing-best-practices.md
│   └── code-organization-best-practices.md
├── rules/
│   ├── critical-code-rules.md
│   ├── quality-standard-rules.md
│   ├── naming-rules.md
│   ├── structure-rules.md
│   └── dependency-injection-rules.md
├── guidelines/
│   ├── ui-design-guidelines.md
│   ├── responsive-design-guidelines.md
│   ├── theme-usage-guidelines.md
│   └── form-management-guidelines.md
└── standards/
    ├── code-quality-standards.md
    ├── documentation-standards.md
    └── testing-standards.md
```

**Note:** Each specialized agent has its own template structure - they will CREATE files with the appropriate format automatically.

### Step 5: Final Validation & Integration
**Deliverable:** Complete set of verified instruction files
**Acceptance Criteria:** All conventions documented and cross-linked

#### Content Validation
For each created file:
- Verify file has actual content (not empty)
- Check includes real examples from codebase
- Validate all required sections are complete
- Ensure no placeholder text remains

#### Cross-Linking
- Add wikilinks between related instructions
- Create index files if needed
- Ensure navigation between related concepts

#### Final Report
Document what was created:
```markdown
## Instruction Files Created
- Patterns: [count] files
- Conventions: [count] files  
- Best Practices: [count] files
- Rules: [count] files
- Guidelines: [count] files
- Standards: [count] files

## Coverage Report
- [✓] All discovered patterns documented
- [✓] Critical rules captured
- [✓] Best practices extracted
```

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN discovering conventions
**Best Practices:**
- **DO IT YOURSELF** - Never delegate initial discovery to agents
- Look for patterns that appear 3+ times
- Check both explicit rules and implicit patterns
- Examine recent code for current practices
- Review configuration files for standards

**Rules:**
- ALWAYS do the initial analysis YOURSELF using Read/Grep/Glob
- ALWAYS provide real examples from the project
- ALWAYS note exceptions to patterns
- NEVER delegate discovery to sub-agents (they miss context)
- NEVER assume conventions without evidence
- MUST verify patterns across multiple files YOURSELF

### WHEN creating the checklist
**Best Practices:**
- Group related conventions together
- Provide concrete examples for each item
- Include both major and minor patterns
- Make descriptions clear and specific

**Rules:**
- ALWAYS use checkboxes for user selection
- ALWAYS include example code or structure
- MUST organize hierarchically by category
- NEVER include speculative patterns

### WHEN executing parallel agents
**Best Practices:**
- Launch ALL agents in a SINGLE function_calls block
- Provide complete context to each agent
- Include specific file paths and examples
- Make prompts action-oriented (CREATE, WRITE, GENERATE)

**Rules:**
- ALWAYS use parallel execution for multiple agents
- ALWAYS verify file creation after execution
- MUST re-run agents if files are missing
- NEVER assume agents completed without checking

### WHEN documenting conventions
**Best Practices:**
- Enforce 100 line maximum per file
- Document only what exists in code
- Include file:line references for everything
- Reject files over 2KB immediately

**Rules:**
- ALWAYS enforce size limits (100 lines, 2KB)
- MUST verify file:line references exist
- NEVER include explanations or rationale
- NEVER document aspirational patterns
- ALWAYS regenerate oversized files
- MUST flag philosophy/recommendations for removal


## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown files with YAML frontmatter

### Structure Template
1. **Discovery Checklist** (`drafts/convention-discovery-checklist.md`)
2. **Instruction Files** (`instructions/[type]/[name]-[type].md`)
   - File naming: `{specific-name}-{instruction-type}.md`
   - Organized by type: `patterns/`, `conventions/`, `best-practices/`, `rules/`, `guidelines/`, `standards/`
   - Examples: `naming-convention-patterns.md`, `error-handling-best-practices.md`, `git-conventions.md`
3. **Developer Agent** (`agents/developer.md`)
   - References all instruction files via wikilinks with type subfolder paths

### Delivery Instructions
- Create checklist first for user review
- Wait for user confirmation on checked items
- Generate instruction files for approved items
- Build developer agent referencing all instructions
- Provide usage examples

---

# Usage Notes

## Universal Application
This prompt works for any project type:
- Web applications (React, Vue, Angular, etc.)
- Mobile apps (Flutter, React Native, Swift, Kotlin)
- Backend services (Node.js, Python, Go, Rust)
- Libraries and frameworks
- Full-stack applications

## Convention Categories
The prompt discovers conventions across:
- File structure and organization
- Naming patterns and styles
- Architecture and design patterns
- State management approaches
- Data flow and transformation
- UI/UX patterns and components
- Testing strategies
- Build and deployment
- Documentation standards
- Quality and code standards

## Adaptation Strategy
The prompt automatically adapts to:
- Project language and framework
- Team size and practices
- Domain-specific requirements
- Tool and library choices
- Existing documentation

## Key Success Factors
- **PERSONAL INITIAL ANALYSIS** - YOU must do Steps 1-3 yourself
- Thorough discovery by the orchestrator (not sub-agents)
- User involvement in selection
- **PARALLEL AGENT EXECUTION** - All 6 agents run simultaneously (AFTER your analysis)
- **VERIFICATION LOOPS** - Ensure files are actually created
- **ACTION-ORIENTED PROMPTS** - Agents must CREATE based on YOUR discoveries
- Real examples from codebase that YOU found
- Clear documentation structure

## Specialized Agents Used
This prompt orchestrates these specialized agents in parallel:
- `pattern-instruction-creator` - Creates pattern documentation
- `convention-instruction-creator` - Creates convention documentation
- `best-practice-instruction-creator` - Creates best practice guides
- `rule-instruction-creator` - Creates rule documentation
- `guideline-instruction-creator` - Creates guideline documentation
- `standard-instruction-creator` - Creates standard specifications

## Parallel Execution Pattern
The workflow uses true parallel execution:
1. ALL agents launch in ONE function_calls block
2. Agents work simultaneously, not sequentially
3. Verification happens AFTER all agents complete
4. Re-execution targets only missing deliverables

## Complete Orchestration Flow
```mermaid
graph TD
    A[Orchestrator] -->|Parallel Launch| B[Pattern Creator]
    A -->|Parallel Launch| C[Convention Creator]
    A -->|Parallel Launch| D[Best Practice Creator]
    A -->|Parallel Launch| E[Rule Creator]
    A -->|Parallel Launch| F[Guideline Creator]
    A -->|Parallel Launch| G[Standard Creator]
    
    B -->|Creates| H[Pattern Files]
    C -->|Creates| I[Convention Files]
    D -->|Creates| J[Best Practice Files]
    E -->|Creates| K[Rule Files]
    F -->|Creates| L[Guideline Files]
    G -->|Creates| M[Standard Files]
    
    H --> N[Verification]
    I --> N
    J --> N
    K --> N
    L --> N
    M --> N
    
    N -->|Gaps Found| O[Re-execute Specific Agents]
    O -->|Retry| A
    N -->|Complete| P[Integration]
```
