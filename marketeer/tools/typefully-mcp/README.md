# Typefully MCP Server

A Model Context Protocol (MCP) server for interacting with the Typefully API. This server enables AI agents within Cursor IDE to perform actions such as creating drafts, retrieving scheduled and published content from Typefully.

## Features

- Create new drafts with support for threadify, scheduling, and more
- Retrieve recently scheduled drafts
- Retrieve recently published drafts

## Installation

1. Clone the repository
2. Install dependencies:
   ```
   npm install
   ```
3. Build the project:
   ```
   npm run build
   ```

## Configuration

To use this MCP server, you need to:

1. Obtain a Typefully API key from your Typefully account
2. Add the MCP configuration to your `~/.cursor/mcp.json` file:

```json
{
  "typefully-mcp": {
    "command": "node",
    "args": ["/path/to/typefully-mcp/dist/index.js"],
    "env": {
      "TYPEFULLY_API_KEY": "your-api-key-here"
    }
  }
}
```

## Available Tools

### typefully_create_draft

Creates a new draft in Typefully.

**Parameters:**
- `content` (required): The content of the draft
- `threadify` (optional): Whether to threadify the content (default: false)
- `share` (optional): Whether to share the draft (default: false)
- `schedule_date` (optional): The date to schedule the draft for publication (ISO format)
- `auto_retweet_enabled` (optional): Whether to enable auto-retweet (default: false)
- `auto_plug_enabled` (optional): Whether to enable auto-plug (default: false)

### typefully_get_scheduled_drafts

Retrieves recently scheduled drafts from Typefully.

**Parameters:**
- `content_filter` (optional): Filter drafts by content

### typefully_get_published_drafts

Retrieves recently published drafts from Typefully.

**Parameters:** None

## Development

- Start the development server:
  ```
  npm run dev
  ```

## Building

- Build the project:
  ```
  npm run build
  ```

- Start the production server:
  ```
  npm start
  ```

## License

ISC 