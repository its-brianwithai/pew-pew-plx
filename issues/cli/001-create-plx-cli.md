# Create Pew Pew Plx CLI Tool

## Overview
Create a simple npm package that replaces `make` with `plx` for Pew Pew Projects.

## Goals
- Install via `npm install -g pew-pew-plx`
- `plx init` downloads the project framework
- All other commands proxy to Makefile

## Implementation

### 1. Package Structure
```
pew-pew-plx/
├── package.json
├── bin/
│   └── plx.js          # Main executable
└── lib/
    └── init.js         # Init command logic
```

### 2. Core Functionality

#### package.json
```json
{
  "name": "pew-pew-plx",
  "version": "1.0.0",
  "bin": {
    "plx": "./bin/plx.js"
  },
  "dependencies": {
    "node-fetch": "^3.0.0"
  }
}
```

#### bin/plx.js
- Parse command line arguments
- If `init`: download project from GitHub
- Otherwise: exec `make ${args.join(' ')}`

#### lib/init.js
- Download main.zip from GitHub
- Extract files to current directory
- Clean up temp files

### 3. Usage

```bash
# Install
npm install -g pew-pew-plx

# Initialize project
plx init

# Use any make command
plx pull main
plx sync claude
plx watch claude
```

## Success Criteria
1. `npm install -g pew-pew-plx` works
2. `plx init` downloads the framework
3. `plx <command>` runs `make <command>`
4. No unnecessary features