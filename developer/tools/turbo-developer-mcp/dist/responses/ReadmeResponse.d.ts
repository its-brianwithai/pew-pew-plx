/**
 * Response object for the get_readme command
 */
export interface ReadmeResponse {
    filename: string;
    content: string;
    byteLength: number;
    lastModified: string;
}
export interface ReadmeErrorResponse {
    error: string;
    status: 'error';
}
