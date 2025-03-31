import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import fs from 'fs';
import path from 'path';
const server = new McpServer({
    name: 'turbo-mcp',
    version: '0.0.1'
});
// Keep track of registered tools with descriptions
const registeredTools = [];
// List all available tools
server.tool('list_tools', {}, async () => {
    const response = {
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
});
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
server.tool('get_readme', {}, async () => {
    try {
        // Get the directory of the current module
        const modulePath = new URL(import.meta.url).pathname;
        const moduleDir = path.dirname(modulePath);
        // Go up one directory to get to the project root
        const projectRoot = path.resolve(moduleDir, '..');
        const readmePath = path.join(projectRoot, 'README.md');
        // Read the README.md file
        const readme = fs.readFileSync(readmePath, 'utf8');
        const response = {
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
    }
    catch (error) {
        const errorResponse = {
            error: `Error reading README.md: ${error.message}`,
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
});
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
// Start the server with stdio transport
console.error('Starting turbo-mcp server...');
const transport = new StdioServerTransport();
process.on('SIGINT', () => {
    console.error('Shutting down turbo-mcp server...');
    process.exit(0);
});
await server.connect(transport);
//# sourceMappingURL=index.js.map