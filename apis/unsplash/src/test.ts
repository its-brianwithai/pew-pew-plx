import { UnsplashClient } from './index';
import { config } from './config';

async function testUnsplashAPI() {
  console.log('Testing Unsplash API (Demo Mode)...');
  
  const client = new UnsplashClient(config);

  try {
    // Test search photos with minimal results
    console.log('\nTesting search photos...');
    const searchResults = await client.searchPhotos('nature', 1, 1);
    console.log(`Found ${searchResults?.total || 0} nature photos. First result:`, 
      searchResults?.results?.[0]?.urls?.regular || 'No results');

    // Test random photo (single photo)
    console.log('\nTesting random photo...');
    const randomPhoto = await client.getRandomPhoto(undefined, 1);
    if (Array.isArray(randomPhoto) && randomPhoto.length > 0) {
      console.log('Random photo URL:', randomPhoto[0].urls.regular);
    }

    console.log('\nAll demo tests completed successfully! 🎉');
    console.log('\nNote: Application is in demo mode (50 requests/hour limit).');
    console.log('To increase rate limits, apply for production access at:');
    console.log('https://unsplash.com/oauth/applications');
  } catch (error) {
    console.error('Error during tests:', error);
  }
}

// Run the tests
testUnsplashAPI(); 