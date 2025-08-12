import assert from 'assert';
import { promises as fs } from 'fs';
import { join } from 'path';
import { loadConfig } from '../lib/config.js';

async function withTempDir(fn) {
  const os = await import('os');
  const { mkdtemp } = fs;
  const tmp = await fs.mkdtemp(join(os.tmpdir(), 'plx-test-'));
  try { await fn(tmp); } finally { await fs.rm(tmp, { recursive: true, force: true }); }
}

async function write(file, content) { await fs.writeFile(file, content, 'utf8'); }

describe('config discovery', () => {
  it('loads plx.yaml from ancestor before default', async () => {
    await withTempDir(async (root) => {
      const child = join(root, 'a', 'b');
      await fs.mkdir(child, { recursive: true });
      await write(join(root, 'plx.yaml'), 'sync_sources:\n  prompts:\n    - prompts');
      const cwd = process.cwd();
      try {
        process.chdir(child);
        const cfg = await loadConfig();
        assert.ok(cfg.sync_sources && cfg.sync_sources.prompts);
      } finally {
        process.chdir(cwd);
      }
    });
  });
});


