import typefully from './index';
import * as fs from 'fs';
import * as path from 'path';

const draftContent = JSON.parse(fs.readFileSync(path.join(__dirname, 'draft-content.json'), 'utf-8'));

typefully.createDraft(draftContent)
  .then(response => console.log('Draft created:', response))
  .catch(error => console.error('Error creating draft:', error)); 