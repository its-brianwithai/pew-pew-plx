import { GiphyAPI } from './index';

async function test() {
  try {
    const giphy = new GiphyAPI();
    
    // Test searching and downloading a GIF
    const result = await giphy.searchAndDownload(
      'coding',
      './test-output',
      'test-gif'
    );
    
    console.log('Successfully downloaded GIF:', {
      id: result.gif.id,
      title: result.gif.title,
      path: result.gifPath,
      attribution: result.attributionPath
    });
  } catch (error) {
    console.error('Test failed:', error);
  }
}

test(); 