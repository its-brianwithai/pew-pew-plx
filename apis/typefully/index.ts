import dotenv from 'dotenv';
import path from 'path';

// Load environment variables from .env file
dotenv.config({ path: path.join(__dirname, '.env') });

interface TypefullyConfig {
  apiKey: string;
  baseUrl?: string;
}

interface Draft {
  id: string;
  content: string;
  share_url?: string;
}

interface CreateDraftOptions {
  content: string;
  threadify?: boolean;
  share?: boolean;
  'schedule-date'?: string | 'next-free-slot';
  auto_retweet_enabled?: boolean;
  auto_plug_enabled?: boolean;
}

type ContentFilter = 'threads' | 'tweets';

interface ListOptions {
  content_filter?: ContentFilter;
}

type NotificationKind = 'inbox' | 'activity';

interface NotificationOptions {
  kind?: NotificationKind;
  account_id?: string;
}

export class TypefullyAPI {
  private apiKey: string;
  private baseUrl: string;

  constructor(config: TypefullyConfig) {
    this.apiKey = config.apiKey;
    this.baseUrl = config.baseUrl || 'https://api.typefully.com/v1';
  }

  private async request<T>(
    endpoint: string,
    method: 'GET' | 'POST' = 'GET',
    body?: any
  ): Promise<T> {
    const url = `${this.baseUrl}${endpoint}`;
    const headers: Record<string, string> = {
      'X-API-KEY': this.apiKey,
    };

    if (body) {
      headers['Content-Type'] = 'application/json';
    }

    console.log('Request:', { 
      url, 
      method, 
      headers: { ...headers, 'X-API-KEY': '[REDACTED]' },
      body 
    });

    const response = await fetch(url, {
      method,
      headers,
      body: body ? JSON.stringify(body) : undefined,
    });

    if (!response.ok) {
      const error = await response.json().catch(() => ({ message: 'Unknown error' }));
      console.error('Response error:', {
        status: response.status,
        statusText: response.statusText,
        error
      });
      throw new Error(`Typefully API Error: ${error.message} (Status: ${response.status})`);
    }

    return response.json();
  }

  // Create a draft
  async createDraft(options: CreateDraftOptions): Promise<Draft> {
    return this.request<Draft>('/drafts/', 'POST', options);
  }

  // Get recently scheduled drafts
  async getRecentlyScheduled(options?: ListOptions): Promise<Draft[]> {
    const query = options?.content_filter ? `?content_filter=${options.content_filter}` : '';
    return this.request<Draft[]>(`/drafts/recently-scheduled/${query}`);
  }

  // Get recently published drafts
  async getRecentlyPublished(options?: ListOptions): Promise<Draft[]> {
    const query = options?.content_filter ? `?content_filter=${options.content_filter}` : '';
    return this.request<Draft[]>(`/drafts/recently-published/${query}`);
  }

  // Get latest notifications
  async getNotifications(options?: NotificationOptions): Promise<any> {
    const query = options?.kind ? `?kind=${options.kind}` : '';
    return this.request<any>(`/notifications/${query}`);
  }

  // Mark notifications as read
  async markNotificationsRead(options?: NotificationOptions): Promise<void> {
    return this.request<void>('/notifications/mark-all-read/', 'POST', options);
  }
}

// Create default instance with API key from environment
const defaultClient = new TypefullyAPI({
  apiKey: process.env.TYPEFULLY_API_KEY || '',
});

export default defaultClient; 