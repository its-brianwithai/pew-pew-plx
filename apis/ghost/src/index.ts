#!/usr/bin/env node
import { program } from 'commander';
import { config } from 'dotenv';
import { GhostClient } from './client/ghost-client';
import { MarkdownParser } from './parser/markdown-parser';

// Load environment variables
config();

const requiredEnvVars = ['GHOST_URL', 'GHOST_ADMIN_API_KEY'];
const missingEnvVars = requiredEnvVars.filter(varName => !process.env[varName]);

if (missingEnvVars.length > 0) {
  console.error('Error: Missing required environment variables:');
  missingEnvVars.forEach(varName => console.error(`- ${varName}`));
  console.error('\nCreate a .env file with these variables or set them in your environment.');
  process.exit(1);
}

const ghostClient = new GhostClient({
  url: process.env.GHOST_URL!,
  adminApiKey: process.env.GHOST_ADMIN_API_KEY!,
});

const markdownParser = new MarkdownParser();

program
  .name('ghost-publisher')
  .description('Publish markdown files as blog posts to Ghost')
  .version('1.0.0');

program
  .command('publish')
  .description('Publish a markdown file as a draft post')
  .argument('<file>', 'markdown file to publish')
  .option('-t, --title <title>', 'override the post title')
  .option('-d, --draft', 'publish as draft (default)', true)
  .action(async (file, options) => {
    try {
      console.log('Reading markdown file...');
      const post = await markdownParser.parseToGhostPost(file, options);

      console.log('Publishing to Ghost...');
      const response = await ghostClient.createPost(post);
      
      const publishedPost = response.posts[0];
      console.log('\nPost published successfully! 🎉');
      console.log(`Title: ${publishedPost.title}`);
      console.log(`Status: ${publishedPost.status}`);
      console.log(`URL: ${publishedPost.url}`);
    } catch (error) {
      console.error('\nError:', error instanceof Error ? error.message : 'An unknown error occurred');
      process.exit(1);
    }
  });

program.parse(); 
