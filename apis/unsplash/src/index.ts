import axios, { AxiosInstance, AxiosError } from 'axios';

interface UnsplashConfig {
  accessKey: string;
}

interface UnsplashPhoto {
  id: string;
  urls: {
    raw: string;
    full: string;
    regular: string;
    small: string;
    thumb: string;
  };
  user: {
    name: string;
    username: string;
  };
  description: string | null;
  alt_description: string | null;
}

export class UnsplashClient {
  private client: AxiosInstance;

  constructor(config: UnsplashConfig) {
    if (!config.accessKey) {
      throw new Error('Access key is required');
    }

    this.client = axios.create({
      baseURL: 'https://api.unsplash.com',
      headers: {
        'Authorization': `Client-ID ${config.accessKey}`,
        'Accept-Version': 'v1',
        'Content-Type': 'application/json'
      }
    });

    // Add request interceptor for debugging
    this.client.interceptors.request.use(request => {
      console.log('Making request to:', request.url);
      console.log('With headers:', request.headers);
      return request;
    });
  }

  private handleError(error: unknown) {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError;
      console.error('API Error:', {
        status: axiosError.response?.status,
        statusText: axiosError.response?.statusText,
        data: axiosError.response?.data,
        headers: axiosError.response?.headers
      });
    }
    throw error;
  }

  /**
   * Search for photos based on a query
   * @param query Search query
   * @param page Page number (optional)
   * @param perPage Number of items per page (optional)
   */
  async searchPhotos(query: string, page: number = 1, perPage: number = 10) {
    try {
      const response = await this.client.get('/search/photos', {
        params: {
          query,
          page,
          per_page: perPage
        }
      });
      return response.data;
    } catch (error) {
      return this.handleError(error);
    }
  }

  /**
   * Get a random photo
   * @param query Optional search query to filter random photos
   * @param count Number of photos to return (max: 30)
   */
  async getRandomPhoto(query?: string, count: number = 1) {
    try {
      const response = await this.client.get('/photos/random', {
        params: {
          query,
          count: Math.min(count, 30)
        }
      });
      return response.data;
    } catch (error) {
      return this.handleError(error);
    }
  }

  /**
   * Get a specific photo by ID
   * @param photoId The ID of the photo to retrieve
   */
  async getPhoto(photoId: string) {
    try {
      const response = await this.client.get(`/photos/${photoId}`);
      return response.data as UnsplashPhoto;
    } catch (error) {
      return this.handleError(error);
    }
  }

  /**
   * Track a photo download
   * @param photoId The ID of the photo being downloaded
   */
  async trackDownload(photoId: string) {
    try {
      const response = await this.client.get(`/photos/${photoId}/download`);
      return response.data;
    } catch (error) {
      return this.handleError(error);
    }
  }
} 