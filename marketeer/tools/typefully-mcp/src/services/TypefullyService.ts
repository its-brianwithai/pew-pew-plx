export interface TypefullyDraftParams {
  content: string;
  threadify?: boolean;
  share?: boolean;
  schedule_date?: string;
  auto_retweet_enabled?: boolean;
  auto_plug_enabled?: boolean;
}

export interface TypefullyScheduledDraftsParams {
  content_filter?: string;
}

export class TypefullyService {
  private readonly apiUrl: string;
  private readonly apiKey: string;

  constructor() {
    this.apiUrl = process.env.TYPEFULLY_API_URL || 'https://api.typefully.com/v1';
    this.apiKey = process.env.TYPEFULLY_API_KEY || '';
    
    if (!this.apiKey) {
      throw new Error('Typefully API key is required. Set TYPEFULLY_API_KEY environment variable.');
    }
  }

  private getHeaders(): HeadersInit {
    return {
      'X-API-KEY': `Bearer ${this.apiKey}`,
      'Content-Type': 'application/json'
    };
  }

  /**
   * Create a new draft in Typefully
   */
  async createDraft(params: TypefullyDraftParams): Promise<any> {
    const url = `${this.apiUrl}/drafts/`;
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: this.getHeaders(),
        body: JSON.stringify(params)
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(`Typefully API error: ${response.status} - ${JSON.stringify(errorData)}`);
      }

      return await response.json();
    } catch (error) {
      if (error instanceof Error) {
        throw error;
      }
      throw new Error(`Unknown error occurred: ${String(error)}`);
    }
  }

  /**
   * Get recently scheduled drafts from Typefully
   */
  async getScheduledDrafts(params?: TypefullyScheduledDraftsParams): Promise<any> {
    let url = `${this.apiUrl}/drafts/recently-scheduled`;
    
    // Add query parameters if they exist
    if (params && params.content_filter) {
      const queryParams = new URLSearchParams();
      queryParams.append('content_filter', params.content_filter);
      url += `?${queryParams.toString()}`;
    }
    
    try {
      const response = await fetch(url, {
        method: 'GET',
        headers: this.getHeaders()
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(`Typefully API error: ${response.status} - ${JSON.stringify(errorData)}`);
      }

      return await response.json();
    } catch (error) {
      if (error instanceof Error) {
        throw error;
      }
      throw new Error(`Unknown error occurred: ${String(error)}`);
    }
  }

  /**
   * Get recently published drafts from Typefully
   */
  async getPublishedDrafts(): Promise<any> {
    const url = `${this.apiUrl}/drafts/recently-published`;
    
    try {
      const response = await fetch(url, {
        method: 'GET',
        headers: this.getHeaders()
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(`Typefully API error: ${response.status} - ${JSON.stringify(errorData)}`);
      }

      return await response.json();
    } catch (error) {
      if (error instanceof Error) {
        throw error;
      }
      throw new Error(`Unknown error occurred: ${String(error)}`);
    }
  }
}
