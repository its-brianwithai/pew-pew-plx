import axios from 'axios';
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

export class GhostService {
  private readonly adminApiUrl: string;
  private readonly adminApiKey: string;
  private readonly keyId: string;
  private readonly keySecret: string;

  constructor() {
    this.adminApiUrl = process.env.GHOST_ADMIN_API_URL || '';
    this.adminApiKey = process.env.GHOST_ADMIN_API_KEY || '';
    
    if (!this.adminApiKey) {
      throw new Error('Ghost Admin API Key is required. Add GHOST_ADMIN_API_KEY to the mcp.json env section.');
    }

    // Split the key into ID and SECRET
    const [id, secret] = this.adminApiKey.split(':');
    
    if (!id || !secret) {
      throw new Error('Invalid Admin API Key format. Expected format: "id:secret"');
    }

    this.keyId = id;
    this.keySecret = secret;
  }

  /**
   * Create a draft post in Ghost using the Admin API
   */
  async createDraftPost(postParams: GhostPostParams): Promise<GhostPostResponse> {
    try {
      // Ensure post is a draft
      const postData = {
        ...postParams,
        status: 'draft'
      };

      // Generate JWT token for authentication
      const token = this.generateToken();

      // Make API request to create post
      const response = await axios.post(`${this.adminApiUrl}/posts/`, {
        posts: [postData]
      }, {
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

  /**
   * Generate a JWT token for Ghost Admin API authentication
   * Following the exact format required by Ghost Admin API
   */
  private generateToken(): string {
    // Create the token header with kid
    const header = {
      alg: 'HS256',
      typ: 'JWT',
      kid: this.keyId // The kid MUST be in the header
    };
    
    // Create the token payload
    const now = Math.floor(Date.now() / 1000);
    const fiveMinutes = 5 * 60; // 5 minutes in seconds
    
    const payload = {
      iat: now,                // Issued at time
      exp: now + fiveMinutes,  // Expiration time (5 minutes from now)
      aud: '/v5/admin/'        // Audience - must match API version
    };

    // Encode header to base64
    const encodedHeader = Buffer.from(
      JSON.stringify(header)
    ).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');
    
    // Encode payload to base64
    const encodedPayload = Buffer.from(
      JSON.stringify(payload)
    ).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');
    
    // Create the signature
    const signature = crypto
      .createHmac('sha256', Buffer.from(this.keySecret, 'hex'))
      .update(`${encodedHeader}.${encodedPayload}`)
      .digest('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=/g, '');
    
    // Combine all parts to form the JWT token
    return `${encodedHeader}.${encodedPayload}.${signature}`;
  }
} 