---
document_type: api_docs
goal: document how to create drafts using Ghost Admin API
gpt_action: follow these steps when creating drafts with Ghost API
---

# Create Draft

1. GIVEN [[User]] WANTS to create draft in Ghost
   1. THEN [[GPT Agent]] VERIFY API folder structure
      1. AND [[GPT Agent]] CHECK `.env` file exists with:
         - `GHOST_ADMIN_API_KEY`
         - `GHOST_CONTENT_API_KEY`
         - `GHOST_API_URL`
      2. AND [[GPT Agent]] CHECK `request.json` file exists

2. WHEN [[GPT Agent]] CREATES draft
   1. THEN [[GPT Agent]] CREATE request in `request.json`:
      ```json
      {
        "posts": [{
          "title": "Post Title",
          "html": "Post content in HTML format",
          "status": "draft",
          "tags": ["tag1", "tag2"],
          "featured": false,
          "custom_excerpt": "Optional excerpt"
        }]
      }
      ```
   2. AND [[GPT Agent]] ENSURE content follows format:
      1. Content must be valid HTML
      2. Status should be "draft" for unpublished posts
      3. Tags are optional but recommended
      4. Custom excerpt is optional

3. THEN [[GPT Agent]] EXECUTE curl command:
   ```bash
   curl -X POST "${GHOST_API_URL}/ghost/api/admin/posts/" \
   -H "Authorization: Ghost ${GHOST_ADMIN_API_KEY}" \
   -H "Content-Type: application/json" \
   -d @request.json
   ```

4. IF [[GPT Agent]] NEEDS clarification
   1. THEN [[GPT Agent]] ASK [[User]] for documentation links
   2. AND [[GPT Agent]] WAIT for response before proceeding 