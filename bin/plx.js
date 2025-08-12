#!/usr/bin/env node

import { spawn } from 'child_process';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import chalk from 'chalk';
import { Command } from 'commander';
import { pullRepository } from '../lib/pull.js';
import { loadConfig } from '../lib/config.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const program = new Command();
program
  .name('plx')
  .description('Pew Pew PLX CLI')
  .version('1.0.0');

async function confirmOrExit(message, yesFlag) {
  if (yesFlag) return;
  if (!process.stdin.isTTY) {
    console.error(chalk.yellow('Confirmation required. Re-run with --yes to proceed in non-interactive mode.'));
    process.exit(1);
  }
  process.stdout.write(`${message} [y/N]: `);
  await new Promise((resolve) => process.stdin.once('data', (d) => {
    const ans = d.toString().trim().toLowerCase();
    if (ans !== 'y' && ans !== 'yes') {
      console.log(chalk.gray('Aborted.'));
      process.exit(0);
    }
    resolve();
  }));
}

function runSyncScript() {
  return new Promise((resolve, reject) => {
    // Scripts relocated under pew-pew-workspace/scripts/claude-code/
    const scriptPath = join(__dirname, '..', 'pew-pew-workspace', 'scripts', 'claude-code', 'sync-claude-code.sh');
    const p = spawn(scriptPath, [], { stdio: 'inherit' });
    p.on('error', reject);
    p.on('exit', (code) => code === 0 ? resolve() : reject(new Error(`sync exited with code ${code}`)));
  });
}

program
  .command('pull')
  .description('Pull latest files')
  .argument('[subcommand]', 'subcommand, e.g., repo', 'repo')
  .option('--repo <url>', 'Repository URL (ssh or https)')
  .option('--branch <name>', 'Branch name', 'main')
  .option('--yes', 'Skip confirmation prompt', false)
  .action(async (sub, opts) => {
    try {
      if (sub !== 'repo') {
        console.error(chalk.red(`Unknown pull target: ${sub}`));
        process.exit(1);
      }
      if (!opts.repo) {
        console.error(chalk.red('Missing --repo <url>'));
        process.exit(1);
      }
      await confirmOrExit(`About to pull from ${opts.repo} (branch ${opts.branch}) into this directory. Continue?`, opts.yes);
      await pullRepository({ repoUrl: opts.repo, branch: opts.branch, cwd: process.cwd() });
      console.log(chalk.green('✅ Pull complete'));
    } catch (e) {
      console.error(chalk.red('✗ Pull failed:'), e.message);
      process.exit(1);
    }
  });

program
  .command('sync')
  .description('Sync content (optionally pulling first)')
  .argument('[subcommand]', 'subcommand, e.g., repo', 'repo')
  .option('--repo <url>', 'Repository URL (ssh or https)')
  .option('--branch <name>', 'Branch name', 'main')
  .option('--yes', 'Skip confirmation prompt for pull', false)
  .action(async (sub, opts) => {
    try {
      if (sub !== 'repo') {
        console.error(chalk.red(`Unknown sync target: ${sub}`));
        process.exit(1);
      }
      if (opts.repo) {
        await confirmOrExit(`About to pull from ${opts.repo} (branch ${opts.branch}) into this directory before sync. Continue?`, opts.yes);
        await pullRepository({ repoUrl: opts.repo, branch: opts.branch, cwd: process.cwd() });
      }
      await runSyncScript();
      console.log(chalk.green('✅ Sync complete'));
    } catch (e) {
      console.error(chalk.red('✗ Sync failed:'), e.message);
      process.exit(1);
    }
  });

// Init command: bootstrap plx.yaml in CWD from user root or bundled default
program
  .command('init')
  .description('Initialize plx.yaml in current directory from user root or bundled default')
  .option('--force', 'Overwrite existing plx.yaml if present', false)
  .action(async (opts) => {
    try {
      const fs = await import('fs');
      const home = process.env.HOME || process.env.USERPROFILE || '';
      const cwdPlx = join(process.cwd(), 'plx.yaml');
      const exists = await fs.promises
        .access(cwdPlx)
        .then(() => true)
        .catch(() => false);
      if (exists && !opts.force) {
        console.error(chalk.red('plx.yaml already exists here. Use --force to overwrite.'));
        process.exit(1);
      }

      const readIfExists = async (p) => {
        try { return await fs.promises.readFile(p, 'utf8'); } catch { return null; }
      };

      // Prefer user root config
      const userPlx = join(home, 'plx', 'plx.yaml');
      const userCfg = join(home, 'plx', 'config.yaml');
      let sourceContent = (await readIfExists(userPlx)) || (await readIfExists(userCfg));

      // Fallback to bundled defaults in repo
      if (!sourceContent) {
        const bundledPlx = join(__dirname, '..', 'plx.yaml');
        const bundledCfg = join(__dirname, '..', 'config.yaml');
        sourceContent = (await readIfExists(bundledPlx)) || (await readIfExists(bundledCfg));
      }

      if (!sourceContent) {
        console.error(chalk.red('No source config found (~/plx/plx.yaml or bundled plx.yaml).'));
        process.exit(1);
      }

      await fs.promises.writeFile(cwdPlx, sourceContent, 'utf8');
      console.log(chalk.green(`✅ Initialized ${cwdPlx}`));
    } catch (e) {
      console.error(chalk.red('✗ Init failed:'), e.message);
      process.exit(1);
    }
  });

// Pew task commands (migrated)
program
  .command('set')
  .description('Set task-related config values')
  .argument('tasks')
  .requiredOption('--field <field>', 'Field to set (tasks.target.primary|tasks.target.paste|tasks.sources.next|tasks.marker)')
  .requiredOption('--value <value>', 'Value to set (use comma-separated for lists)')
  .option('--global', 'Set in ~/plx/plx.yaml', false)
  .action(async (_sub, opts) => {
    try {
      const cfg = await loadConfig();
      const isList = opts.field.endsWith('next');
      const value = isList ? opts.value.split(',').map(s => s.trim()).filter(Boolean) : opts.value;
      const path = opts.field.startsWith('tasks.') ? opts.field.split('.') : ['tasks', opts.field];
      let ref = cfg;
      for (let i = 0; i < path.length - 1; i++) {
        const k = path[i];
        if (!ref[k] || typeof ref[k] !== 'object') ref[k] = {};
        ref = ref[k];
      }
      ref[path[path.length - 1]] = value;
      const fs = await import('fs');
      const { join } = await import('path');
      const home = process.env.HOME || process.env.USERPROFILE || '';
      const target = opts.global ? join(home, 'plx', 'plx.yaml') : join(process.cwd(), 'plx.yaml');
      await fs.promises.mkdir(join(target, '..'), { recursive: true }).catch(() => {});
      await fs.promises.writeFile(target, serializeYaml(cfg), 'utf8');
      console.log(chalk.green('✅ Set complete'));
    } catch (e) {
      console.error(chalk.red('✗ Set failed:'), e.message);
      process.exit(1);
    }
  });

program
  .command('paste')
  .description('Paste clipboard content into the configured task file')
  .argument('tasks')
  .option('--overwrite', 'Overwrite target file', false)
  .option('--append', 'Append to target file', false)
  .option('--insert', 'Insert at top of target file', false)
  .option('--path <file>', 'Override target file path (defaults to tasks.target.paste or tasks.target.primary)')
  .action(async (_sub, opts) => {
    try {
      const { default: clipboardy } = await import('clipboardy');
      const content = await clipboardy.read();
      const fs = await import('fs');
      const { join } = await import('path');
      const cfg = await loadConfig();
      const target = opts.path || cfg?.tasks?.target?.paste || cfg?.tasks?.target?.primary || cfg?.tasks?.paste || cfg?.tasks?.primary;
      if (!target) throw new Error('No target task file configured (tasks.paste or tasks.primary)');
      const abs = join(process.cwd(), target);
      await fs.promises.mkdir(join(abs, '..'), { recursive: true });
      if (opts.overwrite) await fs.promises.writeFile(abs, content, 'utf8');
      else if (opts.insert) {
        const prev = (await fs.promises.readFile(abs, 'utf8').catch(() => ''));
        await fs.promises.writeFile(abs, `${content}\n${prev}`, 'utf8');
      } else {
        await fs.promises.appendFile(abs, `\n${content}\n`, 'utf8');
      }
      console.log(chalk.green('✅ Paste complete'));
    } catch (e) {
      console.error(chalk.red('✗ Paste failed:'), e.message);
      process.exit(1);
    }
  });

program
  .command('next')
  .description('Advance to the next task in configured files, marking current as done')
  .argument('task')
  .action(async () => {
    try {
      const fs = await import('fs');
      const { join } = await import('path');
      const cfg = await loadConfig();
      const files = Array.isArray(cfg?.tasks?.sources?.next) ? cfg.tasks.sources.next : (Array.isArray(cfg?.tasks?.all) ? cfg.tasks.all : []);
      const marker = cfg?.tasks?.marker || '👉';
      for (const rel of files) {
        const p = join(process.cwd(), rel);
        let text = await fs.promises.readFile(p, 'utf8').catch(() => '');
        if (!text) continue;
        const lines = text.split(/\r?\n/);
        let changed = false;
        for (let i = 0; i < lines.length; i++) {
          if (lines[i].includes(marker)) {
            lines[i] = lines[i].replace(marker, '').replace('- [ ]', '- [x]');
            // find next unchecked
            for (let j = i + 1; j < lines.length; j++) {
              if (/- \[ \]/.test(lines[j])) {
                lines[j] = `${marker} ${lines[j]}`;
                changed = true;
                break;
              }
            }
            changed = true;
            break;
          }
        }
        if (changed) {
          await fs.promises.writeFile(p, lines.join('\n'), 'utf8');
          console.log(chalk.green(`✅ Advanced in ${rel}`));
          return;
        }
      }
      console.log(chalk.yellow('No current task marker found.'));
    } catch (e) {
      console.error(chalk.red('✗ Next failed:'), e.message);
      process.exit(1);
    }
  });

program
  .command('reset')
  .description('Reset completed tasks in configured files')
  .argument('tasks')
  .action(async () => {
    try {
      const fs = await import('fs');
      const { join } = await import('path');
      const cfg = await loadConfig();
      const files = Array.isArray(cfg?.tasks?.sources?.next) ? cfg.tasks.sources.next : (Array.isArray(cfg?.tasks?.all) ? cfg.tasks.all : []);
      const marker = cfg?.tasks?.marker || '👉';
      for (const rel of files) {
        const p = join(process.cwd(), rel);
        let text = await fs.promises.readFile(p, 'utf8').catch(() => '');
        if (!text) continue;
        text = text
          .replace(new RegExp(`\\- \\[[xX]\\]`, 'g'), '- [ ]')
          .replace(new RegExp(`${marker}\s*`, 'g'), '');
        await fs.promises.writeFile(p, text, 'utf8');
        console.log(chalk.green(`✅ Reset ${rel}`));
      }
      console.log(chalk.green('✅ Reset complete'));
    } catch (e) {
      console.error(chalk.red('✗ Reset failed:'), e.message);
      process.exit(1);
    }
  });

program
  .command('update')
  .description('Update CLI (placeholder)')
  .argument('cli')
  .action(async () => {
    console.log(chalk.gray('Not implemented: self-update via npm (out of scope locally)'));
  });

function serializeYaml(obj, indent = 0) {
  const pad = '  '.repeat(indent);
  if (Array.isArray(obj)) return obj.map(v => `${pad}- ${serializeYaml(v, 0).trim()}`).join('\n');
  if (obj && typeof obj === 'object') {
    return Object.entries(obj)
      .map(([k, v]) => {
        if (Array.isArray(v)) return `${pad}${k}:\n${serializeYaml(v, indent + 1)}`;
        if (v && typeof v === 'object') return `${pad}${k}:\n${serializeYaml(v, indent + 1)}`;
        return `${pad}${k}: ${String(v)}`;
      })
      .join('\n');
  }
  return `${pad}${String(obj)}`;
}

program.parseAsync(process.argv);