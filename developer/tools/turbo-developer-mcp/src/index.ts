import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import fs from 'fs';
import path from 'path';
import { ListToolsResponse, ToolInfo } from './responses/ListToolsResponse.js';
import { ReadmeResponse, ReadmeErrorResponse } from './responses/ReadmeResponse.js';
import { GhostDraftResponse, GhostErrorResponse } from './responses/GhostResponse.js';
import { GhostService, GhostPostParams } from './services/ghost.service.js';

const server = new McpServer({
  name: 'turbo-mcp',
  version: '0.0.1'
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
        name: 'turbo-mcp',
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
        tools: [
          {
            name: 'list_tools',
            description: 'Returns a JSON list of all available tools...',
            // other fields would be included here
          }
        ],
        count: 1,
        server: {
          name: 'turbo-mcp',
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

// Return README.md content
server.tool(
  'get_readme',
  {},
  async () => {
    try {
      // Get the directory of the current module
      const modulePath = new URL(import.meta.url).pathname;
      const moduleDir = path.dirname(modulePath);
      // Go up one directory to get to the project root
      const projectRoot = path.resolve(moduleDir, '..');
      const readmePath = path.join(projectRoot, 'README.md');
      
      // Read the README.md file
      const readme = fs.readFileSync(readmePath, 'utf8');
      
      const response: ReadmeResponse = {
        filename: 'README.md',
        content: readme,
        byteLength: Buffer.from(readme).length,
        lastModified: fs.statSync(readmePath).mtime.toISOString()
      };

      return {
        content: [{ 
          type: 'text', 
          text: JSON.stringify(response, null, 2) 
        }]
      };
    } catch (error) {
      const errorResponse: ReadmeErrorResponse = {
        error: `Error reading README.md: ${(error as Error).message}`,
        status: 'error'
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

// Register the get_readme tool info
registeredTools.push({
  name: 'get_readme',
  description: 'Returns the contents of the project README.md file as JSON with metadata',
  parameters: [],
  examples: [
    {
      description: 'Retrieve the project README.md file',
      parameters: {},
      response: JSON.stringify({
        filename: 'README.md',
        content: '# Example Project\n\nThis is an example README file.',
        byteLength: 48,
        lastModified: '2025-03-30T22:45:00.000Z'
      }, null, 2)
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns the README.md content with metadata',
    schema: {
      type: 'object',
      properties: {
        filename: { type: 'string' },
        content: { type: 'string' },
        byteLength: { type: 'number' },
        lastModified: { type: 'string', format: 'date-time' }
      }
    }
  }
});

// Create a draft post in Ghost
server.tool(
  'create_ghost_draft_for_uwtd',
  {
    title: z.string().optional().describe('The title of the post'),
    mobiledoc: z.string().optional().describe('The content in mobiledoc format with markdown card (Ghost\'s preferred format)'),
    feature_image: z.string().optional().describe('URL of the feature image'),
    featured: z.boolean().optional().describe('Whether this post is featured'),
    meta_title: z.string().optional().describe('Meta title for SEO'),
    meta_description: z.string().optional().describe('Meta description for SEO'),
    tags: z.array(z.union([z.string(), z.object({ name: z.string() })])).optional().describe('Tags for the post'),
    authors: z.array(z.union([z.string(), z.object({ id: z.string(), slug: z.string() })])).optional().describe('Authors of the post'),
    visibility: z.enum(['public', 'members', 'paid', 'tiers']).optional().describe('Visibility of the post'),
    custom_excerpt: z.string().optional().describe('Custom excerpt for the post'),
    canonical_url: z.string().optional().describe('Canonical URL if this post exists elsewhere'),
    og_image: z.string().optional().describe('Open Graph image URL'),
    og_title: z.string().optional().describe('Open Graph title'),
    og_description: z.string().optional().describe('Open Graph description'),
    twitter_image: z.string().optional().describe('Twitter card image URL'),
    twitter_title: z.string().optional().describe('Twitter card title'),
    twitter_description: z.string().optional().describe('Twitter card description'),
    codeinjection_head: z.string().optional().describe('Code to inject into the head of the post'),
    codeinjection_foot: z.string().optional().describe('Code to inject into the foot of the post'),
    custom_template: z.string().optional().describe('Custom template for the post'),
    locale: z.string().optional().describe('Locale for the post'),
    email_subject: z.string().optional().describe('Email subject when sending as newsletter')
  },
  async (params) => {
    try {
      const ghostService = new GhostService();
      
      // Convert parameters to the format expected by the Ghost API
      const postParams: GhostPostParams = { ...params };
      
      // Create the draft post
      const result = await ghostService.createDraftPost(postParams);
      
      // Format success response
      const response: GhostDraftResponse = {
        success: true,
        post: {
          id: result.posts[0].id,
          uuid: result.posts[0].uuid,
          title: result.posts[0].title,
          slug: result.posts[0].slug,
          status: result.posts[0].status,
          url: result.posts[0].url
        }
      };

      return {
        content: [{ 
          type: 'text', 
          text: JSON.stringify(response, null, 2) 
        }]
      };
    } catch (error) {
      const errorResponse: GhostErrorResponse = {
        success: false,
        error: 'Failed to create Ghost draft post',
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

// Register the create_ghost_draft_for_uwtd tool info
registeredTools.push({
  name: 'create_ghost_draft_for_uwtd',
  description: 'Creates a draft post on the Ultra Wide Turbo Devs Ghost blog',
  parameters: [
    { name: 'title', type: 'string', description: 'The title of the post', required: false },
    { name: 'mobiledoc', type: 'string', description: 'The content in mobiledoc format with markdown card (Ghost\'s preferred format)', required: false },
    { name: 'tags', type: 'array', description: 'Tags for the post', required: false },
    { name: 'feature_image', type: 'string', description: 'URL of the feature image', required: false }
    // Note: Not listing all parameters here for brevity, but they're defined in the schema
  ],
  examples: [
    {
      description: 'Create a draft post using markdown card in mobiledoc format',
      parameters: {
        title: 'My Test Post',
        mobiledoc: JSON.stringify({
          version: "0.3.1",
          ghostVersion: "4.0",
          markups: [],
          atoms: [],
          cards: [
            ["markdown", { markdown: "## Test Header\n\nThis is a simple test with the markdown card which is well supported in Ghost.\n\n* Item 1\n* Item 2\n* Item 3\n\nThis should definitely show up." }]
          ],
          sections: [[10, 0]]
        })
      },
      response: JSON.stringify({
        success: true,
        post: {
          id: '6425dc63a5e3824ac6199376',
          uuid: '8b4de54c-fd5e-4bc6-af89-3326d9754490',
          title: 'My Test Post',
          slug: 'my-test-post',
          status: 'draft'
        }
      }, null, 2)
    }
  ],
  responseFormat: {
    type: 'json',
    description: 'Returns details about the created draft post or an error message',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean' },
        post: {
          type: 'object',
          properties: {
            id: { type: 'string' },
            uuid: { type: 'string' },
            title: { type: 'string' },
            slug: { type: 'string' },
            status: { type: 'string' }
          }
        },
        error: { type: 'string' }
      }
    }
  }
});

// Start the server with stdio transport
console.error('Starting turbo-mcp server...');
const transport = new StdioServerTransport();

process.on('SIGINT', () => {
  console.error('Shutting down turbo-mcp server...');
  process.exit(0);
});

await server.connect(transport); 