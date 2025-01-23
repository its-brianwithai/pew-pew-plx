---
document_type: api_docs
goal: document how to create drafts using Typefully API
gpt_action: follow these steps when creating drafts with Typefully API
---

# Create Draft

1. GIVEN [[User]] WANTS to create draft in Typefully
   1. THEN [[You]] VERIFY API folder structure
      1. AND [[You]] CHECK `.env` file exists with `TYPEFULLY_API_KEY`
      2. AND [[You]] CHECK `request.json` file exists

2. WHEN [[You]] CREATES draft
   1. THEN [[You]] CREATE request in `request.json`:
      ```json
      {
        "content": "Draft content here",
        "threadify": false,
        "share": false,
        "schedule-date": null,
        "auto_retweet_enabled": false,
        "auto_plug_enabled": false
      }
      ```
   2. AND [[You]] ENSURE content follows format:
      1. Split tweets with 4 newlines
      2. Keep content as plain text
      3. Set options as needed per request

3. THEN [[You]] EXECUTE curl command:
   ```bash
   curl -X POST "https://api.typefully.com/v1/drafts/" \
   -H "X-API-KEY: Bearer $TYPEFULLY_API_KEY" \
   -H "Content-Type: application/json" \
   -d @request.json
   ```

4. IF [[You]] NEEDS clarification
   1. THEN [[You]] ASK [[User]] for documentation links
   2. AND [[You]] WAIT for response before proceeding 
