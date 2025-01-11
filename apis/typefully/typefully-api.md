# Typefully API Integration

## Overview
Typefully is a platform for writing and scheduling Twitter threads. This integration allows us to interact with the Typefully API for managing Twitter content.

## Authentication
- API Key is required for all requests
- Store the API key in `.env` file
- Example in `.env.example`

## Base URL
```
https://api.typefully.com/
```

## Endpoints

### Drafts
- GET `/drafts` - List all drafts
- POST `/drafts` - Create a new draft
- GET `/drafts/{id}` - Get a specific draft
- PUT `/drafts/{id}` - Update a draft
- DELETE `/drafts/{id}` - Delete a draft

### Threads
- GET `/threads` - List all threads
- POST `/threads` - Create a new thread
- GET `/threads/{id}` - Get a specific thread
- PUT `/threads/{id}` - Update a thread
- DELETE `/threads/{id}` - Delete a thread

## Example Usage
```javascript
const headers = {
  'Authorization': `Bearer ${process.env.TYPEFULLY_API_KEY}`,
  'Content-Type': 'application/json'
};

// List all drafts
fetch('https://api.typefully.com/drafts', { headers })
  .then(response => response.json())
  .then(data => console.log(data));
```

## Rate Limits
- Standard rate limits apply
- Check response headers for limit information

## Error Handling
Common error codes:
- 401: Invalid API key
- 403: Forbidden
- 404: Resource not found
- 429: Rate limit exceeded

## Testing
To test the API connection:
1. Ensure `.env` file is set up with valid API key
2. Try listing drafts as a basic connectivity test
3. Check response status and data structure 