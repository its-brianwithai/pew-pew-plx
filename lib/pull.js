import fetch from 'node-fetch';
import { createWriteStream, promises as fs } from 'fs';
import { pipeline } from 'stream/promises';
import { spawn } from 'child_process';
import { join } from 'path';

export async function pullRepository({ repoUrl, branch = 'main', cwd = process.cwd() }) {
  if (!repoUrl) throw new Error('repoUrl is required');
  const isSsh = repoUrl.startsWith('git@');
  let httpsUrl = repoUrl;
  if (isSsh) {
    const repoPath = repoUrl.replace('git@github.com:', '').replace(/\.git$/, '');
    httpsUrl = `https://github.com/${repoPath}`;
  } else {
    httpsUrl = repoUrl.replace(/\.git$/, '');
  }

  const zipUrl = `${httpsUrl}/archive/refs/heads/${branch}.zip`;
  const tempZip = join(cwd, `.plx_pull_${Date.now()}.zip`);
  const extractedDirName = `${httpsUrl.split('/').pop()}-${branch}`;

  await downloadZip(zipUrl, tempZip);
  await unzipFile(tempZip, cwd);
  await fs.unlink(tempZip).catch(() => {});

  // Copy files from extracted dir into cwd (respect .plxignore if present in extracted dir)
  const extractedDir = join(cwd, extractedDirName);
  try {
    await fs.access(extractedDir);
  } catch (e) {
    throw new Error(`Extraction failed: ${extractedDirName} not found`);
  }

  const plxignorePath = join(extractedDir, '.plxignore');
  let ignored = [];
  try {
    const content = await fs.readFile(plxignorePath, 'utf8');
    ignored = content.split('\n').map(l => l.trim()).filter(l => l && !l.startsWith('#'));
  } catch {}

  await copyDirectory(extractedDir, cwd, ignored);
  await fs.rm(extractedDir, { recursive: true, force: true });
}

async function downloadZip(url, destPath) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Failed to download ${url}: ${res.status} ${res.statusText}`);
  await pipeline(res.body, createWriteStream(destPath));
}

async function unzipFile(zipPath, destDir) {
  return new Promise((resolve, reject) => {
    const unzip = spawn('unzip', ['-q', zipPath, '-d', destDir], { stdio: 'inherit' });
    unzip.on('error', reject);
    unzip.on('exit', code => (code === 0 ? resolve() : reject(new Error(`unzip exited with code ${code}`))));
  });
}

async function copyDirectory(src, dest, ignored = []) {
  const entries = await fs.readdir(src, { withFileTypes: true });
  for (const entry of entries) {
    if (ignored.includes(entry.name)) continue;
    const srcPath = join(src, entry.name);
    const destPath = join(dest, entry.name);
    if (entry.isDirectory()) {
      await fs.mkdir(destPath, { recursive: true });
      await copyDirectory(srcPath, destPath, ignored);
    } else {
      await fs.copyFile(srcPath, destPath);
    }
  }
}


