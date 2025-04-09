# How To Create A Local Role-Based MCP Server

These instructions will guide you through creating a custom Model Context Protocol (MCP) server for your role in the Ultra Wide Turbo Workspace. MCPs allow you to extend Cursor IDE's capabilities by providing custom tools and services specific to your role's needs.

## Prerequisites

- [ ] Node.js installed on your system
- [ ] Basic understanding of TypeScript
- [ ] Cursor IDE installed
- [ ] Access to your `~/.cursor/mcp.json` configuration file

## Project Setup

- [ ] Create a new directory for your MCP server in your role's tools directory:

```bash
mkdir -p your-role/tools/your-role-mcp
cd your-role/tools/your-role-mcp
```

- [ ] Initialize a new Node.js project:

```bash
npm init -y
```

- [ ] Install required dependencies:

```bash
npm install @modelcontextprotocol/sdk zod
npm install --save-dev typescript @types/node
```

- [ ] Create a `tsconfig.json` file:

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

- [ ] Update your `package.json` to include:

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

- [ ] Create a `.gitignore` file to exclude build results and dependencies:

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

## Project Structure

- [ ] Create the following directory structure:

```
your-role-mcp/
├── src/
│   ├── index.ts
│   ├── responses/
│   │   ├── ListToolsResponse.ts
│   │   └── YourCustomResponse.ts
│   └── services/
│       └── YourService.ts
├── package.json
├── tsconfig.json
└── .gitignore
```

## Implementation

- [ ] Create response types in `src/responses/ListToolsResponse.ts`:

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

- [ ] Create your main server file `src/index.ts`:

```typescript
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import { ListToolsResponse, ToolInfo } from './responses/ListToolsResponse.js';

const server = new McpServer({
  name: 'your-role-mcp',
  version: '0.0.1'
});

// Keep track of registered tools with descriptions
const registeredTools: ToolInfo[] = [];

// Example tool: List all available tools
server.tool(
  'list_tools',
  {},
  async () => {
    const response: ListToolsResponse = {
      tools: registeredTools,
      count: registeredTools.length,
      server: {
        name: 'your-role-mcp',
        version: '0.0.1'
      }
    };

    return {
      content: [{ 
        type: 'text', 
        text: JSON.stringify(response, null, 2)
      }]
    };
  }
);

// Register the list_tools tool info
registeredTools.push({
  name: 'list_tools',
  description: 'Returns a JSON list of all available tools with their descriptions, parameters, and examples',
  parameters: [],
  examples: [
    {
      description: 'List all available tools',
      parameters: {},
      response: JSON.stringify({
        tools: [],
        count: 0,
        server: {
          name: 'your-role-mcp',
          version: '0.0.1'
        }
      }, null, 2)
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns information about all available tools',
    schema: {
      type: 'object',
      properties: {
        tools: {
          type: 'array',
          items: {
            type: 'object',
            properties: {
              name: { type: 'string' },
              description: { type: 'string' },
              parameters: { type: 'array' },
              examples: { type: 'array' },
              responseFormat: { type: 'object' }
            }
          }
        },
        count: { type: 'number' },
        server: {
          type: 'object',
          properties: {
            name: { type: 'string' },
            version: { type: 'string' }
          }
        }
      }
    }
  }
});

// Start the server with stdio transport
console.error('Starting your-role-mcp server...');
const transport = new StdioServerTransport();

process.on('SIGINT', () => {
  console.error('Shutting down your-role-mcp server...');
  process.exit(0);
});

await server.connect(transport);
```

## Adding Custom Tools

- [ ] Add a new tool following this pattern:

```typescript
// Define the tool with its parameters
server.tool(
  'your_tool_name',
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

// Register tool documentation
registeredTools.push({
  name: 'your_tool_name',
  description: 'Description of what your tool does',
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

## Building and Running

- [ ] Build your MCP server:

```bash
npm run build
```

- [ ] Test running your server:

```bash
npm start
```

## Integration with Cursor

- [ ] Add your MCP server to Cursor by modifying `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "your-role-mcp": {
      "command": "node",
      "args": [
        "/absolute/path/to/your/role/tools/your-role-mcp/dist/index.js"
      ],
      "env": {
        "API_URL": "https://api.example.com",
        "API_KEY": "your-api-key"
      }
    }
  }
}
```

## Best Practices

- [ ] Follow Tool Naming conventions:
   - Use clear, descriptive names
   - Follow a consistent naming pattern
   - Prefix tools with your role if needed

- [ ] Implement proper Documentation:
   - Provide detailed descriptions
   - Include practical examples
   - Document all parameters
   - Specify response formats

- [ ] Follow Implementation guidelines:
   - Keep tools focused and atomic
   - Implement proper error handling
   - Use TypeScript for type safety
   - Follow single responsibility principle

- [ ] Maintain Organization:
   - Keep related tools together
   - Use services for shared functionality
   - Maintain clear file structure
   - Follow the role-based organization

## Example Tools to Consider

- [ ] Plan and implement tools for:
   1. Automating repetitive tasks
   2. Providing role-specific information
   3. Integrating with external services
   4. Handling file operations
   5. Processing and transforming data

Remember to align your tools with your role's responsibilities and the Ultra Wide Turbo Workspace structure.

## Troubleshooting Checklist

- [ ] If Server Not Starting:
   - Check if the path in mcp.json is correct
   - Ensure all dependencies are installed
   - Verify the build was successful

- [ ] If Tool Not Found:
   - Verify tool registration in registeredTools
   - Check tool name spelling
   - Restart Cursor IDE

- [ ] If Path Resolution Issues:
   - Use absolute paths in mcp.json
   - Verify file permissions
   - Check working directory 

## Integrating with External APIs

When creating tools that interface with external services like the Ghost Admin API, follow these guidelines:

- [ ] Handle API Authentication properly:
   - Store credentials in the `env` section of `~/.cursor/mcp.json`, not in your code
   - Use secure methods for authentication (e.g., JWT tokens)
   - Include proper error handling for authentication failures

- [ ] Follow these steps for secure API integration:
   1. Create a dedicated service file for the API (e.g., `services/GhostService.ts`)
   2. Handle authentication and token generation in the service
   3. Implement proper error handling with meaningful messages
   4. Document required environment variables
   5. Provide examples of configuration in your README

### Example: Ghost API Integration

Here's an example of how we implemented the complete Ghost API integration with support for all CRUD operations:

```typescript
// services/GhostService.ts
import axios from 'axios';
import crypto from 'crypto';

export interface GhostPostParams {
  title?: string;
  mobiledoc?: string;
  // ... other parameters
}

export class GhostService {
  private readonly adminApiUrl: string;
  private readonly adminApiKey: string;
  private readonly keyId: string;
  private readonly keySecret: string;

  constructor() {
    this.adminApiUrl = process.env.GHOST_ADMIN_API_URL || '';
    this.adminApiKey = process.env.GHOST_ADMIN_API_KEY || '';
    
    if (!this.adminApiKey) {
      throw new Error('Ghost Admin API Key is required');
    }

    // Split the key into ID and SECRET
    const [id, secret] = this.adminApiKey.split(':');
    
    if (!id || !secret) {
      throw new Error('Invalid Admin API Key format. Expected format: "id:secret"');
    }

    this.keyId = id;
    this.keySecret = secret;
  }

  // GET - Retrieve resources
  async getResource(endpoint: string) {
    try {
      const token = this.generateToken();
      
      const response = await axios.get(`${this.adminApiUrl}/${endpoint}`, {
        headers: {
          'Authorization': `Ghost ${token}`,
          'Content-Type': 'application/json',
          'Accept-Version': 'v5.0'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`Ghost API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // POST - Create a new resource
  async createResource(endpoint: string, data: any) {
    try {
      const token = this.generateToken();

      const response = await axios.post(`${this.adminApiUrl}/${endpoint}`, data, {
        headers: {
          'Authorization': `Ghost ${token}`,
          'Content-Type': 'application/json',
          'Accept-Version': 'v5.0'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`Ghost API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // PUT - Update an existing resource
  async updateResource(endpoint: string, data: any) {
    try {
      const token = this.generateToken();

      const response = await axios.put(`${this.adminApiUrl}/${endpoint}`, data, {
        headers: {
          'Authorization': `Ghost ${token}`,
          'Content-Type': 'application/json',
          'Accept-Version': 'v5.0'
        }
      });

      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`Ghost API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  // DELETE - Remove a resource
  async deleteResource(endpoint: string) {
    try {
      const token = this.generateToken();

      const response = await axios.delete(`${this.adminApiUrl}/${endpoint}`, {
        headers: {
          'Authorization': `Ghost ${token}`,
          'Content-Type': 'application/json',
          'Accept-Version': 'v5.0'
        }
      });

      return { success: true, data: response.data };
    } catch (error) {
      if (axios.isAxiosError(error)) {
        throw new Error(`Ghost API error: ${error.message} - ${JSON.stringify(error.response?.data || {})}`);
      }
      throw error;
    }
  }

  private generateToken() {
    // Create proper JWT token with header that includes kid
    // ... JWT token generation code
  }
}
```

```typescript
// Implementation of the four Ghost API tools
// GET 
server.tool(
  'ghost_get',
  { 
    endpoint: z.string().describe('The Ghost API endpoint path (e.g., "posts", "posts/123", "tags")')
  },
  async ({ endpoint }) => {
    try {
      const ghostService = new GhostService();
      const result = await ghostService.getResource(endpoint);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// POST
server.tool(
  'ghost_post',
  { 
    endpoint: z.string().describe('The Ghost API endpoint path (e.g., "posts", "tags")'),
    data: z.record(z.any()).describe('The data to send in the POST request')
  },
  async ({ endpoint, data }) => {
    try {
      const ghostService = new GhostService();
      const result = await ghostService.createResource(endpoint, data);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// PUT
server.tool(
  'ghost_put',
  { 
    endpoint: z.string().describe('The Ghost API endpoint path (e.g., "posts/123", "tags/456")'),
    data: z.record(z.any()).describe('The data to send in the PUT request')
  },
  async ({ endpoint, data }) => {
    try {
      const ghostService = new GhostService();
      const result = await ghostService.updateResource(endpoint, data);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);

// DELETE
server.tool(
  'ghost_delete',
  { 
    endpoint: z.string().describe('The Ghost API endpoint path (e.g., "posts/123", "tags/456")')
  },
  async ({ endpoint }) => {
    try {
      const ghostService = new GhostService();
      const result = await ghostService.deleteResource(endpoint);
      
      return {
        content: [{ type: 'text', text: JSON.stringify(result) }]
      };
    } catch (error) {
      return {
        isError: true,
        content: [{ type: 'text', text: `Error: ${(error as Error).message}` }]
      };
    }
  }
);
```

### Configuring Credentials

In your documentation, explain how to configure the required environment variables:

```json
// ~/.cursor/mcp.json
{
  "mcpServers": {
    "your-role-mcp": {
      "command": "node",
      "args": [
        "/path/to/your/mcp/dist/index.js"
      ],
      "env": {
        "API_URL": "https://api.example.com",
        "API_KEY": "your-api-key"
      }
    }
  }
}
```
