import assert from 'assert';
import { promises as fs } from 'fs';
import { join } from 'path';

describe('tasks marker logic (unit)', () => {
  it('marks current as done and advances to next unchecked', () => {
    const marker = '👉';
    const lines = [
      '- [ ] Task A',
      `${marker} - [ ] Task B`,
      '- [ ] Task C'
    ];
    // simulate next
    for (let i = 0; i < lines.length; i++) {
      if (lines[i].includes(marker)) {
        lines[i] = lines[i].replace(marker, '').replace('- [ ]', '- [x]');
        for (let j = i + 1; j < lines.length; j++) {
          if (/- \[ \]/.test(lines[j])) { lines[j] = `${marker} ${lines[j]}`; break; }
        }
        break;
      }
    }
    assert.ok(/- \[x\] Task B/.test(lines.join('\n')));
    assert.ok(lines.join('\n').includes(`${marker} - [ ] Task C`));
  });
});


