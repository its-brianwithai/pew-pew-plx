/**
 * Response object for Typefully API success responses
 */
export interface TypefullyApiResponse {
  success: true;
  data: unknown;
}

/**
 * Response object for Typefully API error responses
 */
export interface TypefullyErrorResponse {
  success: false;
  error: string;
  details?: string;
} 