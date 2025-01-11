import typefully from './index';

async function testTypefullyAPI() {
  try {
    // Test creating a draft
    console.log('Creating a draft...');
    const draft = await typefully.createDraft({
      content: 'Testing Typefully API integration! 🚀\n\n\n\nThis is a second tweet in the thread.',
      threadify: true,
      share: true,
      'schedule-date': 'next-free-slot',
      auto_retweet_enabled: true
    });
    console.log('Draft created:', draft);

    // Test getting recently scheduled drafts
    console.log('\nGetting recently scheduled drafts...');
    const scheduled = await typefully.getRecentlyScheduled({
      content_filter: 'threads'
    });
    console.log('Recently scheduled:', scheduled);

    // Test getting recently published drafts
    console.log('\nGetting recently published drafts...');
    const published = await typefully.getRecentlyPublished({
      content_filter: 'tweets'
    });
    console.log('Recently published:', published);

    // Test getting notifications
    console.log('\nGetting notifications...');
    const notifications = await typefully.getNotifications({
      kind: 'inbox'
    });
    console.log('Notifications:', notifications);

  } catch (error) {
    console.error('Error testing Typefully API:', error);
  }
}

testTypefullyAPI(); 