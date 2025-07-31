#!/usr/bin/env node

import { spawn } from 'child_process';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import chalk from 'chalk';
import { init } from '../lib/init.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const args = process.argv.slice(2);
const command = args[0];

// Handle init command
if (command === 'init') {
  init().catch(err => {
    console.error(chalk.red('✗ Init failed:'), err.message);
    process.exit(1);
  });
} else if (!command) {
  // No command provided
  console.log(chalk.cyan('🚀 Pew Pew Plx - AI Project Management Framework'));
  console.log('\nUsage:');
  console.log('  plx init           Initialize a new Pew Pew project');
  console.log('  plx <command>      Run any Makefile command');
  console.log('\nExamples:');
  console.log('  plx sync claude    Sync agents and commands');
  console.log('  plx pull main      Pull latest framework updates');
  console.log('  plx watch claude   Watch for changes');
  process.exit(0);
} else {
  // Pass through to make
  const makeProcess = spawn('make', args, {
    stdio: 'inherit'
  });

  makeProcess.on('error', (err) => {
    if (err.code === 'ENOENT') {
      console.error(chalk.red('✗ Make not found. Please install make or run plx init first.'));
    } else {
      console.error(chalk.red('✗ Error:'), err.message);
    }
    process.exit(1);
  });

  makeProcess.on('exit', (code) => {
    process.exit(code || 0);
  });
}