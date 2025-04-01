import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import { ListToolsResponse, ToolInfo } from './responses/ListToolsResponse.js';
import { TypefullyApiResponse, TypefullyErrorResponse } from './responses/TypefullyApiResponse.js';
import { TypefullyService, TypefullyDraftParams, TypefullyScheduledDraftsParams } from './services/TypefullyService.js';

const server = new McpServer({
  name: 'typefully-mcp',
  version: '1.0.0'
});

// Keep track of registered tools with descriptions
const registeredTools: ToolInfo[] = [];

// List all available tools
server.tool(
  'list_tools',
  {},
  async () => {
    const response: ListToolsResponse = {
      tools: registeredTools,
      count: registeredTools.length,
      server: {
        name: 'typefully-mcp',
        version: '1.0.0'
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
        tools: [
          {
            name: 'list_tools',
            description: 'Returns a JSON list of all available tools...',
            // other fields would be included here
          }
        ],
        count: 1,
        server: {
          name: 'typefully-mcp',
          version: '1.0.0'
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

// Define schema for typefully_create_draft
const createDraftSchema = {
  content: z.string().describe('The content of the draft'),
  threadify: z.boolean().optional().describe('Whether to threadify the content (default: false)'),
  share: z.boolean().optional().describe('Whether to share the draft (default: false)'),
  schedule_date: z.string().optional().describe('The date to schedule the draft for publication (ISO format)'),
  auto_retweet_enabled: z.boolean().optional().describe('Whether to enable auto-retweet (default: false)'),
  auto_plug_enabled: z.boolean().optional().describe('Whether to enable auto-plug (default: false)')
};

// Create a draft on Typefully
server.tool(
  'typefully_create_draft',
  createDraftSchema,
  async (params) => {
    try {
      const typefullyService = new TypefullyService();
      
      // Create the draft
      const result = await typefullyService.createDraft(params as TypefullyDraftParams);
      
      // Format success response
      const response: TypefullyApiResponse = {
        success: true,
        data: result
      };

      return {
        content: [{ 
          type: 'text', 
          text: JSON.stringify(response, null, 2) 
        }]
      };
    } catch (error) {
      const errorResponse: TypefullyErrorResponse = {
        success: false,
        error: 'Failed to create Typefully draft',
        details: (error as Error).message
      };

      return {
        isError: true,
        content: [{ 
          type: 'text', 
          text: JSON.stringify(errorResponse, null, 2) 
        }]
      };
    }
  }
);

// Register the typefully_create_draft tool info
registeredTools.push({
  name: 'typefully_create_draft',
  description: 'Creates a new draft in Typefully',
  parameters: [
    {
      name: 'content',
      type: 'string',
      description: 'The content of the draft',
      required: true
    },
    {
      name: 'threadify',
      type: 'boolean',
      description: 'Whether to threadify the content (default: false)',
      required: false
    },
    {
      name: 'share',
      type: 'boolean',
      description: 'Whether to share the draft (default: false)',
      required: false
    },
    {
      name: 'schedule_date',
      type: 'string',
      description: 'The date to schedule the draft for publication (ISO format)',
      required: false
    },
    {
      name: 'auto_retweet_enabled',
      type: 'boolean',
      description: 'Whether to enable auto-retweet (default: false)',
      required: false
    },
    {
      name: 'auto_plug_enabled',
      type: 'boolean',
      description: 'Whether to enable auto-plug (default: false)',
      required: false
    }
  ],
  examples: [
    {
      description: 'Create a simple draft',
      parameters: { 
        content: 'This is a new Typefully draft created via the MCP tool'
      },
      response: '{ "success": true, "data": { "id": "123456", "content": "This is a new Typefully draft created via the MCP tool", ... } }'
    },
    {
      description: 'Create a threadified draft',
      parameters: { 
        content: 'This is the first tweet in a thread.\n\nThis is the second tweet.', 
        threadify: true 
      },
      response: '{ "success": true, "data": { "id": "123456", "content": "...", "threadified": true, ... } }'
    },
    {
      description: 'Create a scheduled draft',
      parameters: { 
        content: 'This tweet will be scheduled for later publication', 
        schedule_date: '2023-05-10T15:00:00Z'
      },
      response: '{ "success": true, "data": { "id": "123456", "content": "...", "scheduled_for": "2023-05-10T15:00:00Z", ... } }'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns data about the created draft with success status',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean' },
        data: { type: 'object' },
        error: { type: 'string' },
        details: { type: 'string' }
      }
    }
  }
});

// Define schema for typefully_get_scheduled_drafts
const getScheduledDraftsSchema = {
  content_filter: z.string().optional().describe('Filter drafts by content')
};

// Get scheduled drafts from Typefully
server.tool(
  'typefully_get_scheduled_drafts',
  getScheduledDraftsSchema,
  async (params) => {
    try {
      const typefullyService = new TypefullyService();
      
      // Get the scheduled drafts
      const result = await typefullyService.getScheduledDrafts(params as TypefullyScheduledDraftsParams);
      
      // Format success response
      const response: TypefullyApiResponse = {
        success: true,
        data: result
      };

      return {
        content: [{ 
          type: 'text', 
          text: JSON.stringify(response, null, 2) 
        }]
      };
    } catch (error) {
      const errorResponse: TypefullyErrorResponse = {
        success: false,
        error: 'Failed to get scheduled Typefully drafts',
        details: (error as Error).message
      };

      return {
        isError: true,
        content: [{ 
          type: 'text', 
          text: JSON.stringify(errorResponse, null, 2) 
        }]
      };
    }
  }
);

// Register the typefully_get_scheduled_drafts tool info
registeredTools.push({
  name: 'typefully_get_scheduled_drafts',
  description: 'Retrieves recently scheduled drafts from Typefully',
  parameters: [
    {
      name: 'content_filter',
      type: 'string',
      description: 'Filter drafts by content',
      required: false
    }
  ],
  examples: [
    {
      description: 'Get all scheduled drafts',
      parameters: {},
      response: '{ "success": true, "data": { "drafts": [...], "meta": {...} } }'
    },
    {
      description: 'Get scheduled drafts containing specific content',
      parameters: { content_filter: 'announcement' },
      response: '{ "success": true, "data": { "drafts": [...], "meta": {...} } }'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns data about scheduled drafts with success status',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean' },
        data: { type: 'object' },
        error: { type: 'string' },
        details: { type: 'string' }
      }
    }
  }
});

// Get published drafts from Typefully
server.tool(
  'typefully_get_published_drafts',
  {},
  async () => {
    try {
      const typefullyService = new TypefullyService();
      
      // Get the published drafts
      const result = await typefullyService.getPublishedDrafts();
      
      // Format success response
      const response: TypefullyApiResponse = {
        success: true,
        data: result
      };

      return {
        content: [{ 
          type: 'text', 
          text: JSON.stringify(response, null, 2) 
        }]
      };
    } catch (error) {
      const errorResponse: TypefullyErrorResponse = {
        success: false,
        error: 'Failed to get published Typefully drafts',
        details: (error as Error).message
      };

      return {
        isError: true,
        content: [{ 
          type: 'text', 
          text: JSON.stringify(errorResponse, null, 2) 
        }]
      };
    }
  }
);

// Register the typefully_get_published_drafts tool info
registeredTools.push({
  name: 'typefully_get_published_drafts',
  description: 'Retrieves recently published drafts from Typefully',
  parameters: [],
  examples: [
    {
      description: 'Get all published drafts',
      parameters: {},
      response: '{ "success": true, "data": { "drafts": [...], "meta": {...} } }'
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns data about published drafts with success status',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean' },
        data: { type: 'object' },
        error: { type: 'string' },
        details: { type: 'string' }
      }
    }
  }
});

// Start the server with stdio transport
console.error('Starting typefully-mcp server...');
const transport = new StdioServerTransport();

process.on('SIGINT', () => {
  console.error('Shutting down typefully-mcp server...');
  process.exit(0);
});

server.connect(transport);
