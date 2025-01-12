---
document_type: code of conduct
goal: define process for creating and publishing blog posts to Ghost
gpt_action: follow these steps when creating and publishing blog content
---

# 🎯 Blog Publishing Process

1. [[GPT Agent]] [[prepare content]]
   1. [[prepare content]]
      1. Create markdown file with `.md` extension
      2. Add required frontmatter:
         ```markdown
         ---
         title: Your Post Title
         tags: 
           - tag1
           - tag2
         featured: false
         excerpt: A brief description of your post
         ---
         ```
      3. Write content using markdown formatting
      4. Add code blocks with proper syntax highlighting
      5. Include and reference images if needed

2. [[GPT Agent]] [[configure environment]]
   1. [[configure environment]]
      1. Verify `.env` file exists in `ghost/scripts`
      2. Ensure required variables are set:
         ```
         GHOST_URL=https://your-blog-url
         GHOST_ADMIN_API_KEY=your-admin-api-key
         ```

3. [[GPT Agent]] [[publish draft]]
   1. [[publish draft]]
      1. Navigate to scripts directory:
         ```bash
         cd ghost/scripts
         ```
      2. Run publishing script:
         ```bash
         npm start -- publish path/to/your-post.md
         ```
      3. Verify draft creation in Ghost admin panel

4. [[GPT Agent]] [[review content]]
   1. [[review content]]
      1. Log into Ghost admin panel
      2. Locate post in Drafts section
      3. Preview rendered content
      4. Check formatting and styling
      5. Make necessary adjustments
      6. Publish when ready

# ✅ Content Requirements

1. [[GPT Agent]] [[verify post]]
   1. [[verify post]]
      1. Frontmatter is complete
         - Title is set
         - Tags are defined
         - Excerpt is provided
      2. Content is properly formatted
         - Markdown syntax is correct
         - Code blocks have language specified
         - Images are properly linked
      3. Environment is configured
         - Variables are set
         - Values are secure
         - Script permissions are correct

# 🔍 Review Process

1. [[GPT Agent]] [[final review]]
   1. [[final review]]
      1. Check content rendering
      2. Verify code block formatting
      3. Confirm image display
      4. Review meta information
      5. Test responsive layout
      6. Validate links and references

# ⚠️ Important Guidelines

1. [[GPT Agent]] [[follow guidelines]]
   1. [[follow guidelines]]
      1. Always publish as draft first
      2. Never commit environment variables
      3. Use proper markdown formatting
      4. Include all required metadata
      5. Test thoroughly in preview
      6. Get peer review when possible
```
