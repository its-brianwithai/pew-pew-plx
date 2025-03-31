export interface GhostDraftResponse {
  success: boolean;
  post?: {
    id: string;
    uuid: string;
    title: string;
    slug: string;
    status: string;
    url?: string;
  };
  error?: string;
}

export interface GhostErrorResponse {
  success: boolean;
  error: string;
  details?: string;
} 