import axios, { AxiosRequestConfig, Method } from 'axios';
import crypto from 'crypto';

export interface GhostPostParams {
  title?: string;
  slug?: string;
  mobiledoc?: string;
  feature_image?: string;
  featured?: boolean;
  status?: 'draft' | 'published' | 'scheduled';
  locale?: string;
  visibility?: 'public' | 'members' | 'paid' | 'tiers';
  meta_title?: string;
  meta_description?: string;
  email_subject?: string;
  canonical_url?: string;
  og_image?: string;
  og_title?: string;
  og_description?: string;
  twitter_image?: string;
  twitter_title?: string;
  twitter_description?: string;
  custom_excerpt?: string;
  codeinjection_head?: string;
  codeinjection_foot?: string;
  custom_template?: string;
  tags?: Array<string | { name: string }>;
  authors?: Array<string | { id: string, slug: string }>;
  published_at?: string;
  updated_at?: string;
  created_at?: string;
}

export interface GhostPostResponse {
  posts: {
    id: string;
    uuid: string;
    title: string;
    slug: string;
    status: string;
    url: string;
    [key: string]: any;
  }[];
}

export interface GhostRequestParams {
  endpoint: string;
  method: Method;
  data?: any;
}

export interface GhostResponse {
  [key: string]: any;
}

export class GhostService {
  private readonly adminApiUrl: string;
  private readonly adminApiKey: string;
  private readonly keyId: string;
  private readonly keySecret: string;
  private readonly apiVersion: string = 'v5.115';

  constructor() {
    this.adminApiUrl = process.env.GHOST_ADMIN_API_URL || '';
    this.adminApiKey = process.env.GHOST_ADMIN_API_KEY || '';
    
    if (!this.adminApiKey) {
      throw new Error('Ghost Admin API key is required. Set GHOST_ADMIN_API_KEY environment variable.');
    }
    
    if (!this.adminApiUrl) {
      throw new Error('Ghost Admin API URL is required. Set GHOST_ADMIN_API_URL environment variable.');
    }

    // Ensure proper API key format: ID:SECRET
    const parts = this.adminApiKey.split(':');
    if (parts.length !== 2) {
      throw new Error('Invalid Ghost Admin API key format. Expected format: {id}:{secret}');
    }
    
    [this.keyId, this.keySecret] = parts;
  }

  private generateAuthHeaders(): Record<string, string> {
    // Create a JWT token following Ghost Admin API documentation
    // https://ghost.org/docs/admin-api/#token-authentication
    
    // Prepare the token parts
    const now = Math.floor(Date.now() / 1000);
    const fiveMinutesFromNow = now + 5 * 60;
    
    // JWT header
    const header = {
      alg: 'HS256', 
      typ: 'JWT',
      kid: this.keyId
    };
    
    // JWT payload
    const payload = {
      iat: now,                // Issued at time
      exp: fiveMinutesFromNow, // Expiration time
      aud: '/admin/'           // Audience - IMPORTANT for Ghost Admin API
    };
    
    // Functions to create base64 URL encoded strings
    const base64UrlEncode = (str: string): string => {
      return Buffer.from(str)
        .toString('base64')
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=/g, '');
    };
    
    // Convert header and payload to base64 strings
    const headerBase64 = base64UrlEncode(JSON.stringify(header));
    const payloadBase64 = base64UrlEncode(JSON.stringify(payload));
    
    // Create the signature
    const message = `${headerBase64}.${payloadBase64}`;
    const signature = crypto
      .createHmac('sha256', Buffer.from(this.keySecret, 'hex'))
      .update(message)
      .digest('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=/g, '');
    
    // Combine to create the JWT token
    const token = `${message}.${signature}`;
    
    return {
      'Content-Type': 'application/json',
      'Accept-Version': this.apiVersion,
      'Authorization': `Ghost ${token}`
    };
  }

  /**
   * Make a request to the Ghost Admin API
   */
  async makeRequest(params: GhostRequestParams): Promise<any> {
    const { endpoint, method, data } = params;
    
    // Ensure the base URL doesn't have trailing slashes
    const baseUrl = this.adminApiUrl.replace(/\/+$/, '');
    
    // Construct the URL properly, ensuring we don't duplicate the API path
    let url;
    if (baseUrl.includes('/ghost/api/admin')) {
      // If base URL already includes the API path, don't append it again
      url = `${baseUrl}/${endpoint.replace(/^\/+/, '')}`;
    } else {
      // Otherwise, append the API path
      url = `${baseUrl}/ghost/api/admin/${endpoint.replace(/^\/+/, '')}`;
    }
    
    // Handle URL ending for proper API format
    if (!endpoint.includes('?') && !url.endsWith('/')) {
      url += '/';
    }
    
    const headers = this.generateAuthHeaders();

    const config: AxiosRequestConfig = {
      method,
      url,
      headers,
    };

    if (data && (method === 'POST' || method === 'PUT')) {
      config.data = data;
    }

    try {
      const response = await axios(config);
      return response.data;
    } catch (error) {
      if (axios.isAxiosError(error) && error.response) {
        throw new Error(`Ghost API error: ${error.response.status} - ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }
} 