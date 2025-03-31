export interface GhostApiResponse {
  success: boolean;
  data?: any;
  error?: string;
  details?: string;
}

export interface GhostErrorResponse {
  success: boolean;
  error: string;
  details?: string;
} 