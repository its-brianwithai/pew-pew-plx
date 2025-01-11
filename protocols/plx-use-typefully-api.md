---
document_type: protocol
goal: interact with Typefully API to manage Twitter drafts and threads using TypeScript
gpt_action: follow these steps when user wants to use the Typefully API
---

CONTEXT: The [[User]] wants to interact with the Typefully API to manage Twitter drafts and threads and needs you to handle the API operations through the TypeScript implementation in `apis/typefully/`.

1. GIVEN [[User]] RUNS plx-use-typefully-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK command type
         ```typescript
         type Command = 
           | 'create-draft'    // Create a new draft
           | 'get-scheduled'   // Get recently scheduled drafts
           | 'get-published'   // Get recently published drafts
           | 'get-notifications' // Get latest notifications
         ```
      2. AND [[GPT Agent]] CHECK required parameters
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
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for command type
      2. AND [[GPT Agent]] ASK for required parameters

2. WHEN [[GPT Agent]] PROCESSES 'create-draft'
   1. THEN [[GPT Agent]] UPDATE draft-content.json
      ```json
      {
        "content": "Your tweet content here",
        "threadify": true,
        "schedule_date": null,
        "share": false
      }
      ```
   2. AND [[GPT Agent]] RUN create-draft.ts
      ```bash
      cd apis/typefully && npx ts-node create-draft.ts
      ```
   3. AND [[GPT Agent]] VERIFY response
      ```typescript
      interface Draft {
        id: string;
        status: 'draft' | 'scheduled' | 'published';
        html: string;
        num_tweets: number;
        share_url?: string;
        twitter_url?: string;
      }
      ```

3. WHEN [[GPT Agent]] PROCESSES 'get-scheduled'
   1. THEN [[GPT Agent]] USE TypefullyAPI client
      ```typescript
      import typefully from './index';
      
      typefully.getRecentlyScheduled()
        .then(drafts => console.log('Scheduled drafts:', drafts))
        .catch(error => console.error('Error:', error));
      ```

4. WHEN [[GPT Agent]] PROCESSES 'get-published'
   1. THEN [[GPT Agent]] USE TypefullyAPI client
      ```typescript
      import typefully from './index';
      
      typefully.getRecentlyPublished()
        .then(drafts => console.log('Published drafts:', drafts))
        .catch(error => console.error('Error:', error));
      ```

5. WHEN [[GPT Agent]] PROCESSES 'get-notifications'
   1. THEN [[GPT Agent]] USE TypefullyAPI client
      ```typescript
      import typefully from './index';
      
      typefully.getNotifications({ kind: 'inbox' })
        .then(notifications => console.log('Notifications:', notifications))
        .catch(error => console.error('Error:', error));
      ```

6. IF [[response]] HAS error
   1. THEN [[GPT Agent]] CHECK error details
      ```typescript
      interface APIError {
        message: string;
        code: string;
      }
      ```
   2. AND [[GPT Agent]] SUGGEST fixes
   3. AND [[GPT Agent]] RETRY operation if appropriate

NOTE: Always use the TypeScript implementation. Never make direct API calls. Handle errors gracefully and verify all responses. 