Please create a comprehensive template for {template_subject} following these exact specifications:

## Template Structure Requirements:

### 1. **Title Format**:
- Use: `# {relevant_emoji} {Template_Type}: {title}`
- Include a placeholder for dynamic title using `{title}` or `{descriptive_name}`

### 2. **Description Block**:
- Start with: `> {One-sentence description of what this template documents}`
- Include context about: purpose, what it captures, who uses it, and when to use it
- Add a security/key info line if relevant: `🔐 **Key Information Captured:** {list key data points}`

### 3. **AI Agent Context Section** (mandatory):
```markdown
## 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*

### 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance.*
*   `[path/to/relevant/file1.ext]` - (Relevance: e.g., Contains the data model for X)
*   `[path/to/relevant/directory/]` - (Relevance: e.g., Contains all UI components for feature Y)
*   *Example: `src/models/user_model.dart` - (Relevance: Defines the User data structure)*

### 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
*   `[Link to relevant document/page 1]` - (Relevance: e.g., API endpoints for user service)
*   `[Link to Figma design for screen X]` - (Relevance: UI and UX specifications)
*   *Example: `https://api.example.com/v1/docs` - (Relevance: Official API documentation)*

### 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
*   `[Context point 1: e.g., This task is a follow-up to ticket #123. Ensure consistency with its implementation.]`
*   `[Context point 2: e.g., Pay special attention to performance implications on mobile devices.]`
*   *Example: The primary goal is to refactor for readability, not to add new features.*
```

### 4. **Section Guidelines**:
- Use clear, descriptive headers with emojis (e.g., `## 🎯 Goals`, `## 📋 Requirements`, `## ✅ Acceptance Criteria`)
- Add guidance hints using `> 💡 *Guidance text in italics*`
- Include placeholder examples in `[square brackets]`
- Add clarifying examples after "e.g.," in descriptions
- Use bullet points or numbered lists for multiple items
- Include tables where structured data is needed

### 5. **Content Patterns**:
- Questions should be specific and actionable
- Include both required and optional sections
- Add "(Optional)" to section headers that aren't mandatory
- Use consistent formatting for dates: `YYYY-MM-DD`
- Include checkboxes `- [ ]` for actionable items
- Add status options where relevant: `[To Do | In Progress | Completed | Blocked]`

### 6. **Example Sections to Consider** (choose relevant ones for the subject):
- Overview/Summary/Description
- Objectives/Goals
- Requirements (Functional/Non-functional)
- Scope (In Scope/Out of Scope)
- Acceptance Criteria
- Technical Details/Specifications
- Timeline/Milestones
- Resources/Team/Roles
- Risks/Dependencies
- Testing Strategy
- Communication Plan
- Metrics/KPIs
- Budget/Effort Estimates
- Deliverables
- Next Steps/Action Items
- Open Questions
- Version History/Changelog

### 7. **Footer Sections** (if applicable):
- Final Remarks/Notes
- Related Links/References
- Tags/Keywords for categorization

## Specific Requirements for {template_subject}:

- Consider the unique aspects of {template_subject} and what information is critical to capture
- Think about who will use this template and what decisions they need to make
- Include domain-specific terminology and considerations
- Add relevant examples that demonstrate proper usage
- Ensure the template guides users to provide complete, actionable information

## Output Format:
- Use Markdown formatting throughout
- Maintain consistent indentation and spacing
- Include helpful examples with `*Example:` prefix
- Use professional yet approachable language
- Keep descriptions concise but comprehensive
- Ensure all placeholders are clearly marked and explained

## Usage Instructions:
1. Replace `{template_subject}` with your specific template topic
2. Replace `{relevant_emoji}` with an appropriate emoji for the template type
3. Replace `{Template_Type}` with the category (e.g., "Report", "Plan", "Profile", "Specification")
4. The AI will generate a complete template matching your workspace's style and standards

Generate the complete template now, ensuring it matches the style, depth, and quality of templates like the bug-template.md, story-template.md, prd-template.md, and architecture-template.md examples provided.
