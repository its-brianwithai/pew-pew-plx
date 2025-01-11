import axios from 'axios';
import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as path from 'path';

dotenv.config();

interface PexelsPhoto {
  id: number;
  width: number;
  height: number;
  url: string;
  photographer: string;
  photographer_url: string;
  src: {
    original: string;
    large2x: string;
    large: string;
    medium: string;
    small: string;
  };
}

interface SearchResponse {
  total_results: number;
  page: number;
  per_page: number;
  photos: PexelsPhoto[];
  next_page: string;
}

export class PexelsAPI {
  private apiKey: string;
  private baseUrl: string = 'https://api.pexels.com/v1';

  constructor() {
    const apiKey = process.env.PEXELS_API_KEY;
    if (!apiKey) {
      throw new Error('PEXELS_API_KEY not found in environment variables');
    }
    this.apiKey = apiKey;
  }

  async searchPhotos(query: string, perPage: number = 1): Promise<PexelsPhoto[]> {
    try {
      const response = await axios.get<SearchResponse>(`${this.baseUrl}/search`, {
        headers: {
          'Authorization': this.apiKey
        },
        params: {
          query,
          per_page: perPage
        }
      });

      return response.data.photos;
    } catch (error) {
      console.error('Error searching Pexels photos:', error);
      throw error;
    }
  }

  async downloadPhoto(photo: PexelsPhoto, outputPath: string): Promise<void> {
    try {
      const response = await axios({
        url: photo.src.large2x,
        method: 'GET',
        responseType: 'stream',
        headers: {
          'Authorization': this.apiKey
        }
      });

      // Ensure directory exists
      const dir = path.dirname(outputPath);
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }

      // Save the image
      const writer = fs.createWriteStream(outputPath);
      response.data.pipe(writer);

      return new Promise((resolve, reject) => {
        writer.on('finish', resolve);
        writer.on('error', reject);
      });
    } catch (error) {
      console.error('Error downloading photo:', error);
      throw error;
    }
  }

  async createAttributionFile(photo: PexelsPhoto, outputPath: string): Promise<void> {
    const attribution = `Pexels Image ID: ${photo.id}
Photographer: ${photo.photographer}
Photographer URL: ${photo.photographer_url}
Original Image URL: ${photo.url}
License: Pexels License (Free to use, attribution appreciated)
Downloaded: ${new Date().toISOString()}`;

    try {
      const dir = path.dirname(outputPath);
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }

      fs.writeFileSync(outputPath, attribution);
    } catch (error) {
      console.error('Error creating attribution file:', error);
      throw error;
    }
  }

  async searchAndDownload(
    query: string,
    outputDir: string,
    filename: string
  ): Promise<{ photo: PexelsPhoto; imagePath: string; attributionPath: string }> {
    const photos = await this.searchPhotos(query);
    if (photos.length === 0) {
      throw new Error('No photos found for query: ' + query);
    }

    const photo = photos[0];
    const imagePath = path.join(outputDir, `${filename}.png`);
    const attributionPath = path.join(outputDir, `${filename}.txt`);

    await this.downloadPhoto(photo, imagePath);
    await this.createAttributionFile(photo, attributionPath);

    return {
      photo,
      imagePath,
      attributionPath
    };
  }
} 