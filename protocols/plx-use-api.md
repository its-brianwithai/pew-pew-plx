---
document_type: protocol
goal: define how to use APIs in a standardized way
gpt_action: follow these steps when using any API, using only curl and JSON files
---

CONTEXT: The [[User]] wants to interact with an API and follow a standardized approach for making API requests.

1. GIVEN [[User]] WANTS to use API
   1. THEN [[You]] VERIFY API folder structure exists
      1. AND [[You]] CHECK `.env` file exists
      2. AND [[You]] CHECK `request.json` file exists

2. WHEN [[You]] NEEDS request instructions
   1. THEN [[You]] CHECK documentation sources in order:
      1. FIRST [[You]] LOOK for `docs.md` in API folder
         1. IF exists THEN follow those instructions
      2. ELSE [[You]] CHECK internal API docs
         1. IF exists THEN follow those instructions
      3. ELSE [[You]] ASK [[User]] for documentation links
         1. AND [[You]] WAIT for response

3. WHEN [[You]] HAS documentation
   1. THEN [[You]] CREATE `request.json` with:
      1. Method and endpoint
      2. Headers and authentication
      3. Request body if needed

4. THEN [[You]] EXECUTE curl command:
   1. WITH environment variables from `.env`
   2. WITH request data from `request.json`
   3. USING only curl (NEVER use API clients or libraries)

5. IF request fails OR unclear
   1. THEN [[You]] ASK [[User]] for help
   2. AND [[You]] WAIT for response 
