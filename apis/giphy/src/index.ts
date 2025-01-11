import axios from 'axios';
import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as path from 'path';

dotenv.config();

interface GiphyGif {
  id: string;
  title: string;
  url: string;
  username: string;
  images: {
    original: {
      url: string;
      width: string;
      height: string;
    };
    fixed_height: {
      url: string;
      width: string;
      height: string;
    };
    fixed_width: {
      url: string;
      width: string;
      height: string;
    };
  };
}

interface SearchResponse {
  data: GiphyGif[];
  pagination: {
    total_count: number;
    count: number;
    offset: number;
  };
  meta: {
    status: number;
    msg: string;
    response_id: string;
  };
}

export class GiphyAPI {
  private apiKey: string;
  private baseUrl: string = 'https://api.giphy.com/v1/gifs';

  constructor() {
    const apiKey = process.env.GIPHY_API_KEY;
    if (!apiKey) {
      throw new Error('GIPHY_API_KEY not found in environment variables');
    }
    this.apiKey = apiKey;
  }

  async searchGifs(query: string, limit: number = 1): Promise<GiphyGif[]> {
    try {
      const response = await axios.get<SearchResponse>(`${this.baseUrl}/search`, {
        params: {
          api_key: this.apiKey,
          q: query,
          limit,
          rating: 'g'
        }
      });

      return response.data.data;
    } catch (error) {
      console.error('Error searching Giphy GIFs:', error);
      throw error;
    }
  }

  async downloadGif(gif: GiphyGif, outputPath: string): Promise<void> {
    try {
      const response = await axios({
        url: gif.images.fixed_width.url,
        method: 'GET',
        responseType: 'stream'
      });

      // Ensure directory exists
      const dir = path.dirname(outputPath);
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }

      // Save the GIF
      const writer = fs.createWriteStream(outputPath);
      response.data.pipe(writer);

      return new Promise((resolve, reject) => {
        writer.on('finish', resolve);
        writer.on('error', reject);
      });
    } catch (error) {
      console.error('Error downloading GIF:', error);
      throw error;
    }
  }

  async createAttributionFile(gif: GiphyGif, outputPath: string): Promise<void> {
    const attribution = `Giphy GIF ID: ${gif.id}
Title: ${gif.title}
Creator: ${gif.username || 'Anonymous'}
Original URL: ${gif.url}
License: Giphy Terms of Service
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
  ): Promise<{ gif: GiphyGif; gifPath: string; attributionPath: string }> {
    const gifs = await this.searchGifs(query);
    if (gifs.length === 0) {
      throw new Error('No GIFs found for query: ' + query);
    }

    const gif = gifs[0];
    const gifPath = path.join(outputDir, `${filename}.gif`);
    const attributionPath = path.join(outputDir, `${filename}.txt`);

    await this.downloadGif(gif, gifPath);
    await this.createAttributionFile(gif, attributionPath);

    return {
      gif,
      gifPath,
      attributionPath
    };
  }
} 