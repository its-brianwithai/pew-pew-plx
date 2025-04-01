/**
 * Response object for the list_tools command
 */
export interface ToolParameter {
  name: string;
  type: string;
  description: string;
  required: boolean;
}

export interface ToolResponseFormat {
  type: string;
  description: string;
  schema: Record<string, unknown>;
}

export interface ToolInfo {
  name: string;
  description: string;
  parameters: ToolParameter[];
  examples: {
    description: string;
    parameters: Record<string, unknown>;
    response: string;
  }[];
  responseFormat: ToolResponseFormat;
}

export interface ListToolsResponse {
  tools: ToolInfo[];
  count: number;
  server: {
    name: string;
    version: string;
  };
}
