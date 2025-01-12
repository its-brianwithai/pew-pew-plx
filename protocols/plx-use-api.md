---
document_type: protocol
goal: define how to use APIs in a standardized way
gpt_action: follow these steps when using any API, using only curl and JSON files
---

CONTEXT: The [[User]] wants to interact with an API and follow a standardized approach for making API requests.

1. GIVEN [[User]] WANTS to use API
   1. THEN [[GPT Agent]] VERIFY API folder structure exists
      1. AND [[GPT Agent]] CHECK `.env` file exists
      2. AND [[GPT Agent]] CHECK `request.json` file exists

2. WHEN [[GPT Agent]] NEEDS request instructions
   1. THEN [[GPT Agent]] CHECK documentation sources in order:
      1. FIRST [[GPT Agent]] LOOK for `docs.md` in API folder
         1. IF exists THEN follow those instructions
      2. ELSE [[GPT Agent]] CHECK internal API docs
         1. IF exists THEN follow those instructions
      3. ELSE [[GPT Agent]] ASK [[User]] for documentation links
         1. AND [[GPT Agent]] WAIT for response

3. WHEN [[GPT Agent]] HAS documentation
   1. THEN [[GPT Agent]] CREATE `request.json` with:
      1. Method and endpoint
      2. Headers and authentication
      3. Request body if needed

4. THEN [[GPT Agent]] EXECUTE curl command:
   1. WITH environment variables from `.env`
   2. WITH request data from `request.json`
   3. USING only curl (NEVER use API clients or libraries)

5. IF request fails OR unclear
   1. THEN [[GPT Agent]] ASK [[User]] for help
   2. AND [[GPT Agent]] WAIT for response 