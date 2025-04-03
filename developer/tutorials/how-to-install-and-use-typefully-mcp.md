# How to Install and Use Typefully MCP

This tutorial will guide you through the process of installing and configuring the Typefully MCP (Model Context Protocol) server for Cursor IDE. This integration allows you to interact with the Typefully API directly from Cursor, enabling you to create, schedule, and manage Twitter threads without leaving your code editor.

## Prerequisites

- Node.js (version 16 or higher)
- Cursor IDE installed on your system
- A Typefully account with API access

## Installation

1. Clone the Typefully MCP repository from GitHub:

```bash
git clone https://github.com/ultrawideturbodev/typefully-mcp.git
cd typefully-mcp
```

2. Install the dependencies:

```bash
npm install
```

3. Build the project:

```bash
npm run build
```

## Configuration

### Obtain a Typefully API Key

1. Log in to your Typefully account
2. Navigate to Settings > API
3. Create a new API key if you don't already have one
4. Copy the API key to use in the next step

### Configure Cursor MCP Integration

1. Open your Cursor MCP configuration file located at `~/.cursor/mcp.json` (create it if it doesn't exist):

```bash
mkdir -p ~/.cursor
touch ~/.cursor/mcp.json
```

2. Add the Typefully MCP configuration to your `mcp.json` file:

```json
{
  "typefully-mcp": {
    "command": "node",
    "args": ["/absolute/path/to/typefully-mcp/dist/index.js"],
    "env": {
      "TYPEFULLY_API_KEY": "your-typefully-api-key-here"
    }
  }
}
```

Replace `/absolute/path/to/typefully-mcp` with the actual path where you cloned the repository, and `your-typefully-api-key-here` with the API key you obtained from Typefully.

3. Save the file and restart Cursor IDE to apply the changes.

## Using Typefully MCP in Cursor

Once configured, you can use the Typefully MCP tools in Cursor through the Claude AI interface. Here are the available commands and how to use them:

### Creating a New Draft

To create a new draft post or thread on Typefully:

```
You can create a new Typefully draft with the following command:

mcp_typefully_mcp_typefully_create_draft({
  "content": "Your tweet content here. You can use multiple paragraphs to create threads.\n\nLike this second paragraph, which will become the second tweet in the thread.",
  "threadify": true,
  "share": false,
  "schedule_date": "2023-12-31T09:00:00Z",
  "auto_retweet_enabled": false,
  "auto_plug_enabled": false
})
```

Parameters:
- `content` (required): The text content of your tweet or thread
- `threadify` (optional): Set to `true` to automatically convert paragraphs into a thread
- `share` (optional): Set to `true` to share the draft immediately
- `schedule_date` (optional): ISO date string to schedule the post for later
- `auto_retweet_enabled` (optional): Set to `true` to automatically retweet the post
- `auto_plug_enabled` (optional): Set to `true` to add a plug/footer to your tweets

### Retrieving Scheduled Drafts

To get a list of your scheduled drafts:

```
mcp_typefully_mcp_typefully_get_scheduled_drafts({})
```

You can also filter drafts by content:

```
mcp_typefully_mcp_typefully_get_scheduled_drafts({
  "content_filter": "keyword"
})
```

### Retrieving Published Drafts

To get a list of your recently published drafts:

```
mcp_typefully_mcp_typefully_get_published_drafts({
  "random_string": ""
})
```

## Example Workflows

### Creating and Scheduling a Thread

Here's how to create and schedule a Twitter thread using Claude in Cursor:

1. Ask Claude to create a thread for you:

```
Please create a Twitter thread about [your topic] and schedule it for tomorrow at 9 AM using Typefully.
```

2. Claude will generate the content and use the Typefully MCP to create the draft:

```
mcp_typefully_mcp_typefully_create_draft({
  "content": "Generated thread content here...",
  "threadify": true,
  "schedule_date": "2023-04-02T09:00:00Z"
})
```

### Checking Your Scheduled Content

To review what you have scheduled:

```
Could you show me my scheduled Typefully drafts?
```

Claude will use the Typefully MCP to retrieve and display your scheduled drafts.

## Troubleshooting

If you encounter issues with the Typefully MCP integration:

1. Ensure your API key is correct in the MCP configuration
2. Check that the path to the index.js file is correct
3. Restart Cursor IDE after making configuration changes
4. Verify that the Typefully MCP server has been built correctly
5. Check the Cursor logs for any error messages

## Advanced Usage

### Development Mode

If you're modifying the Typefully MCP server, you can run it in development mode:

```bash
npm run dev
```

This will start the server with hot-reloading enabled.

### Manual Testing

You can test the MCP server outside of Cursor by running:

```bash
TYPEFULLY_API_KEY=your-api-key npm start
```

## Conclusion

The Typefully MCP integration allows you to streamline your Twitter workflow by managing your content directly from Cursor IDE. This can be especially useful for developers and technical writers who want to share insights and updates without context switching between different applications.

By following this tutorial, you've set up a powerful tool that bridges your development environment with your social media management workflow. 