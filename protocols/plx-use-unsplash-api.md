---
document_type: protocol
goal: interact with Unsplash API to manage and retrieve photos
gpt_action: follow these steps when user wants to use the Unsplash API
---

CONTEXT: The [[User]] wants to interact with the Unsplash API and needs you to handle the API operations based on their input, particularly for searching and retrieving photos.

1. GIVEN [[User]] RUNS plx-use-unsplash-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK command type
         ```typescript
         type Command = 
           | 'search' // Search for photos
           | 'random' // Get random photo(s)
           | 'get'    // Get specific photo
           | 'track'  // Track photo download
         ```
      2. AND [[GPT Agent]] CHECK required parameters
   2. IF [[input]] IS empty
      1. THEN [[GPT Agent]] ASK [[User]] for command type
      2. AND [[GPT Agent]] ASK for required parameters
   3. IF [[command]] IS 'search'
      1. THEN [[GPT Agent]] REQUIRE search query
      2. AND [[GPT Agent]] ACCEPT optional parameters
         ```typescript
         interface SearchParams {
           query: string;
           page?: number;     // Default: 1
           perPage?: number;  // Default: 10
         }
         ```

2. WHEN [[GPT Agent]] PROCESSES command
   1. THEN [[GPT Agent]] USE UnsplashClient
      ```typescript
      const client = new UnsplashClient({
        accessKey: process.env.UNSPLASH_ACCESS_KEY
      });
      ```
   2. IF [[command]] IS 'search'
      1. THEN [[GPT Agent]] CALL searchPhotos
      2. AND [[GPT Agent]] HANDLE response
   3. IF [[command]] IS 'random'
      1. THEN [[GPT Agent]] CALL getRandomPhoto
      2. AND [[GPT Agent]] HANDLE response
   4. IF [[command]] IS 'get'
      1. THEN [[GPT Agent]] CALL getPhoto
      2. AND [[GPT Agent]] HANDLE response
   5. IF [[command]] IS 'track'
      1. THEN [[GPT Agent]] CALL trackDownload
      2. AND [[GPT Agent]] HANDLE response

3. WHEN [[GPT Agent]] HANDLES response
   1. THEN [[GPT Agent]] CHECK response status
   2. IF [[response]] IS successful
      1. THEN [[GPT Agent]] EXTRACT photo data
         ```typescript
         interface PhotoData {
           id: string;
           urls: {
             raw: string;
             full: string;
             regular: string;
             small: string;
             thumb: string;
           };
           user: {
             name: string;
             username: string;
           };
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
   2. IF [[User]] WANTS attribution
      1. THEN [[GPT Agent]] INCLUDE photographer credit
      2. AND [[GPT Agent]] ADD Unsplash credit
   3. IF [[User]] NEEDS different size
      1. THEN [[GPT Agent]] SUGGEST appropriate URL
      2. AND [[GPT Agent]] EXPLAIN size options

NOTE: Remember that in demo mode, the API is limited to 50 requests per hour. For production use, apply at https://unsplash.com/oauth/applications 