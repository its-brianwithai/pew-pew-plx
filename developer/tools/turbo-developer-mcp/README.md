# Turbo MCP Server

A custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE.

## Overview

This MCP server implements the [Model Context Protocol](https://modelcontextprotocol.io/) specification, allowing seamless integration with AI assistants like Claude in Cursor IDE. It provides various tools and services through a standardized interface.

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

## Adding to Cursor

To use this MCP server with Cursor, add the following to your `~/.cursor/mcp.json` file:

```json
{
  "mcpServers": {
    "turbo-mcp": {
      "command": "node",
      "args": [
        "<path-to-project>/dist/index.js"
      ]
    }
  }
}
```

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