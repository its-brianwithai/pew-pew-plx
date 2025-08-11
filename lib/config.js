import { promises as fs } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

function parseYaml(yamlString) {
  const lines = yamlString.split(/\r?\n/);
  const stack = [{ indent: -1, value: {} }];

  const setValueAtPath = (obj, path, value) => {
    let curr = obj;
    for (let i = 0; i < path.length - 1; i++) {
      const key = path[i];
      if (Array.isArray(curr)) {
        const idx = Number(key);
        if (!curr[idx]) curr[idx] = {};
        curr = curr[idx];
      } else {
        if (!curr[key]) curr[key] = {};
        curr = curr[key];
      }
    }
    const last = path[path.length - 1];
    if (Array.isArray(curr)) {
      curr[Number(last)] = value;
    } else {
      curr[last] = value;
    }
  };

  let currentPath = [];
  let currentContainer = stack[stack.length - 1];

  const getParentAtIndent = (indent) => {
    while (stack.length && stack[stack.length - 1].indent >= indent) {
      stack.pop();
      currentPath.pop();
    }
    return stack[stack.length - 1];
  };

  for (const rawLine of lines) {
    const line = rawLine.replace(/#.*$/, '').replace(/\s+$/, '');
    if (!line.trim()) continue;
    const indent = line.match(/^\s*/)[0].length;
    const parent = getParentAtIndent(indent);

    // List item
    const listMatch = line.match(/^\s*-\s+(.*)$/);
    if (listMatch) {
      const valueStr = listMatch[1];
      if (!Array.isArray(parent.value)) {
        // Convert parent to array if not already
        // Determine key from currentPath
        const parentKey = currentPath[currentPath.length - 1];
        const grandParent = stack[stack.length - 2];
        if (grandParent && typeof grandParent.value === 'object') {
          grandParent.value[parentKey] = [];
          parent.value = grandParent.value[parentKey];
        }
      }
      const value = valueStr === '[]' ? [] : valueStr;
      parent.value.push(value);
      continue;
    }

    // key: value or key:
    const kv = line.match(/^\s*([^:]+):\s*(.*)$/);
    if (kv) {
      const key = kv[1].trim();
      const valueStr = kv[2];

      // Descend
      const container = {};
      if (valueStr === '') {
        // Open a new mapping level
        parent.value[key] = {};
        currentPath.push(key);
        stack.push({ indent, value: parent.value[key] });
      } else {
        let value;
        if (valueStr === '[]') value = [];
        else if (valueStr === 'true') value = true;
        else if (valueStr === 'false') value = false;
        else if (!isNaN(Number(valueStr))) value = Number(valueStr);
        else value = valueStr;
        parent.value[key] = value;
      }
      continue;
    }
  }

  return stack[0].value;
}

export async function loadConfig() {
  const cwdPath = join(process.cwd(), 'config.yaml');
  let yamlContent = '';
  try {
    yamlContent = await fs.readFile(cwdPath, 'utf8');
  } catch (e) {
    // Fallback to library default bundled with package
    const defaultPath = join(__dirname, '..', 'config.yaml');
    try {
      yamlContent = await fs.readFile(defaultPath, 'utf8');
    } catch (e2) {
      throw new Error('No config.yaml found in project or library defaults');
    }
  }

  const parsed = parseYaml(yamlContent);

  // Basic normalization
  const config = parsed || {};
  // Handle migration: core_targets -> sync_sources
  if (!config.sync_sources && config.core_targets) {
    const migrated = {};
    for (const [k, v] of Object.entries(config.core_targets)) {
      migrated[k] = Array.isArray(v) ? v : [v];
    }
    config.sync_sources = migrated;
  }
  config.core_targets = config.core_targets || {}; // kept for backward compat (watch may still read this)
  config.delete_before_sync_targets = config.delete_before_sync_targets || [];
  config.delete_after_sync_targets = config.delete_after_sync_targets || [];
  config.sync_targets = config.sync_targets || {};
  // Normalize sync_sources to map<string, string[]> regardless of user shape
  if (config.sync_sources && typeof config.sync_sources === 'object') {
    const normalized = {};
    for (const [domain, value] of Object.entries(config.sync_sources)) {
      if (Array.isArray(value)) {
        normalized[domain] = value;
      } else if (value && typeof value === 'object') {
        // Flatten any nested object of arrays to a single array
        const all = [];
        for (const v of Object.values(value)) {
          if (Array.isArray(v)) all.push(...v);
          else if (typeof v === 'string') all.push(v);
        }
        normalized[domain] = all;
      } else if (typeof value === 'string') {
        normalized[domain] = [value];
      } else {
        normalized[domain] = [];
      }
    }
    config.sync_sources = normalized;
  }

  return config;
}

export function resolvePathFromRoot(relativePath) {
  return join(process.cwd(), relativePath);
}

