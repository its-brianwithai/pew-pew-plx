---
document_type: protocol
goal: interact with Giphy API to search and download GIFs
gpt_action: follow these steps when user wants to use the Giphy API
---

CONTEXT: The [[User]] wants to interact with the Giphy API and needs you to handle the API operations based on their input, particularly for searching and downloading GIFs with proper attribution.

1. GIVEN [[User]] RUNS plx-use-giphy-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK command type
         ```typescript
         type Command = 
           | 'search'          // Search for GIFs
           | 'download'        // Download specific GIF
           | 'search-download' // Search and download in one go
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
           limit?: number;     // Default: 1
           rating?: 'g' | 'pg' | 'pg-13' | 'r';  // Default: 'g'
         }
         ```

2. WHEN [[GPT Agent]] PROCESSES command
   1. THEN [[GPT Agent]] USE GiphyAPI
      ```typescript
      const client = new GiphyAPI();  // Uses GIPHY_API_KEY from env
      ```
   2. IF [[command]] IS 'search'
      1. THEN [[GPT Agent]] CALL searchGifs
      2. AND [[GPT Agent]] HANDLE response
   3. IF [[command]] IS 'download'
      1. THEN [[GPT Agent]] CALL downloadGif
      2. AND [[GPT Agent]] CREATE attribution
   4. IF [[command]] IS 'search-download'
      1. THEN [[GPT Agent]] CALL searchAndDownload
      2. AND [[GPT Agent]] HANDLE response

3. WHEN [[GPT Agent]] HANDLES response
   1. THEN [[GPT Agent]] CHECK response status
   2. IF [[response]] IS successful
      1. THEN [[GPT Agent]] EXTRACT GIF data
         ```typescript
         interface GiphyGif {
           id: string;
           title: string;
           url: string;
           username: string;
           images: {
             original: {
               url: string;
               width: string;
               height: string;
             };
             fixed_height: {
               url: string;
               width: string;
               height: string;
             };
             fixed_width: {
               url: string;
               width: string;
               height: string;
             };
           };
         }
         ```
      2. AND [[GPT Agent]] FORMAT output
   3. IF [[response]] HAS error
      1. THEN [[GPT Agent]] SHOW error details
      2. AND [[GPT Agent]] SUGGEST fixes

4. GIVEN [[response]] IS ready
   1. THEN [[GPT Agent]] CREATE attribution file
      1. AND [[GPT Agent]] INCLUDE
         ```text
         Giphy GIF ID: ${gif.id}
         Title: ${gif.title}
         Creator: ${gif.username || 'Anonymous'}
         Original URL: ${gif.url}
         License: Giphy Terms of Service
         Downloaded: ${timestamp}
         ```
   2. IF [[User]] NEEDS specific size
      1. THEN [[GPT Agent]] SUGGEST appropriate format
         ```typescript
         type GifSize = 'original' | 'fixed_height' | 'fixed_width'
         ```
   3. IF [[User]] WANTS local copy
      1. THEN [[GPT Agent]] SAVE to specified path
      2. AND [[GPT Agent]] SAVE attribution file

NOTE: Remember to always create attribution files when downloading GIFs. Default download size is fixed_width for optimal performance. Content rating defaults to 'g' for general audience. 