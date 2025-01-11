import jwt from 'jsonwebtoken';
import { GhostConfig, GhostPost, GhostApiResponse, GhostError } from './types';

export class GhostClient {
  private readonly url: string;
  private readonly version: string;
  private readonly adminApiKey: string;

  constructor(config: GhostConfig) {
    this.url = config.url.replace(/\/$/, ''); // Remove trailing slash
    this.adminApiKey = config.adminApiKey;
    this.version = config.version || 'v4';
  }

  private generateToken(): string {
    const [id, secret] = this.adminApiKey.split(':');
    
    if (!id || !secret) {
      throw new Error('Invalid admin API key format. Expected format: "id:secret"');
    }

    return jwt.sign({}, Buffer.from(secret, 'hex'), {
      keyid: id,
      algorithm: 'HS256',
      expiresIn: '5m',
      audience: `/${this.version}/admin/`
    });
  }

  private async makeRequest<T>(endpoint: string, method: string, body?: any): Promise<T> {
    const token = this.generateToken();
    const url = `${this.url}/ghost/api/${this.version}/admin/${endpoint}`;

    const response = await fetch(url, {
      method,
      headers: {
        'Authorization': `Ghost ${token}`,
        'Content-Type': 'application/json',
      },
      body: body ? JSON.stringify(body) : undefined,
    });

    const data = await response.json();

    if (!response.ok) {
      const error = data as GhostError;
      const message = error.errors?.[0]?.message || 'Unknown error occurred';
      const context = error.errors?.[0]?.context || '';
      throw new Error(`Ghost API Error: ${message}${context ? ` - ${context}` : ''}`);
    }

    return data as T;
  }

  async createPost(post: GhostPost): Promise<GhostApiResponse> {
    return this.makeRequest<GhostApiResponse>('posts/?source=html', 'POST', {
      posts: [post]
    });
  }
} 
