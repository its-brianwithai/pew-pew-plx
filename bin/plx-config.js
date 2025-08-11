#!/usr/bin/env node
import { loadConfig } from '../lib/config.js';

function getByPath(obj, path) {
  const parts = path.split('.');
  let curr = obj;
  for (const part of parts) {
    if (curr == null) return undefined;
    curr = curr[part];
  }
  return curr;
}

async function main() {
  const [cmd, arg] = process.argv.slice(2);
  const config = await loadConfig();

  switch (cmd) {
    case 'json': {
      process.stdout.write(JSON.stringify(config, null, 2));
      break;
    }
    case 'get': {
      const val = getByPath(config, arg || '');
      if (typeof val === 'object') {
        process.stdout.write(JSON.stringify(val, null, 2));
      } else {
        process.stdout.write(String(val ?? ''));
      }
      break;
    }
    case 'list': {
      const val = getByPath(config, arg || '');
      if (Array.isArray(val)) {
        process.stdout.write(val.join('\n'));
      } else if (val && typeof val === 'object') {
        // List values of object (e.g., core_targets)
        process.stdout.write(Object.values(val).join('\n'));
      } else if (val != null) {
        process.stdout.write(String(val));
      }
      break;
    }
    case 'sources': {
      // Print normalized sync_sources: either all or specific domain
      const sources = config.sync_sources || {};
      if (!arg) {
        for (const [domain, paths] of Object.entries(sources)) {
          for (const p of paths) process.stdout.write(`${domain}: ${p}\n`);
        }
      } else {
        const paths = sources[arg] || [];
        for (const p of paths) process.stdout.write(`${p}\n`);
      }
      break;
    }
    case 'validate': {
      const requiredKeys = ['sync_sources', 'delete_before_sync_targets', 'delete_after_sync_targets', 'sync_targets'];
      for (const key of requiredKeys) {
        if (!(key in config)) {
          console.error(`Missing required key: ${key}`);
          process.exit(2);
        }
      }
      if (typeof config.sync_sources !== 'object') {
        console.error('sync_sources must be an object');
        process.exit(2);
      }
      if (!Array.isArray(config.delete_before_sync_targets)) {
        console.error('delete_before_sync_targets must be an array');
        process.exit(2);
      }
      if (!Array.isArray(config.delete_after_sync_targets)) {
        console.error('delete_after_sync_targets must be an array');
        process.exit(2);
      }
      console.log('OK');
      break;
    }
    default: {
      console.error('Usage: plx-config <json|get|list> [path]');
      process.exit(1);
    }
  }
}

main().catch((e) => {
  console.error('plx-config error:', e.message);
  process.exit(1);
});


