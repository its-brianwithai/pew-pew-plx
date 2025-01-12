---
document_type: api_docs
goal: document how to create drafts using Typefully API
gpt_action: follow these steps when creating drafts with Typefully API
---

# Create Draft

1. GIVEN [[User]] WANTS to create draft in Typefully
   1. THEN [[GPT Agent]] VERIFY API folder structure
      1. AND [[GPT Agent]] CHECK `.env` file exists with `TYPEFULLY_API_KEY`
      2. AND [[GPT Agent]] CHECK `request.json` file exists

2. WHEN [[GPT Agent]] CREATES draft
   1. THEN [[GPT Agent]] CREATE request in `request.json`:
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
   2. AND [[GPT Agent]] ENSURE content follows format:
      1. Split tweets with 4 newlines
      2. Keep content as plain text
      3. Set options as needed per request

3. THEN [[GPT Agent]] EXECUTE curl command:
   ```bash
   curl -X POST "https://api.typefully.com/v1/drafts/" \
   -H "X-API-KEY: Bearer $TYPEFULLY_API_KEY" \
   -H "Content-Type: application/json" \
   -d @request.json
   ```

4. IF [[GPT Agent]] NEEDS clarification
   1. THEN [[GPT Agent]] ASK [[User]] for documentation links
   2. AND [[GPT Agent]] WAIT for response before proceeding 