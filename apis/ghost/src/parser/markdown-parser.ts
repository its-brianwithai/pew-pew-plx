import matter from 'gray-matter';
import { marked } from 'marked';
import { readFile } from 'fs/promises';
import { GhostPost } from '../client/types';

export interface MarkdownContent {
  content: string;
  data: {
    title?: string;
    tags?: string[];
    featured?: boolean;
    excerpt?: string;
    feature_image?: string;
    [key: string]: any;
  };
}

export class MarkdownParser {
  async parseFile(filePath: string): Promise<MarkdownContent> {
    const fileContent = await readFile(filePath, 'utf-8');
    const { content, data } = matter(fileContent);
    return { content, data };
  }

  convertToHtml(markdown: string): string {
    return marked.parse(markdown, {
      gfm: true, // GitHub Flavored Markdown
      breaks: true, // Convert line breaks to <br>
    }) as string;
  }

  async parseToGhostPost(filePath: string, options: { title?: string; draft?: boolean } = {}): Promise<GhostPost> {
    const { content, data } = await this.parseFile(filePath);
    const html = this.convertToHtml(content);

    return {
      title: options.title || data.title || 'Untitled Post',
      html,
      status: options.draft ? 'draft' : 'published',
      tags: data.tags,
      featured: data.featured,
      excerpt: data.excerpt,
      feature_image: data.feature_image,
    };
  }
} 
