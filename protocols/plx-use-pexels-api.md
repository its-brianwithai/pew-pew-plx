---
document_type: protocol
goal: interact with Pexels API to search and download high-quality photos
gpt_action: follow these steps when user wants to use the Pexels API
---

CONTEXT: The [[User]] wants to interact with the Pexels API and needs you to handle the API operations based on their input, particularly for searching and downloading photos with proper attribution.

1. GIVEN [[User]] RUNS plx-use-pexels-api command
   1. THEN [[GPT Agent]] READ [[input]]
      1. AND [[GPT Agent]] CHECK command type
         ```typescript
         type Command = 
           | 'search'          // Search for photos
           | 'download'        // Download specific photo
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
           perPage?: number;  // Default: 1
         }
         ```

2. WHEN [[GPT Agent]] PROCESSES command
   1. THEN [[GPT Agent]] USE PexelsAPI
      ```typescript
      const client = new PexelsAPI();  // Uses PEXELS_API_KEY from env
      ```
   2. IF [[command]] IS 'search'
      1. THEN [[GPT Agent]] CALL searchPhotos
      2. AND [[GPT Agent]] HANDLE response
   3. IF [[command]] IS 'download'
      1. THEN [[GPT Agent]] CALL downloadPhoto
      2. AND [[GPT Agent]] CREATE attribution
   4. IF [[command]] IS 'search-download'
      1. THEN [[GPT Agent]] CALL searchAndDownload
      2. AND [[GPT Agent]] HANDLE response

3. WHEN [[GPT Agent]] HANDLES response
   1. THEN [[GPT Agent]] CHECK response status
   2. IF [[response]] IS successful
      1. THEN [[GPT Agent]] EXTRACT photo data
         ```typescript
         interface PexelsPhoto {
           id: number;
           width: number;
           height: number;
           url: string;
           photographer: string;
           photographer_url: string;
           src: {
             original: string;
             large2x: string;
             large: string;
             medium: string;
             small: string;
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
         Pexels Image ID: ${photo.id}
         Photographer: ${photo.photographer}
         Photographer URL: ${photo.photographer_url}
         Original Image URL: ${photo.url}
         License: Pexels License (Free to use, attribution appreciated)
         Downloaded: ${timestamp}
         ```
   2. IF [[User]] NEEDS specific size
      1. THEN [[GPT Agent]] SUGGEST appropriate src
         ```typescript
         type ImageSize = 'original' | 'large2x' | 'large' | 'medium' | 'small'
         ```
   3. IF [[User]] WANTS local copy
      1. THEN [[GPT Agent]] SAVE to specified path
      2. AND [[GPT Agent]] SAVE attribution file

NOTE: Remember to always create attribution files when downloading images. Pexels requires proper attribution for image usage. Default download size is large2x for optimal quality. 