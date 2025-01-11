---
document_type: protocol
goal: interact with Typefully API to manage Twitter drafts and threads
gpt_action: follow these steps when user wants to use the Typefully API
---

CONTEXT: The [[User]] wants to interact with the Typefully API and needs you to handle the API operations based on their input, particularly for managing Twitter drafts and threads.

1. GIVEN [[User]] RUNS plx-use-typefully-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK command type
         ```typescript
         type Command = 
           | 'create-draft'    // Create a new draft
           | 'get-scheduled'   // Get recently scheduled drafts
           | 'get-published'   // Get recently published drafts
           | 'get-notifications' // Get latest notifications
           | 'mark-read'       // Mark notifications as read
         ```
      2. AND [[GPT Agent]] CHECK required parameters
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for command type
      2. AND [[GPT Agent]] ASK for required parameters
   3. IF [[command]] IS 'create-draft'
      1. THEN [[GPT Agent]] REQUIRE content
      2. AND [[GPT Agent]] ACCEPT optional parameters
         ```typescript
         interface CreateDraftOptions {
           content: string;
           threadify?: boolean;
           share?: boolean;
           schedule_date?: string | 'next-free-slot';
           auto_retweet_enabled?: boolean;
           auto_plug_enabled?: boolean;
         }
         ```

2. WHEN [[GPT Agent]] PROCESSES command
   1. THEN [[GPT Agent]] USE TypefullyAPI
      ```typescript
      const client = new TypefullyAPI({
        apiKey: process.env.TYPEFULLY_API_KEY
      });
      ```
   2. IF [[command]] IS 'create-draft'
      1. THEN [[GPT Agent]] CALL createDraft
      2. AND [[GPT Agent]] HANDLE response
   3. IF [[command]] IS 'get-scheduled'
      1. THEN [[GPT Agent]] CALL getRecentlyScheduled
      2. AND [[GPT Agent]] HANDLE response
   4. IF [[command]] IS 'get-published'
      1. THEN [[GPT Agent]] CALL getRecentlyPublished
      2. AND [[GPT Agent]] HANDLE response
   5. IF [[command]] IS 'get-notifications'
      1. THEN [[GPT Agent]] CALL getNotifications
      2. AND [[GPT Agent]] HANDLE response
   6. IF [[command]] IS 'mark-read'
      1. THEN [[GPT Agent]] CALL markNotificationsRead
      2. AND [[GPT Agent]] HANDLE response

3. WHEN [[GPT Agent]] HANDLES response
   1. THEN [[GPT Agent]] CHECK response status
   2. IF [[response]] IS successful
      1. THEN [[GPT Agent]] EXTRACT data
         ```typescript
         interface Draft {
           id: string;
           content: string;
           share_url?: string;
         }
         ```
      2. AND [[GPT Agent]] FORMAT output
   3. IF [[response]] HAS error
      1. THEN [[GPT Agent]] SHOW error details
      2. AND [[GPT Agent]] SUGGEST fixes

4. GIVEN [[response]] IS ready
   1. THEN [[GPT Agent]] VERIFY rate limits
      1. AND [[GPT Agent]] CHECK remaining requests
      2. AND [[GPT Agent]] WARN if near limit
   2. IF [[User]] WANTS thread
      1. THEN [[GPT Agent]] SET threadify to true
      2. AND [[GPT Agent]] FORMAT content appropriately
   3. IF [[User]] NEEDS scheduling
      1. THEN [[GPT Agent]] SUGGEST schedule options
      2. AND [[GPT Agent]] EXPLAIN timing constraints

NOTE: Remember to handle content formatting appropriately for Twitter's character limits and thread structure. Use the threadify option when content exceeds single tweet length. 