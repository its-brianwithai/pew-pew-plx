# Turbo Developer MCP Server

A custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE, with special features for the Ultra Wide Turbo Workspace.

## Overview

This MCP server implements the [Model Context Protocol](https://modelcontextprotocol.io/) specification, allowing seamless integration with AI assistants like Claude in Cursor IDE. It provides various tools and services through a standardized interface, including Ghost blog integration.

## Version

Current version: 0.0.2 (April 15, 2025)

## Installation

```bash
# Install dependencies
npm install

# Build the server
npm run build
```

## Usage

### Running the server

```bash
# Start the server
npm start

# For development with auto-reload
npm run dev
```

## Available Tools

### list_tools

Returns a JSON list of all available tools with their descriptions, parameters, and examples.

- **Tool Name**: `list_tools`
- **Description**: Returns a JSON list of all available tools with their descriptions, parameters, and examples
- **Parameters**: None
- **Example Usage**:
  ```typescript
  // Call the list_tools tool without any parameters
  const result = await mcpClient.callTool({
    name: 'list_tools',
    arguments: {}
  });
  ```
- **Response Format**:
  ```json
  {
    "tools": [
      {
        "name": "list_tools",
        "description": "Returns a JSON list of all available tools with their descriptions, parameters, and examples",
        "parameters": [],
        "examples": [...],
        "responseFormat": {...}
      },
      {
        "name": "get_readme",
        "description": "Returns the contents of the project README.md file as JSON with metadata",
        "parameters": [],
        "examples": [...],
        "responseFormat": {...}
      }
    ],
    "count": 2,
    "server": {
      "name": "turbo-mcp",
      "version": "0.0.1"
    }
  }
  ```

### get_readme

Returns the contents of the project README.md file as JSON with metadata.

- **Tool Name**: `get_readme`
- **Description**: Returns the contents of the project README.md file as JSON with metadata
- **Parameters**: None
- **Example Usage**:
  ```typescript
  // Call the get_readme tool without any parameters
  const result = await mcpClient.callTool({
    name: 'get_readme',
    arguments: {}
  });
  ```
- **Response Format**:
  ```json
  {
    "filename": "README.md",
    "content": "# Turbo MCP Server\n\nA custom Model Context Protocol...",
    "byteLength": 2048,
    "lastModified": "2025-03-30T22:45:00.000Z"
  }
  ```
- **Error Response**:
  ```json
  {
    "error": "Error reading README.md: [error message]",
    "status": "error"
  }
  ```

### create_ghost_draft_for_uwtd

Creates a draft post on the Ultra Wide Turbo Devs Ghost blog. This tool is optimized to work with the mobiledoc format using markdown cards for reliable content display.

- **Tool Name**: `create_ghost_draft_for_uwtd`
- **Description**: Creates a draft post on the Ultra Wide Turbo Devs Ghost blog
- **Parameters**:
  - `title` (string, optional): The title of the post
  - `mobiledoc` (string, optional): The content in mobiledoc format with markdown card (Ghost's preferred format)
  - `feature_image` (string, optional): URL of the feature image
  - `featured` (boolean, optional): Whether this post is featured
  - `tags` (array, optional): Tags for the post
  - `authors` (array, optional): Authors of the post
  - `visibility` (enum, optional): Visibility of the post ('public', 'members', 'paid', 'tiers')
  - And many other SEO and formatting options (see code for full list)

- **Important Note**: The only supported content format is mobiledoc with markdown card. HTML content is not supported as it can lead to display issues.

- **Example Usage**:
  ```typescript
  // Call the create_ghost_draft_for_uwtd tool with mobiledoc
  const result = await mcpClient.callTool({
    name: 'create_ghost_draft_for_uwtd',
    arguments: {
      title: 'My Test Post',
      mobiledoc: JSON.stringify({
        "version": "0.3.1",
        "ghostVersion": "4.0",
        "markups": [],
        "atoms": [],
        "cards": [
          ["markdown", { 
            "markdown": "## Test Header\n\nThis is a simple test with the markdown card which is well supported in Ghost.\n\n* Item 1\n* Item 2\n* Item 3\n\nThis should definitely show up."
          }]
        ],
        "sections": [[10, 0]]
      })
    }
  });
  ```
- **Using Mobiledoc Format**:
  Ghost's preferred content format is mobiledoc with the markdown card, which is the most reliable way to ensure content shows up correctly. Always use the format shown in the example above with these key elements:
  - Include `"ghostVersion": "4.0"` in your mobiledoc
  - Use the `["markdown", { "markdown": "..." }]` card 
  - Write your content in markdown format inside the card
  - Ensure the sections array points to your card with `[[10, 0]]`
  - Support for standard markdown formatting includes:
    - Headers (`#`, `##`, `###`, etc.)
    - Lists (bulleted and numbered)
    - Links `[text](url)`
    - Emphasis (`*italic*`, `**bold**`)
    - Code blocks (```code```)
    - Blockquotes (`>`)

- **Response Format**:
  ```json
  {
    "success": true,
    "post": {
      "id": "6425dc63a5e3824ac6199376",
      "uuid": "8b4de54c-fd5e-4bc6-af89-3326d9754490",
      "title": "My Test Post",
      "slug": "my-test-post",
      "status": "draft",
      "url": "https://www.ultrawideturbodevs.com/p/8b4de54c-fd5e-4bc6-af89-3326d9754490/"
    }
  }
  ```
- **Error Response**:
  ```json
  {
    "success": false,
    "error": "Failed to create Ghost draft post",
    "details": "[error message]"
  }
  ```

- **Accessing Created Posts**: 
  After creating a draft post, you can access it in the Ghost admin panel or directly through the URL returned in the response. The post will be in draft status and ready for review.

- **Authentication**: 
  This tool requires Ghost Admin API credentials to be set in your `~/.cursor/mcp.json` file as described in the Environment Variables section.

## Environment Variables

These environment variables need to be set in the `env` section of your `~/.cursor/mcp.json` file:

| Variable | Description | Default |
|----------|-------------|---------|
| GHOST_ADMIN_API_URL | The URL of the Ghost Admin API | https://ultrawideturbodevs.ghost.io/ghost/api/admin |
| GHOST_ADMIN_API_KEY | The Ghost Admin API key in format `id:secret` | - |

### Ghost API Key

The Ghost Admin API key must be in the format `id:secret` as provided by the Ghost Admin settings. For example:
```
67eaf59d3c6f52000126a266:219fe7b508ed9d8d846a645c42e49c16fa9d217231f6abfa6c062a95f3fb5643
```

To get your Ghost Admin API key:
1. Log in to your Ghost Admin panel
2. Go to Settings → Integrations
3. Click "Add custom integration"
4. Give it a name (e.g., "Turbo MCP")
5. Copy the Admin API Key (it's in the format `id:secret`)

Example update to your `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "turbo-developer-mcp": {
      "command": "node",
      "args": [
        "/Users/username/path/to/developer/tools/turbo-developer-mcp/dist/index.js"
      ],
      "env": {
        "GHOST_ADMIN_API_KEY": "67eaf59d3c6f52000126a266:219fe7b508ed9d8d846a645c42e49c16fa9d217231f6abfa6c062a95f3fb5643",
        "GHOST_ADMIN_API_URL": "https://ultrawideturbodevs.ghost.io/ghost/api/admin"
      }
    }
  }
}
```

## Adding to Cursor

To use this MCP server with Cursor, add the following to your `~/.cursor/mcp.json` file:

```json
{
  "mcpServers": {
    "turbo-developer-mcp": {
      "command": "node",
      "args": [
        "<path-to-project>/dist/index.js"
      ],
      "env": {
        "GHOST_ADMIN_API_URL": "https://ultrawideturbodevs.ghost.io/ghost/api/admin",
        "GHOST_ADMIN_API_KEY": "your_id:your_secret"
      }
    }
  }
}
```

Replace `<path-to-project>` with the absolute path to this project directory, and specify the Ghost API credentials in the `env` section. The API key should be in the format `id:secret` as provided by the Ghost Admin API.

## Development

### Adding New Tools

To add a new tool to the server, modify the `src/index.ts` file:

```typescript
// Define the tool
server.tool(
  'tool_name',
  { 
    param1: z.string(),
    param2: z.number().optional()
  },
  async ({ param1, param2 }: { param1: string, param2?: number }) => {
    // Your tool implementation
    return {
      content: [{ 
        type: 'text', 
        text: 'Result of operation' 
      }]
    };
  }
);

// Register the tool with comprehensive documentation
registeredTools.push({
  name: 'tool_name',
  description: 'Description of what the tool does',
  parameters: [
    {
      name: 'param1',
      type: 'string',
      description: 'Description of param1',
      required: true
    },
    {
      name: 'param2',
      type: 'number',
      description: 'Description of param2',
      required: false
    }
  ],
  examples: [
    {
      description: 'Example use case',
      parameters: {
        param1: 'example value',
        param2: 42
      },
      response: 'Example response'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Description of the response format',
    schema: {
      // JSON Schema object describing the response
    }
  }
});
```

### Adding New Services

Create service files in the `src/services` directory to implement reusable functionality that can be accessed by multiple tools.

### Response Objects

Response objects are defined in the `src/responses` directory. Each response type should be in its own file with a name ending in `Response.ts`.

For example:
- `ListToolsResponse.ts`
- `ReadmeResponse.ts`

This helps maintain a clean and organized codebase by separating the response structure from the implementation logic.

## Troubleshooting

### Path Resolution

When using the `get_readme` tool, the server needs to find the README.md file in the project directory. Since this project uses ES modules (type: "module" in package.json), we use `import.meta.url` instead of `__dirname` to resolve file paths:

```typescript
// Example of correct path resolution in ES modules
const modulePath = new URL(import.meta.url).pathname;
const moduleDir = path.dirname(modulePath);
const projectRoot = path.resolve(moduleDir, '..');
const readmePath = path.join(projectRoot, 'README.md');
```

If you're running into path resolution issues:
1. Make sure you're running the server from the correct directory
2. Check that your file paths are being resolved correctly for your environment
3. Remember that paths are relative to where the server is running, not where it's installed

### Server Not Starting

If you encounter issues with npm commands like `npm start` or `npm run dev` failing:
1. Make sure you're in the correct directory (the one containing package.json)
2. Try running the commands directly from the `turbo-mcp` directory
3. Check for any errors in the build process

## Best Practices for MCP Tools

Following the [MCP documentation best practices](https://modelcontextprotocol.io/docs/concepts/tools#best-practices):

1. Provide clear, descriptive names and descriptions
2. Use detailed JSON Schema definitions for parameters
3. Include examples in tool descriptions to demonstrate how the model should use them
4. Implement proper error handling and validation
5. Use progress reporting for long operations
6. Keep tool operations focused and atomic
7. Document expected return value structures
8. Implement proper timeouts
9. Consider rate limiting for resource-intensive operations
10. Log tool usage for debugging and monitoring 