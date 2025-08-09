---
name: create-project-instructions
description: "Systematically discover, analyze, and document all project conventions, patterns, and architectural decisions as reusable instruction files, optionally creating a comprehensive developer agent."
---

# 📚 Create Project Instructions: Document Conventions & Build Developer Agent
> 💡 *Systematically analyze a codebase to extract all conventions, patterns, and architectural decisions into reusable instruction files, then optionally create a developer agent with complete project knowledge.*

## 🎯 End Goal
> 💡 *The clean, measurable objective that determines whether any following section provides value.*

Successfully create comprehensive project instruction files that:
- Document all project conventions, patterns, and architectural decisions
- Provide reusable, modular instruction components
- Can be referenced by any agent or prompt via wikilinks
- Serve as the single source of truth for project standards
- Enable developer agent creation via separate workflow

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
- Pattern recognition across codebases
- Convention extraction from examples
- Clear technical documentation writing
- Systematic analysis and categorization
- Developer experience optimization

### Communication Style
Thorough, systematic, and example-driven with emphasis on practical application

## 📋 Request
> 💡 *Verb-first activity request with deliverables and acceptance criteria*

Analyze the entire codebase to discover and document all conventions by:
1. Scanning all relevant project files and structures
2. Identifying patterns and conventions across different aspects
3. Creating a discovery checklist for user confirmation
4. Documenting approved conventions in structured instruction files
5. Validating completeness and accuracy

### Deliverables
- Discovery checklist in `.pew/drafts/convention-discovery-checklist.md`
- Individual instruction files in `.pew/instructions/` subfolders
- Complete documentation of all discovered conventions
- Ready for developer agent creation via [[create-project-developer]]

### Acceptance Criteria
- [ ] All major convention categories are discovered
- [ ] User has reviewed and approved the checklist
- [ ] Each convention type has detailed documentation
- [ ] Instruction files follow `{name}-{type}.md` naming
- [ ] Examples demonstrate real project usage
- [ ] No critical patterns are missed

## 🔄 Workflow
> 💡 *Atomic steps that systematically achieve the end goal.*

### Step 1: Initial Project Analysis
**Deliverable:** Understanding of project structure and technology stack
**Acceptance Criteria:** Core technologies and frameworks identified
- Scan project root for configuration files (package.json, pubspec.yaml, Cargo.toml, etc.)
- Identify primary language and framework
- Detect build tools and dependency managers
- Note testing frameworks and quality tools
- Document project type (web app, mobile, library, etc.)

### Step 2: Convention Discovery
**Deliverable:** Comprehensive list of all conventions to document
**Acceptance Criteria:** All convention categories identified with examples

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

Create `.pew/drafts/convention-discovery-checklist.md`:
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

### Step 4: Document Approved Conventions
**Deliverable:** Structured instruction files in `.pew/instructions/` with proper categorization
**Acceptance Criteria:** Each checked convention has detailed documentation in the correct subfolder

Create instruction files in `.pew/instructions/` organized by instruction type:

**Directory Structure:**
```
.pew/instructions/
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

Each instruction file should follow this structure:
```markdown
---
name: [convention-name]
description: "[What this convention covers]"
---

# [Convention Title]

## Overview
[Brief description of the convention and its purpose]

## Rules
- ALWAYS [required practice]
- NEVER [prohibited practice]
- MUST [critical requirement]

## Patterns
[Detailed explanation with examples from the actual project]

## Examples
### ✅ Correct Implementation
```[language]
[Actual example from project]
```

### ❌ Incorrect Implementation
```[language]
[Counter-example]
```

## Rationale
[Why this convention exists and its benefits]
```

### Step 5: Validation & Testing
**Deliverable:** Verified instruction files ready for use
**Acceptance Criteria:** All conventions properly documented
- Verify all instruction files created with proper naming
- Check convention coverage is complete
- Validate examples are from actual project
- Test that file paths follow the pattern: `{type}/{name}-{type}.md`
- Ensure all discovered patterns are documented

## 📏 Instructions
> 💡 *Event-driven best practices, conventions, constraints and rules.*

### WHEN discovering conventions
**Best Practices:**
- Look for patterns that appear 3+ times
- Check both explicit rules and implicit patterns
- Examine recent code for current practices
- Review configuration files for standards

**Rules:**
- ALWAYS provide real examples from the project
- ALWAYS note exceptions to patterns
- NEVER assume conventions without evidence
- MUST verify patterns across multiple files

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

### WHEN documenting conventions
**Best Practices:**
- Use actual project examples
- Explain the "why" behind conventions
- Provide both correct and incorrect examples
- Link related conventions together

**Rules:**
- ALWAYS use real code from the project
- MUST include rationale for each convention
- NEVER document unused patterns
- ALWAYS specify exceptions clearly


## 📊 Output Format
> 💡 *How to structure and deliver the output.*

### Format Type
Markdown files with YAML frontmatter

### Structure Template
1. **Discovery Checklist** (`.pew/drafts/convention-discovery-checklist.md`)
2. **Instruction Files** (`.pew/instructions/[type]/[name]-[type].md`)
   - File naming: `{specific-name}-{instruction-type}.md`
   - Organized by type: `patterns/`, `conventions/`, `best-practices/`, `rules/`, `guidelines/`, `standards/`
   - Examples: `naming-convention-patterns.md`, `error-handling-best-practices.md`, `git-conventions.md`
3. **Developer Agent** (`.pew/agents/developer.md`)
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
- Thorough initial analysis
- User involvement in selection
- Real examples from codebase
- Clear documentation structure
- Comprehensive agent creation
