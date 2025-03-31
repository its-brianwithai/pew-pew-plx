# How to Convert Any API into a Local MCP Server

This tutorial will guide you through the process of creating a Model Context Protocol (MCP) server that provides a complete integration with an external API service. You'll learn how to implement all CRUD operations (Create, Read, Update, Delete) and configure the server for use with Cursor IDE.

## Prerequisites

Before you begin, make sure you have:

- Node.js installed on your system
- Basic understanding of TypeScript
- Cursor IDE installed
- Access to your `~/.cursor/mcp.json` configuration file
- API credentials for the service you want to integrate

## Project Setup

1. Create a new directory for your MCP server in your tools directory:

```bash
mkdir -p your-tools/your-api-mcp
cd your-tools/your-api-mcp
```

2. Initialize a new Node.js project:

```bash
npm init -y
```

3. Install required dependencies:

```bash
npm install @modelcontextprotocol/sdk zod axios
npm install --save-dev typescript @types/node
```

4. Create a `tsconfig.json` file:

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ES2020",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

5. Update your `package.json` to include:

```json
{
  "type": "module",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsc -w"
  }
}
```

6. Create a `.gitignore` file:

```
# Dependencies
node_modules/
package-lock.json

# Build output
dist/
build/

# TypeScript
*.tsbuildinfo

# Environment variables
.env
.env.local
.env.*.local

# IDE - VSCode
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# IDE - JetBrains
.idea/
*.iml
*.iws

# Logs
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Operating System
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Optional test coverage directory
coverage/

# Temporary files
*.swp
*.swo
*~
```

7. Create a `.env.example` file to show which environment variables are needed:

```
API_URL=https://api.example.com/v1
API_KEY=your_api_key_here
```

8. Create the following directory structure:

```
your-api-mcp/
├── src/
│   ├── index.ts
│   ├── responses/
│   │   └── ListToolsResponse.ts
│   └── services/
│       └── ApiService.ts
├── package.json
├── tsconfig.json
├── .env.example
└── .gitignore
```

## Creating Response Types

Create the file `src/responses/ListToolsResponse.ts` with the following content:

```typescript
export interface ToolInfo {
  name: string;
  description: string;
  parameters: {
    name: string;
    type: string;
    description: string;
    required: boolean;
  }[];
  examples: {
    description: string;
    parameters: Record<string, unknown>;
    response: string;
  }[];
  responseFormat: {
    type: string;
    description: string;
    schema: Record<string, unknown>;
  };
}

export interface ListToolsResponse {
  tools: ToolInfo[];
  count: number;
  server: {
    name: string;
    version: string;
  };
}
```

## Implementing the API Service

Create the file `src/services/ApiService.ts` with the following content. This is a generic service that you can adapt to your specific API:

```typescript
import axios from 'axios';

export class ApiService {
  private readonly apiUrl: string;
  private readonly apiKey: string;
  
  constructor() {
    this.apiUrl = process.env.API_URL || '';
    this.apiKey = process.env.API_KEY || '';
    
    if (!this.apiUrl) {
      throw new Error('API URL is required');
    }
    
    if (!this.apiKey) {
      throw new Error('API Key is required');
    }
  }

  // GET - Retrieve resources
  async getResource(endpoint: string) {
    try {
      const token = this.generateAuthHeader();
      
      const response = await axios.get(`${this.apiUrl}/${endpoint}`, {
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // POST - Create a new resource
  async createResource(endpoint: string, data: any) {
    try {
      const token = this.generateAuthHeader();

      const response = await axios.post(`${this.apiUrl}/${endpoint}`, data, {
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // PUT - Update an existing resource
  async updateResource(endpoint: string, data: any) {
    try {
      const token = this.generateAuthHeader();

      const response = await axios.put(`${this.apiUrl}/${endpoint}`, data, {
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // DELETE - Remove a resource
  async deleteResource(endpoint: string) {
    try {
      const token = this.generateAuthHeader();

      const response = await axios.delete(`${this.apiUrl}/${endpoint}`, {
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json'
        }
      });

      return { success: true, data: response.data };
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  private generateAuthHeader() {
    // Implement your authentication method here
    // This is a simple example for API key authentication
    return `Bearer ${this.apiKey}`;
    
    // For more complex authentication (like OAuth or JWT), 
    // you would generate and return the appropriate token
  }
}
```

## Implementing the MCP Server

Create the file `src/index.ts` with the following content:

```typescript
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import { ListToolsResponse, ToolInfo } from './responses/ListToolsResponse.js';
import { ApiService } from './services/ApiService.js';

// Initialize the MCP server
const server = new McpServer({
  name: 'api-mcp',
  version: '0.0.1'
});

// Keep track of registered tools with descriptions
const registeredTools: ToolInfo[] = [];

// Tool: List all available tools
server.tool(
  'list_tools',
  {},
  async () => {
    const response: ListToolsResponse = {
      tools: registeredTools,
      count: registeredTools.length,
      server: {
        name: 'api-mcp',
        version: '0.0.1'
      }
    };
    
    return {
      content: [{ type: 'text', text: JSON.stringify(response, null, 2) }]
    };
  }
);

// Register the list_tools tool
registeredTools.push({
  name: 'list_tools',
  description: 'Returns a JSON list of all available tools with their descriptions, parameters, and examples',
  parameters: [],
  examples: [
    {
      description: 'List all available tools',
      parameters: {},
      response: '{"tools":[...],"count":4,"server":{"name":"api-mcp","version":"0.0.1"}}'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'JSON object containing array of tools, count, and server info',
    schema: {}
  }
});

// Tool: GET operation
server.tool(
  'api_get',
  { 
    endpoint: z.string().describe('The API endpoint path')
  },
  async ({ endpoint }) => {
    try {
      const apiService = new ApiService();
      const result = await apiService.getResource(endpoint);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result, null, 2) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// Register the api_get tool
registeredTools.push({
  name: 'api_get',
  description: 'Makes a GET request to the API with automatic authentication',
  parameters: [
    {
      name: 'endpoint',
      type: 'string',
      description: 'The API endpoint path',
      required: true
    }
  ],
  examples: [
    {
      description: 'Get all resources',
      parameters: {
        endpoint: 'resources'
      },
      response: '{"data":[...]}'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'API response in JSON format',
    schema: {}
  }
});

// Tool: POST operation
server.tool(
  'api_post',
  { 
    endpoint: z.string().describe('The API endpoint path'),
    data: z.record(z.any()).describe('The data to send in the POST request')
  },
  async ({ endpoint, data }) => {
    try {
      const apiService = new ApiService();
      const result = await apiService.createResource(endpoint, data);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result, null, 2) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// Register the api_post tool
registeredTools.push({
  name: 'api_post',
  description: 'Makes a POST request to the API with automatic authentication',
  parameters: [
    {
      name: 'endpoint',
      type: 'string',
      description: 'The API endpoint path',
      required: true
    },
    {
      name: 'data',
      type: 'object',
      description: 'The data to send in the POST request',
      required: true
    }
  ],
  examples: [
    {
      description: 'Create a new resource',
      parameters: {
        endpoint: 'resources',
        data: {
          name: 'Example Resource',
          description: 'This is an example resource'
        }
      },
      response: '{"id":"123","name":"Example Resource","description":"This is an example resource"}'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'API response in JSON format',
    schema: {}
  }
});

// Tool: PUT operation
server.tool(
  'api_put',
  { 
    endpoint: z.string().describe('The API endpoint path'),
    data: z.record(z.any()).describe('The data to send in the PUT request')
  },
  async ({ endpoint, data }) => {
    try {
      const apiService = new ApiService();
      const result = await apiService.updateResource(endpoint, data);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result, null, 2) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// Register the api_put tool
registeredTools.push({
  name: 'api_put',
  description: 'Makes a PUT request to the API with automatic authentication',
  parameters: [
    {
      name: 'endpoint',
      type: 'string',
      description: 'The API endpoint path',
      required: true
    },
    {
      name: 'data',
      type: 'object',
      description: 'The data to send in the PUT request',
      required: true
    }
  ],
  examples: [
    {
      description: 'Update a resource',
      parameters: {
        endpoint: 'resources/123',
        data: {
          name: 'Updated Resource',
          updated_at: "2025-04-15T12:00:00.000Z"
        }
      },
      response: '{"id":"123","name":"Updated Resource"}'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'API response in JSON format',
    schema: {}
  }
});

// Tool: DELETE operation
server.tool(
  'api_delete',
  { 
    endpoint: z.string().describe('The API endpoint path')
  },
  async ({ endpoint }) => {
    try {
      const apiService = new ApiService();
      const result = await apiService.deleteResource(endpoint);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result, null, 2) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// Register the api_delete tool
registeredTools.push({
  name: 'api_delete',
  description: 'Makes a DELETE request to the API with automatic authentication',
  parameters: [
    {
      name: 'endpoint',
      type: 'string',
      description: 'The API endpoint path',
      required: true
    }
  ],
  examples: [
    {
      description: 'Delete a resource',
      parameters: {
        endpoint: 'resources/123'
      },
      response: '{"success":true,"data":""}'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'API response in JSON format with success status',
    schema: {}
  }
});

// Start the server
server.start(new StdioServerTransport());
console.error('MCP Server started');
```

## Building and Running the Server

1. Create the directory structure and files as described above.

2. Build the TypeScript code:

```bash
npm run build
```

3. Start the server:

```bash
npm start
```

## Configuring Cursor for Your MCP Server

To use your MCP server with Cursor IDE, you need to update your `~/.cursor/mcp.json` file. Here's an example configuration:

```json
{
  "mcpServers": {
    "api-mcp": {
      "command": "node",
      "args": [
        "/absolute/path/to/your/api-mcp/dist/index.js"
      ],
      "env": {
        "API_URL": "https://api.example.com/v1",
        "API_KEY": "your_api_key_here"
      }
    }
  }
}
```

Replace `/absolute/path/to/your/api-mcp/dist/index.js` with the actual path to your built `index.js` file, and set the appropriate values for `API_URL` and `API_KEY`.

## Customizing for Specific APIs

When adapting this template for a specific API, you'll need to:

1. Set up the correct environment variables in your `~/.cursor/mcp.json` file
2. Modify the `ApiService` class to implement appropriate authentication for your API
3. Adjust any headers, request parameters, or response handling as needed
4. Name your tools appropriately for your specific API (e.g., `your_api_get`, `your_api_post`, etc.)

For APIs that require special authentication, you might need to create a custom token generation function. Here's an example structure for custom authentication:

```typescript
private generateAuthHeader() {
  // For OAuth authentication
  // return `Bearer ${this.getOAuthToken()}`;
  
  // For API key in header
  // return this.apiKey;
  
  // For basic authentication
  // const encodedCredentials = Buffer.from(`${this.username}:${this.password}`).toString('base64');
  // return `Basic ${encodedCredentials}`;
  
  // For JWT
  // return this.generateJWT();
}
```

## Testing Your MCP Server

Once your MCP server is properly configured in Cursor IDE, you can test it by:

1. Opening Cursor IDE
2. Creating a new chat with Claude or another AI assistant
3. Using the available tools in your conversation

For example, you could ask the assistant to list your API resources:

```
Could you list the first few resources from our API using the api_get tool?
```

The assistant will use your MCP server's `api_get` tool to fetch and display the resources.

## Troubleshooting

If you encounter issues with your MCP server:

1. Check your environment variables in `~/.cursor/mcp.json` to ensure they're correctly configured
2. Ensure your API service has proper error handling
3. Review the server logs for any error messages
4. Verify your authentication implementation is correct for the specific API
5. Make sure you're not outputting any console.log statements that could interfere with the JSON output

## Conclusion

You've now created a fully functional MCP server that integrates with an external API service. This server provides tools for all CRUD operations, and you can extend it further by adding more specialized tools as needed.

By following this pattern, you can easily integrate any API with Cursor IDE, giving AI assistants like Claude the ability to interact with external services on your behalf. 