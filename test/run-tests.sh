#!/usr/bin/env bash
set -euo pipefail

echo "Running unit tests (lightweight)"
node - <<'NODE'
// Minimal runner for our simple tests
import path from 'path';
import fs from 'fs';

const tests = fs.readdirSync('test').filter(f => f.endsWith('.test.js'));
let failures = 0;

global.describe = (name, fn) => { console.log(`\n${name}`); fn(); };
global.it = (name, fn) => { try { fn(); console.log(`  ✓ ${name}`); } catch (e) { console.error(`  ✗ ${name}:`, e.message); failures++; } };

for (const t of tests) {
  await import(path.resolve('test', t));
}

if (failures) { console.error(`\n${failures} test(s) failed`); process.exit(1); }
console.log('\nAll tests passed');
NODE

