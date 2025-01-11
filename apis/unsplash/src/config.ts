import dotenv from 'dotenv';
import path from 'path';

// Load environment variables from .env file
dotenv.config({ path: path.resolve(__dirname, '../.env') });

export interface UnsplashConfig {
  accessKey: string;
}

if (!process.env.UNSPLASH_ACCESS_KEY) {
  throw new Error('Missing required Unsplash environment variables');
}

export const config: UnsplashConfig = {
  accessKey: process.env.UNSPLASH_ACCESS_KEY
}; 