export interface GhostConfig {
  url: string;
  adminApiKey: string;
  version?: string;
}

export interface GhostPost {
  title: string;
  html: string;
  status?: 'draft' | 'published';
  tags?: string[];
  featured?: boolean;
  excerpt?: string;
  feature_image?: string;
}

export interface GhostApiResponse {
  posts: Array<GhostPost & { url: string; id: string }>;
}

export interface GhostError {
  errors: Array<{
    message: string;
    context?: string;
    details?: Array<{
      message: string;
      params?: {
        allowedValues?: string[];
      };
    }>;
  }>;
} 
