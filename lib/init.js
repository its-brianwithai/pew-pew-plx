import fetch from 'node-fetch';
import { createWriteStream, promises as fs } from 'fs';
import { pipeline } from 'stream/promises';
import { spawn } from 'child_process';
import { join } from 'path';
import chalk from 'chalk';

const REPO_URL = 'https://github.com/its-brianwithai/pew-pew-plx/archive/refs/heads/main.zip';

export async function init() {
  console.log(chalk.cyan('🚀 Pulling latest from main...'));
  
  try {
    // For init, we allow existing files to be overwritten
    // This makes init and pull main behave the same way

    // Download the repository
    console.log(chalk.gray('📥 Downloading framework...'));
    const response = await fetch(REPO_URL);
    
    if (!response.ok) {
      throw new Error(`Failed to download: ${response.statusText}`);
    }

    const tempFile = '.pew-pew-temp.zip';
    await pipeline(
      response.body,
      createWriteStream(tempFile)
    );

    // Extract the files
    console.log(chalk.gray('📦 Extracting files...'));
    await extractZip(tempFile);

    // Clean up
    console.log(chalk.gray('🧹 Cleaning up...'));
    await fs.unlink(tempFile);
    
    const extractedDir = 'pew-pew-plx-main';
    
    // Check if extraction created the expected directory
    try {
      await fs.access(extractedDir);
    } catch (e) {
      console.error(chalk.red('✗ Extraction failed: directory not found'));
      process.exit(1);
    }
    
    // Read .plxignore from extracted files
    const plxignorePath = join(extractedDir, '.plxignore');
    let ignoredFiles = [];
    try {
      const plxignoreContent = await fs.readFile(plxignorePath, 'utf8');
      ignoredFiles = plxignoreContent.split('\n')
        .map(line => line.trim())
        .filter(line => line && !line.startsWith('#'));
    } catch (e) {
      // No .plxignore file, that's ok
    }

    // Move files to current directory, respecting .plxignore
    await moveFiles(extractedDir, '.', ignoredFiles);
    await fs.rm(extractedDir, { recursive: true, force: true });

    console.log(chalk.green('✅ Project initialized successfully!'));
    console.log('\nNext steps:');
    console.log(chalk.gray('  1. Run'), chalk.cyan('plx sync claude'), chalk.gray('to sync agents and commands'));
    console.log(chalk.gray('  2. Check out the'), chalk.cyan('README.md'), chalk.gray('for more information'));
    console.log(chalk.gray('  3. Start building with AI agents!'));
    
  } catch (error) {
    console.error(chalk.red('✗ Initialization failed:'), error.message);
    process.exit(1);
  }
}

async function extractZip(zipFile) {
  return new Promise((resolve, reject) => {
    const unzip = spawn('unzip', ['-q', zipFile], {
      stdio: 'inherit'
    });

    unzip.on('error', (err) => {
      if (err.code === 'ENOENT') {
        reject(new Error('unzip command not found. Please install unzip.'));
      } else {
        reject(err);
      }
    });

    unzip.on('exit', (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`unzip exited with code ${code}`));
      }
    });
  });
}

async function moveFiles(src, dest, ignoredFiles = []) {
  const entries = await fs.readdir(src, { withFileTypes: true });
  
  for (const entry of entries) {
    // Skip ignored files
    if (ignoredFiles.includes(entry.name)) {
      continue;
    }
    
    const srcPath = join(src, entry.name);
    let destPath = join(dest, entry.name);
    
    // Special handling: rename 'pew' to '.pew' when copying to local
    if (entry.name === 'pew' && entry.isDirectory()) {
      destPath = join(dest, '.pew');
      
      // Merge with existing .pew if it exists
      try {
        await fs.access(destPath);
        console.log(chalk.yellow('📁 Merging with existing .pew folder...'));
        await mergeDirectories(srcPath, destPath);
        continue;
      } catch (e) {
        // .pew doesn't exist, proceed with normal copy
      }
    }
    
    if (entry.isDirectory()) {
      await fs.mkdir(destPath, { recursive: true });
      await moveFiles(srcPath, destPath, ignoredFiles);
    } else {
      await fs.copyFile(srcPath, destPath);
    }
  }
}

async function mergeDirectories(src, dest) {
  const entries = await fs.readdir(src, { withFileTypes: true });
  
  for (const entry of entries) {
    const srcPath = join(src, entry.name);
    const destPath = join(dest, entry.name);
    
    if (entry.isDirectory()) {
      await fs.mkdir(destPath, { recursive: true });
      await mergeDirectories(srcPath, destPath);
    } else {
      // Overwrite framework files, preserve user files not in framework
      await fs.copyFile(srcPath, destPath);
    }
  }
}