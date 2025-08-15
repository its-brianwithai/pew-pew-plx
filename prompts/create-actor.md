---
name: create-actor
description: "Create a new actor document following the Actor→Role→Interaction hierarchy and proper conventions"
---

# 🎭 Create Actor Document
> 💡 *Transform requirements into a well-defined actor that references roles using the established hierarchy.*

## 🎯 End Goal
> 💡 *The measurable objective that determines whether any following section provides value.*

Successfully create a production-ready actor document that:
- Clearly defines the actor's identity and purpose
- References appropriate roles via flat wikilinks
- Follows the Actor→Role→Interaction hierarchy
- Integrates seamlessly with existing project structure
- Maintains proper wikilink conventions

### Deliverables
- Complete actor document following actor-template structure
- Proper YAML frontmatter with name and description
- Clear purpose statement
- Key roles section with proper wikilink references
- Saved to /actors/ directory

### Acceptance Criteria
- [ ] Actor identity clearly defined (person/system/entity)
- [ ] Purpose statement is concise and focused
- [ ] References roles (not interactions directly)
- [ ] Uses flat wikilinks without folder paths
- [ ] Follows naming conventions
- [ ] Saved with proper filename format

## 📋 Request
> 💡 *Verb-first activity request with clear scope*

Create a new actor document based on user requirements through systematic analysis and role identification.

## 🔄 Workflow
> 💡 *Systematic methodology for actor creation following project hierarchy.*

### Step 1: Clarify Actor Identity
**Deliverable:** Clear understanding of actor type and core purpose
**Acceptance Criteria:** Actor type and primary goal identified

If requirements are unclear, ask ONE focused question:
```markdown
## 🎭 What type of actor are we creating?
    A. Person (user, customer, staff member, expert)
    B. System (application, service, platform, tool)
    C. External Entity (organization, partner, regulatory body)
```

### Step 2: Define Purpose and Context
**Deliverable:** Core purpose statement and project context
**Acceptance Criteria:** Purpose clearly articulated in one sentence

Clarify the actor's primary value and role in the project ecosystem.

### Step 3: Identify Key Roles
**Deliverable:** List of roles this actor can assume
**Acceptance Criteria:** Roles identified with existing role document references

1. Search existing roles in /roles/ directory
2. Identify which roles this actor can assume
3. Create wikilink references to existing role documents
4. Note any missing roles that might need creation later

### Step 4: Generate Complete Document
**Deliverable:** Complete actor document
**Acceptance Criteria:** All template sections filled with proper structure

Generate the full actor document using the actor-template structure.

## 📏 Instructions
> 💡 *Event-driven rules and conventions for actor creation.*

### WHEN creating a new actor
**Best Practices:**
- Start with understanding the actor's core identity
- Focus on their primary purpose and value
- Map to existing roles rather than creating new ones
- Keep descriptions concise and focused
- Use descriptive but professional language

**Conventions:**
- Use kebab-case for filenames (e.g., nutrition-expert.md)
- Place in /actors/ directory
- Reference roles via flat wikilinks: [[role-name]]
- Use appropriate emoji for actor type
- Keep purpose to one clear sentence

**Rules:**
- ALWAYS search existing roles before referencing
- ALWAYS use flat wikilinks (no folder paths)
- NEVER reference interactions directly from actors
- MUST follow Actor→Role→Interaction hierarchy
- ALWAYS include purpose section

### WHEN gathering requirements
**Process:**
1. If unclear, ask one focused question at a time
2. Provide concrete A/B options for selection
3. Build understanding progressively
4. Verify single, clear purpose

**Question Template:**
```markdown
## [Emoji] [Specific Question]?
    A. [First option with example]
    B. [Second option with example]
```

### WHEN referencing roles
**Requirements:**
- Search /roles/ directory for existing role documents
- Use exact role document names in wikilinks
- Provide brief context for how actor fulfills each role
- Prefer existing roles over creating new role descriptions

**Best Practices:**
- Group related roles together
- Explain the relationship between actor and role
- Keep role context brief but meaningful

## 📊 Output Format
> 💡 *Structure for the created actor document.*

### Format Type
Markdown

### Structure Template
```markdown
---
name: actor-name
description: "Brief description of what this actor represents"
---

# [Emoji] Actor: [Name]
> 💡 *A person, system, or external entity that interacts with the project. This describes their role and high-level purpose.*

[Short description of what this actor is and what their primary goal is.]

## 🎯 Purpose
> 💡 *The core reason this actor exists and what primary value they get from or bring to this project.*

[One-liner that summarizes the core purpose of the actor.]

## 🎭 Key Roles
> 💡 *What are the main roles this actor can assume or perform? Reference role documents when available using wikilinks.*

- [[role-name]] - [Brief context of how this actor fulfills this role]
- [[another-role]] - [Brief context of how this actor fulfills this role]
- [Direct role description if no role document exists yet]
```

### Delivery Instructions
- Save as [actor-name].md in /actors/ directory
- Use kebab-case for filename
- Ensure wikilinks use exact role document names
- Verify all referenced roles exist in /roles/ directory

### Creation Checklist
- [ ] Requirements fully understood
- [ ] Existing roles researched
- [ ] Actor identity clearly defined
- [ ] Purpose statement written
- [ ] Roles identified and linked
- [ ] Template structure followed
- [ ] File saved in correct location
- [ ] WikiLinks validated

---
role: [[meta-template-expert]]