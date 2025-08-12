Update the project README file to reflect the current state of the project. Carefully review all content for accuracy, completeness, and relevance to the target audience.

<instruction>
Update the project README file to reflect the current state of the project. Carefully review all content for accuracy, completeness, and relevance to the target audience. This is a comprehensive update that requires thorough analysis and restructuring.
</instruction>

<context>
You are updating a README.md file that serves as the primary documentation entry point for this project. The README must be accurate, current, and optimized for its intended audience.
</context>

<task_breakdown>
1. ANALYZE the target audience:
   - Check package.json, Cargo.toml, or similar files for project type
   - Identify if this is a library, application, framework, or tool
   - Determine primary users: developers, end-users, contributors, or mixed
   - Note any industry/domain specifics (e.g., AI/ML, web dev, systems)

2. AUDIT existing content:
   - Identify outdated information (versions, deprecated features, old workflows)
   - Find missing critical sections based on project evolution
   - Locate invalid/broken elements (links, badges, code examples)
   - Check if current structure matches audience expectations

3. UPDATE with new content:
   - Add all new features, commands, and capabilities
   - Include recent architectural changes or refactors
   - Document new dependencies or requirements
   - Update installation and setup procedures
   - Refresh examples with current API/interface

4. RESTRUCTURE for audience:
   - For developers: Start with quick start, API reference, examples
   - For end-users: Begin with installation, features, usage guides
   - For contributors: Emphasize development setup, architecture, guidelines
   - For mixed: Use progressive disclosure with clear section hierarchy

5. VALIDATE accuracy:
   - Test all code examples and commands
   - Verify all links and references
   - Ensure version numbers are current
   - Confirm compatibility statements
</task_breakdown>

<audience_preferences>
- **Developers** appreciate:
  - Code examples upfront
  - Clear API documentation
  - Performance characteristics
  - Integration patterns
  - Minimal prose, maximum utility

- **End-users** value:
  - Simple installation steps
  - Visual demonstrations (screenshots/GIFs)
  - Feature lists with benefits
  - Troubleshooting sections
  - Non-technical language

- **Contributors** need:
  - Development environment setup
  - Contribution guidelines
  - Architecture overview
  - Testing procedures
  - Code style guides

- **Enterprise users** require:
  - Security considerations
  - Deployment options
  - Support/SLA information
  - Compliance details
  - Migration guides
</audience_preferences>

<structure_guidelines>
1. **Title and badges** - Keep current status indicators
2. **Hero section** - One-paragraph value proposition
3. **Quick start** - Fastest path to first success
4. **Table of contents** - For READMEs over 500 lines
5. **Core sections** - Ordered by audience priority:
   - Installation
   - Usage/Examples
   - API/Features
   - Configuration
   - Development
   - Contributing
   - License

6. **Optional sections** based on project:
   - Architecture
   - Performance
   - Security
   - Deployment
   - Migration
   - Troubleshooting
   - FAQ
   - Roadmap
</structure_guidelines>

<quality_checks>
- Every command must be tested and working
- All links must resolve (use relative paths where possible)
- Version numbers must match actual releases
- Examples must use current syntax/API
- Remove any features marked as deprecated
- Ensure consistency in formatting and tone
- Optimize for scanability with headers and lists
</quality_checks>

<output_format>
Generate the updated README with:
1. Clear section headers using markdown
2. Concise, scannable content
3. Code blocks with language hints
4. Proper markdown formatting
5. Consistent style throughout
6. TODO comments for items needing human review: <!-- TODO: Verify version number -->
</output_format>

<example>
For a developer-focused library:
```
# ProjectName

> One-line description of what this library does

[![CI](badge-url)](ci-url) [![npm](badge-url)](npm-url)

## Quick Start

```bash
npm install projectname
```

```javascript
const project = require('projectname');
project.doSomething(); // Returns awesome
```

## Installation

[Detailed installation for different environments]

## API Reference

[Complete API documentation with examples]

<!-- TODO: Verify if advanced-feature is still experimental -->
```
</example>
